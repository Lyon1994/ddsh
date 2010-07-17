/**
 * @Author Lucifer.Zhou 4:29:47 PM Jan 6, 2010
 * @MSN zhoujianguo_leo@hotmail.com
 * @Mail leo821031@gmail.com
 * @FileName LoginAction.java
 * @JDKVersion 1.5
 * @Site http://www.osinfo.org
 */
package org.osinfo.core.webapp.action.system;

import java.sql.Timestamp;
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
import org.osinfo.core.webapp.util.PageUtil;
@Results({
	 @Result(name="list",location = "/WEB-INF/result/system/upload/list.ftl"),
})
/**
 * @Author Lucifer.Zhou 4:29:47 PM Jan 6, 2010
 * @Description
 * 上架记录
 */
public class UploadAction extends CrudAction{
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
		String name=org.osinfo.core.webapp.util.StringUtil.convert(getRequest().getParameter("name"));
		String amount=getParameter("amount");
		String barcode=getParameter("barcode");
		String submitdate=getCurrentTime();
		String inventoryid=getParameter("inventoryid");
		String operator=(String) getSession().getAttribute("userid");
		String price=getParameter("price");
		String gridid=getParameter("gridid");
		String zk=getParameter("zk");//折扣

		String sql="insert into dd_upload (inventoryid,barcode,name,amount,gridid,price,userid,operator,date) " +
				"values ("+inventoryid+",'"+barcode+"','"+name+"',"+amount+",'"+gridid+"',"+price+",'"+userid+"','"+operator+"','"+submitdate+"')";
		CommonDAO.executeUpdate(sql);

		sql="insert into dd_sell (inventoryid,barcode,name,amount,gridid,price,userid) " +
				"values ("+inventoryid+",'"+barcode+"','"+name+"',"+amount+",'"+gridid+"',"+price+",'"+userid+"')";
		CommonDAO.executeUpdate(sql);
		sql="select * from dd_inventory where id="+inventoryid;//获取库存数量
		List l2=CommonDAO.executeQuery(sql, DdInventory.class);
		for(int j=0;j<l2.size();j++)
		{
			DdInventory v=(DdInventory)l2.get(j);
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
	    String ids=getParameter("ids");
	    ids=ids.substring(0,ids.length()-1);
	    if(!"".equals(ids.trim())){
	    		String submitdate=getCurrentTime();

	    		String operator=(String) getSession().getAttribute("userid");
		    	String sql2="insert into dd_upload (inventoryid,barcode,name,amount,gridid,price,userid,operator,date) " +
		    			"select id,barcode,name,amount,'',price,userid,'"+operator+"','"+submitdate+"' from dd_inventory where id in ("+ids+")";
		    	CommonDAO.executeUpdate(sql2);
		    	
	    		String sql="update dd_inventory set amount=0 where id in ("+ids+")";
	    		CommonDAO.executeUpdate(sql);
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
		return null;
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
			sql="select * from dd_upload where userid='"+userid+"' and amount>0";
		}else
		{
			sql="select * from dd_upload where amount>0";
		}
		PageUtil p=CommonDAO.findPageByMultiTableSQLQuery(sql,start,end,perpage,DdUpload.class);
		
		String content = "totalPage = " + p.getTotalPageCount() + ";";
		content += "dataStore = [";

		List l=(List)p.getResult();
		for(int i=0;i<l.size();i++)
		{
			DdUpload d=(DdUpload)l.get(i);
			Timestamp date=d.getDate();

			content += "\"<tr id='"+d.getId()+"'><td><input type='checkbox' name='row' value='"+d.getId()+"'/></td><td>"+d.getBarcode()+"</td><td>"+d.getName()+"</td><td>"+d.getUserid()+"</td><td class='editbox' id='amount'>"+d.getAmount()+"</td><td>"+d.getPrice()+"</td><td class='editbox' id='gridid'>"+d.getGridid()+"</td><td>"+date+"</td><td>"+d.getOperator()+"</td></tr>\",";
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
