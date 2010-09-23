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
	 @Result(name="list",location = "/WEB-INF/result/system/total4/list.ftl")
})
/**
 * @Author Lucifer.Zhou 4:29:47 PM Jan 6, 2010
 * @Description
 * 统计记录
 */
public class Total4Action<T> extends CrudAction{
	private static Logger logger = Logger.getLogger ( Total4Action.class.getName () ) ;
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
		String name="年报(按设计师)";
		String name2=name;
		if (getRequest().getHeader("User-Agent").toLowerCase().indexOf("firefox") > 0)
			name2 = new String(name.getBytes("UTF-8"), "ISO8859-1");//firefox浏览器
		else if (getRequest().getHeader("User-Agent").toUpperCase().indexOf("MSIE") > 0)
			name2 = URLEncoder.encode(name, "UTF-8");//IE浏览器 终极解决文件名乱码

		getResponse().setHeader("Content-disposition","attachment;filename=" +name2+"-"+getCurrentTime() + ".xls");
		String[] headers = { "编号","月份","设计师","销售额","退货额","净利润"};
		String userid=(String) getSession().getAttribute("userid");
		String t=(String) getSession().getAttribute("type");
		String sql;
		if(t.equals("2"))
		{
			sql="select id,year,userid,sum1, sum2,(sum1-sum2) as sum3 from(SELECT s.id,DATE_FORMAT(S.DATE, '%Y-%m') AS year,P.userid,IFNULL(ROUND(SUM(S.DISCOUNT * P.PRICE * S.AMOUNT), 2),0) AS sum1,IFNULL((select ROUND(SUM(b.DISCOUNT * P1.PRICE * b.AMOUNT), 2) from dd_back AS b  LEFT OUTER JOIN dd_product AS P1 ON b.BARCODE = P1.BARCODE where DATE_FORMAT(b.DATE, '%Y-%m')=year and b.type='03' and p1.userid=P.userid),0) as sum2 FROM dd_sales AS S LEFT OUTER JOIN dd_product AS P ON S.BARCODE = P.BARCODE  GROUP BY DATE_FORMAT(S.DATE, '%Y-%m'),userid) as v where userid='"+userid+"'";
		}else
		{
			sql="select id,year,userid,sum1, sum2,(sum1-sum2) as sum3 from(SELECT s.id,DATE_FORMAT(S.DATE, '%Y-%m') AS year,P.userid,IFNULL(ROUND(SUM(S.DISCOUNT * P.PRICE * S.AMOUNT), 2),0) AS sum1,IFNULL((select ROUND(SUM(b.DISCOUNT * P1.PRICE * b.AMOUNT), 2) from dd_back AS b  LEFT OUTER JOIN dd_product AS P1 ON b.BARCODE = P1.BARCODE where DATE_FORMAT(b.DATE, '%Y-%m')=year and b.type='03' and p1.userid=P.userid),0) as sum2 FROM dd_sales AS S LEFT OUTER JOIN dd_product AS P ON S.BARCODE = P.BARCODE  GROUP BY DATE_FORMAT(S.DATE, '%Y-%m'),userid) as v";
		}
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
		String userid=(String) getSession().getAttribute("userid");
		String t=(String) getSession().getAttribute("type");
		String sql;
		if(t.equals("2"))
		{
			sql="select id,year,userid,sum1, sum2,(sum1-sum2) as sum3 from(SELECT s.id,DATE_FORMAT(S.DATE, '%Y-%m') AS year,P.userid,IFNULL(ROUND(SUM(S.DISCOUNT * P.PRICE * S.AMOUNT), 2),0) AS sum1,IFNULL((select ROUND(SUM(b.DISCOUNT * P1.PRICE * b.AMOUNT), 2) from dd_back AS b  LEFT OUTER JOIN dd_product AS P1 ON b.BARCODE = P1.BARCODE where DATE_FORMAT(b.DATE, '%Y-%m')=year and b.type='03' and p1.userid=P.userid),0) as sum2 FROM dd_sales AS S LEFT OUTER JOIN dd_product AS P ON S.BARCODE = P.BARCODE  GROUP BY DATE_FORMAT(S.DATE, '%Y-%m'),userid) as v where userid='"+userid+"'";
		}else
		{
			sql="select id,year,userid,sum1, sum2,(sum1-sum2) as sum3 from(SELECT s.id,DATE_FORMAT(S.DATE, '%Y-%m') AS year,P.userid,IFNULL(ROUND(SUM(S.DISCOUNT * P.PRICE * S.AMOUNT), 2),0) AS sum1,IFNULL((select ROUND(SUM(b.DISCOUNT * P1.PRICE * b.AMOUNT), 2) from dd_back AS b  LEFT OUTER JOIN dd_product AS P1 ON b.BARCODE = P1.BARCODE where DATE_FORMAT(b.DATE, '%Y-%m')=year and b.type='03' and p1.userid=P.userid),0) as sum2 FROM dd_sales AS S LEFT OUTER JOIN dd_product AS P ON S.BARCODE = P.BARCODE  GROUP BY DATE_FORMAT(S.DATE, '%Y-%m'),userid) as v";
		}
		PageUtil p=CommonDAO.findPageByMultiTableSQLQuery(sql,start,end,perpage,Total.class);
		
		String content = "totalPage = " + p.getTotalPageCount() + ";";
		content += "dataStore = [";

		List l=(List)p.getResult();
		for(int i=0;i<l.size();i++)
		{
			Total d=(Total)l.get(i);
			content += "\"<tr id='"+d.getId()+"'><td>"+d.getYear()+"</td><td>"+d.getUserid()+"</td><td>"+d.getSum1()+"</td><td>"+d.getSum2()+"</td><td>"+d.getSum3()+"</td></tr>\",";
		}
		content = content.substring(0,content.length()-1);
		content += "];";
		return content;
	}
	@Override
	public int myCount() {
		// TODO Auto-generated method stub
		String userid=(String) getSession().getAttribute("userid");
		String t=(String) getSession().getAttribute("type");
		String sql;
		if(t.equals("2"))
		{
			sql="SELECT s.id FROM dd_sales AS S LEFT OUTER JOIN dd_product AS P ON S.BARCODE = P.BARCODE  where userid='"+userid+"' GROUP BY DATE_FORMAT(s.date,'%Y-%m'),userid";
		}else
		{
			sql="SELECT s.id FROM dd_sales AS S LEFT OUTER JOIN dd_product AS P ON S.BARCODE = P.BARCODE  GROUP BY DATE_FORMAT(s.date,'%Y-%m'),userid";
		}

		int count=CommonDAO.count(sql);
		return count;
	}
}
