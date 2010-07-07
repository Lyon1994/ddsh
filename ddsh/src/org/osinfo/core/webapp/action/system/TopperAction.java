/**
 * @Author Lucifer.Zhou 4:29:47 PM Jan 6, 2010
 * @MSN zhoujianguo_leo@hotmail.com
 * @Mail leo821031@gmail.com
 * @FileName LoginAction.java
 * @JDKVersion 1.5
 * @Site http://www.osinfo.org
 */
package org.osinfo.core.webapp.action.system;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.osinfo.core.webapp.action.CrudAction;
import org.osinfo.core.webapp.action.util.DynamicGrid;
import org.osinfo.core.webapp.dao.CommonDAO;
import org.osinfo.core.webapp.model.DdTopper;
import org.osinfo.core.webapp.util.PageUtil;
@Results({
	 @Result(name="list",location = "/WEB-INF/result/system/topper/list.ftl"),
	 @Result(name="list2",location = "/WEB-INF/result/system/topper/list2.ftl"),
	 @Result(name="add",location = "/WEB-INF/result/system/topper/add.ftl"),
	 @Result(name="edit",location = "/WEB-INF/result/system/topper/edit.ftl"),
})
/**
 * @Author Lucifer.Zhou 4:29:47 PM Jan 6, 2010
 * @Description
 * 上货审批
 */
public class TopperAction extends CrudAction{
	private static Logger logger = Logger.getLogger ( TopperAction.class.getName () ) ;
	/**
	 * @Author Lucifer.Zhou 4:30:01 PM Jan 6, 2010
	 * long LoginAction.java
	 * @Description
	 *
	 */
	private static final long serialVersionUID = 1L;
	
	public String list() {
		return "list";
	}
	public String list2() {
		return "list2";
	}
	@Override
	public String add() {
		// TODO Auto-generated method stub
		String name=getParameter("name");
		String image=getParameter("image");
		String amount=getParameter("amount");
		
		String price=getParameter("price");
		String totalprice=getParameter("totalprice");
		String spec=getParameter("spec");		
		
		String material=getParameter("material");
		String grade=getParameter("grade");
		String location=getParameter("location");		
		
		String memo=getParameter("memo");

		SimpleDateFormat   dateFormat   =   new   SimpleDateFormat("yyyy-MM-dd hh:mm:ss");//可以方便地修改日期格式   

		String submitdate=dateFormat.format(new   Date()); 

		String operator=String.valueOf((Integer) getSession().getAttribute("id"));

		String sql="insert into dd_topper (name,image,amount,price,totalprice,spec,material,location,memo,status,submitdate,userid) " +
				"values ('"+name+"','"+image+"',"+amount+","+price+","+totalprice+",'"+spec+"','"+material+"','"+location+"','"+memo+"','0','"+submitdate+"',"+operator+")";
		System.out.println(sql);
		int v=CommonDAO.executeUpdate(sql);
		if(v>0)
			return "success";
		else
			return "error";
	}
	public String apply() {
		// TODO Auto-generated method stub
		if(logger.isDebugEnabled())
			logger.debug("加载接收页面...");
	    String ids=getParameter("ids");
	    if(!"".equals(ids.trim())){
	    	String sql="update dd_topper set status='1' where id in ("+ids.substring(0,ids.length()-1)+")";
	    		CommonDAO.executeUpdate(sql);
	    }
	    renderSimpleResult(true,"ok");
        return null;
	}
	@Override
	public String del() {
		// TODO Auto-generated method stub
		if(logger.isDebugEnabled())
			logger.debug("加载删除页面...");
	    String ids=getParameter("ids");
	    if(!"".equals(ids.trim())){
	    		String sql="delete from dd_topper where id in ("+ids.substring(0,ids.length()-1)+")";
	    		CommonDAO.executeUpdate(sql);
	    }
	    renderSimpleResult(true,"ok");
        return null;
	}
	@Override
	public String edit() {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	protected HSSFWorkbook exportExcel(HSSFWorkbook workbook, String scope,
			String bound, String where, String sort, String dir)
			throws Exception {
		// TODO Auto-generated method stub
		return null;
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
		if(type.equals("1"))
			sql="select * from dd_topper where status='1'";
		else
			sql="select * from dd_topper where status='0'";
		PageUtil p=CommonDAO.findPageByMultiTableSQLQuery(sql,start,end,perpage,DdTopper.class);
		
		String content = "totalPage = " + p.getTotalPageCount() + ";";
		content += "dataStore = [";

		List l=(List)p.getResult();
		for(int i=0;i<l.size();i++)
		{
			DdTopper d=(DdTopper)l.get(i);
			content += "\"<tr><td><input type='checkbox' name='row' value='"+d.getId()+"'/></td><td>"+d.getName()+"</td><td>"+d.getUserid()+"</td><td>"+d.getImage()+"</td><td>"+d.getAmount()+"</td><td>"+d.getPrice()+"</td><td>"+d.getTotalprice()+"</td><td>"+d.getSpec()+"</td><td>"+d.getGrade()+"</td><td>"+d.getMaterial()+"</td><td>"+d.getLocation()+"</td><td>"+d.getSubmitdate()+"</td><td>"+d.getMemo()+"</td></tr>\",";
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
		if(type.equals("1"))
			sql="select * from dd_topper where status='1'";
		else
			sql="select * from dd_topper where status='0'";
		int count=CommonDAO.count(sql);
		return count;
	}
}
