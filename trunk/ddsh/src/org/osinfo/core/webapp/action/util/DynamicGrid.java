/**
 * @Author Lucifer Zhou 2:05:39 PM Jan 31, 2010
 * @MSN zhoujianguo_leo@hotmail.com
 * @Mail leo821031@gmail.com
 * @Copyright 2007-2009 The 欧斯英孚 Software Organization
 * @WebSite http://www.osinfo.org
 * @FileName DynamicGrid.java
 * @JDKVersion 1.5
 */
package org.osinfo.core.webapp.action.util;

import java.io.Serializable;
import java.util.List;

/**
 * @author Administrator
 * jqgrid表格 临时性
 */
public class DynamicGrid  implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 
	 */
	public DynamicGrid() {
		// TODO Auto-generated constructor stub
	}
    private List colNames;
    private String caption;
    private List<DynamicColModel> dynamicColModel;

	public List<DynamicColModel> getDynamicColModel() {
		return dynamicColModel;
	}
	public void setDynamicColModel(List<DynamicColModel> dynamicColModel) {
		this.dynamicColModel = dynamicColModel;
	}
	public List getColNames() {
		return colNames;
	}
	public void setColNames(List colNames) {
		this.colNames = colNames;
	}
	public String getCaption() {
		return caption;
	}
	public void setCaption(String caption) {
		this.caption = caption;
	}
}
