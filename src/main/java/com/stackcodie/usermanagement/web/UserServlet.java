package com.stackcodie.usermanagement.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.stackcodie.usermanagement.bean.User;
import com.stackcodie.usermanagement.dao.UserDao;

@WebServlet("/")
public class UserServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private UserDao userDao;
	
	
	public void init() {
		userDao = new UserDao();
	}

	
	protected  void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException,IOException{
		doGet(request,response);
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException,IOException{
		String action = request.getServletPath();
		
		try {
			switch(action) {
			case "/new":
				ShowNewForm(request,response);
				break;
			case "/insert":
				insert(request,response);
				break;
			case "/delete":
				delete(request,response);
				break;
			case "/edit":
				ShowEditForm(request,response);
				break;
			case "/update":
				update(request,response);
				break;
				default:
					listUser(request,response);
					break;
			}
		}catch (SQLException ex) {
			throw new ServletException(ex);
		}
	}
	
	private void listUser(HttpServletRequest request, HttpServletResponse response)
	throws SQLException,ServletException,IOException{
		List<User> listUser = userDao.getAllUser();
		request.setAttribute("listUser", listUser);
		RequestDispatcher dispatcher = request.getRequestDispatcher("user-list.jsp");
		dispatcher.forward(request, response);
	}
	
	private void ShowNewForm(HttpServletRequest request, HttpServletResponse response)
	throws SQLException,ServletException,IOException{
		RequestDispatcher dispatcher = request.getRequestDispatcher("user-form.jsp");
		dispatcher.forward(request, response);
	}
	
	private void ShowEditForm(HttpServletRequest request, HttpServletResponse response)
	throws SQLException,ServletException,IOException{
		int id = Integer.parseInt(request.getParameter("id"));
		User existingUser = userDao.getUser(id);
		RequestDispatcher dispatcher = request.getRequestDispatcher("user-edit.jsp");
		request.setAttribute("user", existingUser);
		dispatcher.forward(request, response);
	}
	
	private void insert(HttpServletRequest request, HttpServletResponse response)
	throws SQLException,IOException{
		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		User newUser = new User(firstname,lastname);
		userDao.saveUser(newUser);
		response.sendRedirect("list");
	}
	
	private void update(HttpServletRequest request,HttpServletResponse response)
	throws SQLException,IOException{
		int id = Integer.parseInt(request.getParameter("id"));
		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		User newUser = new User(id,firstname,lastname);
		userDao.updateUser(newUser);
		response.sendRedirect("list");
	}
	
	private void delete(HttpServletRequest request, HttpServletResponse response)
	throws SQLException,IOException{
		int id = Integer.parseInt(request.getParameter("id"));
		userDao.deleteUser(id);
		response.sendRedirect("list");
	}
}
