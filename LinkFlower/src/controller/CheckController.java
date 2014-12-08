package controller;

import hello.annotation.Mapping;
import hello.annotation.RootURL;
import hello.mv.ModelView;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Flower;
import bean.Posting;
import bean.Product;
import bean.User;
import dao.FindShopDAO;
import dao.OrderInfoDAO;
import dao.UserDAO;

@RootURL("/check")
public class CheckController {
	final static String powerUser = "no1";

	@Mapping(url="/idcheck.ap",method="GET")
	ModelView checkId(HttpServletRequest request,HttpServletResponse response){
		String userId = request.getParameter("userid");
		System.out.println(userId);
		ModelView mv = new ModelView("/check/idCheck");

		UserDAO userDao = new UserDAO();
		mv.setModel("userId", userId);
		if(userDao.checkId(userId)==true){
			mv.setModel("checkUser", false);
		}else{
			mv.setModel("checkUser", true);
		}
		return mv;
	}

	@Mapping(url="/searchShop.ap",method="GET")
	ModelView findShop(HttpServletRequest request,HttpServletResponse response){
		ModelView mv = new ModelView("/check/searchShop");

		String shopName = request.getParameter("shopName");
		System.out.println(shopName);
		FindShopDAO findShopDao = new FindShopDAO();
		ArrayList<Flower> shopList = findShopDao.findNameShop(shopName);
		mv.setModel("shopList", shopList );

		return mv;
	}

	@Mapping(url="/searchAddress.ap",method="GET")
	ModelView findAddress(HttpServletRequest request,HttpServletResponse response){
		ModelView mv = new ModelView("/check/searchAddress");

		String address = request.getParameter("address");
		mv.setModel("address", address);

		return mv;
	}
	
	@Mapping(url="/orderList.ap",method="GET")
	ModelView getOrderList(HttpServletRequest request,HttpServletResponse response){
		ModelView mv = new ModelView("/check/orderList");
		
		ArrayList<Product> productList = null;
		int orderId = Integer.parseInt(request.getParameter("orderId"));
		OrderInfoDAO dao = new OrderInfoDAO();
		productList = dao.getOrderProductList(orderId);
		
		mv.setModel("productList", productList);
		
		return mv;
	}
	
	@Mapping(url="/orderList.ap",method="POST",bean="bean.Posting")
	ModelView insertCommnet(HttpServletRequest request,HttpServletResponse response,Object bean){
		ModelView mv = new ModelView("/check/orderList");
		System.out.println("포스트받음");
		Posting posting = (Posting) bean;
		
		OrderInfoDAO dao = new OrderInfoDAO();
		dao.setPosting(posting);
		
		
		return mv;
	}
	

	@Mapping(url="/fail.ap")
	ModelView getFail(HttpServletRequest request,HttpServletResponse response){
		ModelView mv = new ModelView("/fail");
		return mv;
	}

	@Mapping(url="/searchGoogle.ap")
	ModelView search(HttpServletRequest request,HttpServletResponse response){
		ModelView mv = new ModelView("/check/searchShopGoogle");
		return mv;
	}

	@Mapping(url="/searchGoogle.ap", method="post")
	ModelView downloadDataBase(HttpServletRequest request,HttpServletResponse response){
		ModelView mv = new ModelView("redirect:/LinkFlower/check/searchGoogle.ap");
		UserDAO userDao = new UserDAO();
		String userId = null;
		if(request.getSession().getAttribute("user")!=null){
			userId = ((User) request.getSession().getAttribute("user")).getUserId();
		}
		if(userId==null || !userId.equals(powerUser)){
			mv= new ModelView("/check/fail");
			mv.setModel("error", 999);
			return mv;
		}else {
			System.out.println("이프문밖");
			String shopName[] = request.getParameterValues("shopName");
			String shopLat[] = request.getParameterValues("shopLat");
			String shopLng[] = request.getParameterValues("shopLng");
			String shopAddress[] = request.getParameterValues("shopAddress");
			System.out.println("구글에서 받은 데이터수 : "+shopName.length);
			for(int i=0; i<shopName.length;i++){
				Flower flower = new Flower();
				flower.setUserId("null");
				flower.setName("임시");
				flower.setPw("123");
				flower.setPhoneNum("010-0000-0000");
				flower.setShopName(shopName[i]);
				flower.setShopLocation(shopAddress[i]);
				flower.setShopLat(shopLat[i]);
				flower.setShopLng(shopLng[i]);
				flower.setEventComment("임시이벤트");
				flower.makeUser();
				userDao.addShop(flower,2);
			}
		}
		return mv;
	}

	@Mapping(url="/registLike.ap", method="GET")
	ModelView registerLike(HttpServletRequest request,HttpServletResponse response){
		ModelView mv = new ModelView("/check/registLike");
		String userId = ((User) request.getSession().getAttribute("user")).getUserId();
		String shopNum = request.getParameter("shopNum");

		UserDAO userDAO = new UserDAO();
		userDAO.registLike(userId,shopNum);

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