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
import java.util.Collection;
import java.util.List;

import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.osinfo.core.webapp.action.CrudAction;
import org.osinfo.core.webapp.action.util.DynamicGrid;
import org.osinfo.core.webapp.dao.CommonDAO;
import org.osinfo.core.webapp.model.DdBack;
import org.osinfo.core.webapp.model.DdRsales;
import org.osinfo.core.webapp.model.DdSales;
import org.osinfo.core.webapp.model.DdTopper;
import org.osinfo.core.webapp.util.ExcelUtil;
import org.osinfo.core.webapp.util.PageUtil;
@Results({
	 @Result(name="list",location = "/WEB-INF/result/system/rsale/list.ftl"),
	 @Result(name="list2",location = "/WEB-INF/result/system/rsale/list2.ftl"),
})
/**
 * @Author Lucifer.Zhou 4:29:47 PM Jan 6, 2010
 * @Description
 * 商品退回
 */
public class RsaleAction<T> extends CrudAction{
	private static Logger logger = Logger.getLogger ( RsaleAction.class.getName () ) ;
	/**
	 * @Author Lucifer.Zhou 4:30:01 PM Jan 6, 2010
	 * long LoginAction.java
	 * @Description
	 *
	 */
	private static final long serialVersionUID = 1L;
	//退回商品
	public String list() {
		return "list";
	}

	//商品退回
	@Override
	public String add() {
		// TODO Auto-generated method stub
		String userid=getParameter("userid");
		String name=getParameter("name");
		String amount=getParameter("amount");
		String reason=getParameter("reason");
		String submitdate=getCurrentTime();
		String topperid=getParameter("topperid");
		String operator=(String) getSession().getAttribute("userid");

		String sql="insert into dd_back (topperid,userid,name,amount,reason,date,operator) " +
				"values ("+topperid+",'"+userid+"','"+name+"',"+amount+",'"+reason+"','"+submitdate+"','"+operator+"')";
		int v=CommonDAO.executeUpdate(sql);
		//更新商品接收表数量
		String sql2="select * from dd_topper where id ="+topperid;
    	List l=CommonDAO.executeQuery(sql2,DdTopper.class);
    	for(int i=0;i<l.size();i++)
    	{
    		DdTopper t=(DdTopper)l.get(i);
    		sql="update dd_topper set  amount="+(t.getAmount()-Integer.valueOf(amount))+" where id ="+topperid;
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
	    		String sql="delete from dd_rsales where id in ("+ids.substring(0,ids.length()-1)+")";
	    		CommonDAO.executeUpdate(sql);
	    }
	    renderSimpleResult(true,"ok");
        return null;
	}
	@Override
	public String edit() {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	protected HSSFWorkbook exportExcel(HSSFWorkbook workbook, String scope,
			String bound, String where, String sort, String dir)
			throws Exception {
		// TODO Auto-generated method stub
		String name="退货记录表";
		String name2=name;
		if (getRequest().getHeader("User-Agent").toLowerCase().indexOf("firefox") > 0)
			name2 = new String(name.getBytes("UTF-8"), "ISO8859-1");//firefox浏览器
		else if (getRequest().getHeader("User-Agent").toUpperCase().indexOf("MSIE") > 0)
			name2 = URLEncoder.encode(name, "UTF-8");//IE浏览器 终极解决文件名乱码

		getResponse().setHeader("Content-disposition","attachment;filename=" +name2+"-"+getCurrentTime() + ".xls");
		String[] headers = { "序号","条形码", "名称","折扣", "数量", "价格", "总计","设计师","退回原因","操作者","日期"};
		String userid=(String) getSession().getAttribute("userid");
		String t=(String) getSession().getAttribute("type");
		String sql;
		sql="select * from dd_rsales where amount>0 order by date desc";
		PageUtil p=CommonDAO.findByMultiTableSQLQuery(sql,DdRsales.class);
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
		sql="select * from dd_rsales where amount>0 order by date desc";
		PageUtil p=CommonDAO.findPageByMultiTableSQLQuery(sql,start,end,perpage,DdRsales.class);
		
		String content = "totalPage = " + p.getTotalPageCount() + ";";
		content += "dataStore = [";

		List l=(List)p.getResult();
		for(int i=0;i<l.size();i++)
		{
			DdRsales d=(DdRsales)l.get(i);

			content += "\"<tr id='"+d.getId()+"'><td><input type='checkbox' name='row' value='"+d.getId()+"'/></td><td>"+d.getBarcode()+"</td><td>"+d.getName()+"</td><td>"+d.getDiscount()+"</td><td>"+d.getAmount()+"</td><td>"+d.getPrice()+"</td><td>"+d.getTotalprice()+"</td><td>"+d.getUserid()+"</td><td>"+d.getOperator()+"</td><td>"+d.getDate()+"</td></tr>\",";
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
		sql="select * from dd_rsales where amount>0";
		
		int count=CommonDAO.count(sql);
		return count;
	}
}
