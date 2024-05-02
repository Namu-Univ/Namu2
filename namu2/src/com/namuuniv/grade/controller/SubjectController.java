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
import com.namuuniv.vo.GradePagingVO;
import com.namuuniv.vo.ProSubjectVO;
import com.namuuniv.vo.UsersVO;

@WebServlet("/subject")
public class SubjectController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		UsersVO user = (UsersVO) session.getAttribute("user");

		if (user != null) {
			int id = user.getId();
			String role = user.getRole();
			
			if(role.equals("professor")) {
				// 현재 페이지 번호
				String cPage = request.getParameter("cPage");
				int currentPage = 1;
				if (cPage == null || cPage.trim().isEmpty()) {
					cPage = "1";
				}
				currentPage = Integer.parseInt(cPage);
				
				// 페이징 처리
				GradePagingVO pvo = new GradePagingVO();
				pvo.setNowPage(currentPage);
				pvo.setTotalRecord(GradeDAO.totalSubjectCount(id));
				pvo.calculatePaging();

				// 현재 페이지에 맞는 강의 목록 조회
				List<ProSubjectVO> proSub = GradeDAO.proSubList(pvo.getBegin(), pvo.getEnd(), id);
				request.setAttribute("pvo", pvo);
				request.setAttribute("proSub", proSub);
				System.out.println(proSub);
				request.getRequestDispatcher("jsp/grade/subject.jsp").forward(request, response);

			}
			if(role.equals("student")) {
				// 현재 페이지 번호
				String cPage = request.getParameter("cPage");
				int currentPage = 1;
				if (cPage == null || cPage.trim().isEmpty()) {
					cPage = "1";
				}
				currentPage = Integer.parseInt(cPage);

				// 페이징 처리
				GradePagingVO pvo = new GradePagingVO();
				pvo.setNowPage(currentPage);
				pvo.setTotalRecord(GradeDAO.totalStuSubCount(id));
				pvo.calculatePaging();
				
				EnrollStuVO vo = new EnrollStuVO();
				vo.setBegin(pvo.getBegin());
				vo.setEnd(pvo.getEnd());
				vo.setUserId(id);
				// 현재 페이지에 맞는 강의 목록 조회
				List<EnrollStuVO> stuSub = GradeDAO.stuSubList(vo);
				request.setAttribute("pvo", pvo);
				request.setAttribute("stuSub", stuSub);
				System.out.println(stuSub);
				request.getRequestDispatcher("jsp/grade/subject.jsp").forward(request, response);
			}
		} else {
		    // 사용자가 로그인하지 않았을 경우
		    response.sendRedirect("login");
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

