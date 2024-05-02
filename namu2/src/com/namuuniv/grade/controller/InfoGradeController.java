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
		
		String successMsg = "";
		request.setAttribute("successMsg", successMsg);
		int stuId = Integer.parseInt(request.getParameter("stuId"));
		String stuName = request.getParameter("stuName");
		int subId = (Integer)session.getAttribute("subId");
		String subName = (String)session.getAttribute("subName");
		int year = (Integer)session.getAttribute("year");
		int semester = (Integer)session.getAttribute("semester");
		
		
		EnrollStuVO vo = new EnrollStuVO();
		vo.setSubId(subId);
		vo.setStuId(stuId);
		vo.setStuName(stuName);
		vo.setSubName(subName);
		vo.setYear(year);
		vo.setSemester(semester);
		session.setAttribute("remStuSub", vo);
		
		request.getRequestDispatcher("jsp/grade/infoGrade.jsp").forward(request, response);
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
