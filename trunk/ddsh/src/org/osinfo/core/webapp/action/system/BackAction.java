/**
 * @Author Lucifer.Zhou 4:29:47 PM Jan 6, 2010
 * @MSN zhoujianguo_leo@hotmail.com
 * @Mail leo821031@gmail.com
 * @FileName LoginAction.java
 * @JDKVersion 1.5
 * @Site http://www.osinfo.org
 */
package org.osinfo.core.webapp.action.system;

import java.util.List;

import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.osinfo.core.webapp.action.CrudAction;
import org.osinfo.core.webapp.action.util.DynamicGrid;
import org.osinfo.core.webapp.dao.CommonDAO;
import org.osinfo.core.webapp.model.DdBack;
import org.osinfo.core.webapp.model.DdTopper;
import org.osinfo.core.webapp.util.PageUtil;
@Results({
	 @Result(name="list",location = "/WEB-INF/result/system/back/list.ftl"),
	 @Result(name="list2",location = "/WEB-INF/result/system/back/list2.ftl"),
})
/**
 * @Author Lucifer.Zhou 4:29:47 PM Jan 6, 2010
 * @Description
 * 商品退回
 */
public class BackAction extends CrudAction{
	private static Logger logger = Logger.getLogger ( BackAction.class.getName () ) ;
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
	//退回商品记录
	public String list2() {
		return "list2";
	}
	//商品退回
	@Override
	public String add() {
		// TODO Auto-generated method stub
		String userid=getParameter("userid");
		String name=org.osinfo.core.webapp.util.StringUtil.convert(getRequest().getParameter("name"));
		String amount=getParameter("amount");
		String reason=org.osinfo.core.webapp.util.StringUtil.convert(getRequest().getParameter("reason"));
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
			if(type.equals("1"))
				sql="select * from dd_back where userid='"+userid+"' and amount>0";
			else
				sql="select * from dd_back where userid='"+userid+"' and amount>0";
		}else
		{
			if(type.equals("1"))
				sql="select * from dd_back";
			else
				sql="select * from dd_back";
		}
		PageUtil p=CommonDAO.findPageByMultiTableSQLQuery(sql,start,end,perpage,DdBack.class);
		
		String content = "totalPage = " + p.getTotalPageCount() + ";";
		content += "dataStore = [";

		List l=(List)p.getResult();
		for(int i=0;i<l.size();i++)
		{
			DdBack d=(DdBack)l.get(i);

			content += "\"<tr id='"+d.getId()+"'><td><input type='checkbox' name='row' value='"+d.getId()+"'/></td><td>"+d.getName()+"</td><td>"+d.getUserid()+"</td><td>"+d.getAmount()+"</td><td>"+d.getReason()+"</td><td>"+d.getDate()+"</td></tr>\",";
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
				sql="select * from dd_back where userid='"+userid+"' and amount>0";
			else
				sql="select * from dd_back where userid='"+userid+"' and amount>0";
		}else
		{
			if(type.equals("1"))
				sql="select * from dd_back";
			else
				sql="select * from dd_back";
		}
		
		
		int count=CommonDAO.count(sql);
		return count;
	}
}
