package org.osinfo.core.webapp.model;

/**
 * DdSell entity. @author MyEclipse Persistence Tools
 */

public class DdSell implements java.io.Serializable {

	// Fields

	private Integer id;
	private String barcode;
	private String name;
	private Integer gridid;
	private String amount;
	private Float price;
	private Integer userid;

	// Constructors

	/** default constructor */
	public DdSell() {
	}

	/** full constructor */
	public DdSell(String barcode, String name, Integer gridid, String amount,
			Float price, Integer userid) {
		this.barcode = barcode;
		this.name = name;
		this.gridid = gridid;
		this.amount = amount;
		this.price = price;
		this.userid = userid;
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

	public Integer getGridid() {
		return this.gridid;
	}

	public void setGridid(Integer gridid) {
		this.gridid = gridid;
	}

	public String getAmount() {
		return this.amount;
	}

	public void setAmount(String amount) {
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

}