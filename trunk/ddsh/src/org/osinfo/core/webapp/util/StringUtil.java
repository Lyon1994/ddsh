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
package org.osinfo.core.webapp.util;

import java.io.UnsupportedEncodingException;

/**
 * @Date 2010-7-14 下午07:44:28
 * @Description 描述
 */
public class StringUtil {
	//编码转换
	public static String convert1(String s)
	{
		String result = null;
		byte[] temp;
		try {
			temp=s.getBytes("iso-8859-1");
			result=new String(temp,"GBK");
		} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;

	}
}
