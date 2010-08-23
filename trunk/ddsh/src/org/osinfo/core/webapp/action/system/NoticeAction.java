/**
 * @Author Lucifer.Zhou 4:29:47 PM Jan 6, 2010
 * @MSN zhoujianguo_leo@hotmail.com
 * @Mail leo821031@gmail.com
 * @FileName LoginAction.java
 * @JDKVersion 1.5
 * @Site http://www.osinfo.org
 */
package org.osinfo.core.webapp.action.system;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import net.sf.json.JSON;
import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;
import net.sf.json.JsonConfig;

import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.osinfo.core.webapp.action.CrudAction;
import org.osinfo.core.webapp.action.util.DynamicGrid;
import org.osinfo.core.webapp.action.util.JsonDateValueProcessorImpl;
import org.osinfo.core.webapp.dao.CommonDAO;
import org.osinfo.core.webapp.model.DdNotice;
import org.osinfo.core.webapp.util.ExcelUtil;
import org.osinfo.core.webapp.util.JsonUtil;
import org.osinfo.core.webapp.util.PageUtil;
@Results({
	 @Result(name="list",location = "/WEB-INF/result/system/notice/list.ftl")
})
/**
 * @Author Lucifer.Zhou 4:29:47 PM Jan 6, 2010
 * @Description
 * 公告管理
 */
public class NoticeAction<T> extends CrudAction{
	private static Logger logger = Logger.getLogger ( NoticeAction.class.getName () ) ;
	/**
	 * @Author Lucifer.Zhou 4:30:01 PM Jan 6, 2010
	 * long LoginAction.java
	 * @Description
	 *
	 */
	private static final long serialVersionUID = 1L;
	
	//库存列表
	public String list() {
		return "list";
	}


	//商品递交
	@Override
	public String add() {
		// TODO Auto-generated method stub
		String name=getParameter("name");
		String detail=getParameter("detail");
		String location=getParameter("location");
		String submitdate=getCurrentTime();

		String operator=(String) getSession().getAttribute("userid");

		String sql="insert into dd_notice (name,detail,operator,date) " +
				"values ('"+name+"','"+detail+"','"+operator+"','"+submitdate+"')";
		CommonDAO.executeUpdate(sql);
		return "success2";
	}
	public String loadAll() {
		// TODO Auto-generated method stub
		if(logger.isDebugEnabled())
			logger.debug("加载装入页面...");
	    List l=new ArrayList();
	    String sql="select * from dd_notice order by date desc limit 10";
	    l=CommonDAO.executeQuery(sql,DdNotice.class);

		cfg=new JsonConfig();
		/*
		cfg.setJsonPropertyFilter(new PropertyFilter(){
		    public boolean apply(Object source, String name, Object value) {
		        if(name.equals("zfSysOrganizeLeaderses")||name.equals("zfSysUserOrganizes")||name.equals("zfSysUserRoles")||name.equals("zfSysOrganizeRoles")) {
		        	return true;
		        } else {
		        	return false;
		        }
		    }
		});
		 */
		cfg.registerJsonValueProcessor(java.util.Date.class, new JsonDateValueProcessorImpl());
		cfg.registerJsonValueProcessor(java.sql.Date.class, new JsonDateValueProcessorImpl());
		cfg.registerJsonValueProcessor(java.sql.Timestamp.class, new JsonDateValueProcessorImpl());
		
	    JSON json = JSONSerializer.toJSON( l,cfg);
	    renderJson(json.toString());
	    
	    /*try
	    {
	    	String json = JsonUtil.list2json(l);
	    	renderJson(json.toString());
		    System.out.println(json.toString());
	    }catch(Exception e)
	    {
	    	e.printStackTrace();
	    }*/
	    
        return null;
	}

