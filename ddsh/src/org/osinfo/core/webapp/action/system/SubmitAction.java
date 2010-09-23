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
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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
import org.osinfo.core.webapp.model.DdSubmit;
import org.osinfo.core.webapp.model.custom.Submit;
import org.osinfo.core.webapp.util.DBUtil;
import org.osinfo.core.webapp.util.ExcelUtil;
import org.osinfo.core.webapp.util.JsonUtil;
import org.osinfo.core.webapp.util.PageUtil;
@Results({
	 @Result(name="list",location = "/WEB-INF/result/system/submit/list.ftl"),
	 @Result(name="list2",location = "/WEB-INF/result/system/submit/list2.ftl"),
	 @Result(name="list3",location = "/WEB-INF/result/system/submit/list3.ftl")
})
/**
 * @Author Lucifer.Zhou 4:29:47 PM Jan 6, 2010
 * @Description
 * 上货审批
 */
public class SubmitAction<T> extends CrudAction{
	private static Logger logger = Logger.getLogger ( SubmitAction.class.getName () ) ;
	/**
	 * @Author Lucifer.Zhou 4:30:01 PM Jan 6, 2010
	 * long LoginAction.java
	 * @Description
	 *
	 */
	private static final long serialVersionUID = 1L;

	//管理员审批商品
	public String list() {
		return "list";
	}
	//设计师待批商品
	public String list2() {
		return "list2";
	}
	public String list3() {
		return "list3";
	}
	//商品递交
	@Override
	public String add() {
		// TODO Auto-generated method stub
		String barcode=getParameter("barcode");
		String amount=getParameter("amount");
		
		String place=getParameter("place");
		String type_=getParameter("types");
		String serialnumber=getParameter("serialnumber");
		String ems=getParameter("ems");
		String begin=getParameter("begin");		
		
		String end=getParameter("end");
		String pay=getParameter("pay");
		String money=getParameter("money");		
		
		String memo=getParameter("memo");
		String submitdate=getCurrentTime();

	    String sql="insert into dd_submit (barcode,amount,status,type,place,begin,end,ems,receipt,pay,money,memo,submitdate) " +
		"values ('"+barcode+"',"+amount+",'0','"+type_+"','"+place+"','"+begin+"','"+end+"','"+ems+"','"+serialnumber+"','"+pay+"',"+money+",'"+memo+"','"+submitdate+"')";
	    
		int v=CommonDAO.executeUpdate("货品提交",sql);
		if(v>0)
			return "success2";
		else
			return "error2";
	}
	public String load() {
		// TODO Auto-generated method stub
		if(logger.isDebugEnabled())
			logger.debug("加载装入页面...");
		String id=getParameter("id");
		String sql="select * from dd_submit where id ="+id;
		List l=CommonDAO.executeQuery(sql,DdSubmit.class);
		String json = JsonUtil.list2json(l);
    	renderJson(json.toString());
        return null;
	}
	//商品退回
	public String back() {
		// TODO Auto-generated method stub
		String barcode=getParameter("barcode");
		String amount=getParameter("amount");
		String reason=getParameter("reason");
		String submitdate=getCurrentTime();
		String operator=(String) getSession().getAttribute("userid");
		String id=getParameter("id");
		Connection conn=DBUtil.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		try {
			conn.setAutoCommit(false);
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
			String sql="insert into dd_back (barcode,amount,discount,type,reason,operator,date) " +
			"values ('"+barcode+"',"+amount+",1,'01','"+reason+"','"+operator+"','"+submitdate+"')";
			logger.info("插入退回表"+sql);
			stmt.executeUpdate(sql);
			//更新商品接收表数量
			sql="select * from dd_submit where id ="+id;
			List l= DBUtil.populate(rs, DdSubmit.class);
	    	
	    	for(int i=0;i<l.size();i++)
	    	{
	    		DdSubmit t=(DdSubmit)l.get(i);
	    		int v=t.getAmount()-Integer.valueOf(amount);
	    		if(v<=0)
	    			sql="delete from dd_submit where id ="+id;
	    		else
	    			sql="update dd_submit set  amount="+v+" where id ="+id;
	    		logger.info("更新商品提交数量或删除");
	    		stmt.executeUpdate(sql);
	    	}
	    	conn.commit();
	    	conn.setAutoCommit(true);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			try {
				logger.info("操作失败,回滚!");
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}//回滚JDBC事务   
			renderSimpleResult(false,"操作失败！");
			e.printStackTrace();
		}finally {
			DBUtil.close(rs, stmt, conn);
		}
    	renderSimpleResult(true,"操作成功！");
 
	    return null;
	}
	//批量退回
	public String batchAdd() {
		// TODO Auto-generated method stub
	    String ids=getParameter("ids");
	    ids=ids.substring(0,ids.length()-1);
	    if(!"".equals(ids.trim())){
			
    		String submitdate=getCurrentTime();
    		
			Connection conn=DBUtil.getConnection();
			Statement stmt = null;
			ResultSet rs = null;
			try {
				conn.setAutoCommit(false);
				stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);

	    		String operator=(String) getSession().getAttribute("userid");
		    	String sql="insert into dd_back (barcode,amount,discount,type,reason,operator,date) " +
		    			"select barcode,amount,1,'01','01','"+operator+"','"+submitdate+"' from dd_submit where id in ("+ids+")";
		    	logger.info("插入退回表"+sql);
		    	stmt.executeUpdate(sql);
		    	
	    		sql="delete from dd_submit where id in ("+ids+")";
	    		logger.info("删除商品提交"+sql);
	    		stmt.executeUpdate(sql);
		    	conn.commit();
		    	conn.setAutoCommit(true);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				try {
					logger.info("操作失败,回滚!");
					conn.rollback();
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}//回滚JDBC事务   
				renderSimpleResult(false,"操作失败！");
				e.printStackTrace();
			}finally {
				DBUtil.close(rs, stmt, conn);
			}
	    }
	    renderSimpleResult(true,"操作成功！");
	    return null;
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
			Connection conn=DBUtil.getConnection();
			Statement stmt = null;
			ResultSet rs = null;
			try {
				conn.setAutoCommit(false);
				stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
		    	String[] idList = ids.split("\\,");
	    		for(String id:idList){
	    			String sql="select barcode,amount from dd_submit where id ="+id;
	    			String barcode="";
	    			String amount="0";
	    			logger.info("查找商品提交"+sql);
	    				rs=stmt.executeQuery(sql);
	    				while (rs.next())
	    				{
	    					barcode=rs.getString("barcode");
	    					amount=rs.getString("amount");
	    				}
	
	    				sql="update dd_submit set status='1',date='"+submitdate+"',operator='"+operator+"' where id ="+id;
	    				logger.info("更新提交状态为已接收"+sql);
	    				stmt.executeUpdate(sql);
	    				sql="select * from dd_inventory  where barcode='"+barcode+"'";
	    				logger.info("查找库存"+sql);
	    				rs=stmt.executeQuery(sql);
	    				List l = DBUtil.populate(rs, DdInventory.class);
	    				if(l.size()>=1)
	    				{
	    					DdInventory i=(DdInventory)l.get(0);
	    					sql="update dd_inventory set amount="+(Integer.valueOf(amount)+Integer.valueOf(i.getAmount()))+" where barcode='"+barcode+"'";
	    				}else
	    					sql="insert into  dd_inventory (barcode,amount,discount,operator,date) value ('"+barcode+"','"+amount+"',1,'"+operator+"','"+submitdate+"')";
	    				logger.info("插入或更新库存数量！"+sql);
	    				stmt.executeUpdate(sql);
	    		}
		    	conn.commit();
		    	conn.setAutoCommit(true);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				try {
					logger.info("操作失败,回滚!");
					conn.rollback();
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}//回滚JDBC事务   
				renderSimpleResult(false,"操作失败！");
				e.printStackTrace();
			}finally {
				DBUtil.close(rs, stmt, conn);
			}
	    }
	    renderSimpleResult(true,"操作成功！");
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
	    		CommonDAO.executeUpdate("删除提交",sql);
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
		
		String sql="update dd_submit set "+tdid+"='"+value+"',date='"+submitdate+"',operator='"+operator+"' where id ="+trid;
		CommonDAO.executeUpdate("更新提交",sql);
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
		String[] headers = { "序号","条形码","名称","数量", "设计师", "送货方式", "发货日","到货日","发货地","快递单号", "快递方式","付款方式","快递费","备注","提交日期"};
		String userid=(String) getSession().getAttribute("userid");
		String t=(String) getSession().getAttribute("type");
		String sql;
		if(t.equals("2"))
		{
			if(type.equals("1"))
				sql="select s.id,s.barcode,p.name,s.amount,p.userid,s.type,s.place,s.begin,s.end,s.ems,s.receipt,(select d.value from dd_dic d where d.parent='pay' and d.child=s.pay) as pay,s.money,s.memo,s.date from dd_submit s left join dd_product p on s.barcode=p.barcode where s.status='1' and p.userid='"+userid+"' order by s.date desc";
			else
				sql="select s.id,s.barcode,p.name,s.amount,p.userid,s.type,s.place,s.begin,s.end,s.ems,s.receipt,(select d.value from dd_dic d where d.parent='pay' and d.child=s.pay) as pay,s.money,s.memo,s.submitdate from dd_submit s left join dd_product p on s.barcode=p.barcode where s.status='0' and p.userid='"+userid+"' order by s.submitdate desc";
		}else
		{
			if(type.equals("1"))
				sql="select s.id,s.barcode,p.name,s.amount,p.userid,s.type,s.place,s.begin,s.end,s.ems,s.receipt,(select d.value from dd_dic d where d.parent='pay' and d.child=s.pay) as pay,s.money,s.memo,s.date from dd_submit s left join dd_product p on s.barcode=p.barcode where s.status='1' order by s.date desc";
			else
				sql="select s.id,s.barcode,p.name,s.amount,p.userid,s.type,s.place,s.begin,s.end,s.ems,s.receipt,(select d.value from dd_dic d where d.parent='pay' and d.child=s.pay) as pay,s.money,s.memo,s.submitdate from dd_submit s left join dd_product p on s.barcode=p.barcode where s.status='0' order by s.submitdate desc";
		}
		PageUtil p=CommonDAO.findByMultiTableSQLQuery(sql,Submit.class);
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
				sql="select s.id,s.barcode,p.name,s.amount,p.userid,s.type,s.place,s.begin,s.end,s.ems,s.receipt,(select d.value from dd_dic d where d.parent='pay' and d.child=s.pay) as pay,s.money,s.memo,s.date from dd_submit s left join dd_product p on s.barcode=p.barcode where s.status='1' and p.userid='"+userid+"'   order by s.date desc";
			else
				sql="select s.id,s.barcode,p.name,s.amount,p.userid,s.type,s.place,s.begin,s.end,s.ems,s.receipt,(select d.value from dd_dic d where d.parent='pay' and d.child=s.pay) as pay,s.money,s.memo,s.submitdate as date from dd_submit s left join dd_product p on s.barcode=p.barcode where s.status='0' and p.userid='"+userid+"'   order by s.submitdate desc";
		}else
		{
			if(type.equals("1"))
				sql="select s.id,s.barcode,p.name,s.amount,p.userid,s.type,s.place,s.begin,s.end,s.ems,s.receipt,(select d.value from dd_dic d where d.parent='pay' and d.child=s.pay) as pay,s.money,s.memo,s.date from dd_submit s left join dd_product p on s.barcode=p.barcode where s.status='1'   order by s.date desc";
			else
				sql="select s.id,s.barcode,p.name,s.amount,p.userid,s.type,s.place,s.begin,s.end,s.ems,s.receipt,(select d.value from dd_dic d where d.parent='pay' and d.child=s.pay) as pay,s.money,s.memo,s.submitdate as date from dd_submit s left join dd_product p on s.barcode=p.barcode where s.status='0'    order by s.submitdate desc";
		}
		PageUtil p=CommonDAO.findPageByMultiTableSQLQuery(sql,start,end,perpage,Submit.class);
		
		String content = "totalPage = " + p.getTotalPageCount() + ";";
		content += "dataStore = [";

		List l=(List)p.getResult();
		for(int i=0;i<l.size();i++)
		{
			Submit d=(Submit)l.get(i);
			String type_=d.getType();
			String pay=d.getPay();

			if(type_.equals("01"))
				type_="<font color='red'>快递送货</font>";
			else if(type_.equals("02"))
			{
				type_="<font color='green'>上门送货</font>";
				pay="";
			}

			if(type.equals("1"))
				content += "\"<tr id='"+d.getId()+"'><td><input type='checkbox' name='row' value='"+d.getId()+"'/></td><td>"+d.getBarcode()+"</td><td>"+d.getName()+"</td><td class='editbox' id='amount'>"+d.getAmount()+"</td><td>"+d.getUserid()+"</td><td>"+type_+"</td><td>"+d.getPlace()+"</td><td>"+d.getBegin()+"</td><td>"+d.getEnd()+"</td><td>"+d.getEms()+"</td><td>"+d.getReceipt()+"</td><td>"+pay+"</td><td>"+d.getMoney()+"</td><td>"+d.getMemo()+"</td><td>"+d.getDate()+"</td></tr>\",";
			else
				content += "\"<tr id='"+d.getId()+"'><td><input type='checkbox' name='row' value='"+d.getId()+"'/></td><td>"+d.getBarcode()+"</td><td>"+d.getName()+"</td><td class='editbox' id='amount'>"+d.getAmount()+"</td><td>"+d.getUserid()+"</td><td>"+type_+"</td><td>"+d.getPlace()+"</td><td>"+d.getBegin()+"</td><td>"+d.getEnd()+"</td><td>"+d.getEms()+"</td><td>"+d.getReceipt()+"</td><td>"+pay+"</td><td>"+d.getMoney()+"</td><td>"+d.getMemo()+"</td><td>"+d.getSubmitdate()+"</td></tr>\",";
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
				sql="select s.id from dd_submit  s left join dd_product p on s.barcode=p.barcode where s.status='1' and p.userid='"+userid+"' ";
			else
				sql="select s.id from dd_submit  s left join dd_product p on s.barcode=p.barcode where s.status='0' and p.userid='"+userid+"' ";
		}else
		{
			if(type.equals("1"))
				sql="select s.id from dd_submit  s left join dd_product p on s.barcode=p.barcode where s.status='1' ";
			else
				sql="select s.id from dd_submit  s left join dd_product p on s.barcode=p.barcode where s.status='0' ";
		}
		
		
		int count=CommonDAO.count(sql);
		return count;
	}
}
