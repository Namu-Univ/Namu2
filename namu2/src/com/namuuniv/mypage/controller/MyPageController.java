package com.namuuniv.mypage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.namuuniv.vo.ProfessorVO;
import com.namuuniv.vo.StaffVO;
import com.namuuniv.vo.StudentVO;
import com.namuuniv.vo.UsersVO;

@WebServlet("/mypage")
public class MyPageController extends HttpServlet  {
	
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		UsersVO user = (UsersVO) session.getAttribute("user");
		String role = user.getRole();
		if (role.equals("student")) {
			StudentVO vo = (StudentVO)session.getAttribute("student");
			session.setAttribute("vo", vo);
		} else if (role.equals("staff")) {
			StaffVO vo = (StaffVO)session.getAttribute("staff");
			session.setAttribute("vo", vo);
		} else if (role.equals("professor")) {
			ProfessorVO vo = (ProfessorVO)session.getAttribute("professor");
			session.setAttribute("vo", vo);
		}
		request.getRequestDispatcher("jsp/mypage/myPage.jsp").forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
}

