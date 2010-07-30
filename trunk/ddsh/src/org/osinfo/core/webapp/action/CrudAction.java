/**
 * @Author Lucifer.Zhou 1:29:33 PM Jan 29, 2010
 * @MSN zhoujianguo_leo@hotmail.com
 * @Mail leo821031@gmail.com
 * @FileName CrudAction.java
 * @JDKVersion 1.5
 * @Site http://www.osinfo.org
 */
package org.osinfo.core.webapp.action;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.osinfo.core.webapp.Constants;
import org.osinfo.core.webapp.action.util.DynamicGrid;

/**
 * @Author Lucifer.Zhou 1:29:33 PM Jan 29, 2010
 * @Description
 *
 */
public abstract class CrudAction extends BaseAction {
	protected static Logger logger = Logger.getLogger ( CrudAction.class.getName () ) ;
	private static final String TotalRecords="records";//总记录数
	private static final String TotalPages="total";//总页数
	private static final String PageNo="page";//当前页
	private static final String ROWS="rows";//数据行集合根
	private static final String SORT="sidx";//排序字段sort
	private static final String DIR="sord";//排序方式dir
	private static final String START="start";//开始
	private static final String LIMIT="limit";//范围
	private static final String WHERE="where";//条件
	
	//jqgrid
	private static final String Search="_search";//true，false
	private static final String SearchField="searchField";//查询字段
	private static final String SearchOper="searchOper";//运算表达式
	private static final String SearchString="searchString";//值
	

    protected static final String COLMODEL="colModel";//列模式
    protected static final String COLNAMES="colNames";//列头
    protected static final String CAPTION="caption";//表格标题
	protected static final String PAGE_LIST="list";//返回列表页面
	protected static final String PAGE_ADD="add";//返回添加页面
	protected static final String PAGE_EDIT="edit";//返回编辑页面
	
	protected String SORT_;//排序字段
    protected String DIR_;//排序方式
    //protected String START;//开始
    //protected String LIMIT;//多少
    protected List expressions=new ArrayList();//Hibernate Restrictions条件
    protected long pageNo;//显示第几页
    protected long pageSize;//每页显示几条记录
    protected String Search_;
    protected String SearchField_;
    protected String SearchOper_;
    protected String SearchString_;

    //ddshow
    private static final String STARTRECORD="startrecord";//开始
    private static final String ENDRECORD="endrecord";//结束
    private static final String PERPAGE="perpage";//每页多少条
    protected long start;
    protected long end;
    protected long perpage;
    protected String type="1";
    
	/**
	 * @Author Lucifer.Zhou 1:29:39 PM Jan 29, 2010
	 * long CrudAction.java
	 * @Description
	 *
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * @Author Lucifer.Zhou 1:29:33 PM Jan 29, 2010
	 * CrudAction
	 * @Description
	 *
	 */
	public CrudAction() {
		// TODO Auto-generated constructor stub
	}
	/**
	 * 简单查询表达式组合
	 * @param search_
	 * @param searchField_
	 * @param searchOper_
	 * @param searchString_
	 * @return List
	 */
	private List expressionsTranslation(String search_,String searchField_,String searchOper_,String searchString_)
	{
		/*
		if(search_.equalsIgnoreCase("true"))
		{
			if(searchOper_!=null&&searchField_!=null&&searchString_!=null)
			{
				
				if(searchOper_.equalsIgnoreCase("eq"))
				{
					expressions.add(Restrictions.eq(searchField_, searchString_));
				}else if(searchOper_.equalsIgnoreCase("ne"))
				{
					expressions.add(Restrictions.not(Restrictions.eq(searchField_, searchString_)));
				}else if(searchOper_.equalsIgnoreCase("lt"))
				{
					expressions.add(Restrictions.lt(searchField_, searchString_));
				}else if(searchOper_.equalsIgnoreCase("le"))
				{
					expressions.add(Restrictions.le(searchField_, searchString_));
				}else if(searchOper_.equalsIgnoreCase("gt"))
				{
					expressions.add(Restrictions.gt(searchField_, searchString_));
				}else if(searchOper_.equalsIgnoreCase("ge"))
				{
					expressions.add(Restrictions.ge(searchField_, searchString_));
				}else if(searchOper_.equalsIgnoreCase("bw"))
				{
					expressions.add(Restrictions.like(searchField_, searchString_,MatchMode.START));
				}else if(searchOper_.equalsIgnoreCase("bn"))
				{
					expressions.add(Restrictions.not(Restrictions.like(searchField_, searchString_,MatchMode.START)));
				}else if(searchOper_.equalsIgnoreCase("in"))
				{
					expressions.add(Restrictions.in(searchField_, new String[]{searchString_}));
				}else if(searchOper_.equalsIgnoreCase("ni"))
				{
					expressions.add(Restrictions.not(Restrictions.in(searchField_, new String[]{searchString_})));
				}else if(searchOper_.equalsIgnoreCase("ew"))
				{
					expressions.add(Restrictions.like(searchField_, searchString_,MatchMode.END));
				}else if(searchOper_.equalsIgnoreCase("en"))
				{
					expressions.add(Restrictions.not(Restrictions.like(searchField_, searchString_,MatchMode.END)));
				}else if(searchOper_.equalsIgnoreCase("cn"))
				{
					expressions.add(Restrictions.like(searchField_, searchString_,MatchMode.ANYWHERE));
				}else if(searchOper_.equalsIgnoreCase("nc"))
				{
					expressions.add(Restrictions.not(Restrictions.like(searchField_, searchString_,MatchMode.ANYWHERE)));
				}
			}
		}*/
		return expressions;
	}
	/**
	 * @Author Lucifer.Zhou 1:39:56 PM Jan 29, 2010
	 * @Method list
	 * @return String
	 * @Description
	 * 加载数据列表页面
	 */
	public String execute()
	{
		if(logger.isDebugEnabled())
			logger.debug("加载数据列表页面...");
        return PAGE_LIST;
	}
	public String add_()
	{
		if(logger.isDebugEnabled())
			logger.debug("加载数据添加页面...");
        return PAGE_ADD;
	}

