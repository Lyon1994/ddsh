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
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.osinfo.core.webapp.action.CrudAction;
import org.osinfo.core.webapp.action.util.DynamicGrid;
import org.osinfo.core.webapp.dao.CommonDAO;
import org.osinfo.core.webapp.model.DdTransaction;
import org.osinfo.core.webapp.util.DBUtil;
import org.osinfo.core.webapp.util.ExcelUtil;
import org.osinfo.core.webapp.util.PageUtil;
@Results({
	 @Result(name="list",location = "/WEB-INF/result/system/transa/list.ftl"),
	 @Result(name="list2",location = "/WEB-INF/result/system/transa/list2.ftl"),
	 @Result(name="list3",location = "/WEB-INF/result/system/transa/list3.ftl"),
	 @Result(name="list4",location = "/WEB-INF/result/system/transa/list4.ftl")
})
/**
 * @Author Lucifer.Zhou 4:29:47 PM Jan 6, 2010
 * @Description
 * 电子钱包/财务
 */
public class TransaAction<T> extends CrudAction{
	private static Logger logger = Logger.getLogger ( TransaAction.class.getName () ) ;
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
		{
			return "list2";
		}
		return "list";
	}
	public String list2() {
		String t=(String) getSession().getAttribute("type");
		if(t.equals("2"))
		{
			return "list3";
		}
		return "list4";
	}
	//商品退回
	@Override
	public String add() {
		// TODO Auto-generated method stub
		String userid=getParameter("userid");
		String shop=getParameter("shop");
		String from=getParameter("from");
		String to=getParameter("to");
		
		String type=getParameter("type");
		String money=getParameter("money");		
		String memo=getParameter("memo");		
		

		String submitdate=getCurrentTime();

		String operator=(String) getSession().getAttribute("userid");

		String sql="insert into dd_transaction (userid,shop,from,to,type,money,memo,operator,date) " +
				"values ('"+userid+"','"+shop+"','"+from+"','"+to+"','"+type+"',"+money+",'"+memo+"','"+operator+"','"+submitdate+"')";

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
	    		String sql="delete from dd_transaction where id in ("+ids.substring(0,ids.length()-1)+")";
	    		CommonDAO.executeUpdate(sql);
	    }
	    renderSimpleResult(true,"处理成功");
        return null;
	}
	//处理交易-修改钱包
	public String enable() {
		// TODO Auto-generated method stub
		if(logger.isDebugEnabled())
			logger.debug("加载启用页面...");
	    String ids=getParameter("ids");
	    ids=ids.substring(0,ids.length()-1);
	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");//可以方便地修改日期格式   
	    String operator=(String) getSession().getAttribute("userid");
		String date=dateFormat.format(new Date()); 
	    if(!"".equals(ids.trim())){
	    		String[] tmp=ids.split("\\,");
	    		for(int i=0;i<tmp.length;i++)
	    		{
	    			String sql="update dd_transaction set status='1' ,operator='"+operator+"', date='"+date+"' where id ="+tmp[i];
		    		CommonDAO.executeUpdate(sql);
		    		sql="select userid,type,money from dd_transaction where id="+tmp[i];
		    		ResultSet rs = null;
		    		Statement stmt = null;
		    		String userid = null;
		    		String type = null;
		    		float money = 0;
		    		Connection conn=DBUtil.getConnection();
		    		try {
		    			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
		    			rs=stmt.executeQuery(sql);
		    			while(rs.next())
		    			{
		    				userid=rs.getString("userid");
		    				type=rs.getString("type");
		    				money=Float.parseFloat(rs.getString("money"));
		    			}
		    		} catch (SQLException e) {
		    			// TODO Auto-generated catch block
		    			e.printStackTrace();
		    		}finally {
		    			DBUtil.close(rs, stmt, conn);
		    		}
		    		sql="select money as sum from dd_wallet where userid='"+userid+"'";
		    		float wallet=CommonDAO.sum(sql);
		    		if(type.equals("01"))//充值
		    			sql="update dd_wallet set money="+(wallet+money)+" ,operator='"+operator+"', date='"+date+"' where userid='"+userid+"'";
		    		else
		    			sql="update dd_wallet set money="+(wallet-money)+" ,operator='"+operator+"', date='"+date+"' where userid='"+userid+"'";
		    		CommonDAO.executeUpdate(sql);
	    		}
	    }
	    renderSimpleResult(true,"处理成功");
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
		String name="退货记录表";
		String name2=name;
		if (getRequest().getHeader("User-Agent").toLowerCase().indexOf("firefox") > 0)
			name2 = new String(name.getBytes("UTF-8"), "ISO8859-1");//firefox浏览器
		else if (getRequest().getHeader("User-Agent").toUpperCase().indexOf("MSIE") > 0)
			name2 = URLEncoder.encode(name, "UTF-8");//IE浏览器 终极解决文件名乱码

		getResponse().setHeader("Content-disposition","attachment;filename=" +name2+"-"+getCurrentTime() + ".xls");
		String[] headers = { "序号","用户编号","目标用户", "交易类型","状态","金额","备注","提交日期","操作人","日期"};
		String userid=(String) getSession().getAttribute("userid");
		String t=(String) getSession().getAttribute("type");
		String type=getParameter("type");
		String sql;
		if(t.equals("2"))
			if(type.equals("0"))
				sql="select t.id,t.userid,t.user,(select d.value from dd_dic d where d.parent='trans' and d.child=t.type) as type,t.status,t.money,t.memo,t.submitdate,t.operator,t.date from dd_transaction t where (t.userid='"+userid+"' or t.user='"+userid+"') and t.status='0' order by t.userid";
			else
				sql="select t.id,t.userid,t.user,(select d.value from dd_dic d where d.parent='trans' and d.child=t.type) as type,t.status,t.money,t.memo,t.submitdate,t.operator,t.date from dd_transaction t where (t.userid='"+userid+"' or t.user='"+userid+"') and t.status='1' order by t.userid";
		else
			if(type.equals("0"))
				sql="select t.id,t.userid,t.user,(select d.value from dd_dic d where d.parent='trans' and d.child=t.type) as type,t.status,t.money,t.memo,t.submitdate,t.operator,t.date from dd_transaction t where t.status='0' order by t.userid";
			else
				sql="select t.id,t.userid,t.user,(select d.value from dd_dic d where d.parent='trans' and d.child=t.type) as type,t.status,t.money,t.memo,t.submitdate,t.operator,t.date from dd_transaction t where t.status='1' order by t.userid";
		PageUtil p=CommonDAO.findByMultiTableSQLQuery(sql,DdTransaction.class);
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
			if(type.equals("0"))
				sql="select t.id,t.userid,t.user,(select d.value from dd_dic d where d.parent='trans' and d.child=t.type) as type,t.status,t.money,t.memo,t.operator,t.submitdate from dd_transaction t where (t.userid='"+userid+"' or t.user='"+userid+"') and t.status='0' order by t.userid";
			else
				sql="select t.id,t.userid,t.user,(select d.value from dd_dic d where d.parent='trans' and d.child=t.type) as type,t.status,t.money,t.memo,t.operator,t.date from dd_transaction t where (t.userid='"+userid+"' or t.user='"+userid+"') and t.status='1' order by t.userid";
		else
			if(type.equals("0"))
				sql="select t.id,t.userid,t.user,(select d.value from dd_dic d where d.parent='trans' and d.child=t.type) as type,t.status,t.money,t.memo,t.operator,t.submitdate from dd_transaction t where t.status='0' order by t.userid";
			else
				sql="select t.id,t.userid,t.user,(select d.value from dd_dic d where d.parent='trans' and d.child=t.type) as type,t.status,t.money,t.memo,t.operator,t.date from dd_transaction t where t.status='1' order by t.userid";
		PageUtil p=CommonDAO.findPageByMultiTableSQLQuery(sql,start,end,perpage,DdTransaction.class);
		
		String content = "totalPage = " + p.getTotalPageCount() + ";";
		content += "dataStore = [";

		List l=(List)p.getResult();
		for(int i=0;i<l.size();i++)
		{
			DdTransaction d=(DdTransaction)l.get(i);
			String type=d.getType();
			String status=d.getStatus();
			Timestamp date=d.getSubmitdate();
			if(status.equals("0"))
				status="<font color='red'>待处理</font>";
			else if(status.equals("1"))
			{
				status="<font color='green'>已处理</font>";
				date=d.getDate();
			}
				
			
			content += "\"<tr id='"+d.getId()+"'><td><input type='checkbox' name='row' value='"+d.getId()+"'/></td><td>"+d.getUserid()+"</td><td>"+d.getUser()+"</td><td>"+type+"</td><td>"+status+"</td><td>"+d.getMoney()+"</td><td>"+d.getMemo()+"</td><td>"+date+"</td></tr>\",";
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
			if(type.equals("0"))
				sql="select  * from dd_transaction t where (t.userid='"+userid+"' or t.user='"+userid+"') and t.status='0' order by t.userid";
			else
				sql="select * from dd_transaction t where (t.userid='"+userid+"' or t.user='"+userid+"') and t.status='1' order by t.userid";
		else
			if(type.equals("0"))
				sql="select * from dd_transaction t where t.status='0' order by t.userid";
			else
				sql="select * from dd_transaction t where t.status='1' order by t.userid";
		
		int count=CommonDAO.count(sql);
		return count;
	}
}
