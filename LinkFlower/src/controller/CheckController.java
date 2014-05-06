package controller;

import hello.annotation.Mapping;
import hello.annotation.RootURL;
import hello.mv.ModelView;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Flower;
import dao.FindShopDAO;
import dao.UserDAO;

@RootURL("/check")
public class CheckController {

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
	
	@Mapping(url="/fail.ap")
	ModelView getFail(HttpServletRequest request,HttpServletResponse response){
		ModelView mv = new ModelView("/fail");
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