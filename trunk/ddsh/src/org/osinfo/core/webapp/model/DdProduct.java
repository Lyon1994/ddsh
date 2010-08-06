package org.osinfo.core.webapp.model;

import java.sql.Timestamp;

/**
 * DdProduct entity. @author MyEclipse Persistence Tools
 */

public class DdProduct implements java.io.Serializable {

	// Fields

	private Integer id;
	private String barcode;
	private String name;
	private Float price;
	private String type;
	private String status;
	private String image;
	private String userid;
	private String spec;
	private String material;
	private String grade;
	private String location;
	private String memo;
	private Timestamp submitdate;
	private String operator;
	private Timestamp date;

	// Constructors

	/** default constructor */
	public DdProduct() {
	}

	/** minimal constructor */
	public DdProduct(String name, String type, String status, String userid,
			Timestamp submitdate) {
		this.name = name;
		this.type = type;
		this.status = status;
		this.userid = userid;
		this.submitdate = submitdate;
	}

	/** full constructor */
	public DdProduct(String barcode, String name, Float price, String type,
			String status, String image, String userid, String spec,
			String material, String grade, String location, String memo,
			Timestamp submitdate, String operator, Timestamp date) {
		this.barcode = barcode;
		this.name = name;
		this.price = price;
		this.type = type;
		this.status = status;
		this.image = image;
		this.userid = userid;
		this.spec = spec;
		this.material = material;
		this.grade = grade;
		this.location = location;
		this.memo = memo;
		this.submitdate = submitdate;
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

	public Float getPrice() {
		return this.price;
	}

	public void setPrice(Float price) {
		this.price = price;
	}

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getImage() {
		return this.image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getUserid() {
		return this.userid;
	}

	public void setUserid(String userid) {
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

	public String getMemo() {
		return this.memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public Timestamp getSubmitdate() {
		return this.submitdate;
	}

	public void setSubmitdate(Timestamp submitdate) {
		this.submitdate = submitdate;
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