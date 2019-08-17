package cn.web.pack.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import cn.web.pack.mapper.AirportMapper;
import cn.web.pack.object.Airport;
import cn.web.pack.service.AirportService;
import cn.web.pack.util.OpenSessionView;

public class AirportServiceImpl implements AirportService {

	private SqlSession session = null;

	public AirportServiceImpl() {

		/*
		 * try { String ConfigPath = "MybatisConfig.xml";
		 * 
		 * InputStream in = Resources.getResourceAsStream(ConfigPath);
		 * 
		 * SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(in);
		 * 
		 * this.session = factory.openSession();
		 * 
		 * } catch (IOException e) { // TODO Auto-generated catch block
		 * e.printStackTrace(); }
		 */

	}

	@Override
	public List<Airport> getAirports() {

		List<Airport> list = null;

		try {

			AirportMapper mapper = OpenSessionView.getsqlseSession().getMapper(AirportMapper.class);

			list = mapper.all();

		} catch (Exception e) {

			e.printStackTrace();

		}

		return list;
	}

}
