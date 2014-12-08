package dao;

import java.util.ArrayList;

import mapper.OrderMapper;
import mybatis.config.MyBatisManager;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import bean.Order;
import bean.Posting;
import bean.Product;

public class OrderInfoDAO {

	public static SqlSessionFactory sqlSessionFactory = MyBatisManager.getInstance();

	public void insertOrderVisit(Order order){
		SqlSession session = sqlSessionFactory.openSession();

		try{
			OrderMapper mapper = session.getMapper(OrderMapper.class);
			mapper.insertOrderVisit(order);

			int orderId = mapper.getNewOrderId();

			for(Product product: order.getOrderList()){
				mapper.insertOrderMapping(product.getProductId(),product.getAmount(),orderId);
			}
			session.commit();

		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
	}

	public void insertOrderDelivery(Order order) {
		SqlSession session = sqlSessionFactory.openSession();

		try{
			OrderMapper mapper = session.getMapper(OrderMapper.class);
			mapper.insertOrderDelivery(order);

			int orderId = mapper.getNewOrderId();

			for(Product product: order.getOrderList()){
				mapper.insertOrderMapping(product.getProductId(),product.getAmount(),orderId);
			}
			session.commit();

		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}

	}

	public void insertOrderAuction(Order order) {
		SqlSession session = sqlSessionFactory.openSession();

		try{
			OrderMapper mapper = session.getMapper(OrderMapper.class);
			if(order.getOptionsRadios().equals("option1")){
				mapper.insertOrderAuctionVisit(order);
			}else{
				mapper.insertOrderAuctionDelivery(order);
			}

			int orderId = mapper.getNewOrderId();
			order.setOrderId(orderId);

			//연결작업필요
			mapper.addAuctionList(order);
			session.commit();

		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}

	}
	public void applyAuction(String orderId, int shopNum , String price) {
		// TODO Auto-generated method stub
		SqlSession session = sqlSessionFactory.openSession();

		try{
			OrderMapper mapper = session.getMapper(OrderMapper.class);
			mapper.insertApplyAuction(orderId,shopNum,price);
			session.commit();

		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
	}

	public ArrayList<Order> getOrderInfo(int shopNum) {

		SqlSession session = sqlSessionFactory.openSession();
		ArrayList<Order> orderList =null;
		try{
			OrderMapper mapper = session.getMapper(OrderMapper.class);
			orderList = mapper.getOrderInfo(shopNum);

		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		return orderList;

	}
	public ArrayList<Order> getOrderInfoId(String userId) {

		SqlSession session = sqlSessionFactory.openSession();
		ArrayList<Order> orderList =null;
		try{
			OrderMapper mapper = session.getMapper(OrderMapper.class);
			orderList = mapper.getOrderInfoId(userId);
			for(Order order:orderList){
				if(order.getShopNum()!=null)
					order.setShopName(mapper.getShopName(Integer.parseInt(order.getShopNum())));
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		return orderList;

	}

	public ArrayList<Order> getAuctionInfo(String userId){
		SqlSession session = sqlSessionFactory.openSession();
		ArrayList<Order> orderList =null;
		try{
			OrderMapper mapper = session.getMapper(OrderMapper.class);
			orderList = mapper.getMyAuction(userId);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		return orderList;
	}
	public ArrayList<Order> getApplyAuctionInfo(String userId){
		SqlSession session = sqlSessionFactory.openSession();
		ArrayList<Order> orderList =null;
		try{
			OrderMapper mapper = session.getMapper(OrderMapper.class);
			orderList = mapper.getApplyMyAuction(userId);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		return orderList;
	}

	public void changeNextState(int orderId) {
		SqlSession session = sqlSessionFactory.openSession();
		try{
			OrderMapper mapper = session.getMapper(OrderMapper.class);
			String state = mapper.getState(orderId);
			state = Integer.toString((Integer.parseInt(state)+1));
			mapper.updateState(orderId,state);
			session.commit();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}

	}
	
	public void applyConfirmOrder(String orderId, String shopNum ){
		SqlSession session = sqlSessionFactory.openSession();
		try{
			OrderMapper mapper = session.getMapper(OrderMapper.class);
			mapper.updateAuctionOrder(orderId,shopNum);
			mapper.deleteAuctionList(orderId);
			mapper.deleteResponseShopList(orderId,shopNum);
			session.commit();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
	}
	
	public ArrayList<Product> getOrderProductList(int orderId){
		SqlSession session = sqlSessionFactory.openSession();
		ArrayList<Product> productList = null;
		try{
			OrderMapper mapper = session.getMapper(OrderMapper.class);
			productList= mapper.getOrderProductList(orderId);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		return productList;
	}
	
	public void setPosting(Posting post){
		SqlSession session = sqlSessionFactory.openSession();
		try{
			OrderMapper mapper = session.getMapper(OrderMapper.class);
			mapper.addPosting(post);
			mapper.updateState(Integer.parseInt(post.getOrderId()), "5");
			session.commit();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
	}

}
