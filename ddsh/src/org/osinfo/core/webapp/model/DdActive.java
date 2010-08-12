package org.osinfo.core.webapp.model;

import java.sql.Timestamp;

/**
 * DdActive entity. @author MyEclipse Persistence Tools
 */

public class DdActive implements java.io.Serializable {

	// Fields

	private Integer id;
	private String name;
	private String operator;
	private Timestamp date;

	// Constructors

	/** default constructor */
	public DdActive() {
	}

	/** minimal constructor */
	public DdActive(String name) {
		this.name = name;
	}

	/** full constructor */
	public DdActive(String name, String operator, Timestamp date) {
		this.name = name;
		this.operator = operator;
		this.date = date;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getOperator() {
		return this.operator;
	}

	public void setOperator(String operator) {
		this.operator = operator;
	}

	public Timestamp getDate() {
		return this.date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}

}