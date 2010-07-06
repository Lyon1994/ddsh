package org.osinfo.core.webapp.model;

import java.sql.Timestamp;

/**
 * DdInventory entity. @author MyEclipse Persistence Tools
 */

public class DdInventory implements java.io.Serializable {

	// Fields

	private Integer id;
	private String barcode;
	private String name;
	private Integer amount;
	private Float price;
	private Integer userid;
	private String spec;
	private String material;
	private String grade;
	private String location;
	private Integer operator;
	private Timestamp date;

	// Constructors

	/** default constructor */
	public DdInventory() {
	}

	/** minimal constructor */
	public DdInventory(String barcode, String name, Integer amount,
			Float price, Integer userid, Integer operator, Timestamp date) {
		this.barcode = barcode;
		this.name = name;
		this.amount = amount;
		this.price = price;
		this.userid = userid;
		this.operator = operator;
		this.date = date;
	}

	/** full constructor */
	public DdInventory(String barcode, String name, Integer amount,
			Float price, Integer userid, String spec, String material,
			String grade, String location, Integer operator, Timestamp date) {
		this.barcode = barcode;
		this.name = name;
		this.amount = amount;
		this.price = price;
		this.userid = userid;
		this.spec = spec;
		this.material = material;
		this.grade = grade;
		this.location = location;
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

	public String getBarcode() {
		return this.barcode;
	}

	public void setBarcode(String barcode) {
		this.barcode = barcode;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getAmount() {
		return this.amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}

	public Float getPrice() {
		return this.price;
	}

	public void setPrice(Float price) {
		this.price = price;
	}

	public Integer getUserid() {
		return this.userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	public String getSpec() {
		return this.spec;
	}

	public void setSpec(String spec) {
		this.spec = spec;
	}

	public String getMaterial() {
		return this.material;
	}

	public void setMaterial(String material) {
		this.material = material;
	}

	public String getGrade() {
		return this.grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getLocation() {
		return this.location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public Integer getOperator() {
		return this.operator;
	}

	public void setOperator(Integer operator) {
		this.operator = operator;
	}

	public Timestamp getDate() {
		return this.date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}

}