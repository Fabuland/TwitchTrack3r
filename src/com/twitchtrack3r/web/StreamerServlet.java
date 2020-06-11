package com.twitchtrack3r.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.twitchtrack3r.dao.StreamerDao;
import com.twitchtrack3r.model.Streamer;

/**
 * Servlet implementation class StreamerServlet
 */
@WebServlet("/")
public class StreamerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private StreamerDao streamerDao;

	public void init() {
		streamerDao = new StreamerDao();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getServletPath();

		try {
			switch (action) {
			case "/new":
				showNewForm(request, response);
				break;
			case "/insert":
				insertStreamer(request, response);
				break;
			case "/delete":
				deleteStreamer(request, response);
				break;
			case "/edit":
				showEditForm(request, response);
				break;
			case "/update":
				updateStreamer(request, response);
				break;
			default:
				listStreamer(request, response);
				break;
			}
		} catch (SQLException ex) {
			throw new ServletException(ex);
		}
	}

	private void listStreamer(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		List<Streamer> listStreamer = streamerDao.selectAllStreamers();
		request.setAttribute("listStreamer", listStreamer);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/streamer-list.jsp");
		dispatcher.forward(request, response);
	}

	private void showNewForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/streamer-form.jsp");
		dispatcher.forward(request, response);
	}

	private void showEditForm(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		Streamer existingStreamer = streamerDao.selectStreamer(id);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/streamer-form.jsp");
		request.setAttribute("Streamer", existingStreamer);
		dispatcher.forward(request, response);

	}

	private void insertStreamer(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		String name = request.getParameter("name");
		String online = request.getParameter("online");
		Integer subscribers = parseToNumber(request.getParameter("subscribers"));
		Integer followers = parseToNumber(request.getParameter("followers"));
		Integer category_id = parseToNumber(request.getParameter("category_id"));
		System.out.println(name + online + subscribers + followers + category_id);
		Streamer newStreamer = new Streamer(name, online, subscribers, followers, category_id);
		streamerDao.insertStreamer(newStreamer);
		response.sendRedirect("list");
	}

	private void updateStreamer(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		String online = request.getParameter("online");
		int subscribers = Integer.parseInt(request.getParameter("subscribers"));
		Integer followers = Integer.parseInt(request.getParameter("followers"));
		Integer category_id = Integer.parseInt(request.getParameter("category_id"));

		Streamer streamer = new Streamer(id, name, online, subscribers, followers, category_id);
		streamerDao.updateStreamer(streamer);
		response.sendRedirect("list");
	}

	private void deleteStreamer(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		streamerDao.deleteStreamer(id);
		response.sendRedirect("list");

	}
	
	private Integer parseToNumber(String receivedParam)
	{
	    System.out.println("received param:"+receivedParam);
	    if (receivedParam != null && !receivedParam.trim().isEmpty())
	    {
	        try
	        {
	            return Integer.parseInt(receivedParam.trim());
	        }
	        catch (NumberFormatException nfe)
	        {
	            System.out.println("received param is not a number");
	            return null;
	        }
	    }
	    else
	    {
	        System.out.println("received param is null or empty");
	        return null;
	    }
	}

}
