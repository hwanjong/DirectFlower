package mapper;

import bean.User;

public interface UserMapper {
	void insertUser(User user);
	User getUserInfo(User user);
	void changePw(User user);
}
