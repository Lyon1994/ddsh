/**
 * @Author Lucifer.Zhou 4:29:47 PM Jan 6, 2010
 * @MSN zhoujianguo_leo@hotmail.com
 * @Mail leo821031@gmail.com
 * @FileName LoginAction.java
 * @JDKVersion 1.5
 * @Site http://www.osinfo.org
 */
package org.osinfo.core.webapp.action.system;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONObject;

import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.osinfo.core.webapp.action.CrudAction;
import org.osinfo.core.webapp.action.util.DynamicGrid;
import org.osinfo.core.webapp.dao.CommonDAO;
import org.osinfo.core.webapp.model.DdTopper;
import org.osinfo.core.webapp.util.JsonUtil;
import org.osinfo.core.webapp.util.PageUtil;
@Results({
	 @Result(name="list",location = "/WEB-INF/result/system/topper/list.ftl"),
	 @Result(name="list2",location = "/WEB-INF/result/system/topper/list2.ftl"),
	 @Result(name="list3",location = "/WEB-INF/result/system/topper/list3.ftl")
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
	//审批商品
	public String list() {
		return "list";
	}
	//已批商品
	public String list2() {
		return "list2";
	}
	//待批商品
	public String list3() {
		return "list3";
	}

	//商品递交
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
		String submitdate=getCurrentTime();

		String operator=(String) getSession().getAttribute("userid");

		String sql="insert into dd_topper (name,image,amount,price,totalprice,spec,material,grade,location,memo,status,submitdate,userid) " +
				"values ('"+name+"','"+image+"',"+amount+","+price+","+totalprice+",'"+spec+"','"+material+"','"+grade+"','"+location+"','"+memo+"','0','"+submitdate+"','"+operator+"')";
		int v=CommonDAO.executeUpdate(sql);
		if(v>0)
			return "success";
		else
			return "error";
	}

	//审核通过,入库
	public String apply() {
		// TODO Auto-generated method stub
		if(logger.isDebugEnabled())
			logger.debug("加载接收页面...");
	    String ids=getParameter("ids");
	    ids=ids.substring(0,ids.length()-1);
		String submitdate=getCurrentTime();
		String operator=(String) getSession().getAttribute("userid");
	    if(!"".equals(ids.trim())){
	    	String[] idList = ids.split("\\,");
    		for(String id:idList){
    			String sql="update dd_topper set status='1',barcode='"+getRandomBarCode()+"',date='"+submitdate+"',operator='"+operator+"' where id ="+id;
    	    	CommonDAO.executeUpdate(sql);
    		}
	    	
	    	String sql2="insert into dd_inventory (barcode,name,amount,price,totalprice,userid,spec,material,grade,location,operator,date) " +
	    			"select barcode,name,amount,price,totalprice,userid,spec,material,grade,location,operator,date from dd_topper where id in ("+ids+")";
	    	CommonDAO.executeUpdate(sql2);
	    }
	    renderSimpleResult(true,"ok");
        return null;
	}
	//单件物品退回数据加载
	public String load() {
		// TODO Auto-generated method stub
		if(logger.isDebugEnabled())
			logger.debug("加载装入页面...");
	    String id=getParameter("id");
	    List l=new ArrayList();
	    if(!"".equals(id.trim())){
	    		String sql="select * from dd_topper where id ="+id;
	    		l=CommonDAO.executeQuery(sql,DdTopper.class);
	    }
	    try
	    {
	    	String json = JsonUtil.list2json(l);
	    	renderJson(json.toString());
		    System.out.println(json.toString());
	    }catch(Exception e)
	    {
	    	e.printStackTrace();
	    }
	    
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
		String userid=(String) getSession().getAttribute("userid");
		String t=(String) getSession().getAttribute("type");
		if(t.equals("2"))
		{
			if(type.equals("1"))
				sql="select * from dd_topper where status='1' and amount>0 and userid='"+userid+"'";
			else
				sql="select * from dd_topper where status='0' and amount>0 and userid='"+userid+"'";
		}else
		{
			if(type.equals("1"))
				sql="select * from dd_topper where status='1' and amount>0";
			else
				sql="select * from dd_topper where status='0' and amount>0";
		}
		PageUtil p=CommonDAO.findPageByMultiTableSQLQuery(sql,start,end,perpage,DdTopper.class);
		
		String content = "totalPage = " + p.getTotalPageCount() + ";";
		content += "dataStore = [";

		List l=(List)p.getResult();
		for(int i=0;i<l.size();i++)
		{
			DdTopper d=(DdTopper)l.get(i);
			Timestamp date;
			if(type.equals("1"))
				date=d.getDate();
			else
				date=d.getSubmitdate();
			if(type.equals("1"))
				content += "\"<tr id='"+d.getId()+"'><td><input type='checkbox' name='row' value='"+d.getId()+"'/></td><td>"+d.getBarcode()+"</td><td>"+d.getName()+"</td><td>"+d.getUserid()+"</td><td>"+d.getImage()+"</td><td class='editbox' id='amount'>"+d.getAmount()+"</td><td class='editbox' id='price'>"+d.getPrice()+"</td><td class='editbox' id='totalprice'>"+d.getTotalprice()+"</td><td>"+d.getSpec()+"</td><td>"+d.getGrade()+"</td><td>"+d.getMaterial()+"</td><td>"+d.getLocation()+"</td><td>"+date+"</td><td>"+d.getMemo()+"</td></tr>\",";
			else
				content += "\"<tr id='"+d.getId()+"'><td><input type='checkbox' name='row' value='"+d.getId()+"'/></td><td>"+d.getName()+"</td><td>"+d.getUserid()+"</td><td>"+d.getImage()+"</td><td class='editbox' id='amount'>"+d.getAmount()+"</td><td class='editbox' id='price'>"+d.getPrice()+"</td><td class='editbox' id='totalprice'>"+d.getTotalprice()+"</td><td>"+d.getSpec()+"</td><td>"+d.getGrade()+"</td><td>"+d.getMaterial()+"</td><td>"+d.getLocation()+"</td><td>"+date+"</td><td>"+d.getMemo()+"</td></tr>\",";
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
		if(t.equals("2"))
		{
			if(type.equals("1"))
				sql="select * from dd_topper where status='1' and amount>0 and userid='"+userid+"'";
			else
				sql="select * from dd_topper where status='0' and amount>0 and userid='"+userid+"'";
		}else
		{
			if(type.equals("1"))
				sql="select * from dd_topper where status='1' and amount>0";
			else
				sql="select * from dd_topper where status='0' and amount>0";
		}
		
		
		int count=CommonDAO.count(sql);
		return count;
	}
}
