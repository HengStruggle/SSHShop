package com.demo.Action;

import java.util.List;
import java.util.Map;

import com.demo.Model.CommodityClass;
import com.demo.Service.CommodityClassService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ShowCommodityClass extends ActionSupport {
	private CommodityClassService commodityClassService;// 业务逻辑层
	private List<CommodityClass> commodityClasses;// 商品种类列表

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

	@SuppressWarnings("unchecked")
	public String execute() throws Exception {
		Map request = (Map)ActionContext.getContext().get("request");
		commodityClasses = commodityClassService.findAllCommodityClass();// 查询所有的商品种类
		return SUCCESS;
	}

}