	//公告内容显示
	public String load() {
		// TODO Auto-generated method stub
		if(logger.isDebugEnabled())
			logger.debug("加载装入页面...");
	    List l=new ArrayList();
	    String id=getParameter("id");
	    String sql="select * from dd_notice where id="+id;
	    l=CommonDAO.executeQuery(sql,DdNotice.class);
	    cfg=new JsonConfig();
		cfg.registerJsonValueProcessor(java.sql.Timestamp.class, new JsonDateValueProcessorImpl());
		
	    JSON json = JSONSerializer.toJSON( l,cfg);
	    renderJson(json.toString());
	    
        return null;
	}
	@Override
	public String del() {
		// TODO Auto-generated method stub
		if(logger.isDebugEnabled())
			logger.debug("加载删除页面...");
	    String ids=getParameter("ids");
	    if(!"".equals(ids.trim())){
	    		String sql="delete from dd_notice where id in ("+ids.substring(0,ids.length()-1)+")";
	    		CommonDAO.executeUpdate(sql);
	    }
	    renderSimpleResult(true,"处理成功");
        return null;
	}
	@Override
	public String edit() {
		// TODO Auto-generated method stub
		String trid=getParameter("trid");
		String tdid=getParameter("tdid");
		String value=getParameter("value");
		
		String sql="update dd_topper set "+tdid+"="+value+" where id ="+trid;
		CommonDAO.executeUpdate(sql);
		renderSimpleResult(true,"修改成功");
		return null;
	}
	@Override
	protected HSSFWorkbook exportExcel(HSSFWorkbook workbook, String scope,
			String bound, String where, String sort, String dir)
			throws Exception {
		// TODO Auto-generated method stub
		String name="退货记录表";
		String name2=name;
		if (getRequest().getHeader("User-Agent").toLowerCase().indexOf("firefox") > 0)
			name2 = new String(name.getBytes("UTF-8"), "ISO8859-1");//firefox浏览器
		else if (getRequest().getHeader("User-Agent").toUpperCase().indexOf("MSIE") > 0)
			name2 = URLEncoder.encode(name, "UTF-8");//IE浏览器 终极解决文件名乱码

		getResponse().setHeader("Content-disposition","attachment;filename=" +name2+"-"+getCurrentTime() + ".xls");
		String[] headers = { "序号", "名称","内容", "操作者","日期"};
		String userid=(String) getSession().getAttribute("userid");
		String t=(String) getSession().getAttribute("type");
		String sql;
		sql="select * from dd_notice order by date desc";
		PageUtil p=CommonDAO.findByMultiTableSQLQuery(sql,DdNotice.class);
		Collection<T> l = (Collection<T>) p.getResult();
		return ExcelUtil.exportExcel(workbook,name, headers, l);
	}
	@Override
	public List filter(List expressions, String[] filters) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public DynamicGrid myDynamicGrid() {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public String myResult() {
		// TODO Auto-generated method stub
		String sql;
		String userid=(String) getSession().getAttribute("userid");
		String t=(String) getSession().getAttribute("type");

			sql="select * from dd_notice order by date desc";
		
		PageUtil p=CommonDAO.findPageByMultiTableSQLQuery(sql,start,end,perpage,DdNotice.class);
		
		String content = "totalPage = " + p.getTotalPageCount() + ";";
		content += "dataStore = [";

		List l=(List)p.getResult();
		for(int i=0;i<l.size();i++)
		{
			DdNotice d=(DdNotice)l.get(i);

			content += "\"<tr id='"+d.getId()+"'><td><input type='checkbox' name='row' value='"+d.getId()+"'/></td><td>"+d.getName()+"</td><td>"+d.getDetail()+"</td><td>"+d.getOperator()+"</td><td>"+d.getDate()+"</td></tr>\",";
		}
		content = content.substring(0,content.length()-1);
		content += "];";
		return content;
	}
	@Override
	public int myCount() {
		// TODO Auto-generated method stub
		type=(String)getParameter("type");//操作类型
		String sql;
		String userid=(String) getSession().getAttribute("userid");
		String t=(String) getSession().getAttribute("type");

			 sql="select * from dd_notice";
		
		int count=CommonDAO.count(sql);
		return count;
	}
}
