/**
 ************************************************
 * @Company 上海竹枫信息技术有限公司
 * @WebSite http://www.zf-info.com
 * @Organize 欧斯英孚开源组织 http://www.osinfo.org
 * @Founder Lucifer.Zhou 
 * @MSN zhoujianguo_leo@hotmail.com
 * @Mail leo821031@gmail.com
 * 竹枫含义：
 * 【典故】君向楚，我归秦，便分路青竹丹枫。
 * 【释义】青竹生南方，丹枫长北地。借指南北。 
 ************************************************
 */
package org.osinfo.core.webapp.util;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;

/**
 * @Date 2010-7-6 下午09:28:15
 * @Description 描述
 */
public class SQLUtil {
	protected final static Logger logger = Logger.getLogger(SQLUtil.class);
	// 取得 from 位置的表达式
	private static final Pattern FROM_PATTERN = Pattern.compile(
			"(^|\\s)(from)\\s", Pattern.CASE_INSENSITIVE);

	// 取得 order 位置的表达式
	private static final Pattern ORDER_PATTERN = Pattern.compile(
			"\\s(order)(\\s)+by\\s", Pattern.CASE_INSENSITIVE);
	public static String buildSQL(String sql)
	{
		//System.out.println(sql);
        if (StringUtils.isEmpty(sql)) {
            throw new IllegalArgumentException("SQL should not be empty");
        }
		Matcher fMatcher = FROM_PATTERN.matcher(sql);
		if (!fMatcher.find()) {
			throw new IllegalArgumentException("no from clause found in query");
		}
		int fLoc = fMatcher.start(2);
		Matcher oMatcher = ORDER_PATTERN.matcher(sql);
		int oLoc = oMatcher.find() ? oMatcher.start(1) : sql.length();

        /*
        boolean hasDistinctOrGroupby = false;//标识distinct和groupby 在结果集上没什么差异,只有在执行上有差异,所以算同一种情况
        sql=getLineText(sql);
        String lowcaseSQL = sql.toLowerCase();
        int posFirstDistinct = lowcaseSQL.indexOf(" distinct ");
        int posFirstFrom = lowcaseSQL.indexOf(" from ");
        int posLastGroupby = lowcaseSQL.indexOf(" group by ");
        int orderIndex  = getLastOrderInsertPoint(lowcaseSQL);    
        int postLastRightBracket = lowcaseSQL.indexOf(")");
        if (posFirstFrom > 0 && posFirstDistinct > 0 && posFirstDistinct < posFirstFrom) {
            hasDistinctOrGroupby = true;
        }
        if (posLastGroupby > 0 && posLastGroupby > postLastRightBracket) {
            hasDistinctOrGroupby = true;
        }
        if (hasDistinctOrGroupby) {
        	if(orderIndex>-1)
        	{
            	newSql.append("select count(*) as count from (");
            	newSql.append(sql.substring(0, orderIndex));
            	newSql.append(") c");
        	}else
        	{
            	newSql.append("select count(*) as count from (");
            	newSql.append(sql);
            	newSql.append(") c");
        	}
        } else {
            // 参考上面的语法解析
        	if(orderIndex>-1)
        	{
        		newSql.append("select count(*) as count ");
                newSql.append(sql.substring(posFirstFrom,orderIndex));
        	}else
        	{
        		newSql.append("select count(*) as count from(");
                newSql.append(sql+")");
        	}
        }
        return newSql.toString();
        */
		//System.out.println("select count(*) " + sql.substring(fLoc, oLoc));
		System.out.println("select count(*) from (" + sql+") as t");
		return "select count(*) from (" + sql+") as t";
	}

    /**  
     * 判断是否包含正确group by  
     * @return 如果包含返回True否则返回false 
     */    
    protected  boolean isHaveGroupBy(String querySelect){    
        int groupIndex = querySelect.toLowerCase().lastIndexOf(" group by ");    
        if (groupIndex != -1 && this.isBracketCanPartnership(querySelect.substring(groupIndex,querySelect.length()))) {    
            return true;    
        }    
        return false;    
    }    
      
    /**  
     * 得到最后一个order By的插入点位置  
     * @return 返回最后一个order By插入点的位置  
     */    
    protected  int getLastOrderInsertPoint(String querySelect){    
        int orderIndex = querySelect.toLowerCase().lastIndexOf(" order by ");    
        if (orderIndex == -1    
                || !this.isBracketCanPartnership(querySelect.substring(orderIndex,querySelect.length()))) {    
        	{
        		if(logger.isInfoEnabled())
        			logger.info("order by is null");
        	}
        }    
        return orderIndex;    
    }    
    
    
    /**  
     * 将SQL语句变成一条不换行语句，并且每个单词的间隔都是1个空格   
     * @param sql 需要转化的文本  
     * @return 如果sql是NULL返回空，否则返回转化后的SQL  
     */    
    protected  String getLineText(String text) {    
        return text.replaceAll("[\r\n]", " ").replaceAll("\\s{2,}", " ");    
    }    
    
