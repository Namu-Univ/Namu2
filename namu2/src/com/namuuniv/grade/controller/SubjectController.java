package com.namuuniv.grade.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.namuuniv.dao.GradeDAO;
import com.namuuniv.vo.ProSubjectVO;
import com.namuuniv.vo.UsersVO;

@WebServlet("/subject")
public class SubjectController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		UsersVO user = (UsersVO) session.getAttribute("user");

		if (user != null) {
			int id = user.getId();
			String role = user.getRole();
	
			if(role.equals("professor")) {
				List<ProSubjectVO> proSub = GradeDAO.proSubList(id);
				request.setAttribute("proSub", proSub);
				System.out.println(proSub);
				request.getRequestDispatcher("jsp/grade/subject.jsp").forward(request, response);
			}
		} else {
		    // 사용자가 로그인하지 않았을 경우
		    response.sendRedirect("login");
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
