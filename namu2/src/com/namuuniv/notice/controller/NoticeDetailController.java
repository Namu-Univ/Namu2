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
		int noticeId = Integer.parseInt(request.getParameter("id"));
		String cPage = request.getParameter("cPage");
		NoticeVO notice = NoticeDAO.noticeDetail(noticeId);
		
		// 조회수 증가
		NoticeDAO.updateView(noticeId);
		
		// 교직원 여부 확인
		boolean ifStaff = false;
		if (user != null && "staff".equals(user.getRole())) {
			ifStaff = true;
		}
		
		// 글 작성자 확인
		boolean isAutor = user != null && user.getId() == notice.getStaffId();
		
		request.setAttribute("cPage", cPage);
		request.setAttribute("notice", notice);
		request.setAttribute("isStaff", ifStaff);
		request.setAttribute("isAutor", isAutor);
		
		request.getRequestDispatcher("jsp/notice/noticeDetail.jsp").forward(request, response);
	}

}
