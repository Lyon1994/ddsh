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
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.osinfo.core.webapp.action.CrudAction;
import org.osinfo.core.webapp.action.util.DynamicGrid;
import org.osinfo.core.webapp.dao.CommonDAO;
import org.osinfo.core.webapp.model.DdWallet;
import org.osinfo.core.webapp.util.ExcelUtil;
import org.osinfo.core.webapp.util.FloatUtil;
import org.osinfo.core.webapp.util.JsonUtil;
import org.osinfo.core.webapp.util.PageUtil;
@Results({
	 @Result(name="list",location = "/WEB-INF/result/system/wallet/list.ftl"),
	 @Result(name="list2",location = "/WEB-INF/result/system/wallet/list2.ftl"),
})
/**
 * @Author Lucifer.Zhou 4:29:47 PM Jan 6, 2010
 * @Description
 * 电子钱包/财务
 */
public class WalletAction<T> extends CrudAction{
	private static Logger logger = Logger.getLogger ( WalletAction.class.getName () ) ;
	/**
	 * @Author Lucifer.Zhou 4:30:01 PM Jan 6, 2010
	 * long LoginAction.java
	 * @Description
	 *
	 */
	private static final long serialVersionUID = 1L;
	//退回商品
	public String list() {
		String t=(String) getSession().getAttribute("type");
		if(t.equals("2"))
		{
			return "list2";
		}
		return "list";
	}

