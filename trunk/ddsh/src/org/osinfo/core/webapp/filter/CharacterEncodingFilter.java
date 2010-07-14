/**
 ************************************************
 * @Company 上海竹枫信息技术有限公司
 * @WebSite http://www.zf-info.com
 * @Organize 欧斯英孚开源组织 http://www.osinfo.org
 * @Founder Lucifer.Zhou 
 * @MSN zhoujianguo_leo@hotmail.com
 * @Mail leo821031@gmail.com
 * 竹枫含义：
 * 【典故】君向楚，我归秦，便分路青竹丹枫。
 * 【释义】青竹生南方，丹枫长北地。借指南北。 
 ************************************************
 */
package org.osinfo.core.webapp.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

/**
 * @Date 2010-7-14 下午07:39:16
 * @Description 描述
 */
public class CharacterEncodingFilter implements Filter 
{
	/**
	 * Take this filter out of service.
	 */
	public void destroy() {
	}
	/**
	 * Select and set (if specified) the character encoding to be used to
	 * interpret request parameters for this request.
	 */
	public void doFilter(ServletRequest request, ServletResponse response,
	FilterChain chain)throws IOException, ServletException {
		
		request.setCharacterEncoding("UTF-8");
		
		// 传递控制到下一个过滤器
		chain.doFilter(request, response);
	}

	public void init(FilterConfig filterConfig) throws ServletException {
	}


}
