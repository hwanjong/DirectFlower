package dao;

import mapper.ShopMapper;
import mapper.UserMapper;
import mybatis.config.MyBatisManager;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import bean.Flower;
import bean.User;

public class UserDAO {
	public static SqlSessionFactory sqlSessionFactory = MyBatisManager.getInstance();
	
	public boolean addUser(User user){
		SqlSession session = sqlSessionFactory.openSession();

		try{
			UserMapper mapper = session.getMapper(UserMapper.class);
			mapper.insertUser(user);
			session.commit();
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}finally{
			session.close();
		}
		return true;
	}
	
	public User getUser(User user){
		SqlSession session = sqlSessionFactory.openSession();
		User findUser =null;
		try{
			UserMapper mapper = session.getMapper(UserMapper.class);
			findUser=mapper.getUserInfo(user);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		return findUser;
	}
	
	public boolean checkId(String userId){
		SqlSession session = sqlSessionFactory.openSession();
		User findUser =null;
		try{
			UserMapper mapper = session.getMapper(UserMapper.class);
			findUser=mapper.checkId(userId);
			if(findUser==null){
				return false;
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		return true;
	}
	
	public boolean changeInfo(User user){
		SqlSession session = sqlSessionFactory.openSession();
		try{
			UserMapper mapper = session.getMapper(UserMapper.class);
			mapper.changeInfo(user);
			session.commit();
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}finally{
			session.close();
		}
		return true;
	}

	public int addShop(Flower flower){
		SqlSession session = sqlSessionFactory.openSession();

		UserMapper userMapper ;
		ShopMapper shopMapper = null ;
		int newShopNum=0;
		try{
			userMapper = session.getMapper(UserMapper.class);
			shopMapper = session.getMapper(ShopMapper.class);
			User user = flower.getUser();
			
			//샵을먼저넣음
			shopMapper.insertShop(flower);
			session.commit();
			newShopNum = shopMapper.getNewShopNum();
			
			//유저를 넣음
			user.setShopNum(newShopNum);
			userMapper.insertShopUser(user);
			session.commit();
		}catch(Exception e){
			e.printStackTrace();
			//유저넣다가실패하면 꽃집지움
			shopMapper.deleteShop(newShopNum);
			session.commit();
			return 0;
		}finally{
			session.close();
		}
		return newShopNum;
	}
	

}
