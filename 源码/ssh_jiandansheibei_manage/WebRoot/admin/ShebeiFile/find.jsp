<%@ page language="java" contentType="text/html; charset=UTF-8"    
	pageEncoding="UTF-8"%>                                               
<%                                                                        
	String path = request.getContextPath();                                 
	String basePath = request.getScheme() + "://"                         
			+ request.getServerName() + ":" + request.getServerPort()         
			+ path + "/";                                                     
%>                                                                        
<%@ include file="/common/css.jsp"%>                                    
<%@ include file="/common/js.jsp"%>                                     
<%@ include file="/common/taglib.jsp"%>                                 
       
<html>                                                                    
<head>                                                                    
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">   
<base href="<%=basePath%>">                                             
<title><spring:message code="system_name" /></title>                    
<script type="text/javascript">                                         
	function topPage() {                                                    
                                                                          
		var contextPath = "${pageContext.request.contextPath}";             
		var field = document.getElementById("field").value;                 
		var fieldValue = document.getElementById("fieldValue").value;       
		var pageNo = "${pageModel.topPageNo}";                              
		window.location = contextPath                                         
				+ '/ShebeiFile-getAllUtil.action?pageModel.currentPageNo=' + pageNo     
				+ '&field=' + field + '&fieldValue=' + fieldValue + '';           
	}                                                                       
                                                                          
	function previousPage() {                                               
		var contextPath = "${pageContext.request.contextPath}";             
		var field = document.getElementById("field").value;                 
		var fieldValue = document.getElementById("fieldValue").value;       
		var pageNo = "${pageModel.previousPageNo}";                         
		window.location = contextPath                                         
				+ '/ShebeiFile-getAllUtil.action?pageModel.currentPageNo=' + pageNo     
				+ '&field=' + field + '&fieldValue=' + fieldValue + '';           
	}                                                                       
                                                                          
	function nextPage() {                                                   
                                                                          
		var contextPath = "${pageContext.request.contextPath}";             
		var field = document.getElementById("field").value;                 
		var fieldValue = document.getElementById("fieldValue").value;       
		var pageNo = "${pageModel.nextPageNo}";                             
		window.location = contextPath                                         
				+ '/ShebeiFile-getAllUtil.action?pageModel.currentPageNo=' + pageNo     
				+ '&field=' + field + '&fieldValue=' + fieldValue + '';           
	}                                                                       
                                                                          
	function bottomPage() {                                                 
		var contextPath = "${pageContext.request.contextPath}";             
		var field = document.getElementById("field").value;                 
		var fieldValue = document.getElementById("fieldValue").value;       
		var pageNo = "${pageModel.buttomPageNo}";                           
		window.location = contextPath                                         
				+ '/ShebeiFile-getAllUtil.action?pageModel.currentPageNo=' + pageNo     
				+ '&field=' + field + '&fieldValue=' + fieldValue + '';           
	}                                                                       
                                                                          
	function datadel() {                                                    
                                                                          
		var ids = document.getElementsByName("id");                         
		var flag = 0;                                                         
		for ( var i = 0; i < ids.length; i++) {                               
			if (ids[i].checked) {                                               
				flag = 1;                                                         
				break;                                                            
			}                                                                   
		}                                                                     
		if (flag == 1) {                                                      
			if(confirm("确定要删除吗")){                                           
				document.myform.submit();                                           
			}else{                                           
			return false;                                           
			}                                           
		} else {                                                              
			alert("至少选中一条记录");                                             
			return false;                                                       
		}                                                                     
                                                                          
	}                                                                       
</script>                                                                 
</head>                                                                   
<body class="pos-r">                                                                  
	<div>                                                                                 
		<nav class="breadcrumb"> <i class="Hui-iconfont">&#xe67f;</i> 首页              
		<span class="c-gray en">&gt;</span>设备信息管理 <span class="c-gray en">&gt;</span>
		设备信息列表 <a class="btn btn-success radius r"                                      
			style="line-height:1.6em;margin-top:3px"                                        
			href="javascript:location.replace(location.href);" title="刷新"><i            
			class="Hui-iconfont">&#xe68f;</i> </a> </nav>                                   
		<div class="page-container">                                                      
			<div class="text-c">                                                            
				<form                                                                           
					action="${pageContext.request.contextPath}/ShebeiFile-getAllUtil.action">    
					<select id="field" name="field" class="select"
						style="width:120px;height:32px;">
<option <c:if test="${field == 't_sccs.s_0'}">selected</c:if> value="t_sccs.s_0" />
									所属生产厂商
								</option>
								<option <c:if test="${field == 't_bumen.s_0'}">selected</c:if> value="t_bumen.s_0" />
									所属所属部门
								</option>
								<option <c:if test="${field == 's_1'}">selected</c:if> value="s_1" />
									文件名
								</option>
								<option <c:if test="${field == 's_2'}">selected</c:if> value="s_2" />
									上传时间
								</option>
								<option <c:if test="${field == 's_5'}">selected</c:if> value="s_5" />
									设备名字
								</option>
								<option <c:if test="${field == 's_6'}">selected</c:if> value="s_6" />
									设备型号
								</option>
								<option <c:if test="${field == 's_7'}">selected</c:if> value="s_7" />
									设备价格
								</option>
													</select> <input type="text" name="fieldValue" id="fieldValue"                              
						value="${fieldValue }" placeholder=" 检索内容" style="width:250px"                        
						class="input-text">                                                                           
					<button name="" id="" class="btn btn-success" type="submit">                              
						<i class="Hui-iconfont">&#xe665;</i> 搜索                                                     
					</button>                                                                                         
					&nbsp;&nbsp; <input class="btn btn-success" type="button"                                     
						value="清空"                                                                                  
						onclick="javascript: document.getElementById('fieldValue').value='';" />                      
					&nbsp;&nbsp;                                                                                      
				</form>                                                                                             
			</div>                                                                                                
			<div class="cl pd-5 bg-1 bk-gray mt-20">                                                            
				<span class="l">
			<c:if test="${type == 'admin'}"><a href="javascript:;" onclick="datadel()"                                    
					class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i>                            
						批量删除</a> 
			</c:if>
			<c:if test="${type == type1 || type == type2 }">
			<a class="btn btn-primary radius" style="margin-left:20px;"                    
					href="${pageContext.request.contextPath}/ShebeiFile-initUtil.action"><i                   
						class="Hui-iconfont">&#xe600;</i> 添加</a>
			</c:if> 
