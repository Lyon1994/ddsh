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
import org.osinfo.core.webapp.model.custom.Back;
import org.osinfo.core.webapp.util.DBUtil;
import org.osinfo.core.webapp.util.ExcelUtil;
import org.osinfo.core.webapp.util.PageUtil;
@Results({
	 @Result(name="list",location = "/WEB-INF/result/system/back/list.ftl"),
	 @Result(name="list2",location = "/WEB-INF/result/system/back/list2.ftl")
})
/**
 * @Author Lucifer.Zhou 4:29:47 PM Jan 6, 2010
 * @Description
 * 商品退回
 */
public class BackAction<T> extends CrudAction{
	private static Logger logger = Logger.getLogger ( BackAction.class.getName () ) ;
	/**
	 * @Author Lucifer.Zhou 4:30:01 PM Jan 6, 2010
	 * long LoginAction.java
	 * @Description
	 *
	 */
	private static final long serialVersionUID = 1L;
	//退回商品
	public String list() {
		String t=(String) getSession().getAttribute("type");
		if(t.equals("2"))
			return "list2";
		return "list";
	}
	//商品退回-只针对库存和售后退回02和03
	@Override
	public String add() {
		// TODO Auto-generated method stub
		
		String barcode=getParameter("barcode");
		String transaction=getParameter("transaction");
		
		String type=getParameter("type");
		String amount=getParameter("amount");
		String reason=getParameter("reason");
		String submitdate=getCurrentTime();

		String operator=(String) getSession().getAttribute("userid");
		String sql="";
		Connection conn=DBUtil.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		List list = new ArrayList();
		if(type.equals("02"))//库存退回，则库存数量减少
		{
			
			sql="insert into dd_back (barcode,amount,type,reason,operator,date) " +
			"values ('"+barcode+"',"+amount+",'02','"+reason+"','"+operator+"','"+submitdate+"')";
			String sql2="select * from dd_inventory where barcode ='"+barcode+"'";
			try {
				conn.setAutoCommit(false);
				stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
				stmt.executeUpdate(sql);
				rs=stmt.executeQuery(sql2);
				list = DBUtil.populate(rs, DdInventory.class);

		    	for(int i=0;i<list.size();i++)
		    	{
		    		DdInventory t=(DdInventory)list.get(i);
		    		sql="update dd_inventory set  amount="+(t.getAmount()-Integer.valueOf(amount))+" where id ="+t.getId();
		    		stmt.executeUpdate(sql);
		    	}
		    	conn.commit();
		    	conn.setAutoCommit(true);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
		    	renderSimpleResult(false,"交易失败！");
				e.printStackTrace();
			}finally {
				DBUtil.close(rs, stmt, conn);
			}

		}else if(type.equals("03"))//售后退回，则一律先进入库存
		{
			sql="insert into dd_back (barcode,transaction,amount,type,reason,operator,date) " +
			"values ('"+barcode+"','"+transaction+"',"+amount+",'03','"+reason+"','"+operator+"','"+submitdate+"')";
			
			String sql2="select * from dd_inventory where barcode ='"+barcode+"'";
			try {
				conn.setAutoCommit(false);
				stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
				stmt.executeUpdate(sql);
				rs=stmt.executeQuery(sql2);
				list = DBUtil.populate(rs, DdInventory.class);

		    	for(int i=0;i<list.size();i++)
		    	{
		    		DdInventory t=(DdInventory)list.get(i);
		    		sql="update dd_inventory set  amount="+(t.getAmount()+Integer.valueOf(amount))+" where id ="+t.getId();
			    	stmt.executeUpdate(sql);
		    	}
		    	conn.commit();
		    	conn.setAutoCommit(true);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				renderSimpleResult(false,"交易失败！");
				e.printStackTrace();
			}finally {
				DBUtil.close(rs, stmt, conn);
			}
		}
    	renderSimpleResult(true,"交易成功！");
	    return null;
	}

