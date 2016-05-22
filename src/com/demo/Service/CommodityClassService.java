package com.demo.Service;

import java.util.List;

import com.demo.Model.CommodityClass;
import com.demo.Page.Page;
import com.demo.Page.Result;

public interface CommodityClassService {
	/**
	 * 保存商品种类
	 * @param commodityClass
	 */
	public void addCommodityClass(CommodityClass commodityClass);
	
	/**
	 * 修改商品种类
	 * @param commodityClass
	 */
	public void updateCommodityClass(CommodityClass commodityClass);
	
	/**
	 * 分页查询商品种类
	 * @param page
	 * @return
	 */
	public Result findAllCommodityClass(Page page);
	/**
	 * 查询所有商品种类
	 * @return
	 */
	public List<CommodityClass> findAllCommodityClass();
	/**
	 * 按种类ID查询
	 * @param commodityClassID
	 * @return
	 */
	public CommodityClass queryByID(int commodityClassID);
}
