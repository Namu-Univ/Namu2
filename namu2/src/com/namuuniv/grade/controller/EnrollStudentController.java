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
import com.namuuniv.vo.UsersVO;

@WebServlet("/enrollStu")
public class EnrollStudentController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        UsersVO user = (UsersVO) session.getAttribute("user");
        if (user != null) {
        	String role = user.getRole();
        	int userId = user.getId();
            if (role.equals("professor")) {
                String resInsert = (String)session.getAttribute("resInsert");
                if (resInsert == null) {
                	// 성적 입력 전
					processRequest(request, response, userId, false);
                } else {
					// 성적 입력 후 redirect했을 시
					processRequest(request, response, userId, true);
                } 
            }
        } else {
        	// 사용자가 로그인하지 않았을 경우
        	response.sendRedirect("login");
        	return;
        }
    }
   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	doGet(request, response);
    }
    
    private void processRequest(HttpServletRequest request, HttpServletResponse response, int userId, boolean isRedirect) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String subName = null;
        int subId = 0;
        int year = 0;
        int semester = 0;
        String nextPage = (String)session.getAttribute("nextPage");
        if (!isRedirect && nextPage == null) {
        	//성적조회로 페이지 처음 이동했을 시
        	subId = Integer.parseInt(request.getParameter("subId"));
            subName = (String)request.getParameter("subName");
            year = Integer.parseInt(request.getParameter("year"));
            semester = Integer.parseInt(request.getParameter("semester")); 
            EnrollStuVO remVo = new EnrollStuVO();
            remVo.setSubId(subId);
            remVo.setSubName(subName);
            remVo.setYear(year);
            remVo.setSemester(semester);
            session.setAttribute("remVo", remVo);

            // 현재 페이지 번호 처리
            String cPage = request.getParameter("cPage");
            int currentPage = 1;
            if (cPage == null || cPage.trim().isEmpty()) {
                cPage = "1";
            }
            currentPage = Integer.parseInt(cPage);
            
            EnrollStuVO vo = new EnrollStuVO();
            vo.setSubId(subId);
            vo.setSubName(subName);
            vo.setUserId(userId);
            
            // 페이징 처리
            GradePagingVO pvo = new GradePagingVO();
            pvo.setNowPage(currentPage);
            pvo.setTotalRecord(GradeDAO.totalEnrollCount(vo));
            pvo.calculatePaging();
            vo.setBegin(pvo.getBegin());
            vo.setEnd(pvo.getEnd());
            
            // 데이터 조회 처리
            List<EnrollStuVO> enrollStu = GradeDAO.enrollStuList(vo);
            request.setAttribute("pvo", pvo);
            request.setAttribute("vo", vo);
            request.setAttribute("enrollStu", enrollStu);
  
        }
        if (!isRedirect || isRedirect && nextPage != null) {
        	EnrollStuVO remVo = (EnrollStuVO)session.getAttribute("remVo");

            // 현재 페이지 번호 처리
            String cPage = request.getParameter("cPage");
            int currentPage = 1;
            if (cPage == null || cPage.trim().isEmpty()) {
                cPage = "1";
            }
            currentPage = Integer.parseInt(cPage);
            
            EnrollStuVO vo = new EnrollStuVO();
            vo.setSubId(remVo.getSubId());
            vo.setSubName(remVo.getSubName());
            vo.setUserId(userId);
            
            // 페이징 처리
            GradePagingVO pvo = new GradePagingVO();
            pvo.setNowPage(currentPage);
            pvo.setTotalRecord(GradeDAO.totalEnrollCount(vo));
            pvo.calculatePaging();
            vo.setBegin(pvo.getBegin());
            vo.setEnd(pvo.getEnd());

            // 데이터 조회 처리
            List<EnrollStuVO> enrollStu = GradeDAO.enrollStuList(vo);
            request.setAttribute("pvo", pvo);
            request.setAttribute("vo", vo);
            request.setAttribute("enrollStu", enrollStu);
        }
        request.getRequestDispatcher("jsp/grade/enrollStu.jsp").forward(request, response);
    }
}
