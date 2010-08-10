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
import org.osinfo.core.webapp.model.custom.Sales;
import org.osinfo.core.webapp.util.ExcelUtil;
import org.osinfo.core.webapp.util.PageUtil;
@Results({
	 @Result(name="list",location = "/WEB-INF/result/system/sale/list.ftl")
})
/**
 * @Author Lucifer.Zhou 4:29:47 PM Jan 6, 2010
 * @Description
 * 销售记录
 */
public class SaleAction<T> extends CrudAction{
	private static Logger logger = Logger.getLogger ( SaleAction.class.getName () ) ;
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

	//售货,插入销售明细，同时也记录销售交易记录表
	@Override
	public String add() {
		// TODO Auto-generated method stub
		String rowsvalue=getParameter("rowsvalue");
		String totalprice=getParameter("totalprice");
		String receive=getParameter("receive");
		String change=getParameter("change");
		String transaction=getParameter("transaction");
		String submitdate=getCurrentTime();
		String operator=(String) getSession().getAttribute("userid");
		//记录明细表
		String[] v=rowsvalue.split("\\|");
		for(int i=0;i<v.length;i++)
		{
			String[] b=v[i].split("\\,");
			String sql="insert into dd_sales (transaction,barcode,discount,amount,operator,date) " +
			"values ('"+transaction+"','"+b[0]+"',"+b[3]+","+b[4]+",'"+operator+"','"+submitdate+"')";
			CommonDAO.executeUpdate(sql);
			sql="select * from dd_inventory where barcode='"+b[0]+"'";//获取库存数量
			List l2=CommonDAO.executeQuery(sql, DdInventory.class);
			if(l2.size()==1)
			{
				DdInventory vs=(DdInventory)l2.get(0);//更新库存数量
				sql="update dd_inventory set amount="+(vs.getAmount()-Integer.valueOf(b[4]))+" where id ="+vs.getId();
				CommonDAO.executeUpdate(sql);
			}	

		}
		//记录交易记录表 
		String sql="insert into dd_bill (transaction,receive,changes,totalprice,operator,date) " +
		"values ('"+transaction+"',"+receive+","+change+","+totalprice+",'"+operator+"','"+submitdate+"')";
		CommonDAO.executeUpdate(sql);
    	renderSimpleResult(true,"操作成功,交易号:"+transaction);
	    return null;
	}
	
	@Override
	public String del() {
		// TODO Auto-generated method stub
		if(logger.isDebugEnabled())
			logger.debug("加载删除页面...");
	    String ids=getParameter("ids");
	    if(!"".equals(ids.trim())){
	    		String sql="delete from dd_sales where id in ("+ids.substring(0,ids.length()-1)+")";
	    		CommonDAO.executeUpdate(sql);
	    }
	    renderSimpleResult(true,"操作成功");
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
		String name="销售记录表";
		String name2=name;
		if (getRequest().getHeader("User-Agent").toLowerCase().indexOf("firefox") > 0)
			name2 = new String(name.getBytes("UTF-8"), "ISO8859-1");//firefox浏览器
		else if (getRequest().getHeader("User-Agent").toUpperCase().indexOf("MSIE") > 0)
			name2 = URLEncoder.encode(name, "UTF-8");//IE浏览器 终极解决文件名乱码

		getResponse().setHeader("Content-disposition","attachment;filename=" +name2+"-"+getCurrentTime() + ".xls");
		String[] headers = { "序号","交易号","条形码", "名称","折扣", "数量", "价格","操作者","日期"};
		String sql;
		String userid=(String) getSession().getAttribute("userid");
		String t=(String) getSession().getAttribute("type");
		if(t.equals("2"))
			sql="select s.id,s.transaction,s.barcode,p.name,s.discount,s.amount,p.price,s.operator,s.date from dd_sales s left join dd_product p on s.barcode=p.barcode where p.userid='"+userid+"' and s.amount>0 order by s.date desc";
		else
			sql="select s.id,s.transaction,s.barcode,p.name,s.discount,s.amount,p.price,s.operator,s.date from dd_sales s left join dd_product p on s.barcode=p.barcode where s.amount>0 order by s.date desc";;
		
			PageUtil p=CommonDAO.findByMultiTableSQLQuery(sql,Sales.class);
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
			sql="select s.id,s.transaction,s.barcode,p.name,s.discount,s.amount,p.price,s.operator,s.date from dd_sales s left join dd_product p on s.barcode=p.barcode where p.userid='"+userid+"' and s.amount>0 order by s.date desc";
		else
			sql="select s.id,s.transaction,s.barcode,p.name,s.discount,s.amount,p.price,s.operator,s.date from dd_sales s left join dd_product p on s.barcode=p.barcode where s.amount>0 order by s.date desc";;
		
		PageUtil p=CommonDAO.findPageByMultiTableSQLQuery(sql,start,end,perpage,Sales.class);
		
		String content = "totalPage = " + p.getTotalPageCount() + ";";
		content += "dataStore = [";

		List l=(List)p.getResult();
		for(int i=0;i<l.size();i++)
		{
			Sales d=(Sales)l.get(i);

			content += "\"<tr id='"+d.getId()+"'><td><input type='checkbox' name='row' value='"+d.getId()+"'/></td><td>"+d.getTransaction()+"</td><td>"+d.getBarcode()+"</td><td>"+d.getName()+"</td><td>"+d.getDiscount()+"</td><td>"+d.getAmount()+"</td><td>"+d.getPrice()+"</td><td>"+d.getOperator()+"</td><td>"+d.getDate()+"</td></tr>\",";
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
			sql="select s.id  from dd_sales s left join dd_product p on s.barcode=p.barcode where p.userid='"+userid+"' and s.amount>0 order by s.date desc";
		else
			sql="select * from dd_sales  where  amount>0 order by date desc";;
		
		int count=CommonDAO.count(sql);
		return count;
	}
}
