/**
 * @Author Lucifer.Zhou 4:29:47 PM Jan 6, 2010
 * @MSN zhoujianguo_leo@hotmail.com
 * @Mail leo821031@gmail.com
 * @FileName LoginAction.java
 * @JDKVersion 1.5
 * @Site http://www.osinfo.org
 */
package org.osinfo.core.webapp.action.system;

import java.net.URLEncoder;
import java.sql.Timestamp;
import java.util.Collection;
import java.util.List;

import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.osinfo.core.webapp.action.CrudAction;
import org.osinfo.core.webapp.action.util.DynamicGrid;
import org.osinfo.core.webapp.dao.CommonDAO;
import org.osinfo.core.webapp.model.DdInventory;
import org.osinfo.core.webapp.model.DdUpload;
import org.osinfo.core.webapp.model.DdUser;
import org.osinfo.core.webapp.util.ExcelUtil;
import org.osinfo.core.webapp.util.PageUtil;
@Results({
	 @Result(name="list",location = "/WEB-INF/result/system/upload/list.ftl"),
})
/**
 * @Author Lucifer.Zhou 4:29:47 PM Jan 6, 2010
 * @Description
 * 上架记录
 */
public class UploadAction<T> extends CrudAction{
	private static Logger logger = Logger.getLogger ( UploadAction.class.getName () ) ;
	/**
	 * @Author Lucifer.Zhou 4:30:01 PM Jan 6, 2010
	 * long LoginAction.java
	 * @Description
	 *
	 */
	private static final long serialVersionUID = 1L;
	//上架记录
	public String list() {
		return "list";
	}


