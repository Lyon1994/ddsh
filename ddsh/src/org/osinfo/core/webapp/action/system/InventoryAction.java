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
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.osinfo.core.webapp.action.CrudAction;
import org.osinfo.core.webapp.action.util.DynamicGrid;
import org.osinfo.core.webapp.dao.CommonDAO;
import org.osinfo.core.webapp.model.DdInventory;
import org.osinfo.core.webapp.model.DdNotice;
import org.osinfo.core.webapp.util.ExcelUtil;
import org.osinfo.core.webapp.util.FloatUtil;
import org.osinfo.core.webapp.util.JsonUtil;
import org.osinfo.core.webapp.util.PageUtil;
@Results({
	 @Result(name="list",location = "/WEB-INF/result/system/inventory/list.ftl"),
	 @Result(name="list2",location = "/WEB-INF/result/system/inventory/list2.ftl"),
	 @Result(name="list3",location = "/WEB-INF/result/system/inventory/list3.ftl")
})
/**
 * @Author Lucifer.Zhou 4:29:47 PM Jan 6, 2010
 * @Description
 * 库存管理
 */
public class InventoryAction<T> extends CrudAction{
	private static Logger logger = Logger.getLogger ( InventoryAction.class.getName () ) ;
	/**
	 * @Author Lucifer.Zhou 4:30:01 PM Jan 6, 2010
	 * long LoginAction.java
	 * @Description
	 *
	 */
	private static final long serialVersionUID = 1L;
	//单件物品上架数据加载
	public String load() {
		// TODO Auto-generated method stub
		if(logger.isDebugEnabled())
			logger.debug("加载装入页面...");
	    String id=getParameter("id");
	    String barcode=getParameter("barcode");
	    List l=new ArrayList();
	    if(id!=null){
	    		String sql="select * from dd_inventory where id ="+id;
	    		l=CommonDAO.executeQuery(sql,DdInventory.class);
	    }
	    if(barcode!=null){
    		String sql="select * from dd_inventory where barcode ='"+barcode+"'";
    		l=CommonDAO.executeQuery(sql,DdInventory.class);
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
	    		String sql="select * from dd_inventory where id in("+ids.substring(0,ids.length()-1)+")";
	    		l=CommonDAO.executeQuery(sql,DdInventory.class);
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
	    		String sql="delete from dd_inventory where id in ("+ids.substring(0,ids.length()-1)+")";
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
		
		String sql="update dd_inventory set "+tdid+"="+value+" where id ="+trid;
		CommonDAO.executeUpdate(sql);
		renderSimpleResult(true,"修改成功");
		return null;
	}
	@Override
	protected HSSFWorkbook exportExcel(HSSFWorkbook workbook, String scope,
			String bound, String where, String sort, String dir)
			throws Exception {
		// TODO Auto-generated method stub
		String name="库存记录表";
		String name2=name;
		if (getRequest().getHeader("User-Agent").toLowerCase().indexOf("firefox") > 0)
			name2 = new String(name.getBytes("UTF-8"), "ISO8859-1");//firefox浏览器
		else if (getRequest().getHeader("User-Agent").toUpperCase().indexOf("MSIE") > 0)
			name2 = URLEncoder.encode(name, "UTF-8");//IE浏览器 终极解决文件名乱码

		getResponse().setHeader("Content-disposition","attachment;filename=" +name2+"-"+getCurrentTime() + ".xls");
		String[] headers = { "序号","条形码","名称","数量","价格","折扣","总价","设计师","规格","材料","尺寸","产地", "操作者","日期"};
		String userid=(String) getSession().getAttribute("userid");
		String t=(String) getSession().getAttribute("type");
		String sql;
		if(t.equals("2"))
		{
			sql="select * from dd_inventory where userid='"+userid+"' and amount>0 order by date desc";
		}else
		{
			sql="select * from dd_inventory where amount>0 order by date desc";
		}
		PageUtil p=CommonDAO.findByMultiTableSQLQuery(sql,DdInventory.class);
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
		if(t.equals("2"))
		{
			sql="select * from dd_inventory where userid='"+userid+"' and amount>0 order by date desc";
		}else
		{
			sql="select * from dd_inventory where amount>0 order by date desc";
		}
		PageUtil p=CommonDAO.findPageByMultiTableSQLQuery(sql,start,end,perpage,DdInventory.class);
		
		String content = "totalPage = " + p.getTotalPageCount() + ";";
		content += "dataStore = [";

		List l=(List)p.getResult();
		for(int i=0;i<l.size();i++)
		{
			DdInventory d=(DdInventory)l.get(i);
			Timestamp date=d.getDate();
			if(t.equals("1"))
			{
				content += "\"<tr id='"+d.getId()+"'><td><input type='checkbox' name='row' value='"+d.getId()+"'/></td><td>"+d.getBarcode()+"</td><td>"+d.getName()+"</td><td class='editbox' id='amount'>"+d.getAmount()+"</td><td class='editbox' id='price'>"+d.getPrice()+"</td><td class='editbox' id='discount'>"+d.getDiscount()+"</td><td>"+FloatUtil.round((d.getPrice()*d.getDiscount())*d.getAmount(), 2)+"</td><td>"+d.getUserid()+"</td><td>"+d.getSpec()+"</td><td>"+d.getGrade()+"</td><td>"+d.getMaterial()+"</td><td>"+d.getLocation()+"</td><td>"+date+"</td><td>"+d.getOperator()+"</td></tr>\",";
			}else
			{
				content += "\"<tr id='"+d.getId()+"'><td><input type='checkbox' name='row' value='"+d.getId()+"'/></td><td>"+d.getBarcode()+"</td><td>"+d.getName()+"</td><td>"+d.getAmount()+"</td><td>"+d.getPrice()+"</td><td>"+d.getDiscount()+"</td><td>"+FloatUtil.round((d.getPrice()*d.getDiscount())*d.getAmount(), 2)+"</td><td>"+d.getUserid()+"</td><td>"+d.getSpec()+"</td><td>"+d.getGrade()+"</td><td>"+d.getMaterial()+"</td><td>"+d.getLocation()+"</td><td>"+date+"</td><td>"+d.getOperator()+"</td></tr>\",";
			}
			
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
			sql="select * from dd_inventory where userid='"+userid+"' and amount>0";
		}else
		{
			 sql="select * from dd_inventory where amount>0";
		}
		int count=CommonDAO.count(sql);
		return count;
	}
}
