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
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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
import org.osinfo.core.webapp.model.custom.Inventory;
import org.osinfo.core.webapp.util.DBUtil;
import org.osinfo.core.webapp.util.ExcelUtil;
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
    		String sql="select i.id,i.barcode,p.name,p.price,i.discount from dd_inventory i left join dd_product p on i.barcode=p.barcode where i.barcode='"+barcode+"'";
    		l=CommonDAO.executeQuery(sql,Inventory.class);
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
		String t=(String) getSession().getAttribute("type");
		if(t.equals("2"))
			return "list2";
		else if(t.equals("3"))
			return "list3";
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
	//上架操作
	public String upload() {
		// TODO Auto-generated method stub
		String id=getParameter("id");
		String amount=getParameter("amount");
		String barcode=getParameter("barcode");
		String submitdate=getCurrentTime();
		String operator=(String) getSession().getAttribute("userid");

		String sql="insert into dd_upload (barcode,amount,operator,date) " +
				"values ('"+barcode+"',"+amount+",'"+operator+"','"+submitdate+"')";
		CommonDAO.executeUpdate(sql);

    	renderSimpleResult(true,"操作成功");
    	return null;
	}	
	//批量上传
	public String batchUpload() {
		// TODO Auto-generated method stub
	    String value=getParameter("value");
	    String[] tmp=value.split("\\|");
		String submitdate=getCurrentTime();
		String operator=(String) getSession().getAttribute("userid");
		int j=0;
		Connection conn=DBUtil.getConnection();
		ResultSet rs = null;
		Statement stmt = null;
		List list = new ArrayList();
	    for(int i=0;i<tmp.length;i++)
	    {
	    	String[] t=tmp[i].split("\\,");
		    	String barcode=t[0];
		    	String amount=t[1];
		    	String sql="";
				
				try {
					conn.setAutoCommit(false);// 更改JDBC事务的默认提交方式   
					stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
					//sql="select * from dd_inventory where barcode='"+barcode+"'";
					//rs=stmt.executeQuery(sql);
					//list = DBUtil.populate(rs, DdInventory.class);
					
					//DdInventory in=(DdInventory) list.get(0);
		    		sql="insert into dd_upload (barcode,amount,operator,date) " +
					"values ('"+barcode+"',"+amount+",'"+operator+"','"+submitdate+"')";
		    		stmt.executeUpdate(sql);
					conn.commit();//提交JDBC事务  
					conn.setAutoCommit(true);// 恢复JDBC事务的默认提交方式   
		    		j=1;
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					j=-1;
					try {
						conn.rollback();
					} catch (SQLException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}//回滚JDBC事务   
					e.printStackTrace();
				}finally {
					DBUtil.close(rs, stmt, conn);
				}
 
	    }
	    if(j>0)
	    	renderSimpleResult(true,"处理完成");
	    else if(j<0)
	    	renderSimpleResult(true,"处理异常");
	    return null;
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
	    renderSimpleResult(true,"操作成功");
        return null;
	}
	@Override
	public String edit() {
		// TODO Auto-generated method stub
		String trid=getParameter("trid");
		String tdid=getParameter("tdid");
		String value=getParameter("value");
		
		String sql="update dd_inventory set "+tdid+"='"+value+"' where id ="+trid;
		CommonDAO.executeUpdate(sql);
		renderSimpleResult(true,"操作成功");
		return null;
	}
	@Override
	protected HSSFWorkbook exportExcel(HSSFWorkbook workbook, String scope,
			String bound, String where, String sort, String dir)
			throws Exception {
		// TODO Auto-generated method stub
		String name="库存表";
		String name2=name;
		if (getRequest().getHeader("User-Agent").toLowerCase().indexOf("firefox") > 0)
			name2 = new String(name.getBytes("UTF-8"), "ISO8859-1");//firefox浏览器
		else if (getRequest().getHeader("User-Agent").toUpperCase().indexOf("MSIE") > 0)
			name2 = URLEncoder.encode(name, "UTF-8");//IE浏览器 终极解决文件名乱码

		getResponse().setHeader("Content-disposition","attachment;filename=" +name2+"-"+getCurrentTime() + ".xls");
		String[] headers = { "序号","条形码","名称","设计师","数量","价格","折扣", "操作者","日期"};
		String userid=(String) getSession().getAttribute("userid");
		String t=(String) getSession().getAttribute("type");
		String sql;
		if(t.equals("2"))
		{
			sql="select i.id,i.barcode,p.name,p.userid,i.amount,p.price,i.discount,i.operator,i.date from dd_inventory i left join dd_product p on i.barcode=p.barcode where p.userid='"+userid+"' and i.amount>0 order by i.id,p.userid,p.name";
		}else
		{
			sql="select i.id,i.barcode,p.name,p.userid,i.amount,p.price,i.discount,i.operator,i.date from dd_inventory i left join dd_product p on i.barcode=p.barcode where i.amount>0 order by i.id,p.userid,p.name";
		}
		PageUtil p=CommonDAO.findByMultiTableSQLQuery(sql,Inventory.class);
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
			sql="select i.id,i.barcode,p.name,p.userid,i.amount,p.price,i.discount,i.operator,i.date from dd_inventory i left join dd_product p on i.barcode=p.barcode where p.userid='"+userid+"' and i.amount>0 and i.id>=(select v.id from dd_inventory v left join dd_product p1 on v.barcode=p1.barcode where p1.userid='"+userid+"' and v.amount>0 order by v.id limit "+(start-1)+",1) order by i.id,p.userid,p.name";
		}else
		{
			sql="select i.id,i.barcode,p.name,p.userid,i.amount,p.price,i.discount,i.operator,i.date from dd_inventory i left join dd_product p on i.barcode=p.barcode where i.amount>0 and i.id>=(select id from dd_inventory order by id limit "+(start-1)+",1) order by i.id,p.userid,p.name";
		}
		PageUtil p=CommonDAO.findPageByMultiTableSQLQuery(this.total,sql,start,perpage,Inventory.class);
		String content = "totalPage = " + p.getTotalPageCount() + ";";
		content += "dataStore = [";

		List l=(List)p.getResult();
		for(int i=0;i<l.size();i++)
		{
			Inventory d=(Inventory)l.get(i);
			Timestamp date=d.getDate();
			if(t.equals("1"))
			{
				content += "\"<tr id='"+d.getId()+"'><td><input type='checkbox' name='row' value='"+d.getId()+"'/></td><td>"+d.getBarcode()+"</td><td>"+d.getName()+"</td><td>"+d.getUserid()+"</td><td class='editbox' id='amount'>"+d.getAmount()+"</td><td>"+d.getPrice()+"</td><td class='editbox' id='discount'>"+d.getDiscount()+"</td><td>"+d.getOperator()+"</td><td>"+date+"</td></tr>\",";
			}else
			{
				content += "\"<tr id='"+d.getId()+"'><td><input type='checkbox' name='row' value='"+d.getId()+"'/></td><td>"+d.getBarcode()+"</td><td>"+d.getName()+"</td><td>"+d.getUserid()+"</td><td>"+d.getAmount()+"</td><td>"+d.getPrice()+"</td><td>"+d.getDiscount()+"</td><td>"+d.getOperator()+"</td><td>"+date+"</td></tr>\",";
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
			sql="select i.id from dd_inventory i left join dd_product p on i.barcode=p.barcode where p.userid='"+userid+"' and i.amount>0";
		}else
		{
			 sql="select i.id from dd_inventory i where i.amount>0";
		}
		int count=CommonDAO.count(sql);
		this.total=count;
		return count;
	}
}
