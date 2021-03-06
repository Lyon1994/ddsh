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

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.Iterator;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFClientAnchor;
import org.apache.poi.hssf.usermodel.HSSFComment;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFPatriarch;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;

/**
 * @Date 2010-7-17 下午03:28:43
 * @Description 描述
 */
public class ExcelUtil {
	
	public static <T> HSSFWorkbook exportExcel(HSSFWorkbook workbook,String name, String[] headers,Collection<T> dataset)
	{
	      // 生成一个表格
	      HSSFSheet sheet = workbook.createSheet(name);
	      // 设置表格默认列宽度为15个字节
	      sheet.setDefaultColumnWidth((short) 15);
	      // 生成一个样式
	      HSSFCellStyle style = workbook.createCellStyle();
	      // 设置这些样式
	      style.setFillForegroundColor(HSSFColor.SKY_BLUE.index);
	      style.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
	      style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
	      style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
	      style.setBorderRight(HSSFCellStyle.BORDER_THIN);
	      style.setBorderTop(HSSFCellStyle.BORDER_THIN);
	      style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
	      // 生成一个字体
	      HSSFFont font = workbook.createFont();
	      font.setColor(HSSFColor.VIOLET.index);
	      font.setFontHeightInPoints((short) 12);
	      font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
	      // 把字体应用到当前的样式
	      style.setFont(font);
	      // 生成并设置另一个样式
	      HSSFCellStyle style2 = workbook.createCellStyle();
	      style2.setFillForegroundColor(HSSFColor.LIGHT_YELLOW.index);
	      style2.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
	      style2.setBorderBottom(HSSFCellStyle.BORDER_THIN);
	      style2.setBorderLeft(HSSFCellStyle.BORDER_THIN);
	      style2.setBorderRight(HSSFCellStyle.BORDER_THIN);
	      style2.setBorderTop(HSSFCellStyle.BORDER_THIN);
	      style2.setAlignment(HSSFCellStyle.ALIGN_CENTER);
	      style2.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
	      // 生成另一个字体
	      HSSFFont font2 = workbook.createFont();
	      font2.setBoldweight(HSSFFont.BOLDWEIGHT_NORMAL);
	      // 把字体应用到当前的样式
	      style2.setFont(font2);
	      // 声明一个画图的顶级管理器
	      HSSFPatriarch patriarch = sheet.createDrawingPatriarch();
	      // 定义注释的大小和位置,详见文档
	      HSSFComment comment = patriarch.createComment(new HSSFClientAnchor(0, 0, 0, 0, (short) 4, 2, (short) 6, 5));
	      // 设置注释内容
	      comment.setString(new HSSFRichTextString("上海竹枫信息技术有限公司-Lucifer.Zhou"));
	      // 设置注释作者，当鼠标移动到单元格上是可以在状态栏中看到该内容.
	      comment.setAuthor("周建国");
	      //产生表格标题行
	      HSSFRow row = sheet.createRow(0);
	      for (short i = 0; i < headers.length; i++) {
	         HSSFCell cell = row.createCell(i);
	         cell.setCellStyle(style);
	         HSSFRichTextString text = new HSSFRichTextString(headers[i]);
	         cell.setCellValue(text);
	      }
	      //遍历集合数据，产生数据行
	      Iterator<T> it = dataset.iterator();
	      int index = 0;
	      while (it.hasNext()) {
	         index++;
	         row = sheet.createRow(index);
	         T t = (T) it.next();
	         //利用反射，根据javabean属性的先后顺序，动态调用getXxx()方法得到属性值
	         Field[] fields = t.getClass().getDeclaredFields();
	         for (short i = 0; i < fields.length; i++) {
	            HSSFCell cell = row.createCell(i);
	            cell.setCellStyle(style2);
	            Field field = fields[i];
	            String fieldName = field.getName();
	            String getMethodName = "get"
	                   + fieldName.substring(0, 1).toUpperCase()
	                   + fieldName.substring(1);
	            try {
	                Class tCls = t.getClass();
	                Method getMethod = tCls.getMethod(getMethodName,
	                      new Class[] {});
	                Object value = getMethod.invoke(t, new Object[] {});
	                if(value==null)
	                	value="";
	                //判断值的类型后进行强制类型转换
	                String textValue = null;
	              if (value instanceof Integer) {
	                 int intValue = (Integer) value;
	                 cell.setCellValue(intValue);
	              } else if (value instanceof Float) {
	                 float fValue = (Float) value;
	                 cell.setCellValue(fValue);
	              } else if (value instanceof Double) {
	                 double dValue = (Double) value;
	                 cell.setCellValue(dValue);
	              } else if (value instanceof Long) {
	                 long longValue = (Long) value;
                     cell.setCellValue(longValue);
	              } else if (value instanceof Boolean) {
	                   boolean bValue = (Boolean) value;
	                   //textValue = "男";
	                   //if (!bValue) {
	                      //textValue ="女";
	                   //}
	                } else if (value instanceof Date) {
	                   Date date = (Date) value;
	                   SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	                   textValue = sdf.format(date);
	                      HSSFRichTextString richString = new HSSFRichTextString(textValue);
	                      HSSFFont font3 = workbook.createFont();
	                      font3.setColor(HSSFColor.BLUE.index);
	                      richString.applyFont(font3);
	                      cell.setCellValue(richString);
	                }else if (value instanceof byte[]) {
	                   // 有图片时，设置行高为60px;
	                   row.setHeightInPoints(60);
	                   // 设置图片所在列宽度为80px,注意这里单位的一个换算
	                   sheet.setColumnWidth(i, (short) (35.7 * 80));
	                   // sheet.autoSizeColumn(i);
	                   byte[] bsValue = (byte[]) value;
	                   HSSFClientAnchor anchor = new HSSFClientAnchor(0, 0,
	                         1023, 255, (short) 6, index, (short) 6, index);
	                   anchor.setAnchorType(2);
	                   patriarch.createPicture(anchor, workbook.addPicture(
	                   bsValue, HSSFWorkbook.PICTURE_TYPE_JPEG));
	                      HSSFRichTextString richString = new HSSFRichTextString(textValue);
	                      HSSFFont font3 = workbook.createFont();
	                      font3.setColor(HSSFColor.BLUE.index);
	                      richString.applyFont(font3);
	                      cell.setCellValue(richString);
	                } else{
	                   //其它数据类型都当作字符串简单处理
	                   textValue = value.toString();
	                      HSSFRichTextString richString = new HSSFRichTextString(textValue);
	                      HSSFFont font3 = workbook.createFont();
	                      font3.setColor(HSSFColor.BLUE.index);
	                      richString.applyFont(font3);
	                      cell.setCellValue(richString);
	                }
	                

	            } catch (SecurityException e) {
	                // TODO Auto-generated catch block
	                e.printStackTrace();
	            } catch (NoSuchMethodException e) {
	                // TODO Auto-generated catch block
	                e.printStackTrace();
	            } catch (IllegalArgumentException e) {
	                // TODO Auto-generated catch block
	                e.printStackTrace();
	            } catch (IllegalAccessException e) {
	                // TODO Auto-generated catch block
	                e.printStackTrace();
	            } catch (InvocationTargetException e) {
	                // TODO Auto-generated catch block
	                e.printStackTrace();
	            } finally {
	                //清理资源
	            }
	         }
	      }
	      return workbook;
	}

}
