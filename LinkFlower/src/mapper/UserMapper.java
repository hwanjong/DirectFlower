package mapper;

import bean.User;

public interface UserMapper {
	void insertUser(User user);
	void insertShopUser(User user);
	User getUserInfo(User user);
	User checkId(String userId);
	void changeInfo(User user);
}
