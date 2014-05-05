package controller;

import hello.annotation.Mapping;
import hello.annotation.RootURL;
import hello.mv.ModelView;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Flower;
import bean.LocationInfo;
import bean.User;
import dao.FindShopDAO;
import dao.ShopInfoDAO;
import dao.UserDAO;

@RootURL("/")
public class RootController {

	@Mapping(url="/main.ap")
	ModelView getMain(HttpServletRequest request,HttpServletResponse response){
		ModelView mv = new ModelView("/main");
		FindShopDAO findShopDao = new FindShopDAO();
		ArrayList<Flower> shopList = findShopDao.getFavoriteShop();
		
		mv.setModel("shopList", shopList);
		
		return mv;
	}

	@Mapping(url="/login.ap")
	ModelView getLogin(HttpServletRequest request,HttpServletResponse response){
		ModelView mv = new ModelView("/login");
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
	
	@Mapping(url="/shopjoin.ap",method="POST", bean="bean.Flower")
	ModelView joinShop(HttpServletRequest request,HttpServletResponse response,Object bean){
		Flower flower = (Flower)bean;
		flower.makeUser();
		
		User user = flower.getUser();
		
		ModelView mv;
		
		UserDAO userDao = new UserDAO();
		int newShopNum = userDao.addShop(flower);
		
		if(newShopNum!=0){
			user.setShopNum(newShopNum);
			request.getSession().setAttribute("user", user);
			mv = new ModelView("redirect:/LinkFlower/main.ap");
		}else{
			mv = new ModelView("/shopjoin");
			mv.setModel("fail", true);
		}
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
		
		ModelView mv = new ModelView("redirect:/LinkFlower/main.ap");
		return mv;
	}
	

	@Mapping(url="/order.ap", method="GET")
	ModelView getOrder(HttpServletRequest request,HttpServletResponse response){
		ModelView mv = new ModelView("/order");
		String shopNum = request.getParameter("id");
		ShopInfoDAO shopInfoDao = new ShopInfoDAO();
		shopInfoDao.countIncreasing(shopNum);
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
		ArrayList<Flower> findRangeShop;
		ModelView mv = new ModelView("/findShop");

		
		FindShopDAO findShopDao = new FindShopDAO();
		findRangeShop=findShopDao.findRangeShop(info);
		System.out.println("범위내 찾은꽃집 : ");
		mv.setModel("shopList", findRangeShop);
		mv.setModel("info", info);
		
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