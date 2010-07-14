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

import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.osinfo.core.webapp.action.CrudAction;
import org.osinfo.core.webapp.action.util.DynamicGrid;
import org.osinfo.core.webapp.dao.CommonDAO;
import org.osinfo.core.webapp.model.DdInventory;
import org.osinfo.core.webapp.model.DdSell;
import org.osinfo.core.webapp.model.DdTopper;
import org.osinfo.core.webapp.util.JsonUtil;
import org.osinfo.core.webapp.util.PageUtil;
@Results({
	 @Result(name="list",location = "/WEB-INF/result/system/online/list.ftl")
})
/**
 * @Author Lucifer.Zhou 4:29:47 PM Jan 6, 2010
 * @Description
 * 商品在售情况
 */
public class SellAction extends CrudAction{
	private static Logger logger = Logger.getLogger ( SellAction.class.getName () ) ;
	/**
	 * @Author Lucifer.Zhou 4:30:01 PM Jan 6, 2010
	 * long LoginAction.java
	 * @Description
	 *
	 */
	private static final long serialVersionUID = 1L;
	//单件物品下架数据加载
	public String load() {
		// TODO Auto-generated method stub
		if(logger.isDebugEnabled())
			logger.debug("加载装入页面...");
	    String id=getParameter("id");
	    List l=new ArrayList();
	    if(!"".equals(id.trim())){
	    		String sql="select * from dd_sell where id ="+id;
	    		l=CommonDAO.executeQuery(sql,DdSell.class);
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
	//多件物品上架数据加载
	public String loadAll() {
		// TODO Auto-generated method stub
		if(logger.isDebugEnabled())
			logger.debug("加载装入页面...");
	    String ids=getParameter("ids");
	    List l=new ArrayList();
	    if(!"".equals(ids.trim())){
	    		String sql="select * from dd_sell where id in("+ids.substring(0,ids.length()-1)+")";
	    		l=CommonDAO.executeQuery(sql,DdSell.class);
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
	//单件物品下架
	public String down() {
		// TODO Auto-generated method stub
		if(logger.isDebugEnabled())
			logger.debug("加载装入页面...");
	    String id=getParameter("id");
	    String barcode=getParameter("barcode");
	    String amount=getParameter("amount");
	    String reason=org.osinfo.core.webapp.util.StringUtil.convert(getParameter("reason"));
	    String sql="select * from dd_sell where id="+id;
	    List l=CommonDAO.executeQuery(sql,DdSell.class);
	    for(int i=0;i<l.size();i++)
	    {
	    	DdSell s=(DdSell)l.get(i);
	    	sql="update dd_sell set amount="+(s.getAmount()-Integer.valueOf(amount))+" where id="+id;//更新在售表数量
	    	CommonDAO.executeUpdate(sql);
	    }
	    
	    sql="select * from dd_inventory where barcode='"+barcode+"'";
	    l=CommonDAO.executeQuery(sql,DdInventory.class);
	    for(int i=0;i<l.size();i++)
	    {
	    	DdInventory s=(DdInventory)l.get(i);
	    	sql="update dd_inventory set amount="+(s.getAmount()+Integer.valueOf(amount))+" where barcode='"+barcode+"'";//更新库存表数量
	    	CommonDAO.executeUpdate(sql);
	    }
	    String submitdate=getCurrentTime();

		String operator=(String) getSession().getAttribute("userid");

	    sql="insert into dd_down (inventoryid,barcode,name,gridid,amount,price,userid,reason,operator,date) " +
		"select inventoryid,barcode,name,gridid,'"+amount+"',price,userid,'"+reason+"','"+operator+"','"+submitdate+"' from dd_sell where id ="+id;
	    CommonDAO.executeUpdate(sql);
	    
	    renderSimpleResult(true,"处理成功");
        return null;
	}
	//库存列表
	public String list() {
		return "list";
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

	
	@Override
	public String del() {
		// TODO Auto-generated method stub
		if(logger.isDebugEnabled())
			logger.debug("加载删除页面...");
	    String ids=getParameter("ids");
	    if(!"".equals(ids.trim())){
	    		String sql="delete from dd_sell where id in ("+ids.substring(0,ids.length()-1)+")";
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

			sql="select * from dd_sell where  amount>0";
		
		PageUtil p=CommonDAO.findPageByMultiTableSQLQuery(sql,start,end,perpage,DdSell.class);
		
		String content = "totalPage = " + p.getTotalPageCount() + ";";
		content += "dataStore = [";

		List l=(List)p.getResult();
		for(int i=0;i<l.size();i++)
		{
			DdSell d=(DdSell)l.get(i);

			content += "\"<tr id='"+d.getId()+"'><td><input type='checkbox' name='row' value='"+d.getId()+"'/></td><td>"+d.getBarcode()+"</td><td>"+d.getName()+"</td><td>"+d.getUserid()+"</td><td class='editbox' id='amount'>"+d.getAmount()+"</td><td class='editbox' id='price'>"+d.getPrice()+"</td><td>"+d.getGridid()+"</td></tr>\",";
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

			 sql="select * from dd_sell where amount>0";
		
		int count=CommonDAO.count(sql);
		return count;
	}
}
