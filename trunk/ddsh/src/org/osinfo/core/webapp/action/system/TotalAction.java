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
import org.osinfo.core.webapp.model.custom.Total;
import org.osinfo.core.webapp.util.ExcelUtil;
import org.osinfo.core.webapp.util.PageUtil;
@Results({
	 @Result(name="list",location = "/WEB-INF/result/system/total/list.ftl")
})
/**
 * @Author Lucifer.Zhou 4:29:47 PM Jan 6, 2010
 * @Description
 * 统计记录
 */
public class TotalAction<T> extends CrudAction{
	private static Logger logger = Logger.getLogger ( TotalAction.class.getName () ) ;
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

	    return null;
	}
	
	@Override
	public String del() {
		// TODO Auto-generated method stub

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
		String[] headers = { "编号","设计师编号","月份","销售额"};
		String sql;

			sql="select s.id,p.userid,DATE_FORMAT(s.date,'%m') as month,ROUND(sum(s.discount*p.price*s.amount),2) as amount  from dd_sales s left join dd_product p on s.barcode=p.barcode where DATE_FORMAT(s.date,'%Y')=DATE_FORMAT(now(),'%Y') group by DATE_FORMAT(s.date,'%Y-%m') desc,p.userid desc";;
		
			PageUtil p=CommonDAO.findByMultiTableSQLQuery(sql,Total.class);
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
			sql="select s.id,p.userid,DATE_FORMAT(s.date,'%m') as month,ROUND(sum(s.discount*p.price*s.amount),2) as amount  from dd_sales s left join dd_product p on s.barcode=p.barcode where DATE_FORMAT(s.date,'%Y')=DATE_FORMAT(now(),'%Y') group by DATE_FORMAT(s.date,'%Y-%m') desc,p.userid desc";;
		
		PageUtil p=CommonDAO.findPageByMultiTableSQLQuery(sql,start,end,perpage,Total.class);
		
		String content = "totalPage = " + p.getTotalPageCount() + ";";
		content += "dataStore = [";

		List l=(List)p.getResult();
		for(int i=0;i<l.size();i++)
		{
			Total d=(Total)l.get(i);
			content += "\"<tr><td>"+d.getUserid()+"</td><td>"+d.getMonth()+"</td><td>"+d.getAmount()+"</td></tr>\",";
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
			sql="select s.id  from dd_sales s left join dd_product p on s.barcode=p.barcode where DATE_FORMAT(s.date,'%Y')=DATE_FORMAT(now(),'%Y') group by DATE_FORMAT(s.date,'%Y-%m') desc,p.userid desc";

		int count=CommonDAO.count(sql);
		return count;
	}
}
