package com.demo.Action;

import java.util.List;

import com.demo.Model.Commodity;
import com.demo.Model.CommodityClass;
import com.demo.Service.CommodityClassService;
import com.demo.Service.CommodityService;
import com.opensymphony.xwork2.ActionSupport;

public class ShowCommodity extends ActionSupport {
	private CommodityService commodityService;// 业务逻辑层
	private Commodity commodity;// 商品信息
	private CommodityClassService commodityClassService;// 业务逻辑层
	private List<CommodityClass> commodityClasses;// 商品种类列表
	private int commodityID;

	public CommodityService getCommodityService() {
		return commodityService;
	}

	public void setCommodityService(CommodityService commodityService) {
		this.commodityService = commodityService;
	}

	public Commodity getCommodity() {
		return commodity;
	}

	public void setCommodity(Commodity commodity) {
		this.commodity = commodity;
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

	public int getCommodityID() {
		return commodityID;
	}

	public void setCommodityID(int commodityID) {
		this.commodityID = commodityID;
	}

	public String execute() throws Exception {
		commodityClasses = commodityClassService.findAllCommodityClass();// 查询所有的商品种类
		commodity = commodityService.queryByCommodityID(commodityID);
		return SUCCESS;
	}

}
