/**
 * @Author Lucifer.Zhou 4:09:36 PM Jan 6, 2010
 * @MSN zhoujianguo_leo@hotmail.com
 * @Mail leo821031@gmail.com
 * @FileName BaseAction.java
 * @JDKVersion 1.5
 * @Site http://www.osinfo.org
 */
package org.osinfo.core.webapp.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.apache.commons.lang.RandomStringUtils;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.osinfo.core.webapp.Constants;
import org.osinfo.core.webapp.action.util.Struts2Utils;

import com.opensymphony.xwork2.ActionSupport;

@Results( {   
	@Result(name = "next", location = "/next.jsp", type = "dispatcher"), 
    @Result(name = "redirectAction", location = "./child/child", type = "redirectAction"),
    @Result(name = "redirect", location = "http://www.zf-info.com", type = "redirect"),
    @Result(name = "success", location = "/html/success.html",type = "redirect"),
    @Result(name = "success2", location = "/html/success2.html",type = "redirect"),
    @Result(name = "error", location = "/html/error.html",type = "redirect"),
    @Result(name = "error2", location = "/html/error2.html",type = "redirect")
    }
) 
/**
 * @Author Lucifer.Zhou 4:09:36 PM Jan 6, 2010
 * @Description
 * Action基础类
 */
public class BaseAction extends ActionSupport {
	protected static Logger logger = Logger.getLogger (BaseAction.class.getName()) ;
	protected JsonConfig cfg;

