/**
 * @Author Lucifer Zhou 10:04:09 PM Jan 20, 2009
 * @MSN zhoujianguo_leo@hotmail.com
 * @Mail leo821031@gmail.com
 * @Copyright 2007-2008 The ZhouPhratry Software Organization
 * @FileName DynamicColumn.java
 * @JDKVersion 1.5
 */
package  org.osinfo.core.webapp.action.util;

import java.io.Serializable;

/**
 * @Author Lucifer.Zhou 10:04:09 PM Jan 20, 2009
 * ColModel 输出列配置
 */
public class DynamicColModel implements Serializable {

	/**
	 * @Author Lucifer.Zhou 10:04:13 PM Jan 20, 2009
	 * long DynamicColumn.java
	 */
	private static final long serialVersionUID = 1L;
	private String name;//列名
	private String header;
	private String type;
	private boolean hidden;//在初始化表格时是否要隐藏此列
	private String renderer;
	
	//jqgrid

	//private String align;
	//private String classes;
	//private String datefmt;
	//private String defval;
	//private boolean editable;
	//private String[] editoptions;
	//private String[] editrules;
	//private String edittype;
	//private boolean fixed;
	//private String[] formoptions;
	//private String[] formatoptions;
	//private String formatter;
	//private boolean hidedlg;
	
	private String index;
	//private String jsonmap;
	//private boolean key;
	//private String label;
	//private boolean resizable;
	//private boolean search;
	//private String[] searchoptions;
	//private boolean sortable;
	private String sorttype;
	//private String stype;
	//private String surl;
	private int width;
	//private String xmlmap;
	//private String unformat;

	
	/**
	 * @Author Lucifer.Zhou 10:04:09 PM Jan 20, 2009
	 * DynamicColumn
	 */
	public DynamicColModel() {
		// TODO Auto-generated constructor stub
	}
	public DynamicColModel(String name,String header,boolean hidden) {
		// TODO Auto-generated constructor stub
		this.name=name;
		this.header=header;
		this.hidden=hidden;
	}
	public DynamicColModel(String name,String header,String type,boolean hidden,String renderer) {
		// TODO Auto-generated constructor stub
		this.name=name;
		this.header=header;
		this.type=type;
		this.hidden=hidden;
		this.renderer=renderer;
	}
	public DynamicColModel(String name,String header,boolean hidden,String renderer) {
		// TODO Auto-generated constructor stub
		this.name=name;
		this.header=header;
		this.hidden=hidden;
		this.renderer=renderer;
	}
	//extjs
	public DynamicColModel(String name,String header,String type,boolean hidden) {
		// TODO Auto-generated constructor stub
		this.name=name;
		this.header=header;
		this.type=type;
		this.hidden=hidden;
	}
	//jqgrid
	public DynamicColModel(String name,String index,String sorttype,int width) {
		// TODO Auto-generated constructor stub
		this.name=name;
		this.index=index;
		this.sorttype=sorttype;
		this.width=width;
	}
	//jqgrid
	public DynamicColModel(String name,String index,int width) {
		// TODO Auto-generated constructor stub
		this.name=name;
		this.index=index;
		this.width=width;
	}
	//jqgrid
	public DynamicColModel(String name,String index) {
		// TODO Auto-generated constructor stub
		this.name=name;
		this.index=index;
	}
	public String getRenderer() {
		return renderer;
	}
	public void setRenderer(String renderer) {
		this.renderer = renderer;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getHeader() {
		return header;
	}
	public void setHeader(String header) {
		this.header = header;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public boolean getHidden() {
		return hidden;
	}
	public void setHidden(boolean hidden) {
		this.hidden = hidden;
	}
	public String getIndex() {
		return index;
	}
	public void setIndex(String index) {
		this.index = index;
	}
	public String getSorttype() {
		return sorttype;
	}
	public void setSorttype(String sorttype) {
		this.sorttype = sorttype;
	}
	public int getWidth() {
		return width;
	}
	public void setWidth(int width) {
		this.width = width;
	}

}
