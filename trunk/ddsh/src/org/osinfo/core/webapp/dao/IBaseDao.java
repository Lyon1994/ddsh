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

import java.util.List;

/**
 * @param <T>
 * @Date 2010-7-4 上午11:59:52
 * @Description 描述
 */
public interface IBaseDao<T> {
	/**
	 * 插入对象
	 * 
	 * @param sql
	 * @param params
	 */
	int insert(String sql, Object... params);

	/**
	 * 查找多个对象
	 * 
	 * @param sql
	 * @param params
	 * @return
	 */
	List<T> query(String sql, Object... params);

	/**
	 * 查找对象
	 * 
	 * @param sql
	 * @param params
	 * @return
	 */
	T get(String sql, Object... params);

	/**
	 * 执行更新的sql语句,插入,修改,删除
	 * 
	 * @param sql
	 * @return
	 */
	boolean update(String sql);
}
