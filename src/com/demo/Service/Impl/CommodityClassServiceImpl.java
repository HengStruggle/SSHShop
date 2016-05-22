package com.demo.Service.Impl;

import java.util.List;

import com.demo.Dao.CommodityClassDAO;
import com.demo.Model.CommodityClass;
import com.demo.Page.Page;
import com.demo.Page.PageUtil;
import com.demo.Page.Result;
import com.demo.Service.CommodityClassService;

public class CommodityClassServiceImpl implements CommodityClassService{
	private CommodityClassDAO commodityClassDAO;//注入数据访问层
	public void setCommodityClassDAO(CommodityClassDAO commodityClassDAO) {
		this.commodityClassDAO = commodityClassDAO;//设置数据访问层
	}
	public void addCommodityClass(CommodityClass commodityClass) {
		commodityClassDAO.save(commodityClass);//完成数据保存
	}
	public void updateCommodityClass(CommodityClass commodityClass){
		commodityClassDAO.update(commodityClass);
	}
	
	public Result findAllCommodityClass(Page page) {
		page = PageUtil.createPage(page, 
				commodityClassDAO.findAllCount());	//创建分页对象
		List<CommodityClass> commodityClasses
				= commodityClassDAO.findAll(page);	//执行查询
		Result result = new Result();	//创建结果对象
		result.setPage(page);			//设置分页信息
		result.setList(commodityClasses);//设置商品种类列表
		return result;
	}
	public List<CommodityClass> findAllCommodityClass() {
		return commodityClassDAO.findAll();
	}
	public CommodityClass queryByID(int commodityClassID) {
		return commodityClassDAO.findByID(commodityClassID);
	}
}
