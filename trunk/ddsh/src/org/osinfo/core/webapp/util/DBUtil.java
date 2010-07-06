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
 * @Date 2010-7-4 上午10:57:53
 * @Description 描述
 */
package org.osinfo.core.webapp.util;

import java.lang.reflect.Field;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DBUtil {

	public static Connection conn = null;
    
	/**
	 * 
	 * @Title 获取一个空闲连接，而不是重新连接
	 * @Author Lucifer.Zhou
	 * @Date  2010-7-4 上午11:29:13 
	 * @Method getConnection
	 * @return Connection
	 * @Description 描述
	 */
    public static Connection getConnection(){
    	try{ 
    		//Class.forName("org.logicalcobwebs.proxool.ProxoolDriver");
    		conn = DriverManager.getConnection("proxool.dd");
    	 }catch(Exception e){
            	 System.out.println("Connection failed ! "+e.getMessage());
    	 }
    	 return conn;
     }
    /**
     * 
     * @Title 归返连接， 而不是关闭连接
     * @Author Lucifer.Zhou
     * @Date  2010-7-4 上午11:28:40 
     * @Method close
     * @param rs
     * @param stmt
     * @param conn
     * @return void
     * @Description 描述
     */
     public static void close(ResultSet rs, Statement stmt, Connection conn) {
    	 try {
    		 if (rs != null) {
    			 rs.close();
    		 }
    		 if (stmt != null) {
        	     stmt.close();
        	 }
    		 if (conn != null) {
       	      	conn.close();
       	     }
    	 } catch (SQLException e) {
    		 e.printStackTrace();
    	 }
	}
     /*
 	 * 将rs结果转换成对象列表
 	 * @param rs jdbc结果集
 	 * @param clazz 对象的映射类
 	 * return 封装了对象的结果列表
 	 */
 	public static List populate(ResultSet rs , Class clazz){
 		//结果集的元素对象 
 		ResultSetMetaData rsmd = null;
 		//获取结果集的元素个数
		 int colCount;
 		 //返回结果的列表集合
 		 List list = new ArrayList();
 		 //业务对象的属性数组
 		 Field[] fields = clazz.getDeclaredFields();
		try {
			rsmd = rs.getMetaData();
			colCount = rsmd.getColumnCount();
			 while(rs.next()){//对每一条记录进行操作
	 			 Object obj = null;
				try {
					obj = clazz.newInstance();
				} catch (InstantiationException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IllegalAccessException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}//构造业务对象实体
	 			 //将每一个字段取出进行赋值
	 			 for(int i = 1;i<=colCount;i++){
	 				 Object value = rs.getObject(i);
	 				 //寻找该列对应的对象属性
	 				 for(int j=0;j<fields.length;j++){
	 					 Field f = fields[j];
	 					 //如果匹配进行赋值
	 					 if(f.getName().equalsIgnoreCase(rsmd.getColumnName(i))){
	 						 boolean flag = f.isAccessible();
	 						 f.setAccessible(true);
	 						 try {
								f.set(obj, value);
							} catch (IllegalArgumentException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							} catch (IllegalAccessException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
	 						 f.setAccessible(flag);
	 					 }
	 				 }
	 			 }
	 			 list.add(obj);
	 		 }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

// 		 System.out.println("#");
// 		 for(int i = 1;i<=colCount;i++){
// 			 System.out.println(rsmd.getColumnName(i));
// 			 System.out.println(rsmd.getColumnClassName(i));
// 			 System.out.println("#");
// 		 }

 		
 		return list;
 	}
}
