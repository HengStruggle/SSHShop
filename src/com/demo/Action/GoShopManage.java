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

public class GoShopManage extends ActionSupport {
	private CommodityClassService commodityClassService;// 业务逻辑层
	private List<CommodityClass> commodityClasses;// 商品种类列表
	private CommodityService commodityService;// 业务逻辑层
	private List<Commodity> commodities;// 商品信息列表
	//private int commodityClassesCurrentPage;			//商品种类列表当前页
	private int commoditiesCurrentPage;			//商品列表当前页
	// Page commodityClassPage;					//商品种类分页信息
	private Page commodityPage;					//商品分页信息

	public GoShopManage() {
		//初始化参数
		//if(commodityClassesCurrentPage == 0) commodityClassesCurrentPage = 1;
		if(commoditiesCurrentPage == 0) commoditiesCurrentPage = 1;
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
	/*
	public int getCommodityClassesCurrentPage() {
		return commodityClassesCurrentPage;
	}

	public void setCommodityClassesCurrentPage(int commodityClassesCurrentPage) {
		this.commodityClassesCurrentPage = commodityClassesCurrentPage;
	}*/

	public int getCommoditiesCurrentPage() {
		return commoditiesCurrentPage;
	}

	public void setCommoditiesCurrentPage(int commoditiesCurrentPage) {
		this.commoditiesCurrentPage = commoditiesCurrentPage;
	}
/*
	public Page getCommodityClassPage() {
		return commodityClassPage;
	}

	public void setCommodityClassPage(Page commodityClassPage) {
		this.commodityClassPage = commodityClassPage;
	}*/

	public Page getCommodityPage() {
		return commodityPage;
	}

	public void setCommodityPage(Page commodityPage) {
		this.commodityPage = commodityPage;
	}

	public String execute() throws Exception {
		/*
		//商品种类分页
		Page newPage = new Page();				//设置分页信息
		newPage.setCurrentPage(commodityClassesCurrentPage);	//设置当前页
		newPage.setEveryPage(5);				//设置每页显示
		Result commodityClassResult = commodityClassService.findAllCommodityClass(newPage);//获取查询结果
		commodityClassPage = commodityClassResult.getPage();		//获取分页信息*/
		commodityClasses = commodityClassService.findAllCommodityClass();	//获取商品信息列表
		
		//商品分页
		Page newPage = new Page();				//设置分页信息
		newPage.setCurrentPage(commoditiesCurrentPage);	//设置当前页
		newPage.setEveryPage(9);				//设置每页显示
		Result commodityResult = commodityService.findAllCommodity(newPage);//获取查询结果
		commodityPage = commodityResult.getPage();		//获取分页信息
		commodities = commodityResult.getList();	//获取商品信息列表
		return SUCCESS;
	}
}
