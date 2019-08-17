package cn.web.pack.util;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class OpenSessionView {

	static SqlSession session = null;

	static SqlSessionFactory factory = null;

	static {

		try {
			String ConfigPath = "MybatisConfig.xml";

			InputStream in = Resources.getResourceAsStream(ConfigPath);

			factory = new SqlSessionFactoryBuilder().build(in);

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	static final ThreadLocal<SqlSession> LOCAL = new ThreadLocal<SqlSession>();

	public static SqlSession getsqlseSession() {

		if (LOCAL.get() == null) {

			LOCAL.set(factory.openSession());

		}

		return LOCAL.get();
	}

	public static void close() {

		if (LOCAL.get() != null) {

			LOCAL.get().close();

			LOCAL.remove();

		}

	}

}