	public String edit_()
	{
		if(logger.isDebugEnabled())
			logger.debug("加载数据编辑页面...");
		String id=getParameter("id");
		getRequest().setAttribute("id", id);
        return PAGE_EDIT;
	}
	/**
	 * 
	 * @Author Lucifer.Zhou 1:41:32 PM Jan 29, 2010
	 * @Method dynamicColumn
	 * @return String
	 * @Description
	 * 动态生成Grid
	 */
	public String dynamicGrid()
	{
		//具体动态列生成根据具体的Action实现类的表
		DynamicGrid dynamicGrid=this.myDynamicGrid();
		List list=dynamicGrid.getDynamicColModel();
		Map map = new HashMap();
			map.put(PRINT_RESULT, TRUE);
			map.put(COLMODEL, list);
			map.put(COLNAMES, dynamicGrid.getColNames());
			map.put(CAPTION, dynamicGrid.getCaption());
		JSONObject jSon = new JSONObject().fromObject(map);
		renderJson(jSon.toString());
		return null;
	}

	/**
	 * QBC查询方式，针对有关联的简单查询，返回分页查询以后的结果集，带条件，排序
	 * @Author Lucifer.Zhou 11:59:07 AM Jan 13, 2009
	 * @Method result
	 * @return String
	 */
	public String result()
	{
		if(logger.isDebugEnabled())
			logger.debug("加载列表结果集页面...");
		SORT_=getParameter(SORT);//排序字段
		DIR_=getParameter(DIR);//排序方式
		//START=getRequest().getParameter(START_);//开始
		//LIMIT=getRequest().getParameter(LIMIT_);//多少
		//WHERE=getRequest().getParameter(WHERE_);//条件

		Search_=getParameter(Search)==null?"false":getParameter(Search);
		SearchField_=getParameter(SearchField);
		SearchOper_=getParameter(SearchOper);
		SearchString_=getParameter(SearchString);

		//pageNo=Integer.parseInt((String)getParameter(PageNo));//开始
		//pageSize=Integer.parseInt((String)getParameter(ROWS));//开始
		//ddshow
		
		start=Integer.parseInt((String)getParameter(STARTRECORD));//开始
		end=Integer.parseInt((String)getParameter(ENDRECORD));//开始
		perpage=Integer.parseInt((String)getParameter(PERPAGE));//开始
		type=(String)getParameter("type");//操作类型
		
		expressions=this.expressionsTranslation(Search_, SearchField_, SearchOper_, SearchString_);
		String filter = getParameter("filter");
		if(filter!=null)
		{
			try {
				filter=new String(filter.getBytes(Constants.ENCODE_ISO8859_1),Constants.ENCODE_UTF_8);
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			//logger.debug(filter);
			String[] filters=filter.split("\\,");
			expressions=this.filter(expressions, filters);
		}
		/*
		if(logger.isDebugEnabled())
		{
			logger.debug("sort..."+SORT_);
			logger.debug("dir..."+DIR_);
			logger.debug("start..."+START);
			logger.debug("limit..."+LIMIT);
			logger.debug("_search..."+Search_);
			logger.debug("searchField_..."+SearchField_);
			logger.debug("searchOper_..."+SearchOper_);
			logger.debug("searchString_..."+SearchString_);
			logger.debug("where..."+WHERE);
			logger.debug("page..."+pageNo);
			logger.debug("rows..."+pageSize);
			//ddshow
			logger.debug("start..."+start);
			logger.debug("end..."+end);
			logger.debug("perpage..."+perpage);
			logger.debug("type..."+type);
		}*/
		
		cfg=new JsonConfig();
		//具体实现类
		String content=this.myResult();
		System.out.println(content);
		//设置headers参数
		String fullContentType = "text/html;charset=UTF-8";
		getResponse().setContentType(fullContentType);
		getResponse().setHeader("Pragma", "No-cache");
		getResponse().setHeader("Cache-Control", "no-cache");
		getResponse().setDateHeader("Expires", 0);
		try {
			getResponse().getWriter().write(content);
			getResponse().getWriter().flush();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return null;
	}
	/**
	 * 构建导出Excel
	 * @Author Lucifer.Zhou 10:43:26 PM Feb 17, 2009
	 * @Method buildExcelDocument
	 * @return void
	 * @throws IOException 
	 */
	public String export()
	{
		if(logger.isDebugEnabled())
			logger.debug("加载列表导出页面...");
	    String name=getParameter("name");
	    String type=getParameter("type");
	    String scope=getParameter("scope");
	    String template=getParameter("template");
	    String bound=getParameter("bound");
	    String where=getParameter("where");
	    String sort=getParameter("sort");
	    String dir=getParameter("dir");
	    type="1";
	    ServletOutputStream out = null;
		try {
			out = getResponse().getOutputStream();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
    	HSSFWorkbook workbook = null;
    	POIFSFileSystem fs ;
	    if(type.equalsIgnoreCase("1"))//excel
	    {
			if (template != null) {
				if(!template.trim().equals(""))
				{
					/*
					Resource inputFile=new FileSystemResource(template);
					try {
						fs = new POIFSFileSystem(inputFile.getInputStream());
						workbook = new HSSFWorkbook(fs);
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}*/
					
				}else {
					workbook = new HSSFWorkbook();
					logger.info("Created Excel Workbook from scratch");
				}
			}else {
				workbook = new HSSFWorkbook();
				logger.info("Created Excel Workbook from scratch");
			}
			getResponse().reset();//清空输出流      
			//getResponse().setContentType("application/octet-stream");
			getResponse().setContentType(Constants.CONTENT_TYPE_EXCEL);
			/*try {
				if (getRequest().getHeader("User-Agent").toLowerCase().indexOf("firefox") > 0)
					name = new String(name.getBytes("UTF-8"), "ISO8859-1");//firefox浏览器
				else if (getRequest().getHeader("User-Agent").toUpperCase().indexOf("MSIE") > 0)
					name = URLEncoder.encode(name, "UTF-8");//IE浏览器 终极解决文件名乱码
			} catch (UnsupportedEncodingException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}*/
			//线上浏览的方式： response.setHeader("Content-disposition","inline; filename=test1.xls"); 
			//下载的方式： response.setHeader("Content-disposition","attachment; filename=test2.xls"); 
			
			try {
				workbook=this.exportExcel(workbook,scope,bound,where,sort,dir);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
				workbook.write(out);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    }else if(type.equalsIgnoreCase("2"))//pdf
	    {
	    	
	    }else if(type.equalsIgnoreCase("3"))//word
	    {
	    	
	    }else if(type.equalsIgnoreCase("4"))//cvs
	    {
	    	
	    }else if(type.equalsIgnoreCase("5"))//txt
	    {
	    	
	    }
		// Should we set the content length here?
		// response.setContentLength(workbook.getBytes().length);
		try {
			out.flush();
			out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;
	}
	public String count()
	{
		if(logger.isDebugEnabled())
			logger.debug("统计结果集总数...");
		int count=this.myCount();		
		JSONArray json=JSONArray.fromObject("['"+count+"']");
		renderJson(json.toString());
		return null;
	}
	/**
	 * Subclasses must implement this method to create an Excel HSSFWorkbook document,
	 * given the model.
	 * @param model the model Map
	 * @param workbook the Excel workbook to complete
	 * @param request in case we need locale etc. Shouldn't look at attributes.
	 * @param response in case we need to set cookies. Shouldn't write to it.
	 */
	protected abstract HSSFWorkbook exportExcel(HSSFWorkbook workbook
			,String scope,String bound,String where,String sort,String dir)throws Exception;
	/**
	 * 
	 * @Author Lucifer.Zhou 10:54:13 AM Feb 18, 2009
	 * @Method loadExportData
	 * @param criteria
	 * @param scope
	 * @param bound
	 * @param where
	 * @param sort
	 * @param dir
	 * @return List
	 */
	/*
	protected List loadExportData(Criteria criteria,String scope,String bound,String where,String sort,String dir)
	{
		List list = null;
       	String[] tmp=bound.split("-");
		if(scope.equalsIgnoreCase("1"))//当前页
		{
        	//Page pages=pagedQuery(criteria, Integer.parseInt(tmp[0]), 25);
        	//list=(List) pages.getResult();
		}else if(scope.equalsIgnoreCase("2"))//第一页
		{
        	//Page pages=pagedQuery(criteria, 1, 25);
        	//list=(List) pages.getResult();
		}else if(scope.equalsIgnoreCase("3"))//最后一页
		{
        	//Page pages=pagedQuery(criteria, Integer.parseInt(tmp[0]), 25);
        	//list=(List) pages.getResult();
		}else if(scope.equalsIgnoreCase("4"))//所有页面
		{
 
        	list=criteria.list();
		}
		return list;
	}
	 */
	
	public abstract String myResult();
	public abstract String  add();
	public abstract String  del();
	public abstract String  edit();
	public abstract DynamicGrid myDynamicGrid();
	public abstract List  filter(List expressions,String[] filters);//查询字段必须和model对应,方便查询
	public abstract int myCount();
}
