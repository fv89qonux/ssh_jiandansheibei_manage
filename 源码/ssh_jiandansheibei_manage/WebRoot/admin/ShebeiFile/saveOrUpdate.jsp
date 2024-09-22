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
			function check(){
				var s_0 = document.getElementById("util.s_0");
				if('' == s_0.value.replace(/(^\s*)|(\s*$)/g, "") ){
					alert("请输入内容");
					s_0.value = "";
					s_0.focus();
					return false;
				}
				return true;
			}
		</script>
</head>                                                                
<body>                                                                            
	<div class="page-container">                                                  
	<div class="form form-horizontal">                                                  
		<s:form
			action="/ShebeiFile-updateUtil.action"
			method="post"	onsubmit="return check()"	enctype="multipart/form-data">                            
			<c:if test="${util.id != null}">                                          
				<input name="util.id" value="${util.id }" type="hidden" />          
			</c:if>                                                                     
				<div class="row cl">                                          
					<label class="form-label col-xs-4 col-sm-2">附件：</label>  
					<div class="formControls col-xs-8 col-sm-9">                
						<s:file name="myFile" />                                  
						<font size="2" color="red">文件为空表示不修改文件</font>
					</div>                                                        
				</div>                                                          
			<div class="row cl">                                              
				<label class="form-label col-xs-4 col-sm-2"><span               
					class="c-red"></span>生产厂商：</label>                           
				<div class="formControls col-xs-8 col-sm-3">                    

							<span class="select-box"><select  class="select" name="util.sccs.id">
								<c:forEach var="type" items="${listSccs}">
									<option
										<c:if test="${type.id == util.sccs.id }">
																	selected
																	</c:if>
										value="${type.id }">
										${type.s_0 }
									</option>
								</c:forEach>
							</select></span>
							
						</td>				</div>                                                            
			</div>                                                              
			<div class="row cl">                                              
				<label class="form-label col-xs-4 col-sm-2"><span               
					class="c-red"></span>所属部门：</label>                           
				<div class="formControls col-xs-8 col-sm-3">                    

							<span class="select-box"><select  class="select" name="util.bumen.id">
								<c:forEach var="type" items="${listBumen}">
									<option
										<c:if test="${type.id == util.bumen.id }">
																	selected
																	</c:if>
										value="${type.id }">
										${type.s_0 }
									</option>
								</c:forEach>
							</select></span>
							
						</td>				</div>                                                            
			</div>                                                              
			<div class="row cl">                                              
				<label class="form-label col-xs-4 col-sm-2"><span               
					class="c-red"></span>设备名字：</label>                           
				<div class="formControls col-xs-8 col-sm-9">                    
					<input type="text" class="input-text" name="util.s_3"     
						value="${util.s_3 }" placeholder="设备名字" id="" name="">
				</div>                                                            
			</div>                                                              
			<div class="row cl">                                              
				<label class="form-label col-xs-4 col-sm-2"><span               
					class="c-red"></span>设备型号：</label>                           
				<div class="formControls col-xs-8 col-sm-9">                    
					<input type="text" class="input-text" name="util.s_4"     
						value="${util.s_4 }" placeholder="设备型号" id="" name="">
				</div>                                                            
			</div>                                                              
			<div class="row cl">                                              
				<label class="form-label col-xs-4 col-sm-2"><span               
					class="c-red"></span>设备价格：</label>                           
				<div class="formControls col-xs-8 col-sm-9">                    
					<input type="text" class="input-text" name="util.s_5"     
						value="${util.s_5 }" placeholder="设备价格" id="" name="">
				</div>                                                            
			</div>                                                              
			<div class="row cl">                                              
				<label class="form-label col-xs-4 col-sm-2"><span               
					class="c-red"></span>设备负责人姓名：</label>                           
				<div class="formControls col-xs-8 col-sm-9">                    
					<input type="text" class="input-text" name="util.s_6"     
						value="${util.s_6 }" placeholder="设备负责人姓名" id="" name="">
				</div>                                                            
			</div>                                                              
			<div class="row cl">                                              
				<label class="form-label col-xs-4 col-sm-2"><span               
					class="c-red"></span>设备负责人电话：</label>                           
				<div class="formControls col-xs-8 col-sm-9">                    
					<input type="text" class="input-text" name="util.s_7"     
						value="${util.s_7 }" placeholder="设备负责人电话" id="" name="">
				</div>                                                            
			</div>                                                              
			<div class="row cl">                                                 
				<label class="form-label col-xs-4 col-sm-2">设备出厂日期</label>       
				<div class="formControls col-xs-8 col-sm-9">                       
					<input type="text" name="util.s_8" value="${util.s_8 }"      
						onfocus="WdatePicker({ dateFmt:'yyyy-MM-dd HH:mm:ss'})"        
						id="datemin" class="input-text Wdate" style="width:180px;">
				</div>                                                               
			</div>                                                                 
			<div class="row cl">                                                 
				<label class="form-label col-xs-4 col-sm-2">添加日期</label>       
				<div class="formControls col-xs-8 col-sm-9">                       
					<input type="text" name="util.s_9" value="${util.s_9 }"      
						onfocus="WdatePicker({ dateFmt:'yyyy-MM-dd HH:mm:ss'})"        
						id="datemin" class="input-text Wdate" style="width:180px;">
				</div>                                                               
			</div>                                                                 
			<div class="row cl">                                                    
				<label class="form-label col-xs-4 col-sm-2">备注：</label>            
				<div class="formControls col-xs-8 col-sm-9">                          
					<textarea class="textarea" name="util.s_10">${util.s_10 }</textarea>
				</div>                                                                  
			</div>                                                                    
			<div class="row cl">                                                                   
				<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">                      
<c:if test="${type == type1 || type == type2 || util.id == null}">
					<button                                                                              
						class="btn btn-primary radius" type="submit">                                  
						<i class="Hui-iconfont">&#xe632;</i> 保存                                        
					</button>                                                                            
					<button onClick="layer_close();" class="btn btn-default radius"                  
						type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>&nbsp;&nbsp;                  
						<font style="margin-left:20px;" color=red><s:property value="errMsg" /> </font>
</c:if>
				</div>                                                                                 
			</div>                                                                                   
		</s:form>                                                                                    
	</div>                                                                                       
	</div>                                                                                       
                                                                                               
</body>                                                                                        
</html>                                                                                        
