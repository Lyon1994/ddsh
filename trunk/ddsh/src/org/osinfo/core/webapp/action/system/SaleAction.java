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
import org.osinfo.core.webapp.model.DdBack;
import org.osinfo.core.webapp.model.DdInventory;
import org.osinfo.core.webapp.model.DdSales;
import org.osinfo.core.webapp.model.DdSell;
import org.osinfo.core.webapp.model.DdTopper;
import org.osinfo.core.webapp.util.ExcelUtil;
import org.osinfo.core.webapp.util.PageUtil;
@Results({
	 @Result(name="list",location = "/WEB-INF/result/system/sale/list.ftl"),
	 @Result(name="list2",location = "/WEB-INF/result/system/sale/list2.ftl"),
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
	//出售的时候要注意物品时从货架上拿的话，要先走下架，放入库存，再出售
	//如果是从库存拿的话不需要走下架
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
			String sql="insert into dd_sales (transaction,barcode,name,discount,amount,price,operator,date) " +
			"values ('"+transaction+"','"+b[0]+"','"+b[1]+"',"+b[4]+","+b[3]+","+b[2]+",'"+operator+"','"+submitdate+"')";
			CommonDAO.executeUpdate(sql);
			if(b[5].equals("1"))//货架
			{
				sql="select * from dd_sell where barcode='"+b[0]+"'";//获取库存数量
				List l2=CommonDAO.executeQuery(sql, DdSell.class);
				if(l2.size()>0)
				{
					DdInventory vs=(DdInventory)l2.get(0);//更新库存数量
					sql="update dd_sell set amount="+(vs.getAmount()-Integer.valueOf(b[3]))+" where id ="+vs.getId();
					CommonDAO.executeUpdate(sql);
				}
			}else//库存
			{
				sql="select * from dd_inventory where barcode='"+b[0]+"'";//获取库存数量
				List l2=CommonDAO.executeQuery(sql, DdInventory.class);
				if(l2.size()>0)
				{
					DdInventory vs=(DdInventory)l2.get(0);//更新库存数量
					sql="update dd_inventory set amount="+(vs.getAmount()-Integer.valueOf(b[3]))+" where id ="+vs.getId();
					CommonDAO.executeUpdate(sql);
				}	
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
		String name="销售记录表";
		String name2=name;
		if (getRequest().getHeader("User-Agent").toLowerCase().indexOf("firefox") > 0)
			name2 = new String(name.getBytes("UTF-8"), "ISO8859-1");//firefox浏览器
		else if (getRequest().getHeader("User-Agent").toUpperCase().indexOf("MSIE") > 0)
			name2 = URLEncoder.encode(name, "UTF-8");//IE浏览器 终极解决文件名乱码

		getResponse().setHeader("Content-disposition","attachment;filename=" +name2+"-"+getCurrentTime() + ".xls");
		String[] headers = { "序号","交易号","条形码", "名称","折扣", "数量", "价格","操作者","日期"};
		String userid=(String) getSession().getAttribute("userid");
		String t=(String) getSession().getAttribute("type");
		String sql;
		sql="select * from dd_sales where amount>0 order by date desc";
		PageUtil p=CommonDAO.findByMultiTableSQLQuery(sql,DdSales.class);
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
		sql="select * from dd_sales where amount>0 order by date desc";
		PageUtil p=CommonDAO.findPageByMultiTableSQLQuery(sql,start,end,perpage,DdSales.class);
		
		String content = "totalPage = " + p.getTotalPageCount() + ";";
		content += "dataStore = [";

		List l=(List)p.getResult();
		for(int i=0;i<l.size();i++)
		{
			DdSales d=(DdSales)l.get(i);

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
		sql="select * from dd_sales where amount>0";
		int count=CommonDAO.count(sql);
		return count;
	}
}
