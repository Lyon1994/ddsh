/**
 * @Author Lucifer.Zhou 4:29:47 PM Jan 6, 2010
 * @MSN zhoujianguo_leo@hotmail.com
 * @Mail leo821031@gmail.com
 * @FileName LoginAction.java
 * @JDKVersion 1.5
 * @Site http://www.osinfo.org
 */
package org.osinfo.core.webapp.action.system;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.osinfo.core.webapp.action.CrudAction;
import org.osinfo.core.webapp.action.util.DynamicGrid;
import org.osinfo.core.webapp.dao.CommonDAO;
import org.osinfo.core.webapp.model.DdProduct;
import org.osinfo.core.webapp.util.ExcelUtil;
import org.osinfo.core.webapp.util.FloatUtil;
import org.osinfo.core.webapp.util.JsonUtil;
import org.osinfo.core.webapp.util.PageUtil;
@Results({
	 @Result(name="list",location = "/WEB-INF/result/system/product/list.ftl"),
	 @Result(name="list2",location = "/WEB-INF/result/system/product/list2.ftl"),
	 @Result(name="list4",location = "/WEB-INF/result/system/product/list4.ftl"),
	 @Result(name="list5",location = "/WEB-INF/result/system/product/list5.ftl")
})
/**
 * @Author Lucifer.Zhou 4:29:47 PM Jan 6, 2010
 * @Description
 * 商品管理
 */
public class ProductAction<T> extends CrudAction{
	private static Logger logger = Logger.getLogger ( ProductAction.class.getName () ) ;
	private static final int BUFFER_SIZE = 16 * 1024 ; 
	private File image;
	private String imageContentType;
    private String imageFileName;
    
