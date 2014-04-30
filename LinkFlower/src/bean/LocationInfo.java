package bean;

import java.io.Serializable;

public class LocationInfo implements Serializable{
	String lat;
	String lng;
	String shopName;
	String address;
	String optionsRadios;
	public String getLat() {
		return lat;
	}
	public void setLat(String lat) {
		this.lat = lat;
	}
	public String getLng() {
		return lng;
	}
	public void setLng(String lng) {
		this.lng = lng;
	}
	public String getShopName() {
		return shopName;
	}
	public void setShopName(String shopName) {
		this.shopName = shopName;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getOptionsRadios() {
		return optionsRadios;
	}
	public void setOptionsRadios(String optionsRadios) {
		this.optionsRadios = optionsRadios;
	}
	

}
