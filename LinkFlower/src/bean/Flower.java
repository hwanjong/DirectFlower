package bean;

import java.io.Serializable;
import java.util.ArrayList;

public class Flower implements Serializable{
	private User user;
	private String userId;
	private String pw;
	private String name;
	private String phoneNum;
	
	private int shopNum;
	private String shopName;
	private String shopLocation;
	private String shopLat;
	private String shopLng;
	private Object shopPhoto;
	private String eventComment;
	private int eventCount;
	private ArrayList<Product> productList;
	
	//포스팅관련 변수
	private ArrayList<Posting> postingList;
	private float scoreAverage;
	
	
	public ArrayList<Product> getProductList() {
		return productList;
	}
	public void setProductList(ArrayList<Product> productList) {
		this.productList = productList;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhoneNum() {
		return phoneNum;
	}
	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}
	public int getShopNum() {
		return shopNum;
	}
	public void setShopNum(int shopNum) {
		this.shopNum = shopNum;
	}
	public String getShopName() {
		return shopName;
	}
	public void setShopName(String shopName) {
		this.shopName = shopName;
	}
	public String getShopLocation() {
		return shopLocation;
	}
	public void setShopLocation(String shopLocation) {
		this.shopLocation = shopLocation;
	}
	public String getShopLat() {
		return shopLat;
	}
	public void setShopLat(String shopLat) {
		this.shopLat = shopLat;
	}
	public String getShopLng() {
		return shopLng;
	}
	public void setShopLng(String shopLng) {
		this.shopLng = shopLng;
	}
	public Object getShopPhoto() {
		return shopPhoto;
	}
	public void setShopPhoto(Object shopPhoto) {
		this.shopPhoto = shopPhoto;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	public void makeUser(){
		this.user = new User();
		user.setUserId(userId);
		user.setPw(pw);
		user.setName(name);
		user.setPhoneNum(phoneNum);
		
		this.eventCount=0;
	}
	public String getEventComment() {
		return eventComment;
	}
	public void setEventComment(String eventComment) {
		this.eventComment = eventComment;
	}
	public int getEventCount() {
		return eventCount;
	}
	public void setEventCount(int eventCount) {
		this.eventCount = eventCount;
	}
	public ArrayList<Posting> getPostingList() {
		return postingList;
	}
	public void setPostingList(ArrayList<Posting> postingList) {
		this.postingList = postingList;
	}
	public float getScoreAverage() {
		return scoreAverage;
	}
	public void setScoreAverage(float scoreAverage) {
		this.scoreAverage = scoreAverage;
	}

}
