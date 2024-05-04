package com.namuuniv.notice.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.namuuniv.dao.NoticeDAO;
import com.namuuniv.vo.NoticeVO;
import com.namuuniv.vo.PagingVO;
import com.namuuniv.vo.UsersVO;

@WebServlet("/noticeList")
public class NoticeListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		UsersVO user = (UsersVO) session.getAttribute("user");
		String role = user.getRole();
		
		// 교직원 여부 확인
		boolean ifStaff = false;
		if (user != null && "staff".equals(role)) {
			ifStaff = true;
		}
		
		// 현재 페이지 번호
		String cPage = request.getParameter("cPage");
		int currentPage = 1;
		if (cPage == null || cPage.trim().isEmpty()) {
			cPage = "1";
		}
		currentPage = Integer.parseInt(cPage);
		
		// 페이징 처리
		PagingVO pvo = new PagingVO();
		pvo.setNowPage(currentPage);
		pvo.setTotalRecord(NoticeDAO.totalNoticeCount());
		pvo.calculatePaging();
		
		// 현재 페이지에 해당하는 공지목록
		List<NoticeVO> list = NoticeDAO.noticeList(pvo.getBegin(), pvo.getEnd());
		request.setAttribute("pvo", pvo);
		request.setAttribute("list", list);
		System.out.println(pvo);
		System.out.println(list);
		request.setAttribute("isStaff", ifStaff);
		request.getRequestDispatcher("jsp/notice/noticeList.jsp").forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
}
