package dao;

import mapper.UserMapper;
import mybatis.config.MyBatisManager;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

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
	

}
