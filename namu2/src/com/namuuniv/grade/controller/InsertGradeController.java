package com.namuuniv.grade.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.namuuniv.dao.GradeDAO;
import com.namuuniv.vo.GradeVO;
import com.namuuniv.vo.UsersVO;

@WebServlet("/insertGrade")
public class InsertGradeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		UsersVO user = (UsersVO) session.getAttribute("user");
		String role = user.getRole();
		int userId = user.getId();
		
		int absent = Integer.parseInt(request.getParameter("absent"));
		int mid = Integer.parseInt(request.getParameter("mid"));
		int fin = Integer.parseInt(request.getParameter("fin"));
		double exScore = Double.parseDouble(request.getParameter("exScore"));
		String rate = (String)request.getParameter("rate");
		
		GradeVO vo = new GradeVO();
		vo.setAbsent(absent);
		vo.setMidExam(mid);
		vo.setFinExam(fin);
		vo.setExScore(exScore);
		vo.setRate(rate);
		
		System.out.println(vo);
		
		request.getRequestDispatcher("jsp/grade/insertGrade.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
