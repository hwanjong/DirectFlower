package dao;

import java.util.ArrayList;

import mapper.ShopMapper;
import mybatis.config.MyBatisManager;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import bean.Flower;
import bean.LocationInfo;

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
	
	
}
