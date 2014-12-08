package mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import bean.Order;
import bean.Posting;
import bean.Product;

public interface OrderMapper {

	int getNewOrderId();
	void insertOrderMapping(@Param("productId") int productId,@Param("amount") int amount,@Param("orderId") int orderId);
	void insertOrderVisit(Order order);
	void insertOrderDelivery(Order order);
	void insertOrderAuctionVisit(Order order);
	void insertOrderAuctionDelivery(Order order);
	ArrayList<Order> getOrderInfo(int shopNum);
	ArrayList<Order> getOrderInfoId(String userId);
	String getShopName(int shopNum);
	String getState(int orderId);
	void updateState(@Param("orderId") int orderId,@Param("state") String state);
	void addAuctionList(Order order);
	ArrayList<Order> getMyAuction(String userId);
	ArrayList<Order> getApplyMyAuction(String userId);
	void insertApplyAuction(@Param("orderId")String orderId, @Param("shopNum")int shopNum, @Param("price")String price);
	void updateAuctionOrder(@Param("orderId")String orderId, @Param("shopNum")String shopNum);
	void deleteAuctionList(String orderId);
	void deleteResponseShopList(@Param("orderId")String orderId, @Param("shopNum")String shopNum);
	ArrayList<Product> getOrderProductList(int orderId);
	void addPosting(Posting post);
	ArrayList<Posting> getPosting(@Param("shopNum")String shopNum);
	
}
