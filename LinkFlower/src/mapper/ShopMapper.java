package mapper;

import java.util.ArrayList;

import bean.Flower;
import bean.LocationInfo;
import bean.Order;
import bean.Product;

public interface ShopMapper {
	void insertShop(Flower flower);
	int getNewShopNum();
	void deleteShop(int shopNum);
	ArrayList<Flower> findShop(String shopName);
	ArrayList<Flower> findRangeShop(LocationInfo info);
	ArrayList<Order> findRangeAuction(LocationInfo info);
	ArrayList<Flower> getFavoriteShop();
	void shopCountUp(String shopNum);
	void insertProduct(Product product);
	ArrayList<Product> getProductList(int shopNum);
	void updateProduct(Product product);
	String shopPhoneNum(int shopNum);
	Flower getFlowerInfo(int shopNum);
	ArrayList<Flower> getLikeShop(String userId);
	void deleteProduct(String productId);
}
	