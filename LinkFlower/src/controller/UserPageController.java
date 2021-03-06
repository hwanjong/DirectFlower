package controller;

import hello.annotation.Mapping;
import hello.annotation.RootURL;
import hello.mv.ModelView;

import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mapper.UserMapper;

import bean.Flower;
import bean.Order;
import bean.User;
import dao.OrderInfoDAO;
import dao.UserDAO;


@RootURL("/user")
public class UserPageController {
	
	@Mapping(url="/orderInfo.ap") //bean 사용 안할시 bean 빼면됨
	ModelView getOrderInfo(HttpServletRequest request,HttpServletResponse response){ // bean 사용 안할시 Object bean 빼면됨
		
		ModelView mv = new ModelView("/user/orderInfo");
		String userId = ((User)request.getSession().getAttribute("user")).getUserId();
		System.out.println("[userpage] "+userId+" ("+new Date()+") - "+mv.getView());
		OrderInfoDAO orderinfoDAO = new OrderInfoDAO();
		ArrayList<Order> orderList = orderinfoDAO.getOrderInfoId(userId);

		mv.setModel("orderList", orderList);
		
		return mv;
	}

	@Mapping(url="/info.ap")
	ModelView getTest(HttpServletRequest request,HttpServletResponse response){
		ModelView mv = new ModelView("/user/userInfo");
		return mv;
	}
	@Mapping(url="/info.ap",method="POST", bean="bean.User")
	ModelView changeInfo(HttpServletRequest request,HttpServletResponse response,Object bean){
		User user = (User) bean;
		UserDAO userDao= new UserDAO();
		ModelView mv = new ModelView("/user/orderInfo");
		if(userDao.changeInfo(user)){
			request.getSession().setAttribute("user", user);
		}else{
			mv.setView("/check/fail");
			mv.setModel("error", "101");
		}
		return mv;
	}
	
	@Mapping(url="/like.ap")
	ModelView getUserLike(HttpServletRequest request, HttpServletResponse response){
		ModelView mv = new ModelView("/user/userLike");
		String userId = ((User) request.getSession().getAttribute("user")).getUserId();
		UserDAO userDao = new UserDAO();
		ArrayList<Flower> likeShoplist =  userDao.getLikeShop(userId);
		mv.setModel("likeShopList", likeShoplist);
		
		return mv;
	}
	
	@Mapping(url="/adminAuction.ap")
	ModelView getAdminAuction(HttpServletRequest request, HttpServletResponse response){
		ModelView mv = new ModelView("/user/adminAuction");
		String userId = ((User) request.getSession().getAttribute("user")).getUserId();
		OrderInfoDAO orderInfoDAO = new OrderInfoDAO();
		ArrayList<Order> auctionList = orderInfoDAO.getAuctionInfo(userId);
		ArrayList<Order> applyAuctionList = orderInfoDAO.getApplyAuctionInfo(userId);
		mv.setModel("auctionList", auctionList);
		mv.setModel("applyAuctionList", applyAuctionList);
		return mv;
	}
	
	@Mapping(url="/adminAuction.ap", method="post")
	ModelView applyAdminAuction(HttpServletRequest request, HttpServletResponse response){
		String userId = ((User) request.getSession().getAttribute("user")).getUserId();
		String orderId = request.getParameter("orderId");
		String shopNum = request.getParameter("shopNum");
		System.out.println("[confirm auction]"+userId+": "+orderId+", " + shopNum+" ("+new Date()+")");
		OrderInfoDAO orderInfoDAO = new OrderInfoDAO();
		orderInfoDAO.applyConfirmOrder(orderId, shopNum);
		
		ModelView mv = new ModelView("redirect:/LinkFlower/user/orderInfo.ap");
		return mv;
	}
	
	
//	@Mapping(url="/decotest.ap",bean="bean.BeanTest") //bean 사용 안할시 bean 빼면됨
//	ModelView deco(HttpServletRequest request,HttpServletResponse response,Object bean){ // bean 사용 안할시 Object bean 빼면됨
//		//Model(Bean)
//		BeanTest bt = (BeanTest)bean; //캐스팅해서 적절히 사용
//		ModelView mv = new ModelView("/mypage/decotest");
//
//		//Mybatis 사용예제
//		UserDAO dao = new UserDAO();
//		User user = dao.getUser("younghak@gmail.com");
//		dao.getUserList();
//		mv.setModel("user", user);
//		request.setAttribute("user", new User());
//		//request.setAttribute("model",mv); 가 자동으로 등록됨
//		//따라서 꺼낼시에  ((ModelView)request.getAttribute("model")).getModel("id"); 로 꺼낸다
//		mv.setModel("id", "younghak");
//		return mv;
//	}
	

	/*
	 * Controller 클래스 기본 형태1
	 * @RootURL(Contextpath 제외한 URL에서 앞부분에서 매칭될 부분)
	 * 
	 * 함수의 기본 형태 1
	 * @Mapping(url=RootURL을 제외한 나머지 URL에서 매칭될 부분[,bean=bean의 풀패스 클래스 이름])
	 * ModelView 함수이름(HttpServletRequest request,HttpServletResponse response){
	 * 		ModelView mv = new ModelView(뷰이름);
	 * 		return mv;
	 * }
	 * 
	 * 함수의 기본 형태 2(bean을 사용 하는 경우)
	 * @Mapping(url=RootURL을 제외한 나머지 URL에서 매칭될 부분[,bean=bean의 풀패스 클래스 이름])
	 * ModelView 함수이름(HttpServletRequest request,HttpServletResponse response,Object bean){
	 * 		ModelView mv = new ModelView(뷰이름);
	 * 		return mv;
	 * }
	 */
}