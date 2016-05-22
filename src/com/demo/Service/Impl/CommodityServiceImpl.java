package com.demo.Service.Impl;

import java.util.List;

import com.demo.Dao.CommodityDAO;
import com.demo.Model.Commodity;
import com.demo.Model.CommodityClass;
import com.demo.Page.Page;
import com.demo.Page.PageUtil;
import com.demo.Page.Result;
import com.demo.Service.CommodityService;

public class CommodityServiceImpl implements CommodityService{
	private CommodityDAO commodityDAO;//注入数据访问层
	public void setCommodityDAO(CommodityDAO commodityDAO) {
		this.commodityDAO = commodityDAO;//设置数据访问层
	}
	public void addCommodity(Commodity commodity) {
		commodityDAO.save(commodity);//完成数据保存
	}
	public void updateCommodity(Commodity commodity) {
		commodityDAO.update(commodity);//完成数据保存
	}
	public Result findAllCommodity(Page page) {
		page = PageUtil.createPage(page, 
				commodityDAO.findAllCount());	//创建分页对象
		List<Commodity> commodityes
				= commodityDAO.findAll(page);	//执行查询
		Result result = new Result();	//创建结果对象
		result.setPage(page);			//设置分页信息
		result.setList(commodityes);//设置商品种类列表
		return result;
	}
	public void deleteCommodity(int commodityID) {
		commodityDAO.delete(commodityID);
	}
	public List<Commodity> queryByRegTime(int num) {
		return commodityDAO.findByTime(num);
	}
	public Commodity queryByCommodityID(int commodityID) {
		return commodityDAO.findByID(commodityID);
	}
	public Result queryByCommodityClass(CommodityClass commodityClass, Page page) {
		page = PageUtil.createPage(page, 
				commodityDAO.findAllCount(commodityClass));	//创建分页对象
		List<Commodity> commodityes
				= commodityDAO.findByClass(commodityClass, page);	//执行查询
		Result result = new Result();	//创建结果对象
		result.setPage(page);			//设置分页信息
		result.setList(commodityes);//设置商品种类列表
		return result;
	}
}
