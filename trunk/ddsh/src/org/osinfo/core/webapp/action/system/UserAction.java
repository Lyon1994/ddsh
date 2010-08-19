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
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.osinfo.core.webapp.action.CrudAction;
import org.osinfo.core.webapp.action.util.DynamicGrid;
import org.osinfo.core.webapp.dao.CommonDAO;
import org.osinfo.core.webapp.model.DdUser;
import org.osinfo.core.webapp.util.DBUtil;
import org.osinfo.core.webapp.util.ExcelUtil;
import org.osinfo.core.webapp.util.JsonUtil;
import org.osinfo.core.webapp.util.PageUtil;
@Results({
	 @Result(name="list",location = "/WEB-INF/result/system/user/list.ftl"),
	 @Result(name="list2",location = "/WEB-INF/result/system/user/list2.ftl"),
	 @Result(name="add",location = "/WEB-INF/result/system/user/add.ftl"),
	 @Result(name="edit",location = "/WEB-INF/result/system/user/edit.ftl"),
})
/**
 * @Author Lucifer.Zhou 4:29:47 PM Jan 6, 2010
 * @Description
 * 用户管理
 */
public class UserAction<T> extends CrudAction{
	private static Logger logger = Logger.getLogger ( UserAction.class.getName () ) ;
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
	public String list2() {
		return "list2";
	}
	@Override
	public String add() {
		// TODO Auto-generated method stub
		String userid=getParameter("userid");
		System.out.println(userid);
		String password=getParameter("password");
		String type=getParameter("type");
		
		String name=getParameter("name");
		System.out.println(name);
		String sex=getParameter("sex");
		String idcard=getParameter("idcard");		
		
		String mobile=getParameter("mobile");
		String telephone=getParameter("telephone");
		String fax=getParameter("fax");		
		
		String address=getParameter("address");
		String mail=getParameter("mail");

		String brand=getParameter("brand");
		String result=getParameter("result");
		String submitdate=getCurrentTime();
		String operator=(String) getSession().getAttribute("userid");
		String sql="";

		if(type==null)//等待开通
		{
			type="2";//默认设计师
			sql="insert into dd_user (userid,name,brand,password,type,status,idcard,sex,address,mobile,telephone,fax,mail,submitdate) values " +
					"('"+userid+"','"+name+"','"+brand+"','"+password+"','"+type+"','0','"+idcard+"','"+sex+"','"+address+"','"+mobile+"','"+telephone+"','"+fax+"','"+mail+"','"+submitdate+"')";
		}else
			sql="insert into dd_user (userid,name,brand,password,type,status,idcard,sex,address,mobile,telephone,fax,mail,submitdate,operator,date) values " +
					"('"+userid+"','"+name+"','"+brand+"','"+password+"','"+type+"','1','"+idcard+"','"+sex+"','"+address+"','"+mobile+"','"+telephone+"','"+fax+"','"+mail+"','"+submitdate+"','"+operator+"','"+submitdate+"')";

		int v=CommonDAO.executeUpdate(sql);
		if(v>0)
		{
			if(result==null)
				return "success";
			else
				return "success2";
		}else
			if(result==null)
				return "error";
			else
				return "error2";
	}
	//启用用户
	public String enable() {
		// TODO Auto-generated method stub
		if(logger.isDebugEnabled())
			logger.debug("加载启用页面...");
	    String ids=getParameter("ids");
	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");//可以方便地修改日期格式   
	    String operator=(String) getSession().getAttribute("userid");
		String date=dateFormat.format(new Date()); 
	    if(!"".equals(ids.trim())){
	    		String sql="update dd_user set status='1' ,operator='"+operator+"', date='"+date+"' where id in ("+ids.substring(0,ids.length()-1)+")";
	    		CommonDAO.executeUpdate(sql);
	    }
	    renderSimpleResult(true,"处理成功");
        return null;
	}
	//暂时不用
	public String load() {
		// TODO Auto-generated method stub
		if(logger.isDebugEnabled())
			logger.debug("加载装入页面...");
	    String sql="select userid from dd_user";
	    ResultSet rs = null;
		Statement stmt = null;
		Connection conn=DBUtil.getConnection();
		Map m=new HashMap();
		try {
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
			rs=stmt.executeQuery(sql);
			while(rs.next())
				m.put(rs.getString("userid"), rs.getString("userid"));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(rs, stmt, conn);
		}
	    try
	    {
	    	String json = JsonUtil.map2json(m);
	    	renderJson(json.toString());
		    System.out.println(json.toString());
	    }catch(Exception e)
	    {
	    	e.printStackTrace();
	    }
        return null;
	}
	@Override
	public String del() {
		// TODO Auto-generated method stub
		if(logger.isDebugEnabled())
			logger.debug("加载删除页面...");
	    String ids=getParameter("ids");

	    if(!"".equals(ids.trim())){
	    		String sql="delete from dd_user where id in ("+ids.substring(0,ids.length()-1)+")";
	    		CommonDAO.executeUpdate(sql);
	    }
	    renderSimpleResult(true,"处理成功");
        return null;
	}
	@Override
	public String edit() {
		// TODO Auto-generated method stub
		String trid=getParameter("trid");
		String tdid=getParameter("tdid");
		String value=getParameter("value");
		
		String sql="update dd_user set "+tdid+"='"+value+"' where id ='"+trid+"'";
		CommonDAO.executeUpdate(sql);
		renderSimpleResult(true,"修改成功");
		return null;
	}
	@Override
	protected HSSFWorkbook exportExcel(HSSFWorkbook workbook, String scope,
			String bound, String where, String sort, String dir)
			throws Exception {
		// TODO Auto-generated method stub
		String name="用户表";
		String name2=name;
		if (getRequest().getHeader("User-Agent").toLowerCase().indexOf("firefox") > 0)
			name2 = new String(name.getBytes("UTF-8"), "ISO8859-1");//firefox浏览器
		else if (getRequest().getHeader("User-Agent").toUpperCase().indexOf("MSIE") > 0)
			name2 = URLEncoder.encode(name, "UTF-8");//IE浏览器 终极解决文件名乱码

		getResponse().setHeader("Content-disposition","attachment;filename=" +name2+"-"+getCurrentTime() + ".xls");
		String[] headers = { "序号", "用户编号", "名称", "品牌", "密码", "类型", "状态","身份证", "性别", "地址", "手机号码","电话","传真","邮件","提交日期","操作者","验证日期"};
		String sql;
		if(type.equals("1"))
			sql="select * from dd_user where status='1' order by userid desc";
		else
			sql="select * from dd_user where status='0' order by userid desc";
		PageUtil p=CommonDAO.findByMultiTableSQLQuery(sql,DdUser.class);
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
		if(type.equals("1"))
			sql="select * from dd_user where status='1' order by userid desc";
		else
			sql="select * from dd_user where status='0' order by userid desc";
		PageUtil p=CommonDAO.findPageByMultiTableSQLQuery(sql,start,end,perpage,DdUser.class);
		
		String content = "totalPage = " + p.getTotalPageCount() + ";";
		content += "dataStore = [";

		List l=(List)p.getResult();
		for(int i=0;i<l.size();i++)
		{
			DdUser d=(DdUser)l.get(i);
			String t="<font color='green'>管理员</font>";
			if(d.getType().equals("2"))
			{
				t="<font color='red'>设计师</font>";
			}else if(d.getType().equals("3"))
			{
				t="<font color='yellow'>收银员</font>";
			}else if(d.getType().equals("4"))
			{
				t="<font color='blue'>上货员</font>";
			}
			String s="正式会员";
			if(d.getStatus().equals("0"))
				s="待审核";
			Timestamp date;
			if(type.equals("1"))
				date=d.getDate();
			else
				date=d.getSubmitdate();
			content += "\"<tr id='"+d.getId()+"'><td><input type='checkbox' name='row' value='"+d.getId()+"'/></td><td>"+d.getUserid()+"</td><td>"+d.getName()+"</td><td>"+d.getBrand()+"</td><td class='editbox' id='password'>"+d.getPassword()+"</td><td>"+t+"</td><td>"+s+"</td><td class='editbox' id='mobile'>"+d.getMobile()+"</td><td class='editbox' id='telephone'>"+d.getTelephone()+"</td><td class='editbox' id='fax'>"+d.getFax()+"</td><td class='editbox' id='mail'>"+d.getMail()+"</td><td class='editbox' id='address'>"+d.getAddress()+"</td><td>"+date+"</td></tr>\",";
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
		if(type.equals("1"))
			sql="select * from dd_user where status='1'";
		else
			sql="select * from dd_user where status='0'";
		int count=CommonDAO.count(sql);
		return count;
	}
}
