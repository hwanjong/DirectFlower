package bean;

import java.io.Serializable;

public class Product implements Serializable{
	
	int productId;
	String productName;
	int price;
	int shopNum;
	String special;
	//order에서만쓸변수
	private int amount;
	private int state;
	private String userId;
	private int orderId;

	public Product(){
		super();
	}
	public Product(int productid,int amount){
		this.productId=productid;
		this.amount=amount;
	}
	public Product(int productId,String productName,int price, String special,int shopNum) {
		// TODO Auto-generated constructor stub
		this.productId=productId;
		this.productName=productName;
		this.price=price;
		this.special=special;
		this.shopNum=shopNum;
	}
	
	
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getSpecial() {
		return special;
	}

	public void setSpecial(String special) {
		this.special = special;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getShopNum() {
		return shopNum;
	}
	public void setShopNum(int shopNum) {
		this.shopNum = shopNum;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	

}
