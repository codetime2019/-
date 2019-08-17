package cn.web.pack.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import cn.web.pack.mapper.AirportMapper;
import cn.web.pack.mapper.ShuttleMapper;
import cn.web.pack.object.Shuttle;
import cn.web.pack.service.ShuttleService;
import cn.web.pack.util.OpenSessionView;

public class ShuttleServiceImpl implements ShuttleService {

	public ShuttleServiceImpl() {

	}

	@Override
	public List<Shuttle> getShuttles() {
		List<Shuttle> list = null;

		SqlSession session = OpenSessionView.getsqlseSession();

		// list = session.selectList("cn.web.pack.mapper.ShuttleMapper.all");

		list = session.getMapper(ShuttleMapper.class).all();

		return list;
	}

	@Override
	public List<Shuttle> getList(int startvalue, int stopvalue) {

		List<Shuttle> list = null;

		SqlSession session = OpenSessionView.getsqlseSession();

		AirportMapper airmapper = session.getMapper(AirportMapper.class);

		String startaddress = null;

		String stopaddress = null;

		if (startvalue != 0) {

			startaddress = airmapper.getAirport(startvalue).getAddress();

		}

		if (stopvalue != 0) {

			stopaddress = airmapper.getAirport(stopvalue).getAddress();

		}

		list = session.getMapper(ShuttleMapper.class).list(startaddress, stopaddress);

		return list;
	}

}
