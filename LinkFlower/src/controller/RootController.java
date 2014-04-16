package controller;

import hello.annotation.Mapping;
import hello.annotation.RootURL;
import hello.mv.ModelView;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.UserInfo;

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
	
	@Mapping(url="/join.ap")
	ModelView getJoin(HttpServletRequest request,HttpServletResponse response){
		ModelView mv = new ModelView("/join2");
		return mv;
	}
	
	@Mapping(url="/order.ap")
	ModelView getOrder(HttpServletRequest request,HttpServletResponse response){
		ModelView mv = new ModelView("/order");
		return mv;
	}
	
	@Mapping(url="/findShop.ap",method="POST")
	ModelView getFindShop(HttpServletRequest request,HttpServletResponse response){
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		String select = request.getParameter("optionsRadios");
		String inputValue;
		System.out.println("select : "+select);
		
		if(select.equals("option1")){
			System.out.println("내위치로찾기");
			inputValue="내위치";
		}else if(select.equals("option2")){
			System.out.println(request.getParameter("address"));
			inputValue=request.getParameter("address");
		}else{
			System.out.println(request.getParameter("shopName"));
			inputValue=request.getParameter("shopName");
		}
		
		HttpSession session = request.getSession();
		ModelView mv = new ModelView("/findShop");
		mv.setModel("select", select);
		
		UserInfo user = new UserInfo();
		user.setUserId(select);
		mv.setModel("user", user);
		
		request.setAttribute("value", inputValue);
//		request.setAttribute("model",mv);// 가 자동으로 등록됨
		//따라서 꺼낼시에  ((ModelView)request.getAttribute("model")).getModel("id"); 로 꺼낸다
		return mv;
	}
	
	@Mapping(url="/findShop.ap")
	ModelView getFindShopView(HttpServletRequest request,HttpServletResponse response){

		ModelView mv = new ModelView("/findShop");
		//request.setAttribute("model",mv); 가 자동으로 등록됨
		//따라서 꺼낼시에  ((ModelView)request.getAttribute("model")).getModel("id"); 로 꺼낸다
		return mv;
	}

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