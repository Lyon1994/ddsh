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
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
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
import org.osinfo.core.webapp.model.DdUser;
import org.osinfo.core.webapp.util.ExcelUtil;
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
		String password=getParameter("password");
		String type=getParameter("type");
		
		String name=getParameter("name");
		String sex=getParameter("sex");
		String idcard=getParameter("idcard");		
		
		String mobile=getParameter("mobile");
		String telephone=getParameter("telephone");
		String fax=getParameter("fax");		
		
		String address=getParameter("address");
		String mail=getParameter("mail");

		String brand=getParameter("brand");
		String submitdate=getCurrentTime();

		String operator=(String) getSession().getAttribute("userid");

		String sql="insert into dd_user (userid,password,name,idcard,sex,address,mobile,telephone,fax,mail,type,status,submitdate,operator,verifydate,brand) values ('"+userid+"','"+password+"','"+name+"','"+idcard+"','"+sex+"','"+address+"','"+mobile+"','"+telephone+"','"+fax+"','"+mail+"','"+type+"','1','"+submitdate+"','"+operator+"','"+submitdate+"','"+brand+"')";

		int v=CommonDAO.executeUpdate(sql);
		if(v>0)
			return "success";
		else
			return "error";
	}
	public String enable() {
		// TODO Auto-generated method stub
		if(logger.isDebugEnabled())
			logger.debug("加载启用页面...");
	    String ids=getParameter("ids");
	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");//可以方便地修改日期格式   
		String date=dateFormat.format(new Date()); 
	    if(!"".equals(ids.trim())){
	    		String sql="update dd_user set status='1' , verifydate='"+date+"' where id in ("+ids.substring(0,ids.length()-1)+")";
	    		CommonDAO.executeUpdate(sql);
	    }
	    renderSimpleResult(true,"ok");
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
	    renderSimpleResult(true,"ok");
        return null;
	}
	@Override
	public String edit() {
		// TODO Auto-generated method stub
		String trid=getParameter("trid");
		String tdid=getParameter("tdid");
		String value=getParameter("value");
		
		String sql="update dd_user set "+tdid+"="+value+" where id ='"+trid+"'";
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
		String[] headers = { "序号", "用户编号", "名称","身份证", "性别", "地址", "手机号码","电话","传真","邮件","类型","状态","提交日期","操作者","验证日期","更新者","更新日期","密码","品牌"};
		String sql;
		if(type.equals("1"))
			sql="select * from dd_user where status='1' order by verifydate desc";
		else
			sql="select * from dd_user where status='0' order by verifydate desc";
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
			sql="select * from dd_user where status='1' order by verifydate desc";
		else
			sql="select * from dd_user where status='0' order by verifydate desc";
		PageUtil p=CommonDAO.findPageByMultiTableSQLQuery(sql,start,end,perpage,DdUser.class);
		
		String content = "totalPage = " + p.getTotalPageCount() + ";";
		content += "dataStore = [";

		List l=(List)p.getResult();
		for(int i=0;i<l.size();i++)
		{
			DdUser d=(DdUser)l.get(i);
			String t="<font color='green'>管理员</a>";
			if(d.getType().equals("2"))
			{
				t="<font color='green'>设计师("+d.getBrand()+")</a>";
			}else if(d.getType().equals("3"))
			{
				t="<font color='yellow'>店员</a>";
			}else if(d.getType().equals("4"))
			{
				t="<font color='blue'>测试人员</a>";
			}
			Timestamp date;
			if(type.equals("1"))
				date=d.getVerifydate();
			else
				date=d.getSubmitdate();
			content += "\"<tr id='"+d.getId()+"'><td><input type='checkbox' name='row' value='"+d.getId()+"'/></td><td>"+d.getUserid()+"</td><td>"+d.getName()+"</td><td>"+t+"</td><td class='editbox' id='mobile'>"+d.getMobile()+"</td><td class='editbox' id='telephone'>"+d.getTelephone()+"</td><td class='editbox' id='fax'>"+d.getFax()+"</td><td class='editbox' id='mail'>"+d.getMail()+"</td><td class='editbox' id='address'>"+d.getAddress()+"</td><td>"+date+"</td></tr>\",";
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
