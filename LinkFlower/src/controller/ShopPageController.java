package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hello.annotation.Mapping;
import hello.annotation.RootURL;
import hello.mv.ModelView;

@RootURL("/shop")
public class ShopPageController {
	
	@Mapping(url="/eventPush.ap") //bean 사용 안할시 bean 빼면됨
	ModelView getOrderInfo(HttpServletRequest request,HttpServletResponse response){ // bean 사용 안할시 Object bean 빼면됨
		
		ModelView mv = new ModelView("/shop/eventPush");
		return mv;
	}

}
