package bean;

import java.io.Serializable;
import java.util.ArrayList;

public class Order implements Serializable{
	private String shopName;
	
	private int orderId;
	private String state;
	private String visit;
	private String photoUrl;
	
	private String userId;
	private String auctionName; //경매용
	private int responseMoney;
	private String targetName;
	private String requestTime;
	private String requestHour;
	private String targetPhone;
	private String targetAddress;
	private String shopNum;
	private String optionsRadios;
	private String auctionLat;
	private String auctionLng;
	private ArrayList<Product> orderList;
	
	
	public String getPhotoUrl() {
		return photoUrl;
	}
	public void setPhotoUrl(String photoUrl) {
		this.photoUrl = photoUrl;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getVisit() {
		return visit;
	}
	public void setVisit(String visit) {
		this.visit = visit;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public ArrayList<Product> getOrderList() {
		return orderList;
	}
	public void setOrderList(ArrayList<Product> orderList) {
		this.orderList = orderList;
	}
	public String getOptionsRadios() {
		return optionsRadios;
	}
	public void setOptionsRadios(String optionsRadios) {
		this.optionsRadios = optionsRadios;
	}
	public String getShopNum() {
		return shopNum;
	}
	public void setShopNum(String shopNum) {
		this.shopNum = shopNum;
	}
	public String getTargetName() {
		return targetName;
	}
	public void setTargetName(String targetName) {
		this.targetName = targetName;
	}
	public String getRequestTime() {
		return requestTime;
	}
	public void setRequestTime(String requestTime) {
		this.requestTime = requestTime;
	}
	public String getRequestHour() {
		return requestHour;
	}
	public void setRequestHour(String requestHour) {
		this.requestHour = requestHour;
	}
	public String getTargetPhone() {
		return targetPhone;
	}
	public void setTargetPhone(String targetPhone) {
		this.targetPhone = targetPhone;
	}
	public String getTargetAddress() {
		return targetAddress;
	}
	public void setTargetAddress(String targetAddress) {
		this.targetAddress = targetAddress;
	}
	public String getShopName() {
		return shopName;
	}
	public void setShopName(String shopName) {
		this.shopName = shopName;
	}
	public String getAuctionName() {
		return auctionName;
	}
	public void setAuctionName(String auctionName) {
		this.auctionName = auctionName;
	}
	public String getAuctionLat() {
		return auctionLat;
	}
	public void setAuctionLat(String auctionLat) {
		this.auctionLat = auctionLat;
	}
	public String getAuctionLng() {
		return auctionLng;
	}
	public void setAuctionLng(String auctionLng) {
		this.auctionLng = auctionLng;
	}
	public int getResponseMoney() {
		return responseMoney;
	}
	public void setResponseMoney(int responseMoney) {
		this.responseMoney = responseMoney;
	}
	
}
