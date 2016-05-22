package com.demo.Service;

import java.util.List;

import com.demo.Model.Commodity;
import com.demo.Model.CommodityClass;
import com.demo.Page.Page;
import com.demo.Page.Result;

public interface CommodityService {
	/**
	 * 保存商品
	 * @param commodity
	 */
	public void addCommodity(Commodity commodity);
	/**
	 * 修改商品
	 * @param commodity
	 */
	public void updateCommodity(Commodity commodity);
	/**
	 * 分页查询商品
	 * @param page
	 * @return
	 */
	public Result findAllCommodity(Page page);
	/**
	 * 按ID删除商品
	 * @param commodityID
	 */
	public void deleteCommodity(int commodityID);
	/**
	 * 按提交时间倒序查找
	 * @param num
	 * @return
	 */
	public List<Commodity> queryByRegTime(int num);
	/**
	 * 按ID查找商品
	 * @param commodityID
	 * @return
	 */
	public Commodity queryByCommodityID(int commodityID);
	/**
	 * 按商品种类分页查询
	 * @param commodityClass
	 * @param page
	 * @return
	 */
	public Result queryByCommodityClass(CommodityClass commodityClass,Page page);
}
