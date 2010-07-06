package org.osinfo.core.webapp.model;

/**
 * DdGridstatus entity. @author MyEclipse Persistence Tools
 */

public class DdGridstatus implements java.io.Serializable {

	// Fields

	private Integer id;
	private String gridid;
	private String status;

	// Constructors

	/** default constructor */
	public DdGridstatus() {
	}

	/** full constructor */
	public DdGridstatus(String gridid, String status) {
		this.gridid = gridid;
		this.status = status;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getGridid() {
		return this.gridid;
	}

	public void setGridid(String gridid) {
		this.gridid = gridid;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}