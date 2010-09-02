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

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * @Date 2010-8-28 下午05:45:36
 * @Description 描述
 */
public class SecurityUtil {

	/**
	 * 
	 */
	public SecurityUtil() {
		// TODO Auto-generated constructor stub
	}
	public static String encodeMD5(String s)
	{
		char hexDigits[] = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f' }; 

			byte[] strTemp = s.getBytes(); 
			//使用MD5创建MessageDigest对象 
			MessageDigest mdTemp = null;
			try {
				mdTemp = MessageDigest.getInstance("MD5");
			} catch (NoSuchAlgorithmException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
			mdTemp.update(strTemp); 
			byte[] md = mdTemp.digest(); 
			int j = md.length; 
			char str[] = new char[j * 2]; 
			int k = 0; 
			for (int i = 0; i < j; i++) { 
				byte b = md[i]; 
				//System.out.println((int)b); 
				//将没个数(int)b进行双字节加密 
			    str[k++] = hexDigits[b >> 4 & 0xf]; 
				str[k++] = hexDigits[b & 0xf]; 
			} 
			return new String(str); 
	}
	public static void main(String[] args)
	{
		System.out.println(encodeMD5("1"));
	}
}