	//添加账号
	@Override
	public String add() {
		// TODO Auto-generated method stub
		String userid=getParameter("userid");
		String account=getParameter("account");
		String bankname=getParameter("bankname");
		
		String accounter=getParameter("accounter");
		String location=getParameter("location");
		String money=getParameter("money");		
		

		String date=getCurrentTime();

		String operator=(String) getSession().getAttribute("userid");

		String sql="insert into dd_wallet (userid,account,bankname,accounter,location,money,operator,date) " +
				"values ('"+userid+"','"+account+"','"+bankname+"','"+accounter+"','"+location+"',"+money+",'"+operator+"','"+date+"')";

		int v=CommonDAO.executeUpdate(sql);
		if(v>0)
			return "success2";
		else
			return "error2";
	}
	//交易
	public String trans() {
		// TODO Auto-generated method stub
		String type=getParameter("types");
		String money=getParameter("money");		
		String user=getParameter("userid");		
		String isadmin=getParameter("isadmin");		
		//String memo=getParameter("memo");		
		String submitdate=getCurrentTime();
		String operator=(String) getSession().getAttribute("userid");
		String sql="";
		int v;
		if(isadmin==null)//设计师发起提现和充值需处理
		{
			sql="insert into dd_transaction (userid,user,type,status,money,memo,submitdate) " +
			"values ('"+operator+"','東東設會','"+type+"','0',"+money+",'','"+submitdate+"')";
			v=CommonDAO.executeUpdate(sql);
		}
		else
		{
			sql="insert into dd_transaction (userid,user,type,status,money,memo,submitdate,operator,date) " +
			"values ('東東設會','"+user+"','"+type+"','1',"+money+",'','"+submitdate+"','"+operator+"','"+submitdate+"')";
			v=CommonDAO.executeUpdate(sql);
			sql="select money as sum from dd_wallet where userid='"+user+"'";
    		float wallet=CommonDAO.sum(sql);
    		if(type.equals("01"))//充值
    			sql="update dd_wallet set money="+(wallet+Float.parseFloat(money))+" ,operator='"+operator+"', date='"+submitdate+"' where userid='"+user+"'";
    		else
    			sql="update dd_wallet set money="+(wallet-Float.parseFloat(money))+" ,operator='"+operator+"', date='"+submitdate+"' where userid='"+user+"'";
    		v=CommonDAO.executeUpdate(sql);
		}
		if(v>0)
			return "success2";
		else
			return "error2";
	}
	//设计师编辑账号信息
	public String edit2() {
		// TODO Auto-generated method stub
		String account=getParameter("account");
		String bankname=getParameter("bankname");
		
		String accounter=getParameter("accounter");
		String location=getParameter("location");
		

		String date=getCurrentTime();

		String operator=(String) getSession().getAttribute("userid");
		String sql="select * from dd_wallet where userid='"+operator+"'";
		List l=CommonDAO.executeQuery(sql, DdWallet.class);
		if(l.size()>0)
			sql="update dd_wallet set account='"+account+"',bankname='"+bankname+"',accounter='"+accounter+"',location='"+location+"',operator='"+operator+"',date='"+date+"' where userid='"+operator+"'";
		else
			sql="insert into dd_wallet (userid,account,bankname,accounter,location,money,operator,date) " +
				"values ('"+operator+"','"+account+"','"+bankname+"','"+accounter+"','"+location+"',0,'"+operator+"','"+date+"')";

		int v=CommonDAO.executeUpdate(sql);
		if(v>0)
			return "success2";
		else
			return "error2";
	}
	//钱包-设置 数据加载
	public String load() {
		// TODO Auto-generated method stub
		if(logger.isDebugEnabled())
			logger.debug("加载装入页面...");
		String operator=(String) getSession().getAttribute("userid");
	    String sql="select * from dd_wallet  where userid='"+operator+"'";
	    List l=CommonDAO.executeQuery(sql,DdWallet.class);
	    try
	    {
	    	String json = JsonUtil.list2json(l);
	    	renderJson(json.toString());
		    System.out.println(json.toString());
	    }catch(Exception e)
	    {
	    	e.printStackTrace();
	    }
        return null;
	}
	//钱包信息
	public String money() {
		// TODO Auto-generated method stub
		if(logger.isDebugEnabled())
			logger.debug("加载装入页面...");
		float money=0;//余额
		float sale=0;//总销售额
		float tixian=0;//总提现额
		float chongzhi=0;//总充值额
		
		String submitdate=getCurrentTime();
		String operator=(String) getSession().getAttribute("userid");
		String t=(String) getSession().getAttribute("type");
		Map m=new HashMap();
		String sql="";
		if(t.equals("2"))
			sql="select sum(p.price*s.discount*s.amount) as sum from dd_sales s left join dd_product p on s.barcode=p.barcode where p.userid='"+operator+"' order by p.userid";
		else
			sql="select sum(p.price*s.discount*s.amount) as sum from dd_sales s left join dd_product p on s.barcode=p.barcode order by p.userid";
	  
		sale=CommonDAO.sum(sql);
		m.put("sale", FloatUtil.round(sale, 2));//总销售额
		
		if(t.equals("2"))
			sql="select sum(w.money) as sum from dd_transaction w where w.type='01'  and status='1' and (w.userid='"+operator+"' or w.user='user2') ";
		else
			sql="select sum(w.money) as sum from dd_transaction w where  w.type='01' and status='1'";
		chongzhi=CommonDAO.sum(sql);
		m.put("chongzhi", FloatUtil.round(chongzhi, 2));//充值
		
		if(t.equals("2"))
			sql="select sum(w.money) as sum from dd_transaction w where w.type='02' and status='1' and (w.userid='"+operator+"' or w.user='user2') ";
		else
			sql="select sum(w.money) as sum from dd_transaction w where  w.type='02' and status='1'";
		tixian=CommonDAO.sum(sql);
		m.put("tixian", FloatUtil.round(tixian, 2));//取现
		
		if(t.equals("2"))
			sql="select sum(w.money) as sum from dd_wallet w where w.userid='"+operator+"' ";
		else
			sql="select sum(w.money) as sum from dd_wallet w";
		money=CommonDAO.sum(sql);
		m.put("money", FloatUtil.round(money, 2));//余额
		
	    try
	    {
	    	String json = JsonUtil.map2json(m);
	    	renderJson(json.toString());
		    System.out.println(json.toString());
	    }catch(Exception e)
	    {
	    	e.printStackTrace();
	    }
        return null;
	}
	@Override
	public String del() {
		// TODO Auto-generated method stub
		if(logger.isDebugEnabled())
			logger.debug("加载删除页面...");
	    String ids=getParameter("ids");
	    if(!"".equals(ids.trim())){
	    		String sql="delete from dd_wallet where id in ("+ids.substring(0,ids.length()-1)+")";
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
		String[] headers = { "序号","用户编号","账号", "银行名称", "开户人", "开户地址","余额","操作人","日期"};
		String userid=(String) getSession().getAttribute("userid");
		String t=(String) getSession().getAttribute("type");
		String sql;
		if(t.equals("2"))
			sql="select * from dd_wallet where userid='"+userid+"' order by userid";
		else
			sql="select * from dd_wallet order by userid";
		PageUtil p=CommonDAO.findByMultiTableSQLQuery(sql,DdWallet.class);
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
			sql="select * from dd_wallet where userid='"+userid+"' order by userid";
		else
			sql="select * from dd_wallet order by userid";
		
		PageUtil p=CommonDAO.findPageByMultiTableSQLQuery(sql,start,end,perpage,DdWallet.class);
		
		String content = "totalPage = " + p.getTotalPageCount() + ";";
		content += "dataStore = [";

		List l=(List)p.getResult();
		for(int i=0;i<l.size();i++)
		{
			DdWallet d=(DdWallet)l.get(i);

			content += "\"<tr id='"+d.getId()+"'><td><input type='checkbox' name='row' value='"+d.getId()+"'/></td><td>"+d.getUserid()+"</td><td>"+d.getAccount()+"</td><td>"+d.getBankname()+"</td><td>"+d.getAccounter()+"</td><td>"+d.getLocation()+"</td><td>"+d.getMoney()+"</td></tr>\",";
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
			sql="select * from dd_wallet where userid='"+userid+"'";
		else
			sql="select * from dd_wallet";

		int count=CommonDAO.count(sql);
		return count;
	}
}
