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

import com.twitchtrack3r.dao.LoginDao;
import com.twitchtrack3r.dao.StreamerDao;
import com.twitchtrack3r.dao.UserDao;
import com.twitchtrack3r.model.Login;
import com.twitchtrack3r.model.Streamer;
import com.twitchtrack3r.model.User;

/**
 * Servlet implementation class StreamerServlet
 */
@WebServlet("/")
public class StreamerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private StreamerDao streamerDao;
	private UserDao userDao;
	private LoginDao loginDao;

	public void init() {
		streamerDao = new StreamerDao();
		userDao = new UserDao();
		loginDao = new LoginDao();
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
			case "/newStreamer":
				showNewStreamerForm(request, response);
				break;
			case "/insertStreamer":
				insertStreamer(request, response);
				break;
			case "/deleteStreamer":
				deleteStreamer(request, response);
				break;
			case "/editStreamer":
				showEditStreamerForm(request, response);
				break;
			case "/updateStreamer":
				updateStreamer(request, response);
				break;
			case "/newUser":
				showNewUserForm(request, response);
				break;
			case "/insertUser":
				insertUser(request, response);
				break;
			case "/deleteUser":
				deleteUser(request, response);
				break;
			case "/editUser":
				showEditUserForm(request, response);
				break;
			case "/updateUser":
				updateUser(request, response);
				break;
			case "/listUser":
				listUser(request, response);
				break;
			case "/listStreamer":
				listStreamer(request, response);
				break;
			case "/loginAccess":
				loginWeb(request, response);
				break;
			case "/smListStreamer":
				smListStreamer(request, response);
				break;
			default:
				sendToLogin(request, response);
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
	
	private void smListStreamer(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException, ServletException {
		List<Streamer> listStreamer = streamerDao.selectAllStreamers();
		request.setAttribute("listStreamer", listStreamer);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/smStreamer-list.jsp");
		dispatcher.forward(request, response);
	}

	private void showNewStreamerForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/streamer-form.jsp");
		dispatcher.forward(request, response);
	}

	private void showEditStreamerForm(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		Streamer existingStreamer = streamerDao.selectStreamer(id);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/streamer-form.jsp");
		request.setAttribute("streamer", existingStreamer);
		dispatcher.forward(request, response);

	}

	private void insertStreamer(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		String name = request.getParameter("name");
		String online = request.getParameter("online");
		Integer subscribers = parseToNumber(request.getParameter("subscribers"));
		Integer followers = parseToNumber(request.getParameter("followers"));
		String category_id = request.getParameter("category_id");
		System.out.println(name + online + subscribers + followers + category_id);
		Streamer newStreamer = new Streamer(name, online, subscribers, followers, category_id);
		streamerDao.insertStreamer(newStreamer);
		response.sendRedirect("listStreamer");
	}

	private void updateStreamer(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		String online = request.getParameter("online");
		int subscribers = Integer.parseInt(request.getParameter("subscribers"));
		Integer followers = Integer.parseInt(request.getParameter("followers"));
		String category_id = request.getParameter("category_id");

		Streamer streamer = new Streamer(id, name, online, subscribers, followers, category_id);
		streamerDao.updateStreamer(streamer);
		response.sendRedirect("listStreamer");
	}

	private void deleteStreamer(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		streamerDao.deleteStreamer(id);
		response.sendRedirect("list");

	}
	private void listUser(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		List<User> listUser = userDao.selectAllUsers();
		request.setAttribute("listUser", listUser);
		RequestDispatcher dispatcher = request.getRequestDispatcher("user-list.jsp");
		dispatcher.forward(request, response);
	}
	
	private void showNewUserForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("user-form.jsp");
		dispatcher.forward(request, response);
	}

	private void showEditUserForm(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		User existingUser = userDao.selectUser(id);
		RequestDispatcher dispatcher = request.getRequestDispatcher("user-form.jsp");
		request.setAttribute("user", existingUser);
		dispatcher.forward(request, response);

	}
	
	private void insertUser(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException {
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		User newUser = new User(name, password, email);
		userDao.insertUser(newUser);
		response.sendRedirect("listUser");
	}
	
	private void updateUser(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String email = request.getParameter("email");

		User book = new User(id, name, password, email);
		userDao.updateUser(book);
		response.sendRedirect("listUser");
	}
	
	private void deleteUser(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		userDao.deleteUser(id);
		response.sendRedirect("listUser");

	}
	
	private void loginWeb(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException {
		
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		Login login = new Login();
		login.setName(name);
		login.setPassword(password);

		try {
			if (loginDao.validate(login)) {
				response.sendRedirect("listStreamer");
			} else {
				response.sendRedirect("loginFail.jsp");
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	private void sendToLogin(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException {
		response.sendRedirect("login.jsp");
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
