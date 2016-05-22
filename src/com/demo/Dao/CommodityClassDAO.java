package com.demo.Dao;

import java.util.List;

import com.demo.Model.CommodityClass;
import com.demo.Page.Page;

public interface CommodityClassDAO {
	/**
	 * 保存商品种类
	 * @param commodityclass
	 */
	public void save(CommodityClass commodityclass);
	/**
	 * 修改商品种类
	 * @param commodityclass
	 */
	public void update(CommodityClass commodityclass);
	/**
	 * 分页查询所有的商品种类
	 * @param page
	 * @return
	 */
	public List<CommodityClass> findAll(Page page);
	/**
	 * 查询所有记录数
	 * @return
	 */
	public int findAllCount();
	/**
	 * 查询所有记录数
	 * @return
	 */
	public List<CommodityClass> findAll();
	/**
	 * 按种类ID查找
	 * @param commodityClassID
	 * @return
	 */
	public CommodityClass findByID(int commodityClassID);
}
