package com.demo.Dao;

import java.util.List;

import com.demo.Model.Commodity;
import com.demo.Model.CommodityClass;
import com.demo.Page.Page;

public interface CommodityDAO {
	/**
	 * 保存商品信息
	 * @param commodity
	 */
	public void save(Commodity commodity);
	
	/**
	 * 修改商品信息
	 * @param commodity
	 */
	public void update(Commodity commodity);
	
	/**
	 * 分页查询所有的商品
	 * @param page
	 * @return
	 */
	public List<Commodity> findAll(Page page);
	/**
	 * 查询所有记录数
	 * @return
	 */
	public int findAllCount();
	/**
	 * 删除商品信息
	 * @param commodityID
	 */
	public void delete(int commodityID);
	/**
	 * 按时间倒序查找
	 * @param num
	 * @return
	 */
	public List<Commodity> findByTime(int num);
	/**
	 * 按ID查找
	 * @param commodityID
	 * @return
	 */
	public Commodity findByID(int commodityID);
	/**
	 * 按商品种类查找
	 * @param commodityClass
	 * @param page
	 * @return
	 */
	public List<Commodity> findByClass(CommodityClass commodityClass,Page page);
	/**
	 * 查询分类记录数
	 * @param commodityClass
	 * @return
	 */
	public int findAllCount(CommodityClass commodityClass);
}
