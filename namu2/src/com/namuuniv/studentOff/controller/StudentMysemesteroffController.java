package com.namuuniv.studentOff.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.namuuniv.dao.StudentOffDAO;
import com.namuuniv.vo.EduStatusVO;
import com.namuuniv.vo.UsersVO;

@WebServlet("/StudentMysemesteroff")
public class StudentMysemesteroffController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		UsersVO user = (UsersVO) session.getAttribute("user");
		int id = user.getId();
		
		//String id = (String) session.getAttribute("id");
		request.setAttribute("id", id);

		List<EduStatusVO> list = StudentOffDAO.myList(id);
		
		request.setAttribute("list", list);
		System.out.println(list);
		request.getRequestDispatcher("jsp/studentOff/studentMylist.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}
	

}
