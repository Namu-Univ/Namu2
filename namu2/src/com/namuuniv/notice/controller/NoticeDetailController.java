package com.namuuniv.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.namuuniv.dao.NoticeDAO;
import com.namuuniv.vo.NoticeVO;
import com.namuuniv.vo.UsersVO;

@WebServlet("/noticeDetail")
public class NoticeDetailController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		UsersVO user = (UsersVO) session.getAttribute("user");
		String role = user.getRole();
		int noticeId = Integer.parseInt(request.getParameter("id"));
		String cPage = request.getParameter("cPage");
		
		// 교직원 여부 확인
		boolean ifStaff = false;
		if (user != null && "staff".equals(role)) {
			ifStaff = true;
		}
		
		// 조회수 증가
		NoticeDAO.updateView(noticeId);		
		
		NoticeVO notice = NoticeDAO.noticeDetail(noticeId);
		request.setAttribute("cPage", cPage);
		request.setAttribute("notice", notice);
		request.setAttribute("isStaff", ifStaff);
		
		request.getRequestDispatcher("jsp/notice/noticeDetail.jsp").forward(request, response);
	}

}