    /**  
     * 得到SQL第一个正确的FROM的的插入点  
     * @param querySelect 完整的查询语句  
     * @return  正确的FROM插入点  
     */    
    protected  int getAfterFormInsertPoint(String querySelect) {    
        String regex = "\\s+FROM\\s+";    
        Pattern pattern = Pattern.compile(regex, Pattern.CASE_INSENSITIVE);    
        Matcher matcher = pattern.matcher(querySelect);    
        while (matcher.find()) {    
            int fromStartIndex = matcher.start(0);    
            String text = querySelect.substring(0, fromStartIndex);    
            if (this.isBracketCanPartnership(text)) {    
                return fromStartIndex;    
            }    
        }    
        return 0;    
    }    
    
    /**  
     * 判断括号'()'是否匹配  
     * @param text  要判断的文本  
     * @return 如果匹配返回TRUE,否则返回FALSE  
     */    
    protected  boolean isBracketCanPartnership(String text) {    
        if (text == null    
                || (getIndexOfCount(text, '(') != getIndexOfCount(text, ')'))) {    
            return false;    
        }    
        return true;    
    }    
    
    /**  
     * 得到一个字符在另一个字符串中出现的次数  
     * @param text  文本  
     * @param ch    字符  
     * @return 字符出现在文本的次数.  
     */    
    protected  int getIndexOfCount(String text, char ch) {    
        int count = 0;    
        for (int i = 0; i < text.length(); i++) {    
            count = (text.charAt(i) == ch) ? count + 1 : count;    
        }    
        return count;    
    }
    protected String[] getOrderBy(String prefix,String sql)
    {
    	String[] columns=sql.substring(sql.lastIndexOf("order by")+9).split(",");
    	if(columns.length==0)
			try {
				throw new Exception("缺少order by排序!");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    	String[] str=new String[columns.length];
    	for(int i=0;i<columns.length;i++)
    	{
    		if(prefix==null||prefix.trim().equals(""))
    			str[i]=columns[i];
    		else
    		{
    			str[i]=prefix+"."+columns[i];
    		}
    	}
    	return str;
    }
    /**
     * 取的所有查询字段,拼接上数据库的前缀
     * @Author Lucifer.Zhou 3:19:32 PM Nov 17, 2008
     * @Method getColumns
     * @param sql
     * @return String[]
     */
    protected String[] getNewColumns(String prefix,String sql)
    {
    	String[] columns=sql.substring(sql.indexOf("select ")+7,sql.indexOf(" from ")).split(",");
    	String[] str=new String[columns.length];
    	for(int i=0;i<columns.length;i++)
    	{
    		if(prefix==null||prefix.trim().equals(""))
    			str[i]=columns[i].substring(columns[i].lastIndexOf(" ")+1);
    		else
    		{
    			str[i]=prefix+"."+columns[i].substring(columns[i].lastIndexOf(" ")+1);
    		}
    			
    	}
    	return str;
    }
	/**
	 * 封装ResultSet为List
	 * @Author Lucifer.Zhou 5:11:38 PM Nov 13, 2008
	 * @Method packageResultSet
	 * @param rs
	 * @return List
	 */
    protected List packageResultSet(ResultSet rs)
	{
		//执行结果集操作
		ResultSetMetaData rsmd = null;
		List list = new ArrayList();
		Map map;
		int numberOfColumns;
		try {
			rsmd = rs.getMetaData();//取数据库列名
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			numberOfColumns = rsmd.getColumnCount();
			while(rs.next())
				{
					map = new HashMap(numberOfColumns);
				    for(int r=1;r<numberOfColumns+1;r++)
				    {
				    	int type=rsmd.getColumnType(r);
				    	String value="";
				    	if(rs.getObject(r)!=null)
				    		value=rs.getObject(r).toString();
				    	//System.out.println("列名:"+rsmd.getColumnName(r)+" 类型:"+SQLTypeWrapper.getJdbcTypeName(type)+" 值"+value);
				    	map.put(rsmd.getColumnName(r),value); 
				}
				list.add(map);
			}
		} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}


		return list;
	}
}
