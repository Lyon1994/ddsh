/**
 * @Author Lucifer.Zhou 4:29:47 PM Jan 6, 2010
 * @MSN zhoujianguo_leo@hotmail.com
 * @Mail leo821031@gmail.com
 * @FileName LoginAction.java
 * @JDKVersion 1.5
 * @Site http://www.osinfo.org
 */
package org.osinfo.core.webapp.action.system;

import java.io.UnsupportedEncodingException;
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
import org.osinfo.core.webapp.model.DdBack;
import org.osinfo.core.webapp.model.custom.Query;
import org.osinfo.core.webapp.util.DBUtil;
import org.osinfo.core.webapp.util.ExcelUtil;
import org.osinfo.core.webapp.util.PageUtil;
@Results({
	 @Result(name="list",location = "/WEB-INF/result/system/query/list.ftl"),
	 @Result(name="list2",location = "/WEB-INF/result/system/query/list2.ftl"),
})
/**
 * @Author Lucifer.Zhou 4:29:47 PM Jan 6, 2010
 * @Description
 * 查询
 */
public class QueryAction<T> extends CrudAction{
	private static Logger logger = Logger.getLogger ( QueryAction.class.getName () ) ;
	/**
	 * @Author Lucifer.Zhou 4:30:01 PM Jan 6, 2010
	 * long LoginAction.java
	 * @Description
	 *
	 */
	private static final long serialVersionUID = 1L;

