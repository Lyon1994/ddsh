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
import java.util.regex.Pattern;

/**
 * @Date 2010-7-14 下午07:44:28
 * @Description 描述
 */
public class StringUtil {
	//编码转换
	public static String convert(String s)
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
	public static String convertUTF8(String s)
	{
		String result = null;
		byte[] temp;
		try {
			temp=s.getBytes("iso-8859-1");
			result=new String(temp,"UTF-8");
		} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	//过滤html标签
	public static String html2Text(String inputString) { 
        String htmlStr = inputString; //含html标签的字符串 
            String textStr =""; 
      java.util.regex.Pattern p_script; 
      java.util.regex.Matcher m_script; 
      java.util.regex.Pattern p_style; 
      java.util.regex.Matcher m_style; 
      java.util.regex.Pattern p_html; 
      java.util.regex.Matcher m_html; 
   
      try { 
       String regEx_script = "<[\\s]*?script[^>]*?>[\\s\\S]*?<[\\s]*?\\/[\\s]*?script[\\s]*?>"; //定义script的正则表达式{或<script[^>]*?>[\\s\\S]*?<\\/script> } 
       String regEx_style = "<[\\s]*?style[^>]*?>[\\s\\S]*?<[\\s]*?\\/[\\s]*?style[\\s]*?>"; //定义style的正则表达式{或<style[^>]*?>[\\s\\S]*?<\\/style> } 
          String regEx_html = "<[^>]+>"; //定义HTML标签的正则表达式 
      
          p_script = Pattern.compile(regEx_script,Pattern.CASE_INSENSITIVE); 
          m_script = p_script.matcher(htmlStr); 
          htmlStr = m_script.replaceAll(""); //过滤script标签 

          p_style = Pattern.compile(regEx_style,Pattern.CASE_INSENSITIVE); 
          m_style = p_style.matcher(htmlStr); 
          htmlStr = m_style.replaceAll(""); //过滤style标签 
      
          p_html = Pattern.compile(regEx_html,Pattern.CASE_INSENSITIVE); 
          m_html = p_html.matcher(htmlStr); 
          htmlStr = m_html.replaceAll(""); //过滤html标签 
      
       textStr = htmlStr; 
      
      }catch(Exception e) { 
               System.err.println("Html2Text: " + e.getMessage()); 
      } 
   
      return textStr;//返回文本字符串 
       }   

}
