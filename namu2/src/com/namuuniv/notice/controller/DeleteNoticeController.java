package com.namuuniv.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.namuuniv.dao.NoticeDAO;

@WebServlet("/deleteNotice")
public class DeleteNoticeController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idParam = request.getParameter("id");
		if (idParam == null || idParam.trim().isEmpty()) {
			request.getRequestDispatcher("jsp/notice/noticeDetail.jsp").forward(request, response);
			return;
		}
		int id = Integer.parseInt(idParam);
		
		// 파일 정보 삭제
		int fileDelete = NoticeDAO.deleteNoticeFile(id);
		
		// 공지글 삭제
		int noticeDelete = NoticeDAO.deleteNotice(id);
		if (fileDelete >= 0 && noticeDelete > 0) {
			response.sendRedirect("noticeList");
		} else {
			request.setAttribute("error", "공지사항 삭제에 실패했습니다.");
			request.getRequestDispatcher("jsp/notice/noticeDetail.jsp?id=" + id).forward(request, response);
		}
	}
}
