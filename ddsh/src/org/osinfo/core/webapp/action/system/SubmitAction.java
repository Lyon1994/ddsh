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
	 @Result(name="list2",location = "/WEB-INF/result/system/submit/list2.ftl")
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

	//管理员审批商品
	public String list() {
		return "list";
	}
	//设计师待批商品
	public String list2() {
		return "list2";
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
	    
		int v=CommonDAO.executeUpdate(sql);
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
	//商品退回-接收
	public String back() {
		// TODO Auto-generated method stub
		String barcode=getParameter("barcode");
		String amount=getParameter("amount");
		String reason=getParameter("reason");
		String submitdate=getCurrentTime();
		String operator=(String) getSession().getAttribute("userid");
		String id=getParameter("id");
		String sql="insert into dd_back (barcode,amount,type,reason,operator,date) " +
				"values ('"+barcode+"',"+amount+",'01','"+reason+"','"+operator+"','"+submitdate+"')";
		int v=CommonDAO.executeUpdate(sql);
		//更新商品接收表数量
		String sql2="select * from dd_submit where id ="+id;
    	List l=CommonDAO.executeQuery(sql2,DdSubmit.class);
    	for(int i=0;i<l.size();i++)
    	{
    		DdSubmit t=(DdSubmit)l.get(i);
    		sql="update dd_submit set  amount="+(t.getAmount()-Integer.valueOf(amount))+" where id ="+id;
	    	CommonDAO.executeUpdate(sql);
    	}
    	renderSimpleResult(true,"处理完毕");
	    return null;
	}
	//批量退回
	public String batchAdd() {
		// TODO Auto-generated method stub
	    String ids=getParameter("ids");
	    ids=ids.substring(0,ids.length()-1);
	    if(!"".equals(ids.trim())){
	    		String submitdate=getCurrentTime();

	    		String operator=(String) getSession().getAttribute("userid");
		    	String sql2="insert into dd_back (barcode,amount,type,reason,operator,date) " +
		    			"select barcode,amount,'01','01','"+operator+"','"+submitdate+"' from dd_submit where id in ("+ids+")";
		    	CommonDAO.executeUpdate(sql2);
		    	
	    		String sql="update dd_submit set amount=0 where id in ("+ids+")";
	    		CommonDAO.executeUpdate(sql);
	    }
	    renderSimpleResult(true,"处理完毕");
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
	    	String[] idList = ids.split("\\,");
    		for(String id:idList){
    			String sql="select barcode,amount from dd_submit where id ="+id;
    			ResultSet rs = null;
    			Statement stmt = null;
    			Connection conn=DBUtil.getConnection();
    			String barcode="";
    			String amount="0";
    			try {
    				stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
    				rs=stmt.executeQuery(sql);
    				while (rs.next())
    				{
    					barcode=rs.getString("barcode");
    					amount=rs.getString("amount");
    				}
    			} catch (SQLException e) {
    				// TODO Auto-generated catch block
    				e.printStackTrace();
    			}finally {
    				DBUtil.close(rs, stmt, conn);
    			}

    				sql="update dd_submit set status='1',date='"+submitdate+"',operator='"+operator+"' where id ="+id;
    				CommonDAO.executeUpdate(sql);
    				sql="select * from dd_inventory  where barcode='"+barcode+"'";
    				List l=CommonDAO.executeQuery(sql, DdInventory.class);
    				if(l.size()==1)
    				{
    					DdInventory i=(DdInventory)l.get(0);
    					
    					sql="update dd_inventory set amount="+(Integer.valueOf(amount)+Integer.valueOf(i.getAmount()))+" where barcode='"+barcode+"'";
    				}else if(l.size()==0)
    				{
    					sql="insert into  dd_inventory (barcode,amount,discount,operator,date) value ('"+barcode+"','"+amount+"',1,'"+operator+"','"+submitdate+"')";
        				
    				}else
    				    renderSimpleResult(true,"操作失败：库存存在相同条码的物品！");
    				CommonDAO.executeUpdate(sql);

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
		
		String sql="update dd_submit set "+tdid+"='"+value+"',date='"+submitdate+"',operator='"+operator+"' where id ="+trid;
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
		String[] headers = { "序号","条形码","名称","数量", "状态", "送货方式", "发货日","到货日","发货地","快递单号", "快递方式","付款方式","快递费","备注","提交日期"};
		String userid=(String) getSession().getAttribute("userid");
		String t=(String) getSession().getAttribute("type");
		String sql;
		if(t.equals("2"))
		{
			if(type.equals("1"))
				sql="select s.id,s.barcode,p.name,s.amount,s.status,s.type,s.place,s.begin,s.end,(select d.value from dd_dic d where d.parent='ems' and d.child=s.ems) as ems,s.receipt,(select d.value from dd_dic d where d.parent='pay' and d.child=s.pay) as pay,s.money,s.memo,s.date from dd_submit s left join dd_product p on s.barcode=p.barcode where s.status='1' and p.userid='"+userid+"'  and s.amount>0 order by s.date desc";
			else
				sql="select s.id,s.barcode,p.name,s.amount,s.status,s.type,s.place,s.begin,s.end,(select d.value from dd_dic d where d.parent='ems' and d.child=s.ems) as ems,s.receipt,(select d.value from dd_dic d where d.parent='pay' and d.child=s.pay) as pay,s.money,s.memo,s.submitdate from dd_submit s left join dd_product p on s.barcode=p.barcode where s.status='0' and p.userid='"+userid+"'  and s.amount>0 order by s.submitdate desc";
		}else
		{
			if(type.equals("1"))
				sql="select s.id,s.barcode,p.name,s.amount,s.status,s.type,s.place,s.begin,s.end,(select d.value from dd_dic d where d.parent='ems' and d.child=s.ems) as ems,s.receipt,(select d.value from dd_dic d where d.parent='pay' and d.child=s.pay) as pay,s.money,s.memo,s.date from dd_submit s left join dd_product p on s.barcode=p.barcode where s.status='1'  and s.amount>0 order by s.date desc";
			else
				sql="select s.id,s.barcode,p.name,s.amount,s.status,s.type,s.place,s.begin,s.end,(select d.value from dd_dic d where d.parent='ems' and d.child=s.ems) as ems,s.receipt,(select d.value from dd_dic d where d.parent='pay' and d.child=s.pay) as pay,s.money,s.memo,s.submitdate from dd_submit s left join dd_product p on s.barcode=p.barcode where s.status='0'  and s.amount>0 order by s.submitdate desc";
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
				sql="select s.id,s.barcode,p.name,s.amount,s.status,s.type,s.place,s.begin,s.end,(select d.value from dd_dic d where d.parent='ems' and d.child=s.ems) as ems,s.receipt,(select d.value from dd_dic d where d.parent='pay' and d.child=s.pay) as pay,s.money,s.memo,s.date from dd_submit s left join dd_product p on s.barcode=p.barcode where s.status='1' and p.userid='"+userid+"'  and s.amount>0 order by s.date desc";
			else
				sql="select s.id,s.barcode,p.name,s.amount,s.status,s.type,s.place,s.begin,s.end,(select d.value from dd_dic d where d.parent='ems' and d.child=s.ems) as ems,s.receipt,(select d.value from dd_dic d where d.parent='pay' and d.child=s.pay) as pay,s.money,s.memo,s.submitdate as date from dd_submit s left join dd_product p on s.barcode=p.barcode where s.status='0' and p.userid='"+userid+"'  and s.amount>0 order by s.submitdate desc";
		}else
		{
			if(type.equals("1"))
				sql="select s.id,s.barcode,p.name,s.amount,s.status,s.type,s.place,s.begin,s.end,(select d.value from dd_dic d where d.parent='ems' and d.child=s.ems) as ems,s.receipt,(select d.value from dd_dic d where d.parent='pay' and d.child=s.pay) as pay,s.money,s.memo,s.date from dd_submit s left join dd_product p on s.barcode=p.barcode where s.status='1'  and s.amount>0 order by s.date desc";
			else
				sql="select s.id,s.barcode,p.name,s.amount,s.status,s.type,s.place,s.begin,s.end,(select d.value from dd_dic d where d.parent='ems' and d.child=s.ems) as ems,s.receipt,(select d.value from dd_dic d where d.parent='pay' and d.child=s.pay) as pay,s.money,s.memo,s.submitdate as date from dd_submit s left join dd_product p on s.barcode=p.barcode where s.status='0'  and s.amount>0 order by s.submitdate desc";
		}
		PageUtil p=CommonDAO.findPageByMultiTableSQLQuery(sql,start,end,perpage,Submit.class);
		
		String content = "totalPage = " + p.getTotalPageCount() + ";";
		content += "dataStore = [";

		List l=(List)p.getResult();
		for(int i=0;i<l.size();i++)
		{
			Submit d=(Submit)l.get(i);
			String status=d.getStatus();
			String type_=d.getType();
			String pay=d.getPay();
			if(status.equals("0"))
				status="<font color='red'>待审核</font>";
			else if(status.equals("1"))
				status="<font color='green'>已审核</font>";
			if(type_.equals("01"))
				type_="<font color='red'>快递送货</font>";
			else if(type_.equals("02"))
			{
				type_="<font color='green'>上门送货</font>";
				pay="";
			}

			if(type.equals("1"))
				content += "\"<tr id='"+d.getId()+"'><td><input type='checkbox' name='row' value='"+d.getId()+"'/></td><td>"+d.getBarcode()+"</td><td>"+d.getName()+"</td><td class='editbox' id='amount'>"+d.getAmount()+"</td><td>"+status+"</td><td>"+type_+"</td><td>"+d.getPlace()+"</td><td>"+d.getBegin()+"</td><td>"+d.getEnd()+"</td><td>"+d.getEms()+"</td><td>"+d.getReceipt()+"</td><td>"+pay+"</td><td>"+d.getMoney()+"</td><td>"+d.getMemo()+"</td><td>"+d.getDate()+"</td></tr>\",";
			else
				content += "\"<tr id='"+d.getId()+"'><td><input type='checkbox' name='row' value='"+d.getId()+"'/></td><td>"+d.getBarcode()+"</td><td>"+d.getName()+"</td><td class='editbox' id='amount'>"+d.getAmount()+"</td><td>"+status+"</td><td>"+type_+"</td><td>"+d.getPlace()+"</td><td>"+d.getBegin()+"</td><td>"+d.getEnd()+"</td><td>"+d.getEms()+"</td><td>"+d.getReceipt()+"</td><td>"+pay+"</td><td>"+d.getMoney()+"</td><td>"+d.getMemo()+"</td><td>"+d.getSubmitdate()+"</td></tr>\",";
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
				sql="select s.id from dd_submit  s left join dd_product p on s.barcode=p.barcode where s.status='1' and p.userid='"+userid+"' and s.amount>0";
			else
				sql="select s.id from dd_submit  s left join dd_product p on s.barcode=p.barcode where s.status='0' and p.userid='"+userid+"' and s.amount>0";
		}else
		{
			if(type.equals("1"))
				sql="select s.id from dd_submit  s left join dd_product p on s.barcode=p.barcode where s.status='1' and s.amount>0";
			else
				sql="select s.id from dd_submit  s left join dd_product p on s.barcode=p.barcode where s.status='0' and s.amount>0";
		}
		
		
		int count=CommonDAO.count(sql);
		return count;
	}
}
