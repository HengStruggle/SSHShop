package com.demo.Action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.demo.Model.Commodity;
import com.demo.Model.CommodityClass;
import com.demo.Page.Page;
import com.demo.Page.Result;
import com.demo.Service.CommodityClassService;
import com.demo.Service.CommodityService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class GoShop extends ActionSupport {
	private CommodityClassService commodityClassService;// 业务逻辑层
	private List<CommodityClass> commodityClasses;// 商品种类列表
	private CommodityService commodityService;// 业务逻辑层
	private List<Commodity> commodities;// 商品信息列表
	private int currentPage;			//当前页
	private Page page;					//分页信息

	public GoShop() {
		//初始化参数
		if(currentPage == 0) currentPage = 1;
		Map session = ActionContext.getContext().getSession();
		if(session.get("car") == null) {	//如果session中不存在购物车
			List<Commodity> car = new ArrayList<Commodity>();	//新建一个ArrayList实例作为购物车
				session.put("car", car);//将购物车放在session里
		}
	}
	
	public CommodityClassService getCommodityClassService() {
		return commodityClassService;
	}

	public void setCommodityClassService(
			CommodityClassService commodityClassService) {
		this.commodityClassService = commodityClassService;
	}

	public List<CommodityClass> getCommodityClasses() {
		return commodityClasses;
	}

	public void setCommodityClasses(List<CommodityClass> commodityClasses) {
		this.commodityClasses = commodityClasses;
	}

	public CommodityService getCommodityService() {
		return commodityService;
	}

	public void setCommodityService(CommodityService commodityService) {
		this.commodityService = commodityService;
	}

	public List<Commodity> getCommodities() {
		return commodities;
	}

	public void setCommodities(List<Commodity> commodities) {
		this.commodities = commodities;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public Page getPage() {
		return page;
	}

	public void setPage(Page page) {
		this.page = page;
	}
	
	public String execute() throws Exception {
		
		commodityClasses = commodityClassService.findAllCommodityClass();// 查询所有的商品种类
		Page newPage = new Page();				//设置分页信息
		newPage.setCurrentPage(currentPage);	//设置当前页
		newPage.setEveryPage(3);				//设置每页显示
		Result result = commodityService.findAllCommodity(newPage);//获取查询结果
		page = result.getPage();		//获取分页信息
		commodities = result.getList();	//获取商品信息列表
		return SUCCESS;
	}

}
