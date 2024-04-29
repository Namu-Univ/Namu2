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

@WebServlet("/noticeWrite")
public class NoticeWriteController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("jsp/notice/noticeWrite.jsp").forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		UsersVO user = (UsersVO) session.getAttribute("user");
		int staffId = user.getId();
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		// 파일 처리
		
		NoticeVO notice = new NoticeVO();
		notice.setStaffId(staffId);
		notice.setTitle(title);
		notice.setContent(content);
		
		int result = NoticeDAO.noticeWrite(notice);
		if (result > 0) {
			response.sendRedirect("noticeList");
		} else {
			response.sendRedirect("writeNotice");
		}
		
	}
}
