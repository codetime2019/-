package cn.web.pack.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import cn.web.pack.object.Airport;
import cn.web.pack.service.impl.AirportServiceImpl;

/**
 * Servlet implementation class AirportServlet
 */
@WebServlet("/airport")
public class AirportServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		resp.setHeader("Access-Control-Allow-Origin", "*");

		AirportServiceImpl impl = new AirportServiceImpl();

		List<Airport> list = impl.getAirports();

		resp.getWriter().write(new Gson().toJson(list));

	}

}
