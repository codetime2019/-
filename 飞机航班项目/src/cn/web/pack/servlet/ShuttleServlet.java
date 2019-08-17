package cn.web.pack.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import cn.web.pack.object.Shuttle;
import cn.web.pack.service.impl.ShuttleServiceImpl;

/**
 * Servlet implementation class ShuttleServlet
 */
@WebServlet("/shuttle")
public class ShuttleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ShuttleServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int startValue = Integer.parseInt(req.getParameter("startValue"));

		int stopValue = Integer.parseInt(req.getParameter("stopValue"));

		System.out.println("ShuttleServlet.service()" + startValue + ":" + stopValue);

		List<Shuttle> list = null;

		ShuttleServiceImpl impl = new ShuttleServiceImpl();

		list = impl.getList(startValue, stopValue);

		resp.getWriter().write(new Gson().toJson(list));

	}

}
