package com.namuuniv.login.controller;

import java.io.IOException;

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
		String errorMsg = "";
		
		reqUser.setId(request.getParameter("id"));
		reqUser.setPassword(request.getParameter("password"));

		HttpSession session = request.getSession();
		
		user = LoginDAO.getLogin(reqUser);

		// 로그인 실패시 로그인 Redirect
		if (user == null) {
			errorMsg = "아이디 또는 비밀번호를 다시 입력하세요.";
			session.setAttribute("errorMsg", errorMsg);
			response.sendRedirect("login");
			return;
		} else {
			// 세션에 로그인 유저의 role 저장
			userRole = user.getRole();
			session.setAttribute("user", user);			
		}
		
		// 세션에 로그인 유저의 정보를 저장
		if ("student".equals(userRole)) {
			StudentVO student = ProfileSearchDAO.studentOne(user.getId());
			session.setAttribute("student", student);
			session.setAttribute("staff", null);
			session.setAttribute("professor", null);
			System.out.println(student.toString());
		} else if ("staff".equals(userRole)) {
			StaffVO staff = ProfileSearchDAO.staffOne(user.getId());
			session.setAttribute("student", null);
			session.setAttribute("staff", staff);
			session.setAttribute("professor", null);
			System.out.println(staff.toString());
		} else if ("professor".equals(userRole)) {
			ProfessorVO professor = ProfileSearchDAO.professorOne(user.getId());
			session.setAttribute("student", null);
			session.setAttribute("staff", null);
			session.setAttribute("professor", professor);
			System.out.println(professor.toString());
		} else {
			// 유저롤이 안맞을 경우 오류
			errorMsg = "[오류] 관리자에게 연락바랍니다.";
			session.setAttribute("errorMsg", errorMsg);
		}
		response.sendRedirect("mypage");
	}
}
