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
package org.osinfo.core.webapp.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.osinfo.core.webapp.util.DBUtil;
import org.osinfo.core.webapp.util.PageUtil;
import org.osinfo.core.webapp.util.SQLUtil;

/**
 * @Date 2010-7-4 上午11:08:13
 * @Description 描述
 */
public class CommonDAO {
	protected final static Logger logger = Logger.getLogger(CommonDAO.class);
	public static List executeQuery(String sql,Class c) {
		System.out.println(sql);
		ResultSet rs = null;
		Statement stmt = null;
		List list = new ArrayList();
		Connection conn=DBUtil.getConnection();
		try {
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
			rs=stmt.executeQuery(sql);
			list = DBUtil.populate(rs, c);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(rs, stmt, conn);
		}
		return list;
	}
	public static float sum(String sql) {
		System.out.println(sql);
		ResultSet rs = null;
		Statement stmt = null;
		float sum=0;
		Connection conn=DBUtil.getConnection();
		try {
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
			rs=stmt.executeQuery(sql);
			while(rs.next())
				sum=Float.parseFloat(rs.getString("sum"));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(rs, stmt, conn);
		}
		return sum;
	}

	public static int executeUpdate(String sql) {
		System.out.println(sql);
		int r=0;
		Connection conn=DBUtil.getConnection();
		Statement stmt = null;
		try {
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
			r=stmt.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(null, stmt, conn);
		}
		return r;
	}
	public static int count(String sql)
	{
		sql=SQLUtil.buildSQL(sql).toString();
		System.out.println(sql);
		ResultSet rs = null;
		Statement stmt = null;
		Connection conn=DBUtil.getConnection();
		int count=0;
		try {
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
			rs=stmt.executeQuery(sql);
			while (rs.next())
			{
				count=rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(rs, stmt, conn);
		}
		return count;
	}
	public static PageUtil findPageByMultiTableSQLQuery(String sql, long start, long end,long pageSize,Class c)
	{
		System.out.println(sql);
		ResultSet rs = null;
		Statement stmt = null;
		Connection conn=DBUtil.getConnection();
		int totalCount=count(sql);

		List list = new ArrayList();
		try {
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
			rs=stmt.executeQuery(sql+" limit "+(start-1)+","+pageSize);

			list = DBUtil.populate(rs, c);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(rs, stmt, conn);
		}
		return new PageUtil(start, totalCount, pageSize, list);
	}
	public static PageUtil findByMultiTableSQLQuery(String sql,Class c)
	{
		System.out.println(sql);
		ResultSet rs = null;
		Statement stmt = null;
		Connection conn=DBUtil.getConnection();

		List list = new ArrayList();
		try {
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
			rs=stmt.executeQuery(sql);
			list = DBUtil.populate(rs, c);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(rs, stmt, conn);
		}
		return new PageUtil(0, 0, 0, list);
	}
}
