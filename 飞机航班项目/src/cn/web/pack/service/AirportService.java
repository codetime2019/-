package cn.web.pack.service;

import java.util.List;

import cn.web.pack.object.Airport;

public interface AirportService {

	/**
	 * o 获取所有的机场信息
	 * 
	 * @return
	 */
	List<Airport> getAirports();

}
