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

import java.math.BigDecimal;

/**
 * @Date 2010-7-20 下午06:56:52
 * @Description 描述
 */
public class FloatUtil {

	/**
	 * @Title 方法作用名
	 * @Author Lucifer.Zhou
	 * @Date  2010-7-20 下午06:56:52 
	 * @Method main
	 * @param args
	 * @return void
	 * @Description 描述
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println(round((float) 1.2393,2));
	}
	public static double round(float v,int scale)
	{
		if(scale<0)
        {
            throw new IllegalArgumentException("The scale must be a positive integer or zero");
        }
        BigDecimal b = new BigDecimal(Double.toString(v));
        BigDecimal one = new BigDecimal("1");
        return b.divide(one,scale,BigDecimal.ROUND_HALF_UP).doubleValue();
    }

}
