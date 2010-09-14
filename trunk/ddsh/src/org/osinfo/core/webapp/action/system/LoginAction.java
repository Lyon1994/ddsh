/**
 * @Author Lucifer.Zhou 4:29:47 PM Jan 6, 2010
 * @MSN zhoujianguo_leo@hotmail.com
 * @Mail leo821031@gmail.com
 * @FileName LoginAction.java
 * @JDKVersion 1.5
 * @Site http://www.osinfo.org
 */
package org.osinfo.core.webapp.action.system;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.Cookie;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.osinfo.core.webapp.Constants;
import org.osinfo.core.webapp.action.BaseAction;
import org.osinfo.core.webapp.dao.CommonDAO;
import org.osinfo.core.webapp.model.DdUser;
import org.osinfo.core.webapp.model.custom.User;
import org.osinfo.core.webapp.util.SecurityUtil;
import org.osinfo.core.webapp.util.StringUtil;
@Results({
	 @Result(name="login",location = "/WEB-INF/result/system/login.ftl"),
	 @Result(name="workbench",location = "/WEB-INF/result/system/workbench.ftl"),
	 @Result(name="fail",location = "/WEB-INF/result/system/fail.ftl")
})

/**
 * @Author Lucifer.Zhou 4:29:47 PM Jan 6, 2010
 * @Description
 * 登录管理
 */
public class LoginAction extends BaseAction{
	private static Logger logger = Logger.getLogger ( LoginAction.class.getName () ) ;
	public static final String SPRING_SECURITY_REMEMBER_ME_COOKIE_KEY = "SPRING_SECURITY_REMEMBER_ME_COOKIE";
	/**
	 * @Author Lucifer.Zhou 4:30:01 PM Jan 6, 2010
	 * long LoginAction.java
	 * @Description
	 *
	 */
	private static final long serialVersionUID = 1L;
	@Action("/login.*")   
	public String execute()
	{
		if(logger.isDebugEnabled())
			logger.debug("跳转到登录页面...");
        Cookie[] cookies = getRequest().getCookies();
        if ((cookies == null) || (cookies.length == 0)) {
            return "login";
        }

        for (int i = 0; i < cookies.length; i++) {
            if (SPRING_SECURITY_REMEMBER_ME_COOKIE_KEY.equals(cookies[i].getName())) {
            	try {
					getResponse().sendRedirect("workbench_.zf");
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
                return null;
            }
        }
		return "login";
	}
	@Action("/logout.*")   
	public String logout()
	{
		logger.info("用户 "+getSession().getAttribute("userid")+" 注销...");
		getSession().invalidate();
		try {
			getResponse().sendRedirect("/ddsh");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	@Action("/submit.*")   
	public String submit()
	{
		if(logger.isDebugEnabled())
			logger.debug("用户登录校验...");
		
		String userid=getParameter("userid");
		String password=getParameter("password");
		logger.info("用户登录:"+userid+","+password);
		password=SecurityUtil.encodeMD5(password);//md5加密
		String code=getParameter("code");
		if(code.equalsIgnoreCase((String) getSession().getAttribute(Constants.VALIDATECODE)))
		{
			String sql="select u.id,u.userid,u.name,u.type,u.status,l.lastime,l.ip,l.location1,l.location2 from dd_user u left join dd_login l on u.userid=l.userid where u.userid='"+userid+"' and u.password='"+password+"'";
			List l=CommonDAO.executeQuery(sql,User.class);
			if(l.size()>=1)
			{
				User user=(User)l.get(0);
				if(user.getStatus().equals("0"))//未开通
				{
					try {
						logger.info("未开通，跳转");
						getResponse().sendRedirect("/ddsh/html/error3.html");
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}else
				{
					getSession().setAttribute("id", user.getId());
					getSession().setAttribute("userid", user.getUserid());
					getSession().setAttribute("name", user.getName());
					getSession().setAttribute("type", user.getType());
					getSession().setAttribute("lastime", user.getLastime());
					getSession().setAttribute("ip", user.getIp());
					getSession().setAttribute("location1", user.getLocation1());
					getSession().setAttribute("location2", user.getLocation2());
					getSession().setAttribute("menu", WorkbenchAction.getTree(user.getType()));

					if(user.getType().equals("1"))
						getSession().setAttribute("typename", "管理员");
					else if(user.getType().equals("2"))
						getSession().setAttribute("typename", "设计师");
					else if(user.getType().equals("3"))
						getSession().setAttribute("typename", "收银员");
					else if(user.getType().equals("4"))
						getSession().setAttribute("typename", "上货员");
					String info=getParameter("info");
					String[] tmp=info.split(",");
					String date=getCurrentTime();
					if(info=="")
						sql="update dd_login set lastime='"+date+"',ip='127.0.0.1',location1='本机' where userid='"+userid+"'";
					else
						sql="update dd_login set lastime='"+date+"',ip='"+tmp[0]+"',location1='"+tmp[2]+"' where userid='"+userid+"'";
					CommonDAO.executeUpdate("更新登录",sql);
					try {
						logger.info("登录成功，跳转");
						getResponse().sendRedirect("workbench_.zf");
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
		}
		logger.info("登录失败，跳转");
		return "login";
	}
	@Action("/workbench_.*")   
	public String workbench_()
	{
		if(logger.isDebugEnabled())
			logger.debug("转到工作台...");
		logger.info("跳转到工作台...");
		List online = (List)getServletContext().getAttribute("online");
		getSession().setAttribute("onlines",online.size());
		System.out.println("onlines="+online.size());
		
		if(getSession().getAttribute("id")==null)
			return "login";
		return "workbench";
	}
	
	@Action("/login/fail.*")   
	public String fail()
	{
		if(logger.isDebugEnabled())
			logger.debug("登录失败，转到错误页面...");
		return "fail";
	}
}
