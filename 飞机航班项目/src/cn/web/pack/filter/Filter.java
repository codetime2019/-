package cn.web.pack.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import cn.web.pack.util.OpenSessionView;

@WebFilter("/*")
public class Filter implements javax.servlet.Filter {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {

		System.out.println("Filter.init()");

		javax.servlet.Filter.super.init(filterConfig);
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		SqlSession session = OpenSessionView.getsqlseSession();
		try {

			// o 设置请求格式
			request.setCharacterEncoding("utf-8");

			// o 设置响应格式
			response.setContentType("text/html;charset=utf-8");
			HttpServletResponse resp = (HttpServletResponse) response;
			resp.setHeader("Access-Control-Allow-Origin", "*");

			// o 放行
			chain.doFilter(request, response);

			session.commit();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

			session.rollback();
		} finally {
			OpenSessionView.close();

		}

	}

	@Override
	public void destroy() {

		System.out.println("Filter.destroy()");

		javax.servlet.Filter.super.destroy();
	}
}
