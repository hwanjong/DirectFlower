package controller;

import hello.annotation.Mapping;
import hello.annotation.RootURL;
import hello.mv.ModelView;

import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Flower;
import bean.LocationInfo;
import bean.Order;
import bean.Product;
import bean.User;
import dao.FindShopDAO;
import dao.OrderInfoDAO;
import dao.ShopInfoDAO;
import dao.UserDAO;

@RootURL("/shop")
public class ShopPageController {

	@Mapping(url="/eventPush.ap") //bean 사용 안할시 bean 빼면됨
	ModelView getOrderInfo(HttpServletRequest request,HttpServletResponse response){ // bean 사용 안할시 Object bean 빼면됨

		ModelView mv = new ModelView("/shop/eventPush");
		return mv;
	}

	@Mapping(url="/adminSale.ap") //bean 사용 안할시 bean 빼면됨
	ModelView getAdminSale(HttpServletRequest request,HttpServletResponse response){
		ModelView mv = new ModelView("/shop/adminSale");
		int shopNum = ((User)request.getSession().getAttribute("user")).getShopNum();
		System.out.println("[shopPage] "+shopNum+" ("+new Date()+") - "+mv.getView());
		OrderInfoDAO orderinfoDAO = new OrderInfoDAO();
		ArrayList<Order> orderList = orderinfoDAO.getOrderInfo(shopNum);

		mv.setModel("orderList", orderList);

		return mv;
	}

	@Mapping(url="/adminSale.ap", method="POST") //bean 사용 안할시 bean 빼면됨
	ModelView nextSale(HttpServletRequest request,HttpServletResponse response){
		int orderId = Integer.parseInt(request.getParameter("orderId"));
		OrderInfoDAO orderInfoDAO = new OrderInfoDAO();
		orderInfoDAO.changeNextState(orderId);

		ModelView mv = new ModelView("redirect:/LinkFlower/shop/adminSale.ap");
		return mv;
	}

	@Mapping(url="/adminShop.ap") //bean 사용 안할시 bean 빼면됨
	ModelView getAdminShop(HttpServletRequest request,HttpServletResponse response){

		ModelView mv = new ModelView("/shop/adminShop");
		int shopNum = ((User)request.getSession().getAttribute("user")).getShopNum();

		ShopInfoDAO shopInfoDAO = new ShopInfoDAO();
		ArrayList<Product> productList =  shopInfoDAO.getProductList(shopNum);
		mv.setModel("productList", productList);

		return mv;
	}
	@Mapping(url="/adminShop.ap", method="POST") //bean 사용 안할시 bean 빼면됨
	ModelView saveAdminShop(HttpServletRequest request,HttpServletResponse response){
		int shopNum = ((User)request.getSession().getAttribute("user")).getShopNum();
		//		boolean product = request.getParameter("select").equals("product");

		//		if(product){
		String pId[] = request.getParameterValues("pId");
		String pName[] = request.getParameterValues("pName");
		String pPrice[] = request.getParameterValues("pPrice");
		String special[] = request.getParameterValues("special");
		String deleteList[] = request.getParameterValues("deleteId");
		ArrayList<Product> updateList=new ArrayList<Product>();
		ArrayList<Product> insertList= new ArrayList<Product>();
		System.out.println(shopNum);
		for(int i=0;i<pId.length;i++){
			if(pId[i]=="") {
				//신규상품인경우
				insertList.add(new Product(0, pName[i], Integer.parseInt(pPrice[i]), special[i], shopNum));
			}else{
				//기존상품인경우 업데이트
				updateList.add(new Product(Integer.parseInt(pId[i]), pName[i], Integer.parseInt(pPrice[i]),special[i], shopNum));
			}
		}
		ShopInfoDAO shopInfoDAO = new ShopInfoDAO();
		if(insertList.size()!=0){ //DB삽입
			shopInfoDAO.insertProductList(insertList);
		}
		if(updateList.size()!=0){//DB수정
			shopInfoDAO.updateProductList(updateList);
		}
		//삭제에 대한 처리
		if(deleteList!=null){
			shopInfoDAO.deletetProductList(deleteList);
		}
		//		}


		ModelView mv = new ModelView("redirect:/LinkFlower/shop/adminShop.ap");
		return mv;
	}

	@Mapping(url="/adminEvent.ap") //bean 사용 안할시 bean 빼면됨
	ModelView getAdminEvent(HttpServletRequest request,HttpServletResponse response){
		int shopNum = ((User)request.getSession().getAttribute("user")).getShopNum();
		ModelView mv = new ModelView("/shop/adminEvent");
		UserDAO userDAO = new UserDAO();
		ArrayList<User> likeUserList = new ArrayList<User>();
		likeUserList = userDAO.getLikeUser(shopNum);
		mv.setModel("likeUserList", likeUserList);

		return mv;
	}

	@Mapping(url="/saleAuction.ap") //bean 사용 안할시 bean 빼면됨
	ModelView getSaleAuction(HttpServletRequest request,HttpServletResponse response){

		//이부분다시!!!!
		ModelView mv = new ModelView("/shop/saleAuction");
		int shopNum = ((User)request.getSession().getAttribute("user")).getShopNum();
		ShopInfoDAO shopInfoDAO = new ShopInfoDAO();
		Flower shopinfo = shopInfoDAO.getShopInfo(shopNum);
		LocationInfo locInfo = new LocationInfo();
		locInfo.setLat(shopinfo.getShopLat());
		locInfo.setLng(shopinfo.getShopLng());
		FindShopDAO findShopDAO = new FindShopDAO();
		ArrayList<Order> auctionList = findShopDAO.findRangeAuction(locInfo);
		mv.setModel("auctionList", auctionList);
		mv.setModel("shopInfo", shopinfo);
		return mv;
	}
	@Mapping(url="/applyAuction.ap", method="POST") //bean 사용 안할시 bean 빼면됨
	ModelView applyAuction(HttpServletRequest request,HttpServletResponse response){
		String orderId = request.getParameter("orderId");
		String price = request.getParameter("price");
		int shopNum = ((User)request.getSession().getAttribute("user")).getShopNum();
		OrderInfoDAO orderInfoDAO = new OrderInfoDAO();
		orderInfoDAO.applyAuction(orderId,shopNum,price);
		ModelView mv = new ModelView("redirect:/LinkFlower/shop/saleAuction.ap");
		return mv;
	}
}
