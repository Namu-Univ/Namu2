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
import com.namuuniv.vo.UsersVO;

@WebServlet("/SearchOneProfessor")
public class SearchOneProfessorController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		HttpSession session = request.getSession();
		UsersVO user = (UsersVO) session.getAttribute("user");
		
    	String id = request.getParameter("id");
    	request.setAttribute("id", id);
    	
		ProfessorVO prvo = SearchDAO.professorOne(id);
		System.out.println("교수 svo : " + prvo);    
		session.setAttribute("prvo", prvo);
		
		request.getRequestDispatcher("jsp/staffSearch/professorSearchOne.jsp?id=" + id).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
