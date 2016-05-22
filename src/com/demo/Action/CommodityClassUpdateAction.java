package com.demo.Action;

import com.demo.Model.CommodityClass;
import com.demo.Service.CommodityClassService;
import com.opensymphony.xwork2.ActionSupport;

public class CommodityClassUpdateAction extends ActionSupport {
	private Integer commodityClassID;
	private String commodityClassName;		//商品种类名称
	private CommodityClassService commodityClassService;//业务逻辑层

	public Integer getCommodityClassID() {
		return commodityClassID;
	}

	public void setCommodityClassID(Integer commodityClassID) {
		this.commodityClassID = commodityClassID;
	}
	
	public void setCommodityClassName(String commodityClassName) {
		this.commodityClassName = commodityClassName;
	}

	public void setCommodityClassService(CommodityClassService commodityClassService) {
		this.commodityClassService = commodityClassService;
	}

	public String execute() throws Exception {
		CommodityClass commodityClass = commodityClassService.queryByID(commodityClassID);
		commodityClass.setCommodityClassName(commodityClassName);//设置商品种类名称
		commodityClassService.updateCommodityClass(commodityClass);//修改商品种类
		return SUCCESS;
	}


}
