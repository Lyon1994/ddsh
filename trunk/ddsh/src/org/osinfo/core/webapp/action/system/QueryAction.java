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
import org.osinfo.core.webapp.util.ExcelUtil;
import org.osinfo.core.webapp.util.PageUtil;
@Results({
	 @Result(name="list",location = "/WEB-INF/result/system/query/list.ftl"),
	 @Result(name="list2",location = "/WEB-INF/result/system/query/list2.ftl"),
})
/**
 * @Author Lucifer.Zhou 4:29:47 PM Jan 6, 2010
 * @Description
 * 查询
 */
public class QueryAction<T> extends CrudAction{
	private static Logger logger = Logger.getLogger ( QueryAction.class.getName () ) ;
	/**
	 * @Author Lucifer.Zhou 4:30:01 PM Jan 6, 2010
	 * long LoginAction.java
	 * @Description
	 *
	 */
	private static final long serialVersionUID = 1L;

	//商品退回
	@Override
	public String add() {
		// TODO Auto-generated method stub
		String userid=getParameter("userid");
		String barcode=getParameter("barcode");
		String name=getParameter("name");
		String begin=getParameter("begin");
		String end=getParameter("end");
		
		getRequest().setAttribute("userid", userid);
		getRequest().setAttribute("barcode", barcode);
		getRequest().setAttribute("name", name);
		getRequest().setAttribute("begin", begin);
		getRequest().setAttribute("end", end);
		
		return "list";
	}
	//批量删除
	public String batchAdd() {
		// TODO Auto-generated method stub
	    String ids=getParameter("ids");
	    ids=ids.substring(0,ids.length()-1);
	    if(!"".equals(ids.trim())){
	    		String submitdate=getCurrentTime();

	    		String operator=(String) getSession().getAttribute("userid");
		    	String sql2="insert into dd_back (topperid,userid,name,amount,reason,operator,date) " +
		    			"select id,userid,name,amount,'批量退回','"+operator+"','"+submitdate+"' from dd_topper where id in ("+ids+")";
		    	CommonDAO.executeUpdate(sql2);
		    	
	    		String sql="update dd_topper set amount=0 where id in ("+ids+")";
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
	    		String sql="delete from dd_back where id in ("+ids.substring(0,ids.length()-1)+")";
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
		String name="退回表";
		String name2=name;
		if (getRequest().getHeader("User-Agent").toLowerCase().indexOf("firefox") > 0)
			name2 = new String(name.getBytes("UTF-8"), "ISO8859-1");//firefox浏览器
		else if (getRequest().getHeader("User-Agent").toUpperCase().indexOf("MSIE") > 0)
			name2 = URLEncoder.encode(name, "UTF-8");//IE浏览器 终极解决文件名乱码

		getResponse().setHeader("Content-disposition","attachment;filename=" +name2+"-"+getCurrentTime() + ".xls");
		String[] headers = { "序号","上货编号","设计师","名称","数量","理由","操作人","日期"};
		String userid=(String) getSession().getAttribute("userid");
		String t=(String) getSession().getAttribute("type");
		String sql;
		if(t.equals("2"))
		{
			if(type.equals("1"))
				sql="select * from dd_back where userid='"+userid+"' and amount>0 order by date desc";
			else
				sql="select * from dd_back where userid='"+userid+"' and amount>0 order by date desc";
		}else
		{
			if(type.equals("1"))
				sql="select * from dd_back order by date desc";
			else
				sql="select * from dd_back order by date desc";
		}
		PageUtil p=CommonDAO.findByMultiTableSQLQuery(sql,DdBack.class);
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
		String name=getParameter("name");
		String begin=getParameter("begin");
		String end=getParameter("end");
		
		StringBuffer sql=new StringBuffer();
		String uid=(String) getSession().getAttribute("userid");
		String t=(String) getSession().getAttribute("type");
		sql.append("select s.*,t.userid from dd_sales s left join dd_topper t on s.barcode=t.barcode where 1=1 and s.amount>0 ");
		if(!barcode.trim().equals(""))
		{
			sql.append(" and s.barcode like '%"+barcode+"%'");
		}
		if(!name.trim().equals(""))
		{
			sql.append(" and s.name like '%"+name+"%'");
		}
		if(!name.trim().equals(""))
		{
			sql.append(" and s.name like '%"+name+"%'");
		}
		if(!begin.trim().equals(""))
		{
			sql.append(" and s.begin >= '"+begin+"'");
		}
		if(!end.trim().equals(""))
		{
			sql.append(" and s.end <= '"+end+"'");
		}
		if(t.equals("2"))
		{
			sql.append(" and s.userid='"+uid+"'");
			
		}else
		{
			if(!userid.trim().equals(""))
			{
				sql.append(" and s.userid like '%"+userid+"%'");
			}
		}
		PageUtil p=CommonDAO.findPageByMultiTableSQLQuery(sql,start,end,perpage,DdBack.class);
		
		String content = "totalPage = " + p.getTotalPageCount() + ";";
		content += "dataStore = [";

		List l=(List)p.getResult();
		for(int i=0;i<l.size();i++)
		{
			DdBack d=(DdBack)l.get(i);

			content += "\"<tr id='"+d.getId()+"'><td><input type='checkbox' name='row' value='"+d.getId()+"'/></td><td>"+d.getName()+"</td><td>"+d.getUserid()+"</td><td>"+d.getAmount()+"</td><td>"+d.getReason()+"</td><td>"+d.getOperator()+"</td><td>"+d.getDate()+"</td></tr>\",";
		}
		content = content.substring(0,content.length()-1);
		content += "];";
		return content;
	}
	@Override
	public int myCount() {
		// TODO Auto-generated method stub
		String sql;
		String userid=(String) getSession().getAttribute("userid");
		String t=(String) getSession().getAttribute("type");
		if(t.equals("2"))
		{
			
			sql="select s.*,t.userid from dd_sales s left join dd_topper t on s.barcode=t.barcode and userid='"+userid+"' and amount>0";
		}else
		{
			
			sql="select * from dd_back";
		}
		
		
		int count=CommonDAO.count(sql);
		return count;
	}
}
