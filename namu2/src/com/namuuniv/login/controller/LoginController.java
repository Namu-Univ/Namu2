package com.namuuniv.login.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.namuuniv.dao.LoginDAO;
import com.namuuniv.dao.ProfileSearchDAO;
import com.namuuniv.vo.ProfessorVO;
import com.namuuniv.vo.StaffVO;
import com.namuuniv.vo.StudentVO;
import com.namuuniv.vo.UsersVO;

@WebServlet("/login")
public class LoginController extends HttpServlet  {
	
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("jsp/login.jsp").forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UsersVO reqUser = new UsersVO();
		UsersVO user = new UsersVO();
		String userRole = null;
		reqUser.setId(request.getParameter("id"));
		reqUser.setPassword(request.getParameter("password"));
		
		HttpSession session = request.getSession();
		
		user = LoginDAO.getLogin(reqUser);
		// 로그인 실패시 작동, 에러메시지 추후 작성
		System.out.println(user);
		if (user == null) {
			response.sendRedirect("login");
		}
		userRole = user.getRole();
		session.setAttribute("user", user);
		
		// 세션에 로그인 유저의 정보를 저장
		if (userRole.equals("student")) {
			StudentVO student = ProfileSearchDAO.studentOne(user.getId());
			session.setAttribute("student", student);
			session.setAttribute("staff", null);
			session.setAttribute("professor", null);
			System.out.println(student.toString());
		} else if (userRole.equals("staff")) {
			StaffVO staff = ProfileSearchDAO.staffOne(user.getId());
			session.setAttribute("student", null);
			session.setAttribute("staff", staff);
			session.setAttribute("professor", null);
			System.out.println(staff.toString());
		} else if (userRole.equals("professor")) {
			ProfessorVO professor = ProfileSearchDAO.professorOne(user.getId());
			session.setAttribute("student", null);
			session.setAttribute("staff", null);
			session.setAttribute("professor", professor);
			System.out.println(professor.toString());
		} else {
			// 유저롤이 안맞을 경우 오류
		}
		response.sendRedirect("mypage");
	}
}
