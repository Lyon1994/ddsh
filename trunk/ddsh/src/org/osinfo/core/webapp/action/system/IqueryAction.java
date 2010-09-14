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
import org.osinfo.core.webapp.model.custom.Inventory;
import org.osinfo.core.webapp.util.ExcelUtil;
import org.osinfo.core.webapp.util.PageUtil;
@Results({
	 @Result(name="list",location = "/WEB-INF/result/system/iquery/list.ftl")
})
/**
 * @Author Lucifer.Zhou 4:29:47 PM Jan 6, 2010
 * @Description
 * 统计记录
 */
public class IqueryAction<T> extends CrudAction{
	private static Logger logger = Logger.getLogger ( IqueryAction.class.getName () ) ;
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

	@Override
	public String add() {
		// TODO Auto-generated method stub
		String userid=getParameter("userid");
		String barcode=getParameter("barcode");
		String name=getParameter("name");
		getRequest().setAttribute("userid", userid);
		getRequest().setAttribute("barcode", barcode);
		getRequest().setAttribute("name", name);
		
		return "list";
	}
	
	@Override
	public String del() {
		// TODO Auto-generated method stub
		if(logger.isDebugEnabled())
			logger.debug("加载删除页面...");
	    String ids=getParameter("ids");
	    if(!"".equals(ids.trim())){
	    		String sql="delete from dd_inventory where id in ("+ids.substring(0,ids.length()-1)+")";
	    		CommonDAO.executeUpdate("删除库存记录",sql);
	    }
	    renderSimpleResult(true,"操作成功");
        return null;
	}
	@Override
	public String edit() {
		// TODO Auto-generated method stub
		String trid=getParameter("trid");
		String tdid=getParameter("tdid");
		String value=getParameter("value");
		
		String sql="update dd_inventory set "+tdid+"='"+value+"' where id ="+trid;
		CommonDAO.executeUpdate("更新库存记录",sql);
		renderSimpleResult(true,"操作成功");
		return null;
	}
	@Override
	protected HSSFWorkbook exportExcel(HSSFWorkbook workbook, String scope,
			String bound, String where, String sort, String dir)
			throws Exception {
		// TODO Auto-generated method stub
		String name="库存表";
		String name2=name;
		if (getRequest().getHeader("User-Agent").toLowerCase().indexOf("firefox") > 0)
			name2 = new String(name.getBytes("UTF-8"), "ISO8859-1");//firefox浏览器
		else if (getRequest().getHeader("User-Agent").toUpperCase().indexOf("MSIE") > 0)
			name2 = URLEncoder.encode(name, "UTF-8");//IE浏览器 终极解决文件名乱码

		getResponse().setHeader("Content-disposition","attachment;filename=" +name2+"-"+getCurrentTime() + ".xls");
		String[] headers = { "序号","条形码","名称","设计师","数量","价格","折扣", "操作者","日期"};
		String userid=getParameter("userid");
		String barcode=getParameter("barcode");
		String name_=org.osinfo.core.webapp.util.StringUtil.convertUTF8(getParameter("name"));
		StringBuffer sql=new StringBuffer();

			sql.append("select i.id,i.barcode,p.name,p.userid,i.amount,p.price,i.discount,i.operator,i.date from dd_inventory i left join dd_product p on i.barcode=p.barcode where 1=1 ");
			if(!barcode.trim().equals(""))
			{
				sql.append(" and i.barcode like '%"+barcode+"%'");
			}

			if(!name_.trim().equals(""))
			{
				sql.append(" and p.name like '%"+name_+"%'");
			}
			if(!userid.trim().equals(""))
			{
				sql.append(" and p.userid like '%"+userid+"%'");
			}
			PageUtil p=CommonDAO.findByMultiTableSQLQuery(sql.toString(),Inventory.class);
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
		String userid=getParameter("userid");
		String barcode=getParameter("barcode");
		String name_=getParameter("name");
		StringBuffer sql=new StringBuffer();

			sql.append("select i.id,i.barcode,p.name,p.userid,i.amount,p.price,i.discount,i.operator,i.date from dd_inventory i left join dd_product p on i.barcode=p.barcode where 1=1 ");
			if(!barcode.trim().equals(""))
			{
				sql.append(" and i.barcode like '%"+barcode+"%'");
			}

			if(!name_.trim().equals(""))
			{
				sql.append(" and p.name like '%"+name_+"%'");
			}
			if(!userid.trim().equals(""))
			{
				sql.append(" and p.userid like '%"+userid+"%'");
			}
		PageUtil p=CommonDAO.findPageByMultiTableSQLQuery(sql.toString(),start,end,perpage,Inventory.class);
		
		String content = "totalPage = " + p.getTotalPageCount() + ";";
		content += "dataStore = [";

		List l=(List)p.getResult();
		for(int i=0;i<l.size();i++)
		{
			Inventory d=(Inventory)l.get(i);
			Timestamp date=d.getDate();
			content += "\"<tr id='"+d.getId()+"'><td><input type='checkbox' name='row' value='"+d.getId()+"'/></td><td>"+d.getBarcode()+"</td><td>"+d.getName()+"</td><td>"+d.getUserid()+"</td><td class='editbox' id='amount'>"+d.getAmount()+"</td><td>"+d.getPrice()+"</td><td class='editbox' id='discount'>"+d.getDiscount()+"</td><td>"+d.getOperator()+"</td><td>"+date+"</td></tr>\",";
		}
		content = content.substring(0,content.length()-1);
		content += "];";
		return content;
	}
	@Override
	public int myCount() {
		// TODO Auto-generated method stub
		String userid=getParameter("userid");
		String barcode=getParameter("barcode");
		String name_=getParameter("name");
		StringBuffer sql=new StringBuffer();

			sql.append("select i.id from dd_inventory i left join dd_product p  on i.barcode=p.barcode where 1=1 ");
			if(!barcode.trim().equals(""))
			{
				sql.append(" and i.barcode like '%"+barcode+"%'");
			}

			if(!name_.trim().equals(""))
			{
				sql.append(" and p.name like '%"+name_+"%'");
			}
			if(!userid.trim().equals(""))
			{
				sql.append(" and p.userid like '%"+userid+"%'");
			}
		int count=CommonDAO.count(sql.toString());
		return count;
	}
}
