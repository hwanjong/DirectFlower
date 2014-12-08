package dao;

import java.util.ArrayList;

import mapper.ShopMapper;
import mybatis.config.MyBatisManager;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import bean.Flower;
import bean.LocationInfo;
import bean.Order;

public class FindShopDAO {

public static SqlSessionFactory sqlSessionFactory = MyBatisManager.getInstance();
	

	public ArrayList<Flower> findNameShop(String shopName){
		SqlSession session = sqlSessionFactory.openSession();
		ArrayList<Flower> findFlower=null;
		try{
			ShopMapper mapper = session.getMapper(ShopMapper.class);
			findFlower = mapper.findShop(shopName);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		return findFlower;
	}
	
	public ArrayList<Flower> findRangeShop(LocationInfo info){
		SqlSession session = sqlSessionFactory.openSession();
		ArrayList<Flower> findRangeShop=null;
		try{
			ShopMapper mapper = session.getMapper(ShopMapper.class);
			findRangeShop = mapper.findRangeShop(info);
			
			//여기서 그각각의 찾은 샵에 물품도 찾아서 달아주자
			for(Flower shop:findRangeShop){
				shop.setProductList(mapper.getProductList(shop.getShopNum()));
				shop.setPhoneNum(mapper.shopPhoneNum(shop.getShopNum()));
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		return findRangeShop;
	}
	
	
	public ArrayList<Flower> getFavoriteShop(){
		SqlSession session = sqlSessionFactory.openSession();
		ArrayList<Flower> favoriteShop=null;
		try{
			ShopMapper mapper = session.getMapper(ShopMapper.class);
			favoriteShop = mapper.getFavoriteShop();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		return favoriteShop;
	}
	public ArrayList<Order> findRangeAuction(LocationInfo info){
		SqlSession session = sqlSessionFactory.openSession();
		ArrayList<Order> auctionList =null;
		try{
			ShopMapper mapper = session.getMapper(ShopMapper.class);
			auctionList = mapper.findRangeAuction(info);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		return auctionList;
	}
	
}