	protected static final String PRINT_RESULT="result";//返回结果
	protected static final String PRINT_INFO="info";//返回消息
	protected static final String PRINT_PARAMS="params";//返回其他参数
    protected static final boolean TRUE=true;//对
    protected static final String ERROR="error";//错误
    protected static final boolean FALSE=false;//不对
	/**
	 * @Author Lucifer.Zhou 4:09:56 PM Jan 6, 2010
	 * long BaseAction.java
	 * @Description
	 *
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 
	 * @Title 获取Request
	 * @Author Lucifer.Zhou 下午12:29:49 2010-5-3
	 * @Method getRequest
	 * @return HttpServletRequest
	 * @Description 详细描述
	 */
    protected HttpServletRequest getRequest() {
        return Struts2Utils.getRequest();
    }
    /**
     * 
     * @Title 获取Session
     * @Author Lucifer.Zhou 下午12:29:34 2010-5-3
     * @Method getSession
     * @return HttpSession
     * @Description 详细描述
     */
    protected HttpSession getSession() {
        return Struts2Utils.getSession();
    }
    protected String getCurrentTime()
    {
    	long longCalendar = 0;
		// 获得当前日期
		Calendar cldCurrent = Calendar.getInstance();
		// 获得年月日
		String strYear = String.valueOf(cldCurrent.get(Calendar.YEAR));
		String strMonth = String.valueOf(cldCurrent.get(Calendar.MONTH) + 1);
		String strDate = String.valueOf(cldCurrent.get(Calendar.DATE));
		String strHour = String.valueOf(cldCurrent.get(Calendar.HOUR));
		String strAM_PM = String.valueOf(cldCurrent.get(Calendar.AM_PM));
		String strMinute = String.valueOf(cldCurrent.get(Calendar.MINUTE));
		String strSecond = String.valueOf(cldCurrent.get(Calendar.SECOND));

		// 把时间转换为24小时制
		// strAM_PM=="1",表示当前时间是下午，所以strHour需要加12
		if (strAM_PM.equals("1")) {
			strHour = String.valueOf(Long.parseLong(strHour) + 12);
		}
		// 整理格式
		if (strMonth.length() < 2) {
			strMonth = "0" + strMonth;
		}
		if (strDate.length() < 2) {
			strDate = "0" + strDate;
		}
		if (strHour.length() < 2) {
			strHour = "0" + strHour;
		}
		if (strMinute.length() < 2) {
			strMinute = "0" + strMinute;
		}
		if (strSecond.length() < 2) {
			strSecond = "0" + strSecond;
		}

		return strYear+"-"+strMonth+"-"+strDate+" "+strHour+":"+strMinute+":"+strSecond; 
    }
    protected String getRandomBarCode()
    {
    	long longCalendar = 0;
			// 获得当前日期
			Calendar cldCurrent = Calendar.getInstance();
			// 获得年月日
			String strYear = String.valueOf(cldCurrent.get(Calendar.YEAR));
			String strMonth = String.valueOf(cldCurrent.get(Calendar.MONTH) + 1);
			String strDate = String.valueOf(cldCurrent.get(Calendar.DATE));
			String strHour = String.valueOf(cldCurrent.get(Calendar.HOUR));
			String strAM_PM = String.valueOf(cldCurrent.get(Calendar.AM_PM));
			String strMinute = String.valueOf(cldCurrent.get(Calendar.MINUTE));
			String strSecond = String.valueOf(cldCurrent.get(Calendar.SECOND));

			// 把时间转换为24小时制
			// strAM_PM=="1",表示当前时间是下午，所以strHour需要加12
			if (strAM_PM.equals("1")) {
				strHour = String.valueOf(Long.parseLong(strHour) + 12);
			}
			// 整理格式
			if (strMonth.length() < 2) {
				strMonth = "0" + strMonth;
			}
			if (strDate.length() < 2) {
				strDate = "0" + strDate;
			}
			if (strHour.length() < 2) {
				strHour = "0" + strHour;
			}
			if (strMinute.length() < 2) {
				strMinute = "0" + strMinute;
			}
			if (strSecond.length() < 2) {
				strSecond = "0" + strSecond;
			}
			// 组合结果
			longCalendar = Long.parseLong(strYear + strMonth + strDate + strHour + strMinute + strSecond);
	
    	return String.valueOf(longCalendar)+RandomStringUtils.randomNumeric(4);
    }
    /**
     * 
     * @Title 获取Cookie
     * @Author Lucifer.Zhou 下午12:28:48 2010-5-3
     * @Method getCookies
     * @return Cookie[]
     * @Description 详细描述
     */
    protected Cookie[] getCookies() {
        return Struts2Utils.getCookies();
    }
    protected ServletContext context;   
    public ServletContext getServletContext() {   
    	return ServletActionContext.getServletContext();
    } 
    /**
     * 
     * @Author Lucifer.Zhou 4:14:54 PM Jan 6, 2010
     * @Method getResponse
     * @return HttpServletResponse
     * @Description
     *
     */
    protected static HttpServletResponse getResponse() {
        return Struts2Utils.getResponse();
    }
    protected static String getParameter(String name) {
        return Struts2Utils.getParameter(name);
    }
    /**
     * 
     * @Title 获取PrintWriter
     * @Author Lucifer.Zhou 下午12:30:16 2010-5-3
     * @Method getPrintWriter
     * @return PrintWriter
     * @Description 详细描述
     */
    protected static PrintWriter getPrintWriter()
    {
	    PrintWriter out = null;
		try {
			out = getResponse().getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return out;
    }
    /**
     * 
     * @Title 设置Http Header
     * @Author Lucifer.Zhou 下午12:28:16 2010-5-3
     * @Method setHeader
     * @param type
     * @return void
     * @Description 详细描述
     */
    protected static void setHeader(String type)
    {
		getResponse().setCharacterEncoding(Constants.ENCODE_UTF_8);
		getResponse().setHeader("Pragma","No-cache");
		getResponse().setHeader("Cahce-Control","no-cache");
		getResponse().setDateHeader("Expires",0);
		getResponse().setContentType(type+"; charset="+Constants.ENCODE_UTF_8);
    }

    /**
     * 返回Session中的当前用户
     * @Author Lucifer.Zhou 7:48:48 PM Jan 22, 2009
     * @Method getCurrentUser
     * @return String
     */
    public static String getCurrentUser()
    {
    	
    	return "admin";
    }
    /**
     * 
     * @Title 输出JSON格式字符串
     * @Author Lucifer.Zhou 下午12:26:50 2010-5-3
     * @Method renderJson
     * @param json
     * @return void
     * @Description 详细描述
     */
    public static void renderJson(String json)
    {
    	Struts2Utils.renderJson(json);
    }
    /**
     * 
     * @Title 输出简单结果,带数据
     * @Author Lucifer.Zhou 下午12:27:14 2010-5-3
     * @Method renderSimpleResult
     * @param result
     * @param info
     * @param m
     * @return void
     * @Description 详细描述
     */
	public static void renderSimpleResult(boolean result,String info,Map m)
	{
	    Map map=new HashMap();
	    map.put(PRINT_RESULT, result);
	    map.put(PRINT_INFO, info);
	    map.put(PRINT_PARAMS, m);
	    JSONObject jSon = new JSONObject().fromObject(map);
	    renderJson(jSon.toString());
	}
	/**
	 * 
	 * @Title 输出简单结果
	 * @Author Lucifer.Zhou 下午12:27:49 2010-5-3
	 * @Method renderSimpleResult
	 * @param result
	 * @param info
	 * @return void
	 * @Description 详细描述
	 */
	public static void renderSimpleResult(boolean result,String info)
	{
	    Map map=new HashMap();
	    map.put(PRINT_RESULT, result);
	    map.put(PRINT_INFO, info);
	    JSONObject jSon = new JSONObject().fromObject(map);
	    renderJson(jSon.toString());
	}
	/**
	 * 
	 * @Title 输出简单结果
	 * @Author Lucifer.Zhou 下午12:28:00 2010-5-3
	 * @Method renderSimpleResult
	 * @param result
	 * @return void
	 * @Description 详细描述
	 */
	public static void renderSimpleResult(boolean result)
	{
	    Map map=new HashMap();
	    map.put(PRINT_RESULT, result);
	    if(result==true)
	    	map.put(PRINT_INFO, "操作成功!");
	    else
	    	map.put(PRINT_INFO, "操作失败!");
	    JSONObject jSon = new JSONObject().fromObject(map);
	    renderJson(jSon.toString());
	}
	/**
	 * 
	 * @Title 简化版System.out.println
	 * @Author Lucifer.Zhou 下午12:31:22 2010-5-3
	 * @Method print
	 * @param z
	 * @return void
	 * @Description 详细描述
	 */
	public static void print(Object z)
	{
		System.out.println(z);
	}
}
