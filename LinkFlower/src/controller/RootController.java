package controller;

import hello.annotation.Mapping;
import hello.annotation.RootURL;
import hello.mv.ModelView;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.startup.UserDatabase;

import dao.UserDAO;

import bean.LocationInfo;
import bean.User;

@RootURL("/")
public class RootController {

	@Mapping(url="/main.ap")
	ModelView getMain(HttpServletRequest request,HttpServletResponse response){
		ModelView mv = new ModelView("/main");
		return mv;
	}

	@Mapping(url="/login.ap")
	ModelView getLogin(HttpServletRequest request,HttpServletResponse response){
		ModelView mv = new ModelView("/login");
		return mv;
	}
	
	@Mapping(url="/idcheck.ap",method="GET")
	ModelView checkId(HttpServletRequest request,HttpServletResponse response){
		String user_id = request.getParameter("userid");
		System.out.println(user_id);
		ModelView mv = new ModelView("/idCheck");
		
		UserDAO userDao = new UserDAO();
		if(userDao.checkId(user_id)==true){
			mv.setModel("checkUser", false);
		}else{
			mv.setModel("checkUser", true);
		}
		return mv;
	}
	@Mapping(url="/fail.ap")
	ModelView getFail(HttpServletRequest request,HttpServletResponse response){
		ModelView mv = new ModelView("/fail");
		return mv;
	}
	
	@Mapping(url="/popupLogin.ap")
	ModelView getPopupLoginl(HttpServletRequest request,HttpServletResponse response){
		ModelView mv = new ModelView("/popupLogin");
		return mv;
	}
	

	@Mapping(url="/login.ap",method="POST")
	ModelView findId(HttpServletRequest request,HttpServletResponse response){
		HttpSession session =  request.getSession();
		ModelView mv = null;
		User user = new User();
		user.setUserId(request.getParameter("userId"));
		user.setPw(request.getParameter("pw"));
		
		UserDAO userDao = new UserDAO();
		User findUser = userDao.getUser(user);
		
		if(findUser!=null){
			session.setAttribute("user", findUser);
			System.out.println(findUser.getPhoneNum());
			mv = new ModelView("redirect:/LinkFlower/main.ap");
		}else{
			System.out.println("못찾음");
			mv = new ModelView("/login");
			mv.setModel("fail", true);
		}
		return mv;
	}
	@Mapping(url="/logout.ap")
	ModelView logout(HttpServletRequest request,HttpServletResponse response){
		HttpSession session = request.getSession();
		session.invalidate();
		ModelView mv = new ModelView("redirect:/LinkFlower/main.ap");
		return mv;
	}
	
	@Mapping(url="/join.ap")
	ModelView getJoin(HttpServletRequest request,HttpServletResponse response){
		ModelView mv = new ModelView("/join2");
		return mv;
	}
	@Mapping(url="/shopjoin.ap")
	ModelView getShopJoin(HttpServletRequest request,HttpServletResponse response){
		ModelView mv = new ModelView("/shopjoin");
		return mv;
	}
	
	@Mapping(url="/personjoin.ap")
	ModelView getPersonJoin(HttpServletRequest request,HttpServletResponse response){
		ModelView mv = new ModelView("/personjoin");
		return mv;
	}
	@Mapping(url="/personjoin.ap",method="POST",bean="bean.User")
	ModelView joinUser(HttpServletRequest request,HttpServletResponse response,Object bean){
		User user = (User)bean;
		UserDAO userDao = new UserDAO();
		if(userDao.addUser(user)){
			System.out.println("성공");
			request.getSession().setAttribute("user", user);
			request.getSession().removeAttribute("error");
		}else{
			System.out.println("실패");
			ModelView mv = new ModelView("/personjoin");
			mv.setModel("fail", true);
			return mv;
		}
		
		ModelView mv = new ModelView("/main");
		return mv;
	}
	

	@Mapping(url="/order.ap")
	ModelView getOrder(HttpServletRequest request,HttpServletResponse response){
		ModelView mv = new ModelView("/order");
		return mv;
	}

	@Mapping(url="/findshop.ap",method="POST",bean="bean.LocationInfo")
	ModelView getFindShop(HttpServletRequest request,HttpServletResponse response,Object bean){
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		LocationInfo info = (LocationInfo) bean;
		System.out.println(info.getLat());
		System.out.println(info.getLng());
		String select = info.getOptionsRadios();
		String inputValue = null;
		System.out.println("select : "+select);
		//select도 빈으로 테스트해보는중이였음
		if(select.equals("option1")){
			System.out.println("내위치로찾기");
	  		inputValue="내위치";
		}else if(select.equals("option2")&&info.getLat()!=""){
			System.out.println(request.getParameter("address"));
			inputValue=request.getParameter("address");
		}else if(select.equals("option3")){
			System.out.println(request.getParameter("shopName"));
			inputValue=request.getParameter("shopName");
		}

		HttpSession session = request.getSession();

		ModelView mv = new ModelView("/findShop");
		mv.setModel("info", info);

		request.setAttribute("value", inputValue);
		
		//		request.setAttribute("model",mv);// 가 자동으로 등록됨
		//따라서 꺼낼시에  ((ModelView)request.getAttribute("model")).getModel("id"); 로 꺼낸다
		return mv;
	}

//	@Mapping(url="/findShop.ap")
//	ModelView getFindShopView(HttpServletRequest request,HttpServletResponse response){
//
//		ModelView mv = new ModelView("/findShop");
//		//request.setAttribute("model",mv); 가 자동으로 등록됨
//		//따라서 꺼낼시에  ((ModelView)request.getAttribute("model")).getModel("id"); 로 꺼낸다
//		return mv;
//	}

	//	Controller 클래스 기본 형태1
	//	@RootURL(Contextpath 제외한 URL에서 앞부분에서 매칭될 부분)
	//	
	//	함수의 기본 형태 1
	//	@Mapping(url=RootURL을 제외한 나머지 URL에서 매칭될 부분[,bean=bean의 풀패스 클래스 이름])
	//	ModelView 함수이름(HttpServletRequest request,HttpServletResponse response){
	//	ModelView mv = new ModelView(뷰이름);
	//	return mv;
	//	}

	//	함수의 기본 형태 2(bean을 사용 하는 경우)
	//	@Mapping(url=RootURL을 제외한 나머지 URL에서 매칭될 부분[,bean=bean의 풀패스 클래스 이름])
	//	ModelView 함수이름(HttpServletRequest request,HttpServletResponse response,Object bean){
	//	ModelView mv = new ModelView(뷰이름);
	//	return mv;
	//	}

}