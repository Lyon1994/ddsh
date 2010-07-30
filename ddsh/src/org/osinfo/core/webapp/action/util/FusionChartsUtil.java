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
package org.osinfo.core.webapp.action.util;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * @Date 2010-7-29 下午06:07:34
 * @Description 描述
 * 下面就createChart这个静态的方法进行解读!

 createChart(String chartSWF, String strURL,String strXML, String chartId, int chartWidth,     inchartHeight,
 boolean debugMode, boolean registerWithJS) 

  注意该方法需要传递的参数!

 String chartSWF就是一个flash也就是所谓的模板

 String strURL可以传递空字符串

 String strXML 就是我们用java语言写的一个特定的xml文档[注意该文档需要一定的格式！将在下面讲解]

String chartId 就是整个图形的标题[就是说明要显示图形的意图]; int chartWidth就是生成图形的宽度；

  int chartHeight就是生成图形的高度!

   boolean debugMode是否为调试模式 一般为false;

 boolean registerWithJS 是否将js一起发布一般为了保证代码的绝对安全 为false

 

具体的做法已经完成 下面就讲一下调用 在action或者servlet中  我们只需要

  String  strChartCode=FusionChartsCreator.createChart("模板", "","用java生成的xml文档","标题", 600, 500, false, false);

 PrintWriter out = response.getWriter();

out.print(strChartCode);

return null;

一个falsh图形就可以出现在你的面前了!

 */
public class FusionChartsUtil {
	/**
     * Adds additional string to the url to and encodes the parameters,<br>
     * so as to disable caching of data.<br>  
     * @param strDataURL -
     *                dataURL to be fed to chart
     * @param addNoCacheStr -
     *                Whether to add aditional string to URL to disable
     *                caching of data
     * @return cachedURL - URL with the additional string added
     */

    public static String addCacheToDataURL(String strDataURL) {
		 String cachedURL = strDataURL;
		 // Add the no-cache string if required
		
		 // We add ?FCCurrTime=xxyyzz
		 // If the dataURL already contains a ?, we add &FCCurrTime=xxyyzz
		 // We replace : with _, as FusionCharts cannot handle : in URLs
		 Calendar nowCal = Calendar.getInstance();
		 Date now = nowCal.getTime();
		 SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy HH_mm_ss a");
		 String strNow = sdf.format(now);
		
		 try {
		
		     if (strDataURL.indexOf("?") > 0) {
		  cachedURL = strDataURL + "&FCCurrTime="
		  + URLEncoder.encode(strNow, "UTF-8");
		     } else {
		  cachedURL = strDataURL + "?FCCurrTime="
		  + URLEncoder.encode(strNow, "UTF-8");
		     }
		
		 } catch (UnsupportedEncodingException e) {
		     // TODO Auto-generated catch block
		     e.printStackTrace();
		     cachedURL = strDataURL + "?FCCurrTime=" + strNow;
		 }
		
		 return cachedURL;
    }

    /**
     * Creates the JavaScript + HTML code required to embed a chart.<br>
     * Uses the javascript FusionCharts class to create the chart by supplying <br>
     * the required parameters to it.<br>
     * Note: Only one of the parameters strURL or strXML has to be not null for this<br>
     * method to work. If both the parameters are provided then strURL is used for further processing.<br>
     * 
     * @param chartSWF -
     *                SWF File Name (and Path) of the chart which you intend
     *                to plot
     * @param strURL -
     *                If you intend to use dataURL method for this chart,
     *                pass the URL as this parameter. Else, set it to "" (in
     *                case of dataXML method)
     * @param strXML -
     *                If you intend to use dataXML method for this chart,
     *                pass the XML data as this parameter. Else, set it to ""
     *                (in case of dataURL method)
     * @param chartId -
     *                Id for the chart, using which it will be recognized in
     *                the HTML page. Each chart on the page needs to have a
     *                unique Id.
     * @param chartWidth -
     *                Intended width for the chart (in pixels)
     * @param chartHeight -
     *                Intended height for the chart (in pixels)
     * @param debugMode -
     *                Whether to start the chart in debug mode
     * @param registerWithJS -
     *                Whether to ask chart to register itself with
     *                JavaScript
     */
    public static String createChart(String chartSWF, String strURL,
     String strXML, String chartId, int chartWidth, int chartHeight,
     boolean debugMode, boolean registerWithJS) {
		 StringBuffer strBuf = new StringBuffer();
		 // First we create a new DIV for each chart. We specify the name of DIV
		 // as "chartId"Div.
		 // DIV names are case-sensitive.
		
		 strBuf.append("\t\t<!-- START Script Block for Chart-->\n");
		 strBuf.append("\t\t<script LANGUAGE='Javascript' SRC='/FusionCharts/FusionCharts.js'></script>\n");
		 strBuf.append("\t\t<div id='" + chartId + "Div' align='center'>\n");
		 strBuf.append("\t\t\t\tChart.\n");
		
		 /*
		  * The above text "Chart" is shown to users before the chart has started
		  * loading (if there is a lag in relaying SWF from server). This text is
		  * also shown to users who do not have Flash Player installed. You can
		  * configure it as per your needs.
		  */
		
		 strBuf.append("\t\t</div>\n");
		
		 /*
		  * Now, we create the chart using FusionCharts js class. Each chart's
		  * instance (JavaScript) Id is named as chart_"chartId".
		  */
		
		 strBuf.append("\t\t<script type='text/javascript'>\n");
		 // Instantiate the Chart
		 Boolean registerWithJSBool = new Boolean(registerWithJS);
		 Boolean debugModeBool = new Boolean(debugMode);
		 int regWithJSInt = boolToNum(registerWithJSBool);
		 int debugModeInt = boolToNum(debugModeBool);
		
		 strBuf.append("\t\t\t\tvar chart_" + chartId + " = new FusionCharts('"
		  + chartSWF + "', '" + chartId + "', '" + chartWidth + "', '"
		  + chartHeight + "', '" + debugModeInt + "', '" + regWithJSInt
		  + "');\n");
		 // Check whether we've to provide data using dataXML method or dataURL
		 // method
		 if (strXML.equals("")) {
		     strBuf.append("\t\t\t\t// Set the dataURL of the chart\n");
		     strBuf.append("\t\t\t\tchart_" + chartId + ".setDataURL(\"" + strURL
		      + "\");\n");
		 } else {
		     strBuf.append("\t\t\t\t// Provide entire XML data using dataXML method\n");
		     strBuf.append("\t\t\t\tchart_" + chartId + ".setDataXML(\"" + strXML
		      + "\");\n");
		 }
		 strBuf.append("\t\t\t\t// Finally, render the chart.\n");
		 strBuf.append("\t\t\t\tchart_" + chartId + ".render(\"" + chartId + "Div\");\n");
		 strBuf.append("\t\t</script>\n");
		 strBuf.append("\t\t<!--END Script Block for Chart-->\n");
		 System.out.println(strBuf);
		 return strBuf.substring(0);
    }

