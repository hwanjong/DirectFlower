package dao;

import java.util.ArrayList;

import mapper.ShopMapper;
import mybatis.config.MyBatisManager;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;


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
	
	
}
