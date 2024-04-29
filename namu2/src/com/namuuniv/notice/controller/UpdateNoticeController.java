package com.namuuniv.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.namuuniv.dao.NoticeDAO;
import com.namuuniv.vo.NoticeVO;

@WebServlet("/updateNotice")
public class UpdateNoticeController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idParam = request.getParameter("id");
		if (idParam == null || idParam.trim().isEmpty()) {
			response.sendRedirect("noticeList");
			return;
		}
		int id = Integer.parseInt(idParam);
		NoticeVO notice = NoticeDAO.noticeDetail(id);
		request.setAttribute("notice", notice);
		request.getRequestDispatcher("jsp/notice/updateNotice.jsp").forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int id = Integer.parseInt(request.getParameter("id"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		NoticeVO notice = new NoticeVO();
		notice.setId(id);
		notice.setTitle(title);
		notice.setContent(content);
		
		int result = NoticeDAO.updateNotice(notice);
		if(result > 0) {
			response.sendRedirect("noticeDetail?id=" + id);
		} 
	}
}
