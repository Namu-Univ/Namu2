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
                System.out.println(resInsert);
                if (resInsert == null) {
                	// 성적 입력 후 redirect 했을 시 무효
                	int subId = Integer.parseInt(request.getParameter("subId"));
    	            String subName = request.getParameter("subName");
    	            int year = Integer.parseInt(request.getParameter("year"));
    	            int semester = Integer.parseInt(request.getParameter("semester"));
    	            
    	            session.setAttribute("subId", subId);
    	            session.setAttribute("subName", subName);
    	            session.setAttribute("year", year);
    	            session.setAttribute("semester", semester);
    	            
    	            EnrollStuVO vo = new EnrollStuVO();
    	            vo.setUserId(userId);
    	            vo.setSubName(subName);
	                List<EnrollStuVO> enrollStu = GradeDAO.enrollStuList(vo);
	                System.out.println(enrollStu);
	                request.setAttribute("enrollStu", enrollStu);
	
	                request.getRequestDispatcher("jsp/grade/enrollStu.jsp").forward(request, response);
                } else {
                	// 성적 입력 후 redirect 했을 시
                	String subName = (String)session.getAttribute("subName");
    	            EnrollStuVO vo = new EnrollStuVO();
    	            vo.setUserId(userId);
    	            vo.setSubName(subName);

	                List<EnrollStuVO> enrollStu = GradeDAO.enrollStuList(vo);
	                request.setAttribute("enrollStu", enrollStu);
	                System.out.println(enrollStu);
	                request.getRequestDispatcher("jsp/grade/enrollStu.jsp").forward(request, response);
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
}
