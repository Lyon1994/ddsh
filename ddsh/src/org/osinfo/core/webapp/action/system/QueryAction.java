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
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import net.sf.json.JSON;
import net.sf.json.JSONSerializer;

import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.osinfo.core.webapp.action.CrudAction;
import org.osinfo.core.webapp.action.util.DynamicGrid;
import org.osinfo.core.webapp.dao.CommonDAO;
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
	//最新销售记录
	public String latest()
	{
		String sql="select p.name,(select u.brand from dd_user u where u.userid=p.userid) as brand,s.date as date2,s.amount,time_format(timediff(now(),s.date),'%H,%i,%s') as date from dd_sales s left join dd_product p on s.barcode=p.barcode where s.date< now()  order by s.date desc limit 30";
		ResultSet rs = null;
		Statement stmt = null;
		Connection conn=DBUtil.getConnection();
		List l=new ArrayList();
		try {
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
			rs=stmt.executeQuery(sql);
			while(rs.next())
			{
		        String time = rs.getString("date");
		       // System.out.println(time);
		        String t="";
				String[] tmp=time.split("\\,");
				int hours=Integer.parseInt(tmp[0]);
				int minis=Integer.parseInt(tmp[1]);
				int seconds=Integer.parseInt(tmp[2]);
				
				if(hours>0)
				{
					t=hours+"小时前";
				}else if(minis>0)
				{
					t=minis+"分钟前";
				}else
					t=seconds+"秒钟前";
					
				l.add("<li>售出&nbsp;&nbsp;&nbsp;<font color='green'>"+rs.getString("name")+"</font>&nbsp;&nbsp;&nbsp;"+rs.getString("amount")+"件&nbsp;&nbsp;&nbsp;"+t+"</li>");
			}
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(rs, stmt, conn);
		}
	    JSON json = JSONSerializer.toJSON( l);
	    renderJson(json.toString());
		
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
			String sql;
			String userid=(String) getSession().getAttribute("userid");
			String t=(String) getSession().getAttribute("type");
			if(t.equals("2"))
				sql="select DATE_FORMAT(s.date,'%m') as year,ROUND(sum(s.discount*p.price*s.amount),2) as sum  from dd_sales s left join dd_product p on s.barcode=p.barcode where DATE_FORMAT(s.date,'%Y')=DATE_FORMAT(now(),'%Y') and p.userid='"+userid+"' group by DATE_FORMAT(s.date,'%Y-%m')";
			else
				sql="select DATE_FORMAT(s.date,'%m') as year,ROUND(sum(s.discount*p.price*s.amount),2) as sum  from dd_sales s left join dd_product p on s.barcode=p.barcode where DATE_FORMAT(s.date,'%Y')=DATE_FORMAT(now(),'%Y') group by DATE_FORMAT(s.date,'%Y-%m')";
			
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
			String sql;
			String userid=(String) getSession().getAttribute("userid");
			String t=(String) getSession().getAttribute("type");
			if(t.equals("2"))
				sql="select DATE_FORMAT(s.date,'%d') as year,ROUND(sum(s.discount*p.price*s.amount),2) as sum  from dd_sales s left join dd_product p on s.barcode=p.barcode where DATE_FORMAT(s.date,'%Y-%m')=DATE_FORMAT(now(),'%Y-%m') and p.userid='"+userid+"' group by p.userid,DATE_FORMAT(s.date,'%Y-%m-%d')";
			else
				sql="select DATE_FORMAT(s.date,'%d') as year,ROUND(sum(s.discount*p.price*s.amount),2) as sum  from dd_sales s left join dd_product p on s.barcode=p.barcode where DATE_FORMAT(s.date,'%Y-%m')=DATE_FORMAT(now(),'%Y-%m') group by DATE_FORMAT(s.date,'%Y-%m-%d')";

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
		}else if(type.equals("4"))//按上月销售额
		{
			String sql;
			String userid=(String) getSession().getAttribute("userid");
			String t=(String) getSession().getAttribute("type");
			if(t.equals("2"))
				sql="select DATE_FORMAT(s.date,'%d') as year,ROUND(sum(s.discount*p.price*s.amount),2) as sum  from dd_sales  s left join dd_product p on s.barcode=p.barcode where DATE_FORMAT(s.date,'%Y-%m')=DATE_FORMAT(DATE_SUB(curdate(), INTERVAL 1 MONTH),'%Y-%m') and p.userid='"+userid+"' group by DATE_FORMAT(s.date,'%Y-%m-%d')";
			else
				sql="select DATE_FORMAT(s.date,'%d') as year,ROUND(sum(s.discount*p.price*s.amount),2) as sum  from dd_sales  s left join dd_product p on s.barcode=p.barcode where DATE_FORMAT(s.date,'%Y-%m')=DATE_FORMAT(DATE_SUB(curdate(), INTERVAL 1 MONTH),'%Y-%m') group by DATE_FORMAT(s.date,'%Y-%m-%d')";
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
			chart.append("<chart palette='2' caption='上月销售分析' shownames='1' showvalues='1' decimals='2' numberPrefix='￥'>");   
			
			chart.append("<categories>"); 
			chart.append(categories.toString()); 
			chart.append("</categories>"); 
			
			chart.append("<dataset seriesName='销售收入' color='AFD8F8' decimalSeparator=',' thousandSeparator='.' formatNumber='1' showValues='1' decimalPrecision='2' numberPrefix='%A5'>"); 
			chart.append(dataset.toString()); 
			chart.append("</dataset>"); 
			
			chart.append("</chart>"); 
		}else if(type.equals("5"))//按本周销售额
		{
			String sql="select DATE_FORMAT(date,'%m-%d') as year,ROUND(sum(discount*price*amount),2) as sum  from dd_sales where YEARWEEK(date_format(date,'%Y-%m-%d')) = YEARWEEK(now()) group by DATE_FORMAT(date,'%Y-%m-%d')";
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
			chart.append("<chart palette='2' caption='本周销售分析' shownames='1' showvalues='1' decimals='2' numberPrefix='￥'>");   
			
			chart.append("<categories>"); 
			chart.append(categories.toString()); 
			chart.append("</categories>"); 
			
			chart.append("<dataset seriesName='销售收入' color='AFD8F8' decimalSeparator=',' thousandSeparator='.' formatNumber='1' showValues='1' decimalPrecision='2' numberPrefix='%A5'>"); 
			chart.append(dataset.toString()); 
			chart.append("</dataset>"); 
			
			chart.append("</chart>"); 
		}else if(type.equals("6"))//按上周销售额
		{
			String sql="select DATE_FORMAT(date,'%m-%d') as year,ROUND(sum(discount*price*amount),2) as sum  from dd_sales where YEARWEEK(date_format(date,'%Y-%m-%d')) = (YEARWEEK(now())-1) group by DATE_FORMAT(date,'%Y-%m-%d')";
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
			chart.append("<chart palette='2' caption='上周销售分析' shownames='1' showvalues='1' decimals='2' numberPrefix='￥'>");   
			
			chart.append("<categories>"); 
			chart.append(categories.toString()); 
			chart.append("</categories>"); 
			
			chart.append("<dataset seriesName='销售收入' color='AFD8F8' decimalSeparator=',' thousandSeparator='.' formatNumber='1' showValues='1' decimalPrecision='2' numberPrefix='%A5'>"); 
			chart.append(dataset.toString()); 
			chart.append("</dataset>"); 
			
			chart.append("</chart>"); 
		}else if(type.equals("7"))//按本周销售额TOP10
		{
			String sql="select name,ROUND(sum(discount*price*amount),2) as sum  from dd_sales where YEARWEEK(date_format(date,'%Y-%m-%d')) = YEARWEEK(now()) group by name limit 10";
			ResultSet rs = null;
			Statement stmt = null;
			Connection conn=DBUtil.getConnection();
			try {
				stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
				rs=stmt.executeQuery(sql);
				while(rs.next())
				{
					categories.append("<category label='"+rs.getString("name")+"' />");
					dataset.append("<set value='"+rs.getString("sum")+"' />");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				DBUtil.close(rs, stmt, conn);
			}
			chart.append("<chart palette='2' caption='本周销售TOP10分析' shownames='1' showvalues='1' decimals='2' numberPrefix='￥'>");   
			
			chart.append("<categories>"); 
			chart.append(categories.toString()); 
			chart.append("</categories>"); 
			
			chart.append("<dataset seriesName='销售收入' color='AFD8F8' decimalSeparator=',' thousandSeparator='.' formatNumber='1' showValues='1' decimalPrecision='2' numberPrefix='%A5'>"); 
			chart.append(dataset.toString()); 
			chart.append("</dataset>"); 
			
			chart.append("</chart>"); 
		}else if(type.equals("8"))//按本月销售额TOP10
		{
			String sql="select name,ROUND(sum(discount*price*amount),2) as sum  from dd_sales where DATE_FORMAT(date,'%Y-%m')=DATE_FORMAT(now(),'%Y-%m') group by name limit 10";
			ResultSet rs = null;
			Statement stmt = null;
			Connection conn=DBUtil.getConnection();
			try {
				stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
				rs=stmt.executeQuery(sql);
				while(rs.next())
				{
					categories.append("<category label='"+rs.getString("name")+"' />");
					dataset.append("<set value='"+rs.getString("sum")+"' />");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				DBUtil.close(rs, stmt, conn);
			}
			chart.append("<chart palette='2' caption='本月销售TOP10分析' shownames='1' showvalues='1' decimals='2' numberPrefix='￥'>");   
			
			chart.append("<categories>"); 
			chart.append(categories.toString()); 
			chart.append("</categories>"); 
			
			chart.append("<dataset seriesName='销售收入' color='AFD8F8' decimalSeparator=',' thousandSeparator='.' formatNumber='1' showValues='1' decimalPrecision='2' numberPrefix='%A5'>"); 
			chart.append(dataset.toString()); 
			chart.append("</dataset>"); 
			
			chart.append("</chart>"); 
		}else if(type.equals("9"))//按今年销售额TOP10
		{
			String sql="select name,ROUND(sum(discount*price*amount),2) as sum  from dd_sales where DATE_FORMAT(date,'%Y')=DATE_FORMAT(now(),'%Y') group by name limit 10";
			ResultSet rs = null;
			Statement stmt = null;
			Connection conn=DBUtil.getConnection();
			try {
				stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
				rs=stmt.executeQuery(sql);
				while(rs.next())
				{
					categories.append("<category label='"+rs.getString("name")+"' />");
					dataset.append("<set value='"+rs.getString("sum")+"' />");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				DBUtil.close(rs, stmt, conn);
			}
			chart.append("<chart palette='2' caption='今年销售TOP10分析' shownames='1' showvalues='1' decimals='2' numberPrefix='￥'>");   
			
			chart.append("<categories>"); 
			chart.append(categories.toString()); 
			chart.append("</categories>"); 
			
			chart.append("<dataset seriesName='销售收入' color='AFD8F8' decimalSeparator=',' thousandSeparator='.' formatNumber='1' showValues='1' decimalPrecision='2' numberPrefix='%A5'>"); 
			chart.append(dataset.toString()); 
			chart.append("</dataset>"); 
			
			chart.append("</chart>"); 
		}else if(type.equals("10"))//按今日销售额TOP10
		{
			String sql="select name,ROUND(sum(discount*price*amount),2) as sum  from dd_sales where DATE_FORMAT(date,'%Y-%m-%d')=DATE_FORMAT(now(),'%Y-%m-%d') group by name limit 10";
			ResultSet rs = null;
			Statement stmt = null;
			Connection conn=DBUtil.getConnection();
			try {
				stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
				rs=stmt.executeQuery(sql);
				while(rs.next())
				{
					categories.append("<category label='"+rs.getString("name")+"' />");
					dataset.append("<set value='"+rs.getString("sum")+"' />");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				DBUtil.close(rs, stmt, conn);
			}
			chart.append("<chart palette='2' caption='今日销售TOP10分析' shownames='1' showvalues='1' decimals='2' numberPrefix='￥'>");   
			
			chart.append("<categories>"); 
			chart.append(categories.toString()); 
			chart.append("</categories>"); 
			
			chart.append("<dataset seriesName='销售收入' color='AFD8F8' decimalSeparator=',' thousandSeparator='.' formatNumber='1' showValues='1' decimalPrecision='2' numberPrefix='%A5'>"); 
			chart.append(dataset.toString()); 
			chart.append("</dataset>"); 
			
			chart.append("</chart>"); 
		}else if(type.equals("11"))//按今日销售量TOP10
		{
			String sql="select name,sum(amount) as sum  from dd_sales where DATE_FORMAT(date,'%Y-%m-%d')=DATE_FORMAT(now(),'%Y-%m-%d') group by name limit 10";
			ResultSet rs = null;
			Statement stmt = null;
			Connection conn=DBUtil.getConnection();
			try {
				stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
				rs=stmt.executeQuery(sql);
				while(rs.next())
				{
					categories.append("<category label='"+rs.getString("name")+"' />");
					dataset.append("<set value='"+rs.getString("sum")+"' />");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				DBUtil.close(rs, stmt, conn);
			}
			chart.append("<chart palette='2' caption='今日销售TOP10分析' formatNumberScale='0' shownames='1' showvalues='1'>");   
			
			chart.append("<categories>"); 
			chart.append(categories.toString()); 
			chart.append("</categories>"); 
			
			chart.append("<dataset seriesName='销售量' color='AFD8F8' decimalSeparator=',' thousandSeparator='.' formatNumber='1' showValues='1'>"); 
			chart.append(dataset.toString()); 
			chart.append("</dataset>"); 
			
			chart.append("</chart>"); 
		}else if(type.equals("12"))//按本周销售量TOP10
		{
			String sql="select name,sum(amount) as sum  from dd_sales where YEARWEEK(date_format(date,'%Y-%m-%d')) = YEARWEEK(now()) group by name limit 10";
			ResultSet rs = null;
			Statement stmt = null;
			Connection conn=DBUtil.getConnection();
			try {
				stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
				rs=stmt.executeQuery(sql);
				while(rs.next())
				{
					categories.append("<category label='"+rs.getString("name")+"' />");
					dataset.append("<set value='"+rs.getString("sum")+"' />");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				DBUtil.close(rs, stmt, conn);
			}
			chart.append("<chart palette='2' caption='本周销售TOP10分析' formatNumberScale='0' shownames='1' showvalues='1'>");   
			
			chart.append("<categories>"); 
			chart.append(categories.toString()); 
			chart.append("</categories>"); 
			
			chart.append("<dataset seriesName='销售量' color='AFD8F8' decimalSeparator=',' thousandSeparator='.' formatNumber='1' showValues='1'>"); 
			chart.append(dataset.toString()); 
			chart.append("</dataset>"); 
			
			chart.append("</chart>"); 
		}else if(type.equals("13"))//按本月销售量TOP10 饼图
		{
			String sql="select p.name,sum(s.amount) as sum  from dd_sales s left join dd_product p on s.barcode=p.barcode where DATE_FORMAT(s.date,'%Y-%m')=DATE_FORMAT(now(),'%Y-%m') group by s.barcode limit 10";
			ResultSet rs = null;
			Statement stmt = null;
			Connection conn=DBUtil.getConnection();
			try {
				stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
				rs=stmt.executeQuery(sql);
				int i=0;
				while(rs.next())
				{
					if(i<3)
						categories.append("<set label='"+rs.getString("name")+"' value='"+rs.getString("sum")+"' isSliced='1'/>");
					else
						categories.append("<set label='"+rs.getString("name")+"' value='"+rs.getString("sum")+"'/>");
					i++;
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				DBUtil.close(rs, stmt, conn);
			}
			chart.append("<chart palette='4' decimals='0' enableSmartLabels='1' enableRotation='0' bgColor='99CCFF,FFFFFF' bgAlpha='40,100' bgRatio='0,100' bgAngle='360' showBorder='1' startingAngle='70'>");   
			chart.append(categories.toString()); 
			chart.append("</chart>"); 
		}else if(type.equals("14"))//按今年销售量TOP10
		{
			String sql="select name,sum(amount) as sum  from dd_sales where DATE_FORMAT(date,'%Y')=DATE_FORMAT(now(),'%Y') group by name limit 10";
			ResultSet rs = null;
			Statement stmt = null;
			Connection conn=DBUtil.getConnection();
			try {
				stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
				rs=stmt.executeQuery(sql);
				while(rs.next())
				{
					categories.append("<category label='"+rs.getString("name")+"' />");
					dataset.append("<set value='"+rs.getString("sum")+"' />");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				DBUtil.close(rs, stmt, conn);
			}
			chart.append("<chart palette='2' caption='今年销售TOP10分析' formatNumberScale='0' shownames='1' showvalues='1'>");   
			
			chart.append("<categories>"); 
			chart.append(categories.toString()); 
			chart.append("</categories>"); 
			
			chart.append("<dataset seriesName='销售量' color='AFD8F8' decimalSeparator=',' thousandSeparator='.' formatNumber='1' showValues='1'>"); 
			chart.append(dataset.toString()); 
			chart.append("</dataset>"); 
			
			chart.append("</chart>"); 
		}else if(type.equals("15"))//按今日设计师销售额TOP10
		{
			String sql="select i.userid as name,ROUND(sum(s.discount*s.price*s.amount),2) as sum  from dd_sales s left join dd_inventory i on s.barcode=i.barcode where DATE_FORMAT(s.date,'%Y-%m-%d')=DATE_FORMAT(now(),'%Y-%m-%d') group by i.userid limit 10";
			ResultSet rs = null;
			Statement stmt = null;
			Connection conn=DBUtil.getConnection();
			try {
				stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
				rs=stmt.executeQuery(sql);
				while(rs.next())
				{
					categories.append("<category label='"+rs.getString("name")+"' />");
					dataset.append("<set value='"+rs.getString("sum")+"' />");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				DBUtil.close(rs, stmt, conn);
			}
			chart.append("<chart palette='2' caption='今日销售TOP10分析' formatNumberScale='0' shownames='1' showvalues='1' decimals='2' numberPrefix='￥'>");   
			
			chart.append("<categories>"); 
			chart.append(categories.toString()); 
			chart.append("</categories>"); 
			
			chart.append("<dataset seriesName='销售额' color='AFD8F8' decimalSeparator=',' thousandSeparator='.' formatNumber='1' showValues='1' decimalPrecision='2' numberPrefix='%A5'>"); 
			chart.append(dataset.toString()); 
			chart.append("</dataset>"); 
			
			chart.append("</chart>"); 
		}else if(type.equals("16"))//按本周设计师销售额TOP10
		{
			String sql="select i.userid as name,ROUND(sum(s.discount*s.price*s.amount),2) as sum  from dd_sales s left join dd_inventory i on s.barcode=i.barcode where YEARWEEK(date_format(s.date,'%Y-%m-%d')) = YEARWEEK(now()) group by i.userid limit 10";
			ResultSet rs = null;
			Statement stmt = null;
			Connection conn=DBUtil.getConnection();
			try {
				stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
				rs=stmt.executeQuery(sql);
				while(rs.next())
				{
					categories.append("<category label='"+rs.getString("name")+"' />");
					dataset.append("<set value='"+rs.getString("sum")+"' />");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				DBUtil.close(rs, stmt, conn);
			}
			chart.append("<chart palette='2' caption='本周销售TOP10分析' formatNumberScale='0' shownames='1' showvalues='1' decimals='2' numberPrefix='￥'>");   
			
			chart.append("<categories>"); 
			chart.append(categories.toString()); 
			chart.append("</categories>"); 
			
			chart.append("<dataset seriesName='销售额' color='AFD8F8' decimalSeparator=',' thousandSeparator='.' formatNumber='1' showValues='1' decimalPrecision='2' numberPrefix='%A5'>"); 
			chart.append(dataset.toString()); 
			chart.append("</dataset>"); 
			
			chart.append("</chart>"); 
		}else if(type.equals("17"))//按本月设计师销售额TOP10
		{
			String sql="select i.userid as name,ROUND(sum(s.discount*s.price*s.amount),2) as sum  from dd_sales s left join dd_inventory i on s.barcode=i.barcode where DATE_FORMAT(s.date,'%Y-%m')=DATE_FORMAT(now(),'%Y-%m') group by i.userid limit 10";
			ResultSet rs = null;
			Statement stmt = null;
			Connection conn=DBUtil.getConnection();
			try {
				stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
				rs=stmt.executeQuery(sql);
				while(rs.next())
				{
					categories.append("<category label='"+rs.getString("name")+"' />");
					dataset.append("<set value='"+rs.getString("sum")+"' />");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				DBUtil.close(rs, stmt, conn);
			}
			chart.append("<chart palette='2' caption='本月销售TOP10分析' formatNumberScale='0' shownames='1' showvalues='1' decimals='2' numberPrefix='￥'>");   
			
			chart.append("<categories>"); 
			chart.append(categories.toString()); 
			chart.append("</categories>"); 
			
			chart.append("<dataset seriesName='销售额' color='AFD8F8' decimalSeparator=',' thousandSeparator='.' formatNumber='1' showValues='1' decimalPrecision='2' numberPrefix='%A5'>"); 
			chart.append(dataset.toString()); 
			chart.append("</dataset>"); 
			
			chart.append("</chart>"); 
		}else if(type.equals("18"))//按今年设计师销售额TOP10
		{
			String sql="select i.userid as name,ROUND(sum(s.discount*s.price*s.amount),2) as sum  from dd_sales s left join dd_inventory i on s.barcode=i.barcode where DATE_FORMAT(s.date,'%Y')=DATE_FORMAT(now(),'%Y') group by i.userid limit 10";
			ResultSet rs = null;
			Statement stmt = null;
			Connection conn=DBUtil.getConnection();
			try {
				stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
				rs=stmt.executeQuery(sql);
				while(rs.next())
				{
					categories.append("<category label='"+rs.getString("name")+"' />");
					dataset.append("<set value='"+rs.getString("sum")+"' />");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				DBUtil.close(rs, stmt, conn);
			}
			chart.append("<chart palette='2' caption='今年销售TOP10分析' formatNumberScale='0' shownames='1' showvalues='1' decimals='2' numberPrefix='￥'>");   
			
			chart.append("<categories>"); 
			chart.append(categories.toString()); 
			chart.append("</categories>"); 
			
			chart.append("<dataset seriesName='销售额' color='AFD8F8' decimalSeparator=',' thousandSeparator='.' formatNumber='1' showValues='1' decimalPrecision='2' numberPrefix='%A5'>"); 
			chart.append(dataset.toString()); 
			chart.append("</dataset>"); 
			
			chart.append("</chart>"); 
		}else if(type.equals("19"))//最近15天销售额
		{
			String sql;
			String userid=(String) getSession().getAttribute("userid");
			String t=(String) getSession().getAttribute("type");
			if(t.equals("2"))
				sql="select DATE_FORMAT(s.date,'%m-%d') as year,ROUND(sum(s.discount*p.price*s.amount),2) as sum  from dd_sales s left join dd_product p on s.barcode=p.barcode where  (s.date>=DATE_SUB(CURDATE(), INTERVAL 15 DAY) and s.date <= date(now()))  and p.userid='"+userid+"' group by p.userid,DATE_FORMAT(s.date,'%Y-%m-%d')";
			else
				sql="select DATE_FORMAT(s.date,'%m-%d') as year,ROUND(sum(s.discount*p.price*s.amount),2) as sum  from dd_sales s left join dd_product p on s.barcode=p.barcode where  (s.date>=DATE_SUB(CURDATE(), INTERVAL 15 DAY) and s.date <= date(now())) group by DATE_FORMAT(s.date,'%Y-%m-%d')";

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
			chart.append("<chart palette='2' caption='立体柱状销售图' shownames='1' showvalues='1' decimals='2' numberPrefix='￥'>");   
			
			chart.append("<categories>"); 
			chart.append(categories.toString()); 
			chart.append("</categories>"); 
			
			chart.append("<dataset seriesName='销售收入' color='AFD8F8' decimalSeparator=',' thousandSeparator='.' formatNumber='1' showValues='1' decimalPrecision='2' numberPrefix='%A5'>"); 
			chart.append(dataset.toString()); 
			chart.append("</dataset>"); 
			
			chart.append("</chart>"); 
		}else if(type.equals("20"))//按最近15天销售量TOP10 饼图
		{
			String sql="select p.name,sum(s.amount) as sum  from dd_sales s left join dd_product p on s.barcode=p.barcode where (s.date>=DATE_SUB(CURDATE(), INTERVAL 15 DAY) and s.date <= date(now())) group by s.barcode order by sum desc limit 10";
			ResultSet rs = null;
			Statement stmt = null;
			Connection conn=DBUtil.getConnection();
			try {
				stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
				rs=stmt.executeQuery(sql);
				int i=0;
				while(rs.next())
				{
					if(i<3)
						categories.append("<set label='"+rs.getString("name")+"' value='"+rs.getString("sum")+"' isSliced='1'/>");
					else
						categories.append("<set label='"+rs.getString("name")+"' value='"+rs.getString("sum")+"'/>");
					i++;
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				DBUtil.close(rs, stmt, conn);
			}
			chart.append("<chart palette='4' decimals='0' enableSmartLabels='1' enableRotation='0' bgColor='99CCFF,FFFFFF' bgAlpha='40,100' bgRatio='0,100' bgAngle='360' showBorder='1' startingAngle='70'>");   
			chart.append(categories.toString()); 
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
		String name="销售分析表";
		String name2=name;
		if (getRequest().getHeader("User-Agent").toLowerCase().indexOf("firefox") > 0)
			name2 = new String(name.getBytes("UTF-8"), "ISO8859-1");//firefox浏览器
		else if (getRequest().getHeader("User-Agent").toUpperCase().indexOf("MSIE") > 0)
			name2 = URLEncoder.encode(name, "UTF-8");//IE浏览器 终极解决文件名乱码

		getResponse().setHeader("Content-disposition","attachment;filename=" +name2+"-"+getCurrentTime() + ".xls");
		String[] headers = { "序号","交易号","条形码","名称","设计师","折扣","数量","单价","操作人","日期"};
		String transaction=getParameter("transaction");
		String userid=getParameter("userid");
		String barcode=getParameter("barcode");
		String name_=org.osinfo.core.webapp.util.StringUtil.convertUTF8(getParameter("name"));
		String begin=getParameter("begin");
		String end_=getParameter("end");

		StringBuffer sql=new StringBuffer();
		String uid=(String) getSession().getAttribute("userid");
		String t=(String) getSession().getAttribute("type");
		sql.append("select s.*,p.userid,p.name,p.price from dd_sales s left join dd_product p on s.barcode=p.barcode where 1=1 and s.amount>0 ");
		if(!barcode.trim().equals(""))
		{
			sql.append(" and s.barcode like '%"+barcode+"%'");
		}
		if(!transaction.trim().equals(""))
		{
			sql.append(" and s.transaction like '%"+transaction+"%'");
		}
		if(!name_.trim().equals(""))
		{
			sql.append(" and p.name like '%"+name_+"%'");
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
			sql.append(" and p.userid='"+uid+"'");
			
		}else
		{
			if(!userid.trim().equals(""))
			{
				sql.append(" and p.userid like '%"+userid+"%'");
			}
		}
		sql.append(" order by s.date desc");
		PageUtil p=CommonDAO.findByMultiTableSQLQuery(sql.toString(),Query.class);
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
		String transaction=getParameter("transaction");
		String userid=getParameter("userid");
		String barcode=getParameter("barcode");
		String name_=getParameter("name");
		String begin=getParameter("begin");
		String end_=getParameter("end");
		
		StringBuffer sql=new StringBuffer();
		String uid=(String) getSession().getAttribute("userid");
		String t=(String) getSession().getAttribute("type");
		sql.append("select s.*,p.userid,p.name,p.price from dd_sales s left join dd_product p on s.barcode=p.barcode where 1=1 and s.amount>0 ");
		if(!barcode.trim().equals(""))
		{
			sql.append(" and s.barcode like '%"+barcode+"%'");
		}
		if(!transaction.trim().equals(""))
		{
			sql.append(" and s.transaction like '%"+transaction+"%'");
		}
		if(!name_.trim().equals(""))
		{
			sql.append(" and p.name like '%"+name_+"%'");
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
			sql.append(" and p.userid='"+uid+"'");
			
		}else
		{
			if(!userid.trim().equals(""))
			{
				sql.append(" and p.userid like '%"+userid+"%'");
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

			content += "\"<tr id='"+d.getId()+"'><td><input type='checkbox' name='row' value='"+d.getId()+"'/></td><td>"+d.getTransaction()+"</td><td>"+d.getBarcode()+"</td><td>"+d.getName()+"</td><td>"+d.getUserid()+"</td><td>"+d.getDiscount()+"</td><td>"+d.getAmount()+"</td><td>"+d.getPrice()+"</td><td>"+d.getDate()+"</td></tr>\",";
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
		sql.append("select s.*,p.userid,p.name,p.price from dd_sales s left join dd_product p on s.barcode=p.barcode where 1=1 and s.amount>0 ");
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
			sql.append(" and p.name like '%"+name+"%'");
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
			sql.append(" and p.userid='"+uid+"'");
			
		}else
		{
			if(!userid.trim().equals(""))
			{
				sql.append(" and p.userid like '%"+userid+"%'");
			}
		}
		
		
		int count=CommonDAO.count(sql.toString());
		return count;
	}
}
