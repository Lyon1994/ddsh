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
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.osinfo.core.webapp.action.CrudAction;
import org.osinfo.core.webapp.action.util.DynamicGrid;
import org.osinfo.core.webapp.dao.CommonDAO;
import org.osinfo.core.webapp.model.DdSubmit;
import org.osinfo.core.webapp.util.DBUtil;
import org.osinfo.core.webapp.util.ExcelUtil;
import org.osinfo.core.webapp.util.JsonUtil;
import org.osinfo.core.webapp.util.PageUtil;
@Results({
	 @Result(name="list",location = "/WEB-INF/result/system/submit/list.ftl")
})
/**
 * @Author Lucifer.Zhou 4:29:47 PM Jan 6, 2010
 * @Description
 * 上货审批
 */
public class SubmitAction<T> extends CrudAction{
	private static Logger logger = Logger.getLogger ( SubmitAction.class.getName () ) ;
	private static final int BUFFER_SIZE = 16 * 1024 ; 


	/**
	 * @Author Lucifer.Zhou 4:30:01 PM Jan 6, 2010
	 * long LoginAction.java
	 * @Description
	 *
	 */
	private static final long serialVersionUID = 1L;

	public String list() {
		return "list";
	}

	//商品递交
	@Override
	public String add() {
		// TODO Auto-generated method stub
		String barcode=getParameter("barcode");
		String amount=getParameter("amount");
		
		String place=getParameter("place");
		String ems=getParameter("ems");
		String begin=getParameter("begin");		
		
		String end=getParameter("end");
		String pay=getParameter("pay");
		String money=getParameter("money");		
		
		String memo=getParameter("memo");
		String submitdate=getCurrentTime();

	    String sql="insert into dd_submit (barcode,amount,place,ems,begin,end,pay,money,memo,submitdate) " +
		"values ('"+barcode+"',"+amount+",'"+place+"','"+ems+"','"+begin+"','"+end+"','"+pay+"',"+money+",'"+memo+"','"+submitdate+"')";
	    
		int v=CommonDAO.executeUpdate(sql);
		if(v>0)
			return "success";
		else
			return "error";
	}


	//审核通过,入库
	public String apply() {
		// TODO Auto-generated method stub
		if(logger.isDebugEnabled())
			logger.debug("加载接收页面...");
	    String ids=getParameter("ids");
	    ids=ids.substring(0,ids.length()-1);
		String submitdate=getCurrentTime();
		String operator=(String) getSession().getAttribute("userid");
	    if(!"".equals(ids.trim())){
	    	String[] idList = ids.split("\\,");
    		for(String id:idList){
    			String sql="select barcode,type,amount from dd_topper where id ="+id;
    			ResultSet rs = null;
    			Statement stmt = null;
    			Connection conn=DBUtil.getConnection();
    			String type="1";
    			String barcode="";
    			String amount="";
    			try {
    				stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
    				rs=stmt.executeQuery(sql);
    				while (rs.next())
    				{
    					type=rs.getString("type");
    					barcode=rs.getString("barcode");
    					amount=rs.getString("amount");
    				}
    			} catch (SQLException e) {
    				// TODO Auto-generated catch block
    				e.printStackTrace();
    			}finally {
    				DBUtil.close(rs, stmt, conn);
    			}
    			if(type==null)
    				type="1";
    			if(type.equals("1"))
    			{
    				sql="update dd_topper set status='1',barcode='"+getRandomBarCode()+"',date='"+submitdate+"',operator='"+operator+"' where id ="+id;
    				CommonDAO.executeUpdate(sql);
    		    	
    		    	String sql2="insert into dd_inventory (barcode,name,amount,price,discount,totalprice,userid,spec,material,grade,location,operator,date) " +
    		    			"select barcode,name,amount,price,"+1+",totalprice,userid,spec,material,grade,location,operator,date from dd_topper where id ="+id;
    		    	CommonDAO.executeUpdate(sql2);
    			}else
    			{
    				sql="update dd_topper set status='1',date='"+submitdate+"',operator='"+operator+"' where id ="+id;
    				CommonDAO.executeUpdate(sql);
    				sql="select amount from dd_inventory  where barcode='"+barcode+"'";

        			conn=DBUtil.getConnection();
    				String amount_="";
        			try {
        				stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
        				rs=stmt.executeQuery(sql);
        				while (rs.next())
        				{
        					amount_=rs.getString("amount");
        				}
        			} catch (SQLException e) {
        				// TODO Auto-generated catch block
        				e.printStackTrace();
        			}finally {
        				DBUtil.close(rs, stmt, conn);
        			}
    				sql="update dd_inventory set amount="+(Integer.valueOf(amount)+Integer.valueOf(amount_))+" where barcode='"+barcode+"'";
    		    	CommonDAO.executeUpdate(sql);
    			}
    		}
	    	//
	    	//String sql2="insert into dd_inventory (barcode,name,amount,price,discount,totalprice,userid,spec,material,grade,location,operator,date) " +
	    			//"select barcode,name,amount,price,"+1+",totalprice,userid,spec,material,grade,location,operator,date from dd_topper where id in ("+ids+")";
	    	//CommonDAO.executeUpdate(sql2);
	    }
	    renderSimpleResult(true,"ok");
        return null;
	}

