package com.namuuniv.grade.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.namuuniv.vo.EnrollStuVO;
import com.namuuniv.vo.UsersVO;

@WebServlet("/infoGrade")
public class InfoGradeController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		UsersVO user = (UsersVO) session.getAttribute("user");
		String role = user.getRole();
		
		int stuId = Integer.parseInt(request.getParameter("stuId"));
		String stuName = request.getParameter("stuName");
		String subName = (String)session.getAttribute("subName");
		int year = Integer.parseInt((String)session.getAttribute("year"));
		int semester = Integer.parseInt((String)session.getAttribute("semester"));
		
		EnrollStuVO vo = new EnrollStuVO();
		vo.setStuId(stuId);
		vo.setStuName(stuName);
		vo.setSubName(subName);
		vo.setYear(year);
		vo.setSemester(semester);
		session.setAttribute("remStuSub", vo);
		request.getRequestDispatcher("jsp/grade/infoGrade.jsp").forward(request, response);
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}