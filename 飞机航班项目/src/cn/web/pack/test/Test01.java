package cn.web.pack.test;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import cn.web.pack.mapper.AirportMapper;
import cn.web.pack.object.Airport;
import cn.web.pack.object.Shuttle;
import cn.web.pack.service.impl.ShuttleServiceImpl;
import cn.web.pack.util.OpenSessionView;

public class Test01 {

	public static void main(String[] args) {

		try {
			test03();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	static void test01() {

		SqlSessionFactory factory = null;

		SqlSession session = null;

		try {
			String ConfigPath = "MybatisConfig.xml";

			InputStream in = Resources.getResourceAsStream(ConfigPath);

			factory = new SqlSessionFactoryBuilder().build(in);

			session = factory.openSession();

			List<Shuttle> list = session.selectList("cn.web.pack.mapper.ShuttleMapper.all");

			session.commit();
		} catch (Exception e) {

			session.rollback();

			System.out.println(e.getMessage());
		} finally {
			session.close();
		}

	}

	static void test02() {

		SqlSession session = OpenSessionView.getsqlseSession();

		Airport airport = session.getMapper(AirportMapper.class).getAirport(1);

		OpenSessionView.close();

	}

	static void test03() {

		ShuttleServiceImpl impl = new ShuttleServiceImpl();

		List<Shuttle> list = null;

		list = impl.getList(3, 0);

		System.out.println("Test01.test03()");
	}
}
