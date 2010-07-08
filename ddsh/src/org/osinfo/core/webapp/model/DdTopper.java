package org.osinfo.core.webapp.model;

import java.sql.Timestamp;

/**
 * DdTopper entity. @author MyEclipse Persistence Tools
 */

public class DdTopper implements java.io.Serializable {

	// Fields

	private Integer id;
	private String name;
	private String image;
	private Integer amount;
	private Float price;
	private Float totalprice;
	private String userid;
	private String spec;
	private String material;
	private String grade;
	private String location;
	private String status;
	private String memo;
	private Timestamp submitdate;
	private Timestamp date;
	private String operator;
	private String barcode;

	// Constructors

	/** default constructor */
	public DdTopper() {
	}

	/** minimal constructor */
	public DdTopper(String name, String image, Integer amount, Float price,
			Float totalprice, String userid, String status, Timestamp submitdate) {
		this.name = name;
		this.image = image;
		this.amount = amount;
		this.price = price;
		this.totalprice = totalprice;
		this.userid = userid;
		this.status = status;
		this.submitdate = submitdate;
	}

	/** full constructor */
	public DdTopper(String name, String image, Integer amount, Float price,
			Float totalprice, String userid, String spec, String material,
			String grade, String location, String status, String memo,
			Timestamp submitdate, Timestamp date, String operator,
			String barcode) {
		this.name = name;
		this.image = image;
		this.amount = amount;
		this.price = price;
		this.totalprice = totalprice;
		this.userid = userid;
		this.spec = spec;
		this.material = material;
		this.grade = grade;
		this.location = location;
		this.status = status;
		this.memo = memo;
		this.submitdate = submitdate;
		this.date = date;
		this.operator = operator;
		this.barcode = barcode;
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

	public String getImage() {
		return this.image;
	}

	public void setImage(String image) {
		this.image = image;
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

	public Float getTotalprice() {
		return this.totalprice;
	}

	public void setTotalprice(Float totalprice) {
		this.totalprice = totalprice;
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

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
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

	public Timestamp getDate() {
		return this.date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}

	public String getOperator() {
		return this.operator;
	}

	public void setOperator(String operator) {
		this.operator = operator;
	}

	public String getBarcode() {
		return this.barcode;
	}

	public void setBarcode(String barcode) {
		this.barcode = barcode;
	}

}