package org.osinfo.core.webapp.model;

/**
 * DdGrid entity. @author MyEclipse Persistence Tools
 */

public class DdGrid implements java.io.Serializable {

	// Fields

	private Integer id;
	private String gridid;
	private String name;
	private String location;
	private String userid;

	// Constructors

	/** default constructor */
	public DdGrid() {
	}

	/** minimal constructor */
	public DdGrid(String gridid, String name) {
		this.gridid = gridid;
		this.name = name;
	}

	/** full constructor */
	public DdGrid(String gridid, String name, String location, String userid) {
		this.gridid = gridid;
		this.name = name;
		this.location = location;
		this.userid = userid;
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

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLocation() {
		return this.location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getUserid() {
		return this.userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

}