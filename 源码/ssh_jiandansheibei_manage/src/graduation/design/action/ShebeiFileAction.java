package graduation.design.action;

import java.util.*;
import java.io.*;
import java.text.*;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;
import graduation.design.dao.ObjectManager;
import graduation.design.model.*;
import com.opensymphony.xwork2.*;

import system.common.util.PageModel;

@SuppressWarnings({ "unchecked" })
public class ShebeiFileAction extends ActionSupport {
	private static final long serialVersionUID = 1l;
	private static final int BUFFER_SIZE = 1;
	private File myFile;
	private String contentType;
	private String fileName;
	private String imageFileName;
	private ShebeiFile util;
	private PageModel<ShebeiFile> pageModel;
	private String errMsg;
	private String field;
	private String fieldValue;
	private ObjectManager objectManager;

	private List<Sccs> listSccs;
	private List<Bumen> listBumen;
	public String initUtil() throws Exception{
		listSccs = objectManager.getUtil("from Sccs");
		listBumen = objectManager.getUtil("from Bumen");
		util = null;
		return "saveOrUpdate";
	}

	public String selectUtil() throws Exception{
		listSccs = objectManager.getUtil("from Sccs");
		listBumen = objectManager.getUtil("from Bumen");
		util = (ShebeiFile) objectManager.getObject(new ShebeiFile(), util.getId());
		errMsg = null;
		return "saveOrUpdate";
	}

	public String deleteManyUtil() throws Exception {                
		HttpServletRequest request = ServletActionContext.getRequest();
		String ids[] = request.getParameterValues("id");             
		ShebeiFile util = null;                                              
		for (String id : ids) {                                        
			util = new ShebeiFile();                                           
			util.setId(Integer.parseInt(id));                            
			objectManager.deleteObject(util);                            
		}                                                              
		util = null;                                                   
		return getAllUtil();                                           
	}                                                                
	
	public String getAllUtil() throws Exception{
		if (null == pageModel) {
			pageModel = new PageModel<ShebeiFile>();
		}
		if (0 == pageModel.getCurrentPageNo()) {
			pageModel.setCurrentPageNo(1);
		}
		StringBuilder _sql = new StringBuilder();
		_sql.append(" from ShebeiFile ");
		if (null != field && field.trim().length() > 0) {
			fieldValue = new String(fieldValue.getBytes("UTF-8"), "UTF-8");
			_sql.append(" where " + field + " like '%" + fieldValue + "%'");
		}
		pageModel = objectManager.getUtil(_sql.toString(), pageModel.getCurrentPageNo());
		errMsg = null;
		return "find";
	}

	public String updateUtil() throws Exception {
		if (null != util) {                           
			if(null == util.getS_3() || "".equals(util.getS_3())){         
				errMsg = "名称不能为空";                          
				return "saveOrUpdate";                                       
			}                                                                
		}                                                                  
		int id = util.getId();
		if(id == 0){
			boolean flag = false;
			flag = upload();
			if (flag) {
				objectManager.saveObject(util);
				util = null;
				fileName = null;
				return "ok";
			} else {
				errMsg = "upload err";
				return "saveOrUpdate";
			}
		}
		ShebeiFile tmp = (ShebeiFile) objectManager.getObject(new ShebeiFile(), id);
		if (fileName == null || (fileName != null && fileName.equals(tmp.getS_2()))) {
			util.setId(id);
			util.setS_0(tmp.getS_0());
			util.setS_1(tmp.getS_1());
			util.setS_2(tmp.getS_2());
			objectManager.updateObject(util);
			return getAllUtil();
		}
		boolean flag = false;
		flag = upload();
		if (flag) {
			objectManager.updateObject(util);
			util = null;
			errMsg = null;
			return getAllUtil();
		} else {
			errMsg = "update err";
			return "saveOrUpdate";
		}
	}

	public String deleteUtil() throws Exception {
		objectManager.deleteObject(util);
		return getAllUtil();
	}

	private boolean upload() {
		if (null == fileName) {
			return false;
		}
		int pos = fileName.lastIndexOf(".");
		fileName.substring(pos);
		imageFileName = fileName.substring(0, pos) + new Date().getTime()
				+ fileName.substring(pos);
		String path = ServletActionContext.getServletContext().getRealPath( "/upload") + "/" + imageFileName;
		File imageFile = new File(path);
		util.setS_0(imageFileName);
		String date = new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
		util.setS_2(date);
		util.setS_1(fileName);
		try {
			copy(myFile, imageFile);
		} catch (Exception e) {
			return false;
		}

		return true;
	}

	private void copy(File src, File dst) throws Exception {
		InputStream in = new BufferedInputStream(new FileInputStream(src),
				BUFFER_SIZE);
		OutputStream out = new BufferedOutputStream(new FileOutputStream(dst),
				BUFFER_SIZE);
		byte[] buffer = new byte[BUFFER_SIZE];
		while (in.read(buffer) > 0) {
			out.write(buffer);
		}
		in.close();
		out.close();
	}

	public void setMyFileContentType(String contentType) {
		this.contentType = contentType;
	}

	public void setMyFileFileName(String fileName) {
		this.fileName = fileName;
	}

	public void setMyFile(File myFile) {
		this.myFile = myFile;
	}

	public String getImageFileName() {
		return imageFileName;
	}

	public String getContentType() {
		return contentType;
	}

	public void setContentType(String contentType) {
		this.contentType = contentType;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public static int getBUFFER_SIZE() {
		return BUFFER_SIZE;
	}

	public File getMyFile() {
		return myFile;
	}

	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}

	public ObjectManager getObjectManager() {
		return objectManager;
	}

	public void setObjectManager(ObjectManager objectManager) {
		this.objectManager = objectManager;
	}

	public PageModel<ShebeiFile> getPageModel() {
		return pageModel;
	}

	public void setPageModel(PageModel<ShebeiFile> pageModel) {
		this.pageModel = pageModel;
	}

	public String getErrMsg() {
		return errMsg;
	}

	public void setErrMsg(String errMsg) {
		this.errMsg = errMsg;
	}

	public String getField() {
		return field;
	}

	public void setField(String field) {
		this.field = field;
	}

	public String getFieldValue() {
		return fieldValue;
	}

	public void setFieldValue(String fieldValue) {
		this.fieldValue = fieldValue;
	}


	public static long getSerialVersionUID() {
		return serialVersionUID;
	}

	public ShebeiFile getUtil() {
		return util;
	}

	public void setUtil(ShebeiFile util) {
		this.util = util;
	}

	public List<Sccs> getListSccs() {
		return listSccs;
	}

	public void setListSccs(List<Sccs> listSccs) {
		this.listSccs = listSccs;
	}

	public List<Bumen> getListBumen() {
		return listBumen;
	}

	public void setListBumen(List<Bumen> listBumen) {
		this.listBumen = listBumen;
	}

}
