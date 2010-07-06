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

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @Date 2010-7-4 下午06:11:46
 * @Description 描述
 */
public class DateUtil {
	//获取当天时间 
    public static Date getNowTime(){
		Date   now = null;  
		SimpleDateFormat   dateFormat   =   new   SimpleDateFormat("yyyy-MM-dd hh:mm:ss");//可以方便地修改日期格式   
		String  hehe  = dateFormat.format(new   Date());   
		try {
			now=dateFormat.parse(hehe);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return now;
	} 
}
