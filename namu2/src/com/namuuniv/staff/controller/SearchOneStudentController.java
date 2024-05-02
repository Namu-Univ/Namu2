package com.namuuniv.staff.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import com.namuuniv.dao.SearchDAO;
import com.namuuniv.mybatis.DBService;
import com.namuuniv.vo.ProfessorVO;
import com.namuuniv.vo.StudentVO;
import com.namuuniv.vo.UsersVO;

@WebServlet("/SearchOneStudent")
public class SearchOneStudentController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		HttpSession session = request.getSession();
		UsersVO user = (UsersVO) session.getAttribute("user");
		
		String id = request.getParameter("id");
    	request.setAttribute("id", id);
    	System.out.println("id: " + id);
    	
		StudentVO svo = SearchDAO.studentOne(id);
		session.setAttribute("svo", svo);
		System.out.println("학생 svo : " + svo);    
		
		request.getRequestDispatcher("jsp/staffSearch/studentSearchOne.jsp?id=" + id).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