	@Override
	public String del() {
		// TODO Auto-generated method stub
		if(logger.isDebugEnabled())
			logger.debug("加载删除页面...");
	    String ids=getParameter("ids");
	    if(!"".equals(ids.trim())){
	    		String sql="delete from dd_back where id in ("+ids.substring(0,ids.length()-1)+")";
	    		CommonDAO.executeUpdate(sql);
	    }
	    renderSimpleResult(true,"处理完毕");
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
		String name="退回表";
		String name2=name;
		if (getRequest().getHeader("User-Agent").toLowerCase().indexOf("firefox") > 0)
			name2 = new String(name.getBytes("UTF-8"), "ISO8859-1");//firefox浏览器
		else if (getRequest().getHeader("User-Agent").toUpperCase().indexOf("MSIE") > 0)
			name2 = URLEncoder.encode(name, "UTF-8");//IE浏览器 终极解决文件名乱码

		getResponse().setHeader("Content-disposition","attachment;filename=" +name2+"-"+getCurrentTime() + ".xls");
		String[] headers = { "序号","条形码","交易号","名称","设计师","数量","单价","退回类型","原因","操作人","日期"};
		String userid=(String) getSession().getAttribute("userid");
		String t=(String) getSession().getAttribute("type");
		String sql;
		if(t.equals("2"))
				sql="select b.id,b.barcode,b.transaction,p.name,p.userid,b.amount,p.price,(select value from dd_dic d where d.parent='back' and d.child=b.type) as type,(select value from dd_dic d where d.parent='reason' and d.child=b.reason) as reason,b.operator,b.date from dd_back b left join dd_product p on b.barcode=p.barcode where p.userid='"+userid+"'  order by b.date desc";
		else
				sql="select b.id,b.barcode,b.transaction,p.name,p.userid,b.amount,p.price,(select value from dd_dic d where d.parent='back' and d.child=b.type) as type,(select value from dd_dic d where d.parent='reason' and d.child=b.reason) as reason,b.operator,b.date from dd_back b left join dd_product p on b.barcode=p.barcode  order by b.date desc";
		PageUtil p=CommonDAO.findByMultiTableSQLQuery(sql,Back.class);
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
			sql="select * from (select b.id,b.barcode,b.transaction,p.name,p.userid,b.amount,p.price,(select value from dd_dic d where d.parent='back' and d.child=b.type) as type,(select value from dd_dic d where d.parent='reason' and d.child=b.reason) as reason,b.operator,b.date from dd_back b left join dd_product p on b.barcode=p.barcode where p.userid='"+userid+"' and b.id<=(select v.id from dd_back v left join dd_product p1 on v.barcode=p1.barcode where p1.userid='"+userid+"'  order by v.id desc limit "+(start-1)+",1) ) as s order by s.id desc";
		else
			sql="select * from (select b.id,b.barcode,b.transaction,p.name,p.userid,b.amount,p.price,(select value from dd_dic d where d.parent='back' and d.child=b.type) as type,(select value from dd_dic d where d.parent='reason' and d.child=b.reason) as reason,b.operator,b.date from dd_back b left join dd_product p on b.barcode=p.barcode  where  b.id<=(select id from dd_back order by id desc limit "+(start-1)+",1) ) as s order by s.id desc";
		PageUtil p=CommonDAO.findPageByMultiTableSQLQuery(this.total,sql,start,perpage,Back.class);
		
		String content = "totalPage = " + p.getTotalPageCount() + ";";
		content += "dataStore = [";

		List l=(List)p.getResult();
		for(int i=0;i<l.size();i++)
		{
			Back d=(Back)l.get(i);

			content += "\"<tr id='"+d.getId()+"'><td><input type='checkbox' name='row' value='"+d.getId()+"'/></td><td>"+d.getBarcode()+"</td><td>"+d.getTransaction()+"</td><td>"+d.getName()+"</td><td>"+d.getUserid()+"</td><td>"+d.getAmount()+"</td><td>"+d.getPrice()+"</td><td>"+d.getType()+"</td><td>"+d.getReason()+"</td><td>"+d.getOperator()+"</td><td>"+d.getDate()+"</td></tr>\",";
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
				sql="select b.id from dd_back b left join dd_product p on b.barcode=p.barcode   where p.userid='"+userid+"' ";
		else
				sql="select id from dd_back ";
		int count=CommonDAO.count(sql);
		this.total=count;
		return count;
	}
}
