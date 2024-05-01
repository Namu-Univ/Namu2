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
import com.namuuniv.vo.EnrollStuVO;
import com.namuuniv.vo.UsersVO;

@WebServlet("/enrollStu")
public class EnrollStuentController extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		UsersVO user = (UsersVO) session.getAttribute("user");
		String role = user.getRole();
		int userId = user.getId();

		String subName = request.getParameter("subName");
		
		int year = Integer.parseInt(request.getParameter("year"));
		int semester = Integer.parseInt(request.getParameter("semester"));
		session.setAttribute("subName", subName);
	    session.setAttribute("year", year);
	    session.setAttribute("semester", semester);
	    
	    
	    EnrollStuVO vo = new EnrollStuVO();
	    vo.setUserId(userId);
	    vo.setSubName(subName);
	    System.out.println(vo);
	    
		System.out.println("subName : " + subName);
		if(role.equals("professor")) {
			List<EnrollStuVO> enrollStu = GradeDAO.enrollStuList(vo);
			request.setAttribute("enrollStu", enrollStu);
			System.out.println(enrollStu);
			
			request.getRequestDispatcher("jsp/grade/enrollStu.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		
	}

}