</span> <span class="r">检索列表<strong></strong>
				</span>                                                                                             
			</div>                                                                                                
			<div class="mt-20">                                                                                 
				<form                                                                                               
					action="${pageContext.request.contextPath}/ShebeiFile-deleteManyUtil.action"                     
					name="myform" id="myform" method="post">                                                    
					<table                                                                                            
						class="table table-border table-bordered table-bg table-hover table-sort">                    
						<thead>                                                                                         
							<tr class="text-c">                                                                         
								<th width="60"><input name="" type="checkbox" value="">&nbsp;全选                   
								</th>                                                                                       
						<th>
							文件名
						</th>
						<th>
							上传时间
						</th>
						<th>
							生产厂商
						</th>
						<th>
							所属部门
						</th>
						<th>
							设备名字
						</th>
						<th>
							设备型号
						</th>
						<th>
							设备价格
						</th>
						<th>
							操作
						</th>
					</tr>
				</thead>
				<tbody>							<c:if test="${fn:length(pageModel.list) < 1}">
								<tr class="text-c va-m">                    
									<td colspan=82>无记录</td>                   
								</tr>                                         
							</c:if>                                         

					<c:forEach var="tmp" items="${pageModel.list}">
						<tr class="text-c">
									<td><input name="id" value="${tmp.id }" type="checkbox">
									</td>                                                         
							<td>
								<img src="/ssh_jiandansheibei_manage/upload/${tmp.s_0 }"  width="100px" height="100px">
							</td>
							<td>
								${tmp.s_2 }
							</td>
							<td>
								${tmp.sccs.s_0 }
							</td>
							<td>
								${tmp.bumen.s_0 }
							</td>
							<td>
								${tmp.s_3 }
							</td>
							<td>
								${tmp.s_4 }
							</td>
							<td>
								${tmp.s_5 }
							</td>

								<c:if test="${type == 'admin'}">
									<td class="td-manage"><a style="text-decoration:none;margin-left:15px;"                                   
										class="ml-5"                                                                            
										href="${pageContext.request.contextPath}/admin/download.jsp?filename=${tmp.s_0}"
										title="下载"><i class="Hui-iconfont">&#xe6df;</i>下载 </a>  <a style="text-decoration:none;margin-left:15px;"                                   
										class="ml-5"                                                                            
										href="${pageContext.request.contextPath}/ShebeiFile-selectUtil.action?util.id=${tmp.id }"
										title="编辑"><i class="Hui-iconfont">&#xe6df;</i> 编辑</a> <a                             
										style="text-decoration:none;margin-left:15px;" class="ml-5"                           
										href="${pageContext.request.contextPath}/ShebeiFile-deleteUtil.action?util.id=${tmp.id }"
										title="删除"><i class="Hui-iconfont">&#xe6e2;</i>删除 </a>                                
									</td>                                                                                       

								</c:if>

								<c:if test="${type != 'admin'}">
									<td class="td-manage"><a style="text-decoration:none;margin-left:15px;"                                   
										class="ml-5"                                                                            
										href="${pageContext.request.contextPath}/admin/download.jsp?filename=${tmp.s_0}"
										title="下载"><i class="Hui-iconfont">&#xe6df;</i>下载 </a>  <a style="text-decoration:none;margin-left:15px;"                                   
										class="ml-5"                                                                            
										href="${pageContext.request.contextPath}/ShebeiFile-selectUtil.action?util.id=${tmp.id }"
										title="查看"><i class="Hui-iconfont">&#xe6df;</i>查看 </a>                                
									</td>                                                                                       

								</c:if>

						</tr>
					</c:forEach>
				</tbody>
			</table>
		</form>				<br />
		<table width="90%" height="30" border="0" align="center"
			cellpadding="0" cellspacing="0" class="rd1">
			<tr>
				<td nowrap class="rd19" height="2" width="36%">
					<div align="left">
						<font>&nbsp;共&nbsp;${pageModel.totalPages}&nbsp;页</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<font>当前第</font>&nbsp;
						<font color="#FF0000">${pageModel.currentPageNo}</font>&nbsp;
						<font>页</font>
					</div>
				</td>
				<td nowrap class="rd19" width="64%">
					<div align="right">
						<input name="btnTopPage" class="btn btn-inverse" type="button"
							id="btnTopPage" value="|&lt;&lt; " title="首页"
							onClick="javascript:topPage();">
						<input name="btnPreviousPage" class="btn btn-inverse" type="button"
							id="btnPreviousPage" value=" &lt;  " title="上页"
							onClick="javascript:previousPage();">
						<input name="btnNextPage" class="btn btn-inverse" type="button"
							id="btnNextPage" value="  &gt; " title="下页" onClick="javascript:nextPage();">
						<input name="btnBottomPage" class="btn btn-inverse" type="button"
							id="btnBottomPage" value=" &gt;&gt;|" title="尾页"
							onClick="javascript:bottomPage();">
					</div>
				</td>
			</tr>
		</table>
	</body>
</html>
