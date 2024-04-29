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
import com.namuuniv.vo.SubjectVO;
import com.namuuniv.vo.UsersVO;

@WebServlet("/subject")
public class SubjcetController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		UsersVO user = (UsersVO) session.getAttribute("user");
		int id = user.getId();
		String role = user.getRole();
		System.out.println(id);
		System.out.println(role);
		
		if(role.equals("professor")) {
			List<SubjectVO> subList = GradeDAO.subjectList(id);
			request.setAttribute("subList", subList);
			System.out.println(subList);
			request.getRequestDispatcher("jsp/grade/subject.jsp").forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
