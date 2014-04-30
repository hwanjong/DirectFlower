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
		User user2 =null;
		try{
			UserMapper mapper = session.getMapper(UserMapper.class);
			System.out.println("여기실행됨"+user.getUserId());
			user2=mapper.getUserInfo(user);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		return user2;
	}
	
	public void changePw(User user){
		SqlSession session = sqlSessionFactory.openSession();
		try{
			UserMapper mapper = session.getMapper(UserMapper.class);
			System.out.println("여기도실행됨");
			mapper.changePw(user);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
	}

}
