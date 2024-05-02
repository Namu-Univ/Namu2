package com.namuuniv.studentOff.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.namuuniv.dao.StudentOffDAO;
import com.namuuniv.vo.EduStatusVO;
import com.namuuniv.vo.StudentVO;
import com.namuuniv.vo.UsersVO;

@WebServlet("/StudentSemesterOff")
public class StudentSemesterOffController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		UsersVO user = (UsersVO) session.getAttribute("user");
		
		StudentVO vo = (StudentVO)session.getAttribute("student");
		request.setAttribute("vo", vo);
		
		request.getRequestDispatcher("jsp/studentOff/studentSemesterOff.jsp").forward(request, response);	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		UsersVO user = (UsersVO) session.getAttribute("user");
		
		String sYear = request.getParameter("sYear");
		String sSemester = request.getParameter("sSemester");
		String fYear = request.getParameter("eYear");
		String fSemester = request.getParameter("eSemester");
		
		EduStatusVO student = new EduStatusVO();
		student.setId(user.getId());
		student.setStatus("재학");
		student.setStartYear(sYear);
		student.setStartSemester(sSemester);
		student.setFinishYear(fYear);
		student.setFinishSemester(fSemester);
		student.setApprovalStatus("대기");
		
		int result = StudentOffDAO.application(student);
		
		if (result > 0) {
			// 완료 후 목록으로 이동
			//response.sendRedirect("jsp/studentOff/studentMylist.jsp");
			//response.sendRedirect("StudentMysemesteroff");
			request.getRequestDispatcher("StudentMysemesteroff").forward(request, response);
		} else {
			// 예외처리 추후 구현
		}
	}

}

