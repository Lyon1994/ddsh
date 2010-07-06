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
import java.sql.DriverManager;
import java.util.List;

/**
 * @param <T>
 * @Date 2010-7-4 下午12:05:51
 * @Description 描述
 */
public class BaseDAOImpl<T> implements IBaseDao<T> {

	public T get(String sql, Object... params) {
		// TODO Auto-generated method stub
		return null;
	}

	public int insert(String sql, Object... params) {
		// TODO Auto-generated method stub
		return 0;
	}

	public List<T> query(String sql, Object... params) {
		// TODO Auto-generated method stub
		return null;
	}

	public boolean update(String sql) {
		// TODO Auto-generated method stub
		return false;
	}

}
