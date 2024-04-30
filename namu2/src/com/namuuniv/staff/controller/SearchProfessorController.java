package com.namuuniv.staff.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.namuuniv.dao.SearchDAO;
import com.namuuniv.vo.ProfessorVO;

@WebServlet("/SearchProfessor")
public class SearchProfessorController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String idx = req.getParameter("idx");
		String keyword = req.getParameter("keyword");
		System.out.println("idx" + idx + "keyword" + keyword);
		
		if(keyword == null || keyword.trim().length() == 0) {
			req.getRequestDispatcher("jsp/staffSearch/professorSearchList.jsp").forward(req, resp);
			return;
		}

		List<ProfessorVO> list = SearchDAO.getProfessorSearch(idx, keyword);
		System.out.println("list: " + list);
		
		String title ="";
		switch (idx) {
		case "0" : title = "이름"; break;
		case "1" : title = "교번"; break;
		case "2" : title = "전공"; break;
		default:
				title = "선택안함";
		}
		
		req.setAttribute("list", list);
		req.setAttribute("title", title);
		
		req.getRequestDispatcher("jsp/staffSearch/professorSearchList.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		doGet(req, resp);
	}
}
