package org.osinfo.core.webapp.model;

/**
 * DdDic entity. @author MyEclipse Persistence Tools
 */

public class DdDic implements java.io.Serializable {

	// Fields

	private Integer id;
	private String parent;
	private String child;
	private String value;

	// Constructors

	/** default constructor */
	public DdDic() {
	}

	/** full constructor */
	public DdDic(String parent, String child, String value) {
		this.parent = parent;
		this.child = child;
		this.value = value;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getParent() {
		return this.parent;
	}

	public void setParent(String parent) {
		this.parent = parent;
	}

	public String getChild() {
		return this.child;
	}

	public void setChild(String child) {
		this.child = child;
	}

	public String getValue() {
		return this.value;
	}

	public void setValue(String value) {
		this.value = value;
	}

}