	//商品上架，修改相应的库存数量
	@Override
	public String add() {
		// TODO Auto-generated method stub
		String userid=getParameter("userid");
		String name=getParameter("name");
		String amount=getParameter("amount");
		String barcode=getParameter("barcode");
		String submitdate=getCurrentTime();
		String inventoryid=getParameter("inventoryid");
		String operator=(String) getSession().getAttribute("userid");
		String price=getParameter("price");
		String gridid=getParameter("gridid");
		String discount=getParameter("discount");//折扣

		String sql="insert into dd_upload (inventoryid,barcode,name,amount,gridid,price,discount,userid,operator,date) " +
				"values ("+inventoryid+",'"+barcode+"','"+name+"',"+amount+",'"+gridid+"',"+price+","+discount+",'"+userid+"','"+operator+"','"+submitdate+"')";
		CommonDAO.executeUpdate(sql);

		sql="insert into dd_sell (inventoryid,barcode,name,amount,gridid,price,discount,userid) " +
				"values ("+inventoryid+",'"+barcode+"','"+name+"',"+amount+",'"+gridid+"',"+price+","+discount+",'"+userid+"')";
		CommonDAO.executeUpdate(sql);
		sql="select * from dd_inventory where id="+inventoryid;//获取库存数量
		List l2=CommonDAO.executeQuery(sql, DdInventory.class);
		if(l2!=null)
		{
			DdInventory v=(DdInventory)l2.get(0);
			sql="update dd_inventory set amount="+(v.getAmount()-Integer.valueOf(amount))+" where id ="+v.getId();
			CommonDAO.executeUpdate(sql);
		}

    	renderSimpleResult(true,"ok");
    	return null;
	}
	//批量上传,修改库存表的数量为0,用户可在上传记录表进行修改数量和格子编号
	//如果数量被修改了，则要补全库存表
	public String batchAdd() {
		// TODO Auto-generated method stub
	    String value=getParameter("value");
	    String[] tmp=value.split("\\|");
		String submitdate=getCurrentTime();
		String operator=(String) getSession().getAttribute("userid");
	    for(int i=0;i<tmp.length;i++)
	    {
	    	String[] t=tmp[i].split("\\,");
		    	String barcode=t[0];
		    	String amount=t[1];
		    	String discount=t[2];
		    	String gridid=t[3];
		    	String sql="select * from dd_inventory where barcode='"+barcode+"'";
		    	List l=CommonDAO.executeQuery(sql, DdInventory.class);
		    	if(l!=null)
		    	{
		    		DdInventory in=(DdInventory) l.get(0);
		    		
		    		sql="insert into dd_upload (inventoryid,barcode,name,amount,gridid,price,discount,userid,operator,date) " +
					"values ("+in.getId()+",'"+barcode+"','"+in.getName()+"',"+amount+",'"+gridid+"',"+in.getPrice()+","+discount+",'"+in.getUserid()+"','"+operator+"','"+submitdate+"')";
					CommonDAO.executeUpdate(sql);
				
					sql="insert into dd_sell (inventoryid,barcode,name,amount,gridid,price,discount,userid) " +
							"values ("+in.getId()+",'"+barcode+"','"+in.getName()+"',"+amount+",'"+gridid+"',"+in.getPrice()+","+discount+",'"+in.getUserid()+"')";
					CommonDAO.executeUpdate(sql);
					
					sql="update dd_inventory set amount="+(in.getAmount()-Integer.valueOf(amount))+" where id ="+in.getId();
					CommonDAO.executeUpdate(sql);

		    	}
	    }

	    renderSimpleResult(true,"处理完成");
	    return null;
	}
	@Override
	public String del() {
		// TODO Auto-generated method stub
		if(logger.isDebugEnabled())
			logger.debug("加载删除页面...");
	    String ids=getParameter("ids");
	    if(!"".equals(ids.trim())){
	    		String sql="delete from dd_upload where id in ("+ids.substring(0,ids.length()-1)+")";
	    		CommonDAO.executeUpdate(sql);
	    }
	    renderSimpleResult(true,"ok");
        return null;
	}
	//上传后的编辑，如果是修改数量，则要相应的调整库存
	@Override
	public String edit() {
		// TODO Auto-generated method stub
		String trid=getParameter("trid");
		String tdid=getParameter("tdid");
		String value=getParameter("value");
		String sql="";
		if(tdid.equalsIgnoreCase("amount"))//如果修改的是数量，则要修改库存量
		{
			sql="select * from dd_upload where id="+trid;//获取已上传的物品id
			List l=CommonDAO.executeQuery(sql, DdUpload.class);
			for(int i=0;i<l.size();i++)
			{
				DdUpload u=(DdUpload)l.get(i);
				int va=u.getAmount()-Integer.valueOf(value);//差量
				sql="select * from dd_inventory where id="+u.getInventoryid();//获取库存数量
				List l2=CommonDAO.executeQuery(sql, DdInventory.class);
				for(int j=0;j<l2.size();j++)
				{
					DdInventory v=(DdInventory)l2.get(j);
					sql="update dd_inventory set amount="+(v.getAmount()+va)+" where id ="+v.getId();
					CommonDAO.executeUpdate(sql);
				}
			}
		}
		sql="update dd_upload set "+tdid+"='"+value+"' where id ="+trid;
		CommonDAO.executeUpdate(sql);
		renderSimpleResult(true,"修改成功");
		return null;
	}
	@Override
	protected HSSFWorkbook exportExcel(HSSFWorkbook workbook, String scope,
			String bound, String where, String sort, String dir)
			throws Exception {
		// TODO Auto-generated method stub
		String name="上传记录表";
		String name2=name;
		if (getRequest().getHeader("User-Agent").toLowerCase().indexOf("firefox") > 0)
			name2 = new String(name.getBytes("UTF-8"), "ISO8859-1");//firefox浏览器
		else if (getRequest().getHeader("User-Agent").toUpperCase().indexOf("MSIE") > 0)
			name2 = URLEncoder.encode(name, "UTF-8");//IE浏览器 终极解决文件名乱码

		getResponse().setHeader("Content-disposition","attachment;filename=" +name2+"-"+getCurrentTime() + ".xls");
		String[] headers = { "序号", "商品ID", "条形码","名称", "数量", "格子编号", "价格","折扣","用户编号","操作者","提交日期"};
		String sql="select * from dd_upload";
		PageUtil p=CommonDAO.findByMultiTableSQLQuery(sql,DdInventory.class);
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
			sql="select * from dd_upload where userid='"+userid+"' and amount>0 order by date desc";
		}else
		{
			sql="select * from dd_upload where amount>0 order by date desc";
		}
		PageUtil p=CommonDAO.findPageByMultiTableSQLQuery(sql,start,end,perpage,DdUpload.class);
		
		String content = "totalPage = " + p.getTotalPageCount() + ";";
		content += "dataStore = [";

		List l=(List)p.getResult();
		for(int i=0;i<l.size();i++)
		{
			DdUpload d=(DdUpload)l.get(i);
			Timestamp date=d.getDate();

			content += "\"<tr id='"+d.getId()+"'><td><input type='checkbox' name='row' value='"+d.getId()+"'/></td><td>"+d.getBarcode()+"</td><td>"+d.getName()+"</td><td>"+d.getUserid()+"</td><td>"+d.getAmount()+"</td><td>"+d.getPrice()+"</td><td>"+d.getDiscount()+"</td><td>"+d.getGridid()+"</td><td>"+date+"</td><td>"+d.getOperator()+"</td></tr>\",";
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
			sql="select * from dd_upload where userid='"+userid+"' and amount>0";
		}else
		{
			 sql="select * from dd_upload where amount>0";
		}
		int count=CommonDAO.count(sql);
		return count;
	}
}
