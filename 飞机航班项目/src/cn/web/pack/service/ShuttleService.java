package cn.web.pack.service;

import java.util.List;

import cn.web.pack.object.Shuttle;

public interface ShuttleService {

	/**
	 * o 显示所有订单
	 * 
	 * @return
	 */
	List<Shuttle> getShuttles();

	/**
	 * o 根据值显示数据
	 * 
	 * @param startvalue
	 * @param stopvalue
	 * @return
	 */
	List<Shuttle> getList(int startvalue, int stopvalue);

}