    public File getImage() {
		return image;
	}
	public void setImage(File image) {
		this.image = image;
	}
	public String getImageContentType() {
		return imageContentType;
	}
	public void setImageContentType(String imageContentType) {
		this.imageContentType = imageContentType;
	}
	public String getImageFileName() {
		return imageFileName;
	}
	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}
	public String getCaption() {
		return caption;
	}
	public void setCaption(String caption) {
		this.caption = caption;
	}
	private String caption;

	/**
	 * @Author Lucifer.Zhou 4:30:01 PM Jan 6, 2010
	 * long LoginAction.java
	 * @Description
	 *
	 */
	private static final long serialVersionUID = 1L;
	//商品管理
	public String list() {
		return "list";
	}
	//已批商品
	public String list2() {
		return "list2";
	}

	//设计师待批商品
	public String list4() {
		return "list4";
	}
	//管理员审批商品
	public String list5() {
		return "list5";
	}
	//商品递交
	@Override
	public String add() {
		// TODO Auto-generated method stub
		String type=getParameter("type");
		String name=getParameter("name");
		String price=getParameter("price");
		String spec=getParameter("spec");		
		
		String material=getParameter("material");
		String grade=getParameter("grade");
		String location=getParameter("location");		
		
		String memo=getParameter("memo");
		String submitdate=getCurrentTime();

		String operator=(String) getSession().getAttribute("userid");
		String result=getParameter("result");
		

	    String sql="";
		File imageFile = new File(ServletActionContext.getServletContext().getRealPath("/upload") + "/" + imageFileName);
		copy(image, imageFile);
	    sql="insert into dd_product (name,price,type,status,image,userid,spec,material,grade,location,memo,submitdate) " +
			"values ('"+name+"','"+FloatUtil.round(Float.parseFloat(price), 2)+"','"+type+"','0','"+imageFileName+"','"+operator+"','"+spec+"','"+material+"','"+grade+"','"+location+"','"+memo+"','"+submitdate+"')";

		int v=CommonDAO.executeUpdate(sql);
		if(v>0)
		{
			if(result==null)
				return "success";
			else
				return "success2";
		}else
			if(result==null)
				return "error";
			else
				return "error2";
	}
	//审核通过
	public String apply() {
		// TODO Auto-generated method stub
		if(logger.isDebugEnabled())
			logger.debug("加载接收页面...");
	    String ids=getParameter("ids");
	    ids=ids.substring(0,ids.length()-1);
		String submitdate=getCurrentTime();
		String operator=(String) getSession().getAttribute("userid");
	    if(!"".equals(ids.trim())){
	    	String sql="update dd_product set status='1',barcode='"+getRandomBarCode()+"',date='"+submitdate+"',operator='"+operator+"' where id in ("+ids+")";
			int r=CommonDAO.executeUpdate(sql);
	    	if(r>0)
	    		renderSimpleResult(true,r+"条处理成功！");
	    }
        return null;
	}
    private static void copy(File src, File dst)  {
        try  {
           InputStream in = null ;
           OutputStream out = null ;
            try  {                
               in = new BufferedInputStream( new FileInputStream(src), BUFFER_SIZE);
               out = new BufferedOutputStream( new FileOutputStream(dst), BUFFER_SIZE);
                byte [] buffer = new byte [BUFFER_SIZE];
                while (in.read(buffer) > 0 )  {
                   out.write(buffer);
               } 
            } finally  {
                if ( null != in)  {
                   in.close();
               } 
                 if ( null != out)  {
                   out.close();
               } 
           } 
        } catch (Exception e)  {
           e.printStackTrace();
       } 
   }  

	//获取当前用户拥有的商品barcode
	public String load() {
		// TODO Auto-generated method stub
		if(logger.isDebugEnabled())
			logger.debug("加载装入页面...");
		String operator=(String) getSession().getAttribute("userid");
		String sql="select * from dd_product where userid ='"+operator+"'";
		List l=CommonDAO.executeQuery(sql,DdProduct.class);
		List l_=new ArrayList();
		for(int i=0;i<l.size();i++)
		{
			Map m=new HashMap();
			DdProduct p=(DdProduct)l.get(i);
			m.put("name",p.getBarcode());
			m.put("value",p.getBarcode());
			l_.add(m);
		}
		String json = JsonUtil.list2json(l_);
    	renderJson(json.toString());
	    System.out.println(json.toString());
	    
        return null;
	}
	@Override
	public String del() {
		// TODO Auto-generated method stub
		if(logger.isDebugEnabled())
			logger.debug("加载删除页面...");
	    String ids=getParameter("ids");
	    if(!"".equals(ids.trim())){
	    		String sql="delete from dd_product where id in ("+ids.substring(0,ids.length()-1)+")";
	    		CommonDAO.executeUpdate(sql);
	    }
	    renderSimpleResult(true,"ok");
        return null;
	}
	@Override
	public String edit() {
		// TODO Auto-generated method stub
		String trid=getParameter("trid");
		String tdid=getParameter("tdid");
		String value=org.osinfo.core.webapp.util.StringUtil.convert(getParameter("value"));
		String submitdate=getCurrentTime();

		String operator=(String) getSession().getAttribute("userid");
		
		String sql="update dd_product set "+tdid+"='"+value+"',date='"+submitdate+"',operator='"+operator+"' where id ="+trid;
		CommonDAO.executeUpdate(sql);
		renderSimpleResult(true,"修改成功");
		return null;
	}
	@Override
	protected HSSFWorkbook exportExcel(HSSFWorkbook workbook, String scope,
			String bound, String where, String sort, String dir)
			throws Exception {
		// TODO Auto-generated method stub
		String name="商品表";
		String name2=name;
		if (getRequest().getHeader("User-Agent").toLowerCase().indexOf("firefox") > 0)
			name2 = new String(name.getBytes("UTF-8"), "ISO8859-1");//firefox浏览器
		else if (getRequest().getHeader("User-Agent").toUpperCase().indexOf("MSIE") > 0)
			name2 = URLEncoder.encode(name, "UTF-8");//IE浏览器 终极解决文件名乱码

		getResponse().setHeader("Content-disposition","attachment;filename=" +name2+"-"+getCurrentTime() + ".xls");
		String[] headers = { "序号","条形码", "名称", "单价", "类型", "状态", "图片","设计师", "规格","材料","尺寸","产地","备注","提交日期","操作者","验证日期"};
		String userid=(String) getSession().getAttribute("userid");
		String t=(String) getSession().getAttribute("type");
		String sql;
		if(t.equals("2"))
		{
			if(type.equals("1"))
				sql="select * from dd_product where status='1' and userid='"+userid+"' order by userid,barcode desc";
			else
				sql="select * from dd_product where status='0' and userid='"+userid+"' order by userid,submitdate desc";
		}else
		{
			if(type.equals("1"))
				sql="select * from dd_product where status='1' order by userid,barcode desc";
			else
				sql="select * from dd_product where status='0' order by userid,submitdate desc";
		}
		PageUtil p=CommonDAO.findByMultiTableSQLQuery(sql,DdProduct.class);
		Collection<T> l = (Collection<T>) p.getResult();
		return ExcelUtil.exportExcel(workbook,name, headers, l);
	}
	@Override
	public List filter(List expressions, String[] filters) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public DynamicGrid myDynamicGrid() {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public String myResult() {
		// TODO Auto-generated method stub
		String sql;
		String userid=(String) getSession().getAttribute("userid");
		String t=(String) getSession().getAttribute("type");
		if(t.equals("2"))
		{
			if(type.equals("1"))
				sql="select * from dd_product where status='1' and userid='"+userid+"' order by userid,barcode desc";
			else
				sql="select * from dd_product where status='0' and userid='"+userid+"' order by userid,submitdate desc";
		}else
		{
			if(type.equals("1"))
				sql="select * from dd_product where status='1' order by userid,barcode desc";
			else
				sql="select * from dd_product where status='0' order by userid,submitdate desc";
		}
		PageUtil p=CommonDAO.findPageByMultiTableSQLQuery(sql,start,end,perpage,DdProduct.class);
		
		String content = "totalPage = " + p.getTotalPageCount() + ";";
		content += "dataStore = [";

		List l=(List)p.getResult();
		for(int i=0;i<l.size();i++)
		{
			DdProduct d=(DdProduct)l.get(i);
			Timestamp date;
			String type_=d.getType();
			if(type_.equals("1"))
				type_="小型物品";
			else if(type_.equals("2"))
				type_="中型物品";
			else if(type_.equals("3"))
				type_="大型物品";
			
			String status=d.getStatus();
			if(status.equals("0"))
				status="<font color='red'>待审核</font>";
			else if(status.equals("1"))
				status="<font color='green'>已审核</font>";
			
			if(type.equals("1"))
				content += "\"<tr id='"+d.getId()+"'><td><input type='checkbox' name='row' value='"+d.getId()+"'/></td><td>"+d.getBarcode()+"</td><td>"+d.getName()+"</td><td class='editbox' id='price'>"+d.getPrice()+"</td><td>"+type_+"</td><td>"+status+"</td><td><img src='../upload/"+d.getImage()+"' width=50 height=20/></td><td>"+d.getUserid()+"</td><td class='editbox' id='spec'>"+d.getSpec()+"</td><td class='editbox' id='grade'>"+d.getGrade()+"</td><td class='editbox' id='material'>"+d.getMaterial()+"</td><td class='editbox' id='location'>"+d.getLocation()+"</td><td>"+d.getDate()+"</td></tr>\",";
			else
				content += "\"<tr id='"+d.getId()+"'><td><input type='checkbox' name='row' value='"+d.getId()+"'/></td><td>"+d.getName()+"</td><td>"+d.getPrice()+"</td><td>"+type_+"</td><td>"+status+"</td><td><img src='../upload/"+d.getImage()+"' width=50 height=20/></td><td>"+d.getUserid()+"</td><td>"+d.getSpec()+"</td><td>"+d.getGrade()+"</td><td>"+d.getMaterial()+"</td><td>"+d.getLocation()+"</td><td>"+d.getMemo()+"</td><td>"+d.getSubmitdate()+"</td></tr>\",";
		}
		content = content.substring(0,content.length()-1);
		content += "];";
		return content;
	}
	@Override
	public int myCount() {
		// TODO Auto-generated method stub
		type=(String)getParameter("type");//操作类型
		String sql;
		String userid=(String) getSession().getAttribute("userid");
		String t=(String) getSession().getAttribute("type");
		if(t.equals("2"))
		{
			if(type.equals("1"))
				sql="select * from dd_product where status='1' and  userid='"+userid+"'";
			else
				sql="select * from dd_product where status='0' and  userid='"+userid+"'";
		}else
		{
			if(type.equals("1"))
				sql="select * from dd_product where status='1' ";
			else
				sql="select * from dd_product where status='0' ";
		}
		
		int count=CommonDAO.count(sql);
		return count;
	}
}