    /**
     * Creates the object tag required to embed a chart.
     * Generates the object tag to embed the swf directly into the html page.<br>
     * Note: Only one of the parameters strURL or strXML has to be not null for this<br>
     * method to work. If both the parameters are provided then strURL is used for further processing.<br>
     *  
     * @param chartSWF -
     *                SWF File Name (and Path) of the chart which you intend
     *                to plot
     * @param strURL -
     *                If you intend to use dataURL method for this chart,
     *                pass the URL as this parameter. Else, set it to "" (in
     *                case of dataXML method)
     * @param strXML -
     *                If you intend to use dataXML method for this chart,
     *                pass the XML data as this parameter. Else, set it to ""
     *                (in case of dataURL method)
     * @param chartId -
     *                Id for the chart, using which it will be recognized in
     *                the HTML page. Each chart on the page needs to have a
     *                unique Id.
     * @param chartWidth -
     *                Intended width for the chart (in pixels)
     * @param chartHeight -
     *                Intended height for the chart (in pixels)
     * @param debugMode -
     *                Whether to start the chart in debug mode
     */
    public static String createChartHTML(String chartSWF, String strURL,
     String strXML, String chartId, int chartWidth, int chartHeight,
     boolean debugMode) { /*
      * Generate the FlashVars string based
      * on whether dataURL has been provided
      * or dataXML.
      */
		 String strFlashVars = "";
		 Boolean debugModeBool = new Boolean(debugMode);
		
		 if (strXML.equals("")) {
		     // DataURL Mode
		     strFlashVars = "chartWidth=" + chartWidth + "&chartHeight="
		     + chartHeight + "&debugMode=" + boolToNum(debugModeBool)
		     + "&dataURL=" + strURL + "";
		 } else {
		     // DataXML Mode
		     strFlashVars = "chartWidth=" + chartWidth + "&chartHeight="
		     + chartHeight + "&debugMode=" + boolToNum(debugModeBool)
		     + "&dataXML=" + strXML + "";
		 }
		 StringBuffer strBuf = new StringBuffer();
		
		 strBuf.append("\t\t<!--START Code Block for Chart-->\n");
		 strBuf
		 .append("\t\t<object classid='clsid:d27cdb6e-ae6d-11cf-96b8-444553540000' codebase='http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0' width='"
		  + chartWidth
		  + "' height='"
		  + chartHeight
		  + "' id='"
		  + chartId + "'>\n");
		 strBuf.append("\t\t\t\t<param name='allowScriptAccess' value='always' />\n");
		 strBuf.append("\t\t\t\t<param name='movie' value='" + chartSWF + "'/>\n");
		 strBuf.append("\t\t\t\t<param name='FlashVars' value=\"" + strFlashVars
		  + "\" />\n");
		 strBuf.append("\t\t\t\t<param name='quality' value='high' />\n");
		 strBuf
		 .append("\t\t\t\t<embed src='"
		  + chartSWF
		  + "' FlashVars=\""
		  + strFlashVars
		  + "\" quality='high' width='"
		  + chartWidth
		  + "' height='"
		  + chartHeight
		  + "' name='"
		  + chartId
		  + "' allowScriptAccess='always' type='application/x-shockwave-flash' pluginspage='http://www.macromedia.com/go/getflashplayer' />\n");
		 strBuf.append("\t\t</object>\n");
		 strBuf.append("\t\t<!--END Code Block for Chart-->\n");
		 return strBuf.substring(0);
    }

    /**
     * Converts a Boolean value to int value<br>
     * 
     * @param bool Boolean value which needs to be converted to int value 
     * @return int value correspoding to the boolean : 1 for true and 0 for false
     */
   public static int boolToNum(Boolean bool) {
	 int num = 0;
	 if (bool.booleanValue()) {
	     num = 1;
	 }
	 return num;
    }


}
