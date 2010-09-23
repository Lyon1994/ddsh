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
package org.osinfo.core.webapp.model.custom;


/**
 * @Date 2010-7-29 上午11:54:49
 * @Description 描述
 */
public class Total  implements java.io.Serializable{
	private Integer id;
	private String year;
	private String userid;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public double getSum1() {
		return sum1;
	}
	public void setSum1(double sum1) {
		this.sum1 = sum1;
	}
	public double getSum2() {
		return sum2;
	}
	public void setSum2(double sum2) {
		this.sum2 = sum2;
	}
	public double getSum3() {
		return sum3;
	}
	public void setSum3(double sum3) {
		this.sum3 = sum3;
	}
	private double sum1;
	private double sum2;
	private double sum3;
}
