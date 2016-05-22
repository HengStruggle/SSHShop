package com.demo.Action;

import java.io.File;
import java.util.Date;
import java.util.List;

import com.demo.Model.Commodity;
import com.demo.Model.CommodityClass;
import com.demo.Service.CommodityClassService;
import com.demo.Service.CommodityService;
import com.demo.Util.FileToByte;
import com.opensymphony.xwork2.ActionSupport;

public class CommodityUpdateAction extends ActionSupport {
	private CommodityClassService commodityClassService;// 业务逻辑层
	private List<CommodityClass> commodityClasses;// 商品种类列表
	private CommodityService commodityService;//商品业务逻辑组件
	private Integer commodityID;		//商品编号
	private CommodityClass commodityClass;	//商品种类
	private Integer commodityClassID;		//商品种类编号
	private String commodityName;			//商品名称
	private String manufacturer;			//生产厂家
	private String commodityDepict;			//商品描述
	private Double commodityPrice;			//商品价格
	private Double fcPrice;					//帆成网价格
	private Integer commodityAmount;		//商品总数量
	private File uploadImage;					//上传图片文件

	public void setCommodityService(CommodityService commodityService) {
		this.commodityService = commodityService;
	}
	
	public Integer getCommodityID() {
		return commodityID;
	}

	public void setCommodityID(Integer commodityID) {
		this.commodityID = commodityID;
	}

	public CommodityClass getCommodityClass() {
		return commodityClass;
	}

	public void setCommodityClass(CommodityClass commodityClass) {
		this.commodityClass = commodityClass;
	}

	public Integer getCommodityClassID() {
		return commodityClassID;
	}

	public void setCommodityClassID(Integer commodityClassID) {
		this.commodityClassID = commodityClassID;
	}

	public String getCommodityName() {
		return commodityName;
	}

	public void setCommodityName(String commodityName) {
		this.commodityName = commodityName;
	}

	public String getManufacturer() {
		return manufacturer;
	}

	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}

	public String getCommodityDepict() {
		return commodityDepict;
	}

	public void setCommodityDepict(String commodityDepict) {
		this.commodityDepict = commodityDepict;
	}

	public Double getCommodityPrice() {
		return commodityPrice;
	}

	public void setCommodityPrice(Double commodityPrice) {
		this.commodityPrice = commodityPrice;
	}

	public Double getFcPrice() {
		return fcPrice;
	}

	public void setFcPrice(Double fcPrice) {
		this.fcPrice = fcPrice;
	}

	public Integer getCommodityAmount() {
		return commodityAmount;
	}

	public void setCommodityAmount(Integer commodityAmount) {
		this.commodityAmount = commodityAmount;
	}

	public File getUploadImage() {
		return uploadImage;
	}

	public void setUploadImage(File uploadImage) {
		this.uploadImage = uploadImage;
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

	  public void addActionError(String anErrorMessage){
	   String s=anErrorMessage;
	   System.out.println(s);
	  }
	  public void addActionMessage(String aMessage){
	   String s=aMessage;
	   System.out.println(s);
	 
	  }
	  public void addFieldError(String fieldName, String errorMessage){
	   String s=errorMessage;
	   String f=fieldName;
	   System.out.println(s);
	   System.out.println(f);
	 
	  }
	
	public String execute() throws Exception {
		Commodity commodity = commodityService.queryByCommodityID(commodityID);
		commodity.setCommodityDepict(commodityDepict);//设置商品描述
		commodity.setCommodityLeaveNum(commodityAmount);//设置商品剩余数量
		commodity.setCommodityAmount(commodityAmount);//设置商品总数量
		commodity.setCommodityPrice(commodityPrice);//设置商品价格
		commodity.setFcPrice(fcPrice);//设置价格
		commodity.setManufacturer(manufacturer);//设置生成厂家
		commodity.setCommodityName(commodityName);//设置商品名称
		commodity.setRegTime(new Date() );//设置商品上架时间
		File file = getUploadImage();
		if(file != null && file.exists()) {
			commodity.setImage(FileToByte.getBytesFromFile(file));
		}
		commodityService.updateCommodity(commodity);//更新商品
		return SUCCESS;
	}
}
