/**
 * @Author Lucifer.Zhou 3:35:01 PM Feb 10, 2010
 * @MSN zhoujianguo_leo@hotmail.com
 * @Mail leo821031@gmail.com
 * @FileName ToolsAction.java
 * @JDKVersion 1.5
 * @Site http://www.osinfo.org
 */
package org.osinfo.core.webapp.action.system;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;

import org.apache.commons.lang.RandomStringUtils;
import org.apache.log4j.Logger;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.osinfo.core.webapp.action.BaseAction;

@Results({
	 @Result(name="header",location = "/WEB-INF/result/system/header.ftl"),
	 @Result(name="left",location = "/WEB-INF/result/system/left.ftl"),
	 @Result(name="right",location = "/WEB-INF/result/system/right.ftl"),
	 @Result(name="main",location = "/WEB-INF/result/system/main.ftl")
})
public class WorkbenchAction extends BaseAction {
	private String VALIDATECODE="j_validation_code";
	/**
	 * @Author Lucifer.Zhou 11:32:26 AM Mar 28, 2010
	 * long WorkbenchAction.java
	 * @Description
	 *
	 */
	private static final long serialVersionUID = 1L;

	private static Logger logger = Logger.getLogger ( WorkbenchAction.class.getName () ) ;

	
	/**
	 * @Author Lucifer.Zhou 3:35:01 PM Feb 10, 2010
	 * ToolsAction
	 * @Description
	 *
	 */
	public WorkbenchAction() {
		// TODO Auto-generated constructor stub
	}

	@Action("/header.*") 
	public String header()
	{
		if(logger.isDebugEnabled())
			logger.debug("获取头...");
		return "header";
	}
	@Action("/left.*") 
	public String left()
	{
		if(logger.isDebugEnabled())
			logger.debug("获取左...");
		return "left";
	}
	@Action("/main.*") 
	public String main()
	{
		if(logger.isDebugEnabled())
			logger.debug("获取正文...");
		return "main";
	}
	public static Map getTree(String type)
	{
		Map m=new LinkedHashMap();
		if(type.equals("1"))
		{
			m.put("用户注册", "html/regedit_user.html");
			m.put("用户审批", "system/user!list2.zf");
			m.put("商品审批", "system/topper!list.zf");
			m.put("已批记录", "system/topper!list2.zf");
			m.put("商品退回", "system/back!list.zf");
			m.put("库存管理", "system/inventory!list.zf");
			m.put("商品上架", "user.zf");
			m.put("商品下架", "user.zf");
			m.put("当前在售", "user.zf");
			m.put("售货分析", "user.zf");
			m.put("退货分析", "user.zf");
			m.put("用户管理", "user.zf");
			m.put("格子管理", "user.zf");
			m.put("公告管理", "user.zf");
			m.put("用户管理", "system/user!list.zf");
			m.put("财务管理", "user.zf");
		}else if(type.equals("2"))
		{
			m.put("上货审批", "html/regedit_topper.html");
			m.put("待批记录", "system/topper!list3.zf");
			m.put("已批记录", "system/topper!list2.zf");
			m.put("退回记录", "system/back!list2.zf");
			m.put("库存记录", "system/inventory!list.zf");
			m.put("上架记录", "user.zf");
			m.put("下架记录", "user.zf");
			m.put("当前在售", "user.zf");
			m.put("售货分析", "user.zf");
			m.put("退货分析", "user.zf");
			m.put("电子钱包", "user.zf");
		}else if(type.equals("3"))
		{
			m.put("售货管理", "user.zf");
			m.put("退货管理", "user.zf");
			m.put("待批记录", "system/topper!list3.zf");
			m.put("已批记录", "system/topper!list2.zf");
			m.put("退回记录", "system/back!list2.zf");
			m.put("库存管理", "system/inventory!list.zf");
			m.put("商品上架", "user.zf");
			m.put("商品下架", "user.zf");
			m.put("当前在售", "user.zf");
			m.put("售货分析", "user.zf");
			m.put("退货分析", "user.zf");
		}else
		{
			m.put("当前在售", "user.zf");
		}
		return m;
	}

	@Action("/captcha.*")   
	public String execute() {
		// TODO Auto-generated method stub

        getResponse().setContentType("image/jpeg");
        int width = 50;
        int height = 18;
        // 取得一个4位随机字母数字字符串
        String s = RandomStringUtils.random(4, true, true);

        // 保存入session,用于与用户的输入进行比较.
        // 注意比较完之后清除session.
        //HttpSession session = request.getSession(true);
        getSession().setAttribute(VALIDATECODE, s);
        System.out.println(VALIDATECODE+"："+s);

        ServletOutputStream out = null;
		try {
			out = getResponse().getOutputStream();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
        BufferedImage image = new BufferedImage(width, height,
                BufferedImage.TYPE_INT_RGB);
        Graphics g = image.getGraphics();
        // 设定背景色
        g.setColor(getRandColor(200, 250));
        g.fillRect(0, 0, width, height);

        // 设定字体
        Font mFont = new Font("Times New Roman", Font.BOLD, 18);// 设置字体
        g.setFont(mFont);

        // 画边框
        // g.setColor(Color.BLACK);
        // g.drawRect(0, 0, width - 1, height - 1);

        // 随机产生干扰线，使图象中的认证码不易被其它程序探测到
        g.setColor(getRandColor(160, 200));
        // 生成随机类
        Random random = new Random();
        for (int i = 0; i < 155; i++) {
            int x2 = random.nextInt(width);
            int y2 = random.nextInt(height);
            int x3 = random.nextInt(12);
            int y3 = random.nextInt(12);
            g.drawLine(x2, y2, x2 + x3, y2 + y3);
        }

        // 将认证码显示到图象中
        g.setColor(new Color(20 + random.nextInt(110), 20 + random
                .nextInt(110), 20 + random.nextInt(110)));

        g.drawString(s, 2, 16);

        // 图象生效
        g.dispose();
        // 输出图象到页面
        try {
			ImageIO.write((BufferedImage) image, "JPEG", out);
	        out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return null;
	}
	/**
	 * 
	 * @param fc
	 * @param bc
	 * @return Color
	 */
	private Color getRandColor(int fc, int bc) { // 给定范围获得随机颜色
	    Random random = new Random();
	    if (fc > 255)
	        fc = 255;
	    if (bc > 255)
	        bc = 255;
	    int r = fc + random.nextInt(bc - fc);
	    int g = fc + random.nextInt(bc - fc);
	    int b = fc + random.nextInt(bc - fc);
	    return new Color(r, g, b);
	}
}