	//商品退回
	@Override
	public String add() {
		// TODO Auto-generated method stub
		String transaction=getParameter("transaction");
		String userid=getParameter("userid");
		String barcode=getParameter("barcode");
		String name=getParameter("name");
		String begin=getParameter("begin");
		String end=getParameter("end");
		getRequest().setAttribute("transaction", transaction);
		getRequest().setAttribute("userid", userid);
		getRequest().setAttribute("barcode", barcode);
		getRequest().setAttribute("name", name);
		getRequest().setAttribute("begin", begin);
		getRequest().setAttribute("end", end);
		
		return "list";
	}
	public String test() {
		// TODO Auto-generated method stub

	    renderSimpleResult(true,"ok");
        return null;
	}
	//按今日、本周、本月、本季、今年以条状图显示
	public String total() {
		// TODO Auto-generated method stub
		String type=getParameter("type");
		byte[] utf8Bom = new byte[]{(byte) 0xef, (byte) 0xbb, (byte) 0xbf};   
		String utf8BomStr="";   
		try {   
		utf8BomStr = new String(utf8Bom,"UTF-8");//定义BOM标记   
		} catch (UnsupportedEncodingException e) {   
		   e.printStackTrace();   
		}
		getResponse().setContentType("text/xml;charset=GBK"); //必须是GBK，不累caption无法显示
		StringBuffer chart = new StringBuffer();   
		StringBuffer categories = new StringBuffer(); 
		StringBuffer dataset = new StringBuffer(); 
		chart.append("<?xml version='1.0' encoding='GBK'?>");//必须是GBK，不累seriesName无法显示
		if(type.equals("1"))//年销售额
		{
			String sql="select DATE_FORMAT(date,'%Y') as year,ROUND(sum(discount*price*amount),2) as sum  from dd_sales group by DATE_FORMAT(date,'%Y')";
			ResultSet rs = null;
			Statement stmt = null;
			Connection conn=DBUtil.getConnection();
			try {
				stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
				rs=stmt.executeQuery(sql);
				while(rs.next())
				{
					categories.append("<category label='"+rs.getString("year")+"' />");
					dataset.append("<set value='"+rs.getString("sum")+"' />");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				DBUtil.close(rs, stmt, conn);
			}
			chart.append("<chart palette='2' caption='年销售分析' shownames='1' showvalues='1' decimals='2' numberPrefix='￥'>");   
			
			chart.append("<categories>"); 
			chart.append(categories.toString()); 
			chart.append("</categories>"); 
			
			chart.append("<dataset seriesName='销售收入' color='AFD8F8' decimalSeparator=',' thousandSeparator='.' formatNumber='1' showValues='1' decimalPrecision='2' numberPrefix='%A5'>"); 
			chart.append(dataset.toString()); 
			chart.append("</dataset>"); 
			
			chart.append("</chart>"); 
		}else if(type.equals("2"))//按月销售额
		{
			String sql="select DATE_FORMAT(date,'%Y-%m') as year,ROUND(sum(discount*price*amount),2) as sum  from dd_sales where DATE_FORMAT(date,'%Y')=DATE_FORMAT(now(),'%Y') group by DATE_FORMAT(date,'%Y-%m')";
			ResultSet rs = null;
			Statement stmt = null;
			Connection conn=DBUtil.getConnection();
			try {
				stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
				rs=stmt.executeQuery(sql);
				while(rs.next())
				{
					categories.append("<category label='"+rs.getString("year")+"' />");
					dataset.append("<set value='"+rs.getString("sum")+"' />");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				DBUtil.close(rs, stmt, conn);
			}
			chart.append("<chart palette='2' caption='月销售分析' shownames='1' showvalues='1' decimals='2' numberPrefix='￥'>");   
			
			chart.append("<categories>"); 
			chart.append(categories.toString()); 
			chart.append("</categories>"); 
			
			chart.append("<dataset seriesName='销售收入' color='AFD8F8' decimalSeparator=',' thousandSeparator='.' formatNumber='1' showValues='1' decimalPrecision='2' numberPrefix='%A5'>"); 
			chart.append(dataset.toString()); 
			chart.append("</dataset>"); 
			
			chart.append("</chart>"); 
		}else if(type.equals("3"))//按本月销售额
		{
			String sql="select DATE_FORMAT(date,'%m-%d') as year,ROUND(sum(discount*price*amount),2) as sum  from dd_sales where DATE_FORMAT(date,'%Y-%m')=DATE_FORMAT(now(),'%Y-%m') group by DATE_FORMAT(date,'%Y-%m-%d')";
			ResultSet rs = null;
			Statement stmt = null;
			Connection conn=DBUtil.getConnection();
			try {
				stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
				rs=stmt.executeQuery(sql);
				while(rs.next())
				{
					categories.append("<category label='"+rs.getString("year")+"' />");
					dataset.append("<set value='"+rs.getString("sum")+"' />");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				DBUtil.close(rs, stmt, conn);
			}
			chart.append("<chart palette='2' caption='本月销售分析' shownames='1' showvalues='1' decimals='2' numberPrefix='￥'>");   
			
			chart.append("<categories>"); 
			chart.append(categories.toString()); 
			chart.append("</categories>"); 
			
			chart.append("<dataset seriesName='销售收入' color='AFD8F8' decimalSeparator=',' thousandSeparator='.' formatNumber='1' showValues='1' decimalPrecision='2' numberPrefix='%A5'>"); 
			chart.append(dataset.toString()); 
			chart.append("</dataset>"); 
			
			chart.append("</chart>"); 
		}

		System.out.println(chart.toString());
		getPrintWriter().print(chart.toString());   

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
		String name="退回表";
		String name2=name;
		if (getRequest().getHeader("User-Agent").toLowerCase().indexOf("firefox") > 0)
			name2 = new String(name.getBytes("UTF-8"), "ISO8859-1");//firefox浏览器
		else if (getRequest().getHeader("User-Agent").toUpperCase().indexOf("MSIE") > 0)
			name2 = URLEncoder.encode(name, "UTF-8");//IE浏览器 终极解决文件名乱码

		getResponse().setHeader("Content-disposition","attachment;filename=" +name2+"-"+getCurrentTime() + ".xls");
		String[] headers = { "序号","上货编号","设计师","名称","数量","理由","操作人","日期"};
		String userid=(String) getSession().getAttribute("userid");
		String t=(String) getSession().getAttribute("type");
		String sql;
		if(t.equals("2"))
		{
			if(type.equals("1"))
				sql="select * from dd_back where userid='"+userid+"' and amount>0 order by date desc";
			else
				sql="select * from dd_back where userid='"+userid+"' and amount>0 order by date desc";
		}else
		{
			if(type.equals("1"))
				sql="select * from dd_back order by date desc";
			else
				sql="select * from dd_back order by date desc";
		}
		PageUtil p=CommonDAO.findByMultiTableSQLQuery(sql,DdBack.class);
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
		System.out.println("....");
		// TODO Auto-generated method stub
		String transaction=getParameter("transaction");
		String userid=getParameter("userid");
		String barcode=getParameter("barcode");
		String name=getParameter("name");
		String begin=getParameter("begin");
		String end_=getParameter("end");
		
		StringBuffer sql=new StringBuffer();
		String uid=(String) getSession().getAttribute("userid");
		String t=(String) getSession().getAttribute("type");
		sql.append("select s.*,t.userid from dd_sales s left join dd_topper t on s.barcode=t.barcode where 1=1 and s.amount>0 ");
		if(!barcode.trim().equals(""))
		{
			sql.append(" and s.barcode like '%"+barcode+"%'");
		}
		if(!transaction.trim().equals(""))
		{
			sql.append(" and s.transaction like '%"+transaction+"%'");
		}
		if(!name.trim().equals(""))
		{
			sql.append(" and s.name like '%"+name+"%'");
		}
		if(!begin.trim().equals(""))
		{
			sql.append(" and s.date >= '"+begin+"'");
		}
		if(!end_.trim().equals(""))
		{
			sql.append(" and s.date <= '"+end_+"'");
		}
		if(t.equals("2"))
		{
			sql.append(" and t.userid='"+uid+"'");
			
		}else
		{
			if(!userid.trim().equals(""))
			{
				sql.append(" and t.userid like '%"+userid+"%'");
			}
		}
		sql.append(" order by s.date desc");
		PageUtil p=CommonDAO.findPageByMultiTableSQLQuery(sql.toString(),start,end,perpage,Query.class);
		
		String content = "totalPage = " + p.getTotalPageCount() + ";";
		content += "dataStore = [";

		List l=(List)p.getResult();
		for(int i=0;i<l.size();i++)
		{
			Query d=(Query)l.get(i);

			content += "\"<tr id='"+d.getId()+"'><td><input type='checkbox' name='row' value='"+d.getId()+"'/></td><td>"+d.getTransaction()+"</td><td>"+d.getBarcode()+"</td><td>"+d.getName()+"</td><td>"+d.getDiscount()+"</td><td>"+d.getAmount()+"</td><td>"+d.getPrice()+"</td><td>"+d.getOperator()+"</td><td>"+d.getDate()+"</td><td>"+d.getUserid()+"</td></tr>\",";
		}
		content = content.substring(0,content.length()-1);
		content += "];";
		return content;
	}
	@Override
	public int myCount() {
		// TODO Auto-generated method stub
		String transaction=getParameter("transaction");
		String userid=getParameter("userid");
		String barcode=getParameter("barcode");
		String name=getParameter("name");
		String begin=getParameter("begin");
		String end_=getParameter("end");
		
		StringBuffer sql=new StringBuffer();

		String uid=(String) getSession().getAttribute("userid");
		String t=(String) getSession().getAttribute("type");
		sql.append("select s.*,t.userid from dd_sales s left join dd_topper t on s.barcode=t.barcode where 1=1 and s.amount>0 ");
		if(!barcode.trim().equals(""))
		{
			sql.append(" and s.barcode like '%"+barcode+"%'");
		}
		if(!transaction.trim().equals(""))
		{
			sql.append(" and s.transaction like '%"+transaction+"%'");
		}
		if(!name.trim().equals(""))
		{
			sql.append(" and s.name like '%"+name+"%'");
		}
		if(!begin.trim().equals(""))
		{
			sql.append(" and s.date >= '"+begin+"'");
		}
		if(!end_.trim().equals(""))
		{
			sql.append(" and s.date <= '"+end_+"'");
		}
		if(t.equals("2"))
		{
			sql.append(" and t.userid='"+uid+"'");
			
		}else
		{
			if(!userid.trim().equals(""))
			{
				sql.append(" and t.userid like '%"+userid+"%'");
			}
		}
		
		
		int count=CommonDAO.count(sql.toString());
		return count;
	}
}
