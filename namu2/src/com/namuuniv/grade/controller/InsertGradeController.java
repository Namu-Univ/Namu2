package com.namuuniv.grade.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.namuuniv.dao.GradeDAO;
import com.namuuniv.vo.EnrollStuVO;
import com.namuuniv.vo.GradeVO;
import com.namuuniv.vo.UsersVO;

@WebServlet("/insertGrade")
public class InsertGradeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		UsersVO user = (UsersVO) session.getAttribute("user");
		String role = user.getRole();
		
		int absent = Integer.parseInt(request.getParameter("absent"));
		int mid = Integer.parseInt(request.getParameter("mid"));
		int fin = Integer.parseInt(request.getParameter("fin"));
		double exScore = Double.parseDouble(request.getParameter("exScore"));
		String rate = (String)request.getParameter("rate");
		
		EnrollStuVO evo = (EnrollStuVO)request.getAttribute("remStuSub");
		int stuId = evo.getStuId();
		int subId = evo.getSubId();
		
		GradeVO vo = new GradeVO();
		vo.setStuId(stuId);
		vo.setSubId(subId);
		vo.setAbsent(absent);
		vo.setMidExam(mid);
		vo.setFinExam(fin);
		vo.setExScore(exScore);
		vo.setRate(rate);

		if (user != null) {
			
			if(role.equals("professor")) {
				
				int result = GradeDAO.insertGrade(vo);
				
				String resMsg;
				if (result != -1) {
					resMsg = evo.getStuName() + "님의 성적 입력을 완료했습니다.";
					session.setAttribute("resMsg", resMsg);
					response.sendRedirect("enrollStu");
				} else {
					resMsg = evo.getStuName() + "님의 성적 입력에 실패했습니다.";
					session.setAttribute("resMsg", resMsg);
					response.sendRedirect("enrollStu");
				}
				String resInsert = "success"; 
				session.setAttribute("resInsert", resInsert);
			}
		} 
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
