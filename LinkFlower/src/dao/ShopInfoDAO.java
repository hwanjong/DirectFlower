package dao;

import java.util.ArrayList;

import mapper.OrderMapper;
import mapper.ShopMapper;
import mybatis.config.MyBatisManager;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import bean.Flower;
import bean.Posting;
import bean.Product;


public class ShopInfoDAO {
public static SqlSessionFactory sqlSessionFactory = MyBatisManager.getInstance();
	

	public void countIncreasing(String shopNum){
		SqlSession session = sqlSessionFactory.openSession();
		try{
			ShopMapper mapper = session.getMapper(ShopMapper.class);
			mapper.shopCountUp(shopNum);
			session.commit();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
	}
	
	public void insertProductList(ArrayList<Product> productList){
		SqlSession session = sqlSessionFactory.openSession();

		try{
			ShopMapper mapper = session.getMapper(ShopMapper.class);
			for(Product product:productList){
				mapper.insertProduct(product);
			}
			session.commit();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
	}
	
	public void deletetProductList(String[] productList){
		SqlSession session = sqlSessionFactory.openSession();

		try{
			ShopMapper mapper = session.getMapper(ShopMapper.class);
			for(String productId:productList){
				mapper.deleteProduct(productId);
			}
			session.commit();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
	}
	
	
	public void updateProductList(ArrayList<Product> productList){
		SqlSession session = sqlSessionFactory.openSession();

		try{
			ShopMapper mapper = session.getMapper(ShopMapper.class);
			for(Product product:productList){
				mapper.updateProduct(product);
			}
			session.commit();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
	}
	
	public ArrayList<Product> getProductList(int shopNum){
		SqlSession session = sqlSessionFactory.openSession();
		ArrayList<Product> productList=null;
		try{
			ShopMapper mapper = session.getMapper(ShopMapper.class);
			productList = mapper.getProductList(shopNum);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		return productList;
	}
	
	public String getShopPhoneNum(int shopNum){
		SqlSession session = sqlSessionFactory.openSession();
		String phoneNum=null;
		try{
			ShopMapper mapper = session.getMapper(ShopMapper.class);
			phoneNum=mapper.shopPhoneNum(shopNum);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		return phoneNum;
	} 
	public Flower getShopInfo(int shopNum){
		SqlSession session = sqlSessionFactory.openSession();
		Flower flower=null;
		try{
			ShopMapper mapper = session.getMapper(ShopMapper.class);
			flower=mapper.getFlowerInfo(shopNum);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		return flower;
	}
	
	public ArrayList<Posting> getPosting(String shopNum){
		SqlSession session = sqlSessionFactory.openSession();
		ArrayList<Posting> postingList = null;
		try{
			OrderMapper mapper = session.getMapper(OrderMapper.class);
			postingList=mapper.getPosting(shopNum);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		return postingList;
	}
	
}
