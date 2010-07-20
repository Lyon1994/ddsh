package org.osinfo.core.webapp.model;

/**
 * DdSell entity. @author MyEclipse Persistence Tools
 */

public class DdSell implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer inventoryid;
	private String barcode;
	private String name;
	private String gridid;
	private Integer amount;
	private Float price;
	private Float discount;
	private String userid;

	// Constructors

	/** default constructor */
	public DdSell() {
	}

	/** full constructor */
	public DdSell(Integer inventoryid, String barcode, String name,
			String gridid, Integer amount, Float price, Float discount,
			String userid) {
		this.inventoryid = inventoryid;
		this.barcode = barcode;
		this.name = name;
		this.gridid = gridid;
		this.amount = amount;
		this.price = price;
		this.discount = discount;
		this.userid = userid;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getInventoryid() {
		return this.inventoryid;
	}

	public void setInventoryid(Integer inventoryid) {
		this.inventoryid = inventoryid;
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

	public String getGridid() {
		return this.gridid;
	}

	public void setGridid(String gridid) {
		this.gridid = gridid;
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

	public Float getDiscount() {
		return this.discount;
	}

	public void setDiscount(Float discount) {
		this.discount = discount;
	}

	public String getUserid() {
		return this.userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

}