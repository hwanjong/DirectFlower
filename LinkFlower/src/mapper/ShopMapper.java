package mapper;

import java.util.ArrayList;

import bean.Flower;
import bean.LocationInfo;

public interface ShopMapper {
	void insertShop(Flower flower);
	int getNewShopNum();
	void deleteShop(int shopNum);
	ArrayList<Flower> findShop(String shopName);
	ArrayList<Flower> findRangeShop(LocationInfo info);
	ArrayList<Flower> getFavoriteShop();
	void shopCountUp(String shopNum);
}
