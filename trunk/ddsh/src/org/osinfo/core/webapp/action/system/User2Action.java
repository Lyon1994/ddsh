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
import org.osinfo.core.webapp.model.DdUser;
import org.osinfo.core.webapp.util.PageUtil;
@Results({
	 @Result(name="list",location = "/WEB-INF/result/system/user/list2.ftl")
})
/**
 * @Author Lucifer.Zhou 4:29:47 PM Jan 6, 2010
 * @Description
 * 登录管理
 */
public class User2Action extends CrudAction{
	private static Logger logger = Logger.getLogger ( User2Action.class.getName () ) ;
	/**
	 * @Author Lucifer.Zhou 4:30:01 PM Jan 6, 2010
	 * long LoginAction.java
	 * @Description
	 *
	 */
	private static final long serialVersionUID = 1L;
	

	@Override
	public String add() {
		// TODO Auto-generated method stub
		return null;
	}
	public String enable() {
		// TODO Auto-generated method stub
		if(logger.isDebugEnabled())
			logger.debug("加载启用页面...");
	    String ids=getParameter("ids");
	    if(!"".equals(ids.trim())){
	    		String sql="update dd_user set status='1' where id in ("+ids.substring(0,ids.length()-1)+")";
	    		CommonDAO.executeUpdate(sql);
	    }
	    renderSimpleResult(true,"ok");
        return null;
	}

	@Override
	public String del() {
		// TODO Auto-generated method stub

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
		String sql="select * from dd_user where status='0'";
		PageUtil p=CommonDAO.findPageByMultiTableSQLQuery(sql,start,end,perpage);
		
		String content = "totalPage = " + p.getTotalPageCount() + ";";
		content += "dataStore = [";

		List l=(List)p.getResult();
		for(int i=0;i<l.size();i++)
		{
			DdUser d=(DdUser)l.get(i);
			String type="<font color='green'>管理员</a>";
			String status="<font color='green'>认证用户</a>";
			if(d.getType().equals("2"))
			{
				type="<font color='green'>设计师</a>";
			}else if(d.getType().equals("3"))
			{
				type="<font color='yellow'>店员</a>";
			}else if(d.getType().equals("4"))
			{
				type="<font color='blue'>测试人员</a>";
			}
			if(d.getStatus().equals("0"))
				status="<font color='red'>未认证用户</a>";
			content += "\"<tr><td><input type='checkbox' name='row' value='"+d.getId()+"'/></td><td>"+d.getUserid()+"</td><td>"+d.getName()+"</td><td>"+type+"</td><td>"+status+"</td><td>"+d.getMobile()+"</td><td>"+d.getTelephone()+"</td><td>"+d.getFax()+"</td><td>"+d.getMail()+"</td><td>"+d.getAddress()+"</td></tr>\",";
		}
		content = content.substring(0,content.length()-1);
		content += "];";
		
		return content;
	}
	@Override
	public int myCount() {
		// TODO Auto-generated method stub
		String sql="select * from dd_user where status='0'";
		int count=CommonDAO.count(sql);
		return count;
	}
}