	@Override
	public String del() {
		// TODO Auto-generated method stub
		if(logger.isDebugEnabled())
			logger.debug("加载删除页面...");
	    String ids=getParameter("ids");
	    if(!"".equals(ids.trim())){
	    		String sql="delete from dd_submit where id in ("+ids.substring(0,ids.length()-1)+")";
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
		String value=getParameter("value");
		String submitdate=getCurrentTime();

		String operator=(String) getSession().getAttribute("userid");
		
		String sql="update dd_submit set "+tdid+"="+value+",date='"+submitdate+"',operator='"+operator+"' where id ="+trid;
		CommonDAO.executeUpdate(sql);
		renderSimpleResult(true,"修改成功");
		return null;
	}
	@Override
	protected HSSFWorkbook exportExcel(HSSFWorkbook workbook, String scope,
			String bound, String where, String sort, String dir)
			throws Exception {
		// TODO Auto-generated method stub
		String name="上货审批表";
		String name2=name;
		if (getRequest().getHeader("User-Agent").toLowerCase().indexOf("firefox") > 0)
			name2 = new String(name.getBytes("UTF-8"), "ISO8859-1");//firefox浏览器
		else if (getRequest().getHeader("User-Agent").toUpperCase().indexOf("MSIE") > 0)
			name2 = URLEncoder.encode(name, "UTF-8");//IE浏览器 终极解决文件名乱码

		getResponse().setHeader("Content-disposition","attachment;filename=" +name2+"-"+getCurrentTime() + ".xls");
		String[] headers = { "序号","条形码", "名称", "图片","数量", "价格", "总计", "设计师","规格","材料","尺寸","产地","状态","备注","提交日期","验证日期","操作者"};
		String userid=(String) getSession().getAttribute("userid");
		String t=(String) getSession().getAttribute("type");
		String sql;
		if(t.equals("2"))
		{
			if(type.equals("1"))
				sql="select * from dd_submit where status='1' and amount>0 and userid='"+userid+"' order by date desc";
			else
				sql="select * from dd_submit where status='0' and amount>0 and userid='"+userid+"' order by date desc";
		}else
		{
			if(type.equals("1"))
				sql="select * from dd_submit where status='1' and amount>0 order by date desc";
			else
				sql="select * from dd_submit where status='0' and amount>0 order by date desc";
		}
		PageUtil p=CommonDAO.findByMultiTableSQLQuery(sql,DdSubmit.class);
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
				sql="select * from dd_submit where status='1' and amount>0 and userid='"+userid+"' order by date desc";
			else
				sql="select * from dd_submit where status='0' and amount>0 and userid='"+userid+"' order by date desc";
		}else
		{
			if(type.equals("1"))
				sql="select * from dd_submit where status='1' and amount>0 order by date desc";
			else
				sql="select * from dd_submit where status='0' and amount>0 order by date desc";
		}
		PageUtil p=CommonDAO.findPageByMultiTableSQLQuery(sql,start,end,perpage,DdSubmit.class);
		
		String content = "totalPage = " + p.getTotalPageCount() + ";";
		content += "dataStore = [";

		List l=(List)p.getResult();
		for(int i=0;i<l.size();i++)
		{
			DdSubmit d=(DdSubmit)l.get(i);
			Timestamp date;
			String type_=d.getType();
			if(type_==null)
				type_="新商品";
			if(type.equals("1"))
				date=d.getDate();
			else
				date=d.getSubmitdate();
			
			if(type_.equals("2"))
				type_="老商品";
			else
				type_="新商品";
			if(type.equals("1"))
				content += "\"<tr id='"+d.getId()+"'><td><input type='checkbox' name='row' value='"+d.getId()+"'/></td><td>"+d.getBarcode()+"</td><td>"+d.getName()+"</td><td>"+type_+"</td><td>"+d.getUserid()+"</td><td><img src='../upload/"+d.getImage()+"' width=50 height=20/></td><td class='editbox' id='amount'>"+d.getAmount()+"</td><td class='editbox' id='price'>"+d.getPrice()+"</td><td>"+d.getPrice()*d.getAmount()+"</td><td>"+d.getSpec()+"</td><td>"+d.getGrade()+"</td><td>"+d.getMaterial()+"</td><td>"+d.getLocation()+"</td><td>"+date+"</td><td>"+d.getMemo()+"</td></tr>\",";
			else
				content += "\"<tr id='"+d.getId()+"'><td><input type='checkbox' name='row' value='"+d.getId()+"'/></td><td>"+d.getName()+"</td><td>"+type_+"</td><td>"+d.getUserid()+"</td><td><img src='../upload/"+d.getImage()+"' width=50 height=20/></td><td class='editbox' id='amount'>"+d.getAmount()+"</td><td class='editbox' id='price'>"+d.getPrice()+"</td><td>"+d.getPrice()*d.getAmount()+"</td><td>"+d.getSpec()+"</td><td>"+d.getGrade()+"</td><td>"+d.getMaterial()+"</td><td>"+d.getLocation()+"</td><td>"+date+"</td><td>"+d.getMemo()+"</td></tr>\",";
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
				sql="select * from dd_topper where status='1' and amount>0 and userid='"+userid+"'";
			else
				sql="select * from dd_topper where status='0' and amount>0 and userid='"+userid+"'";
		}else
		{
			if(type.equals("1"))
				sql="select * from dd_topper where status='1' and amount>0";
			else
				sql="select * from dd_topper where status='0' and amount>0";
		}
		
		
		int count=CommonDAO.count(sql);
		return count;
	}
}
