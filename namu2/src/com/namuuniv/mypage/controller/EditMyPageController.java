package com.namuuniv.mypage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.namuuniv.dao.ProfileSearchDAO;
import com.namuuniv.dao.SearchUpdateDAO;
import com.namuuniv.vo.ProfessorVO;
import com.namuuniv.vo.StaffVO;
import com.namuuniv.vo.StudentVO;
import com.namuuniv.vo.UsersVO;

@WebServlet("/editMyPage")
public class EditMyPageController extends HttpServlet  {
	
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		UsersVO user = (UsersVO) session.getAttribute("user");
		String role = user.getRole();
		if (role.equals("student")) {
			StudentVO vo = (StudentVO)session.getAttribute("student");
			request.setAttribute("vo", vo);
		} else if (role.equals("staff")) {
			StaffVO vo = (StaffVO)session.getAttribute("staff");
			request.setAttribute("vo", vo);
		} else if (role.equals("professor")) {
			ProfessorVO vo = (ProfessorVO)session.getAttribute("professor");
			request.setAttribute("vo", vo);
		}
		request.getRequestDispatcher("jsp/mypage/editMyPage.jsp").forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		UsersVO user = (UsersVO) session.getAttribute("user");
		String role = user.getRole();
		boolean result = false;
		// 수정할 정보를 가져옴
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String tel = request.getParameter("tel");
		
		// 롤에 따라 업데이트를 다르게함
		if (role.equals("student")) {
			StudentVO student = new StudentVO();
			student.setId(user.getId());
			student.setName(name);
			student.setAddress(address);
			student.setTel(tel);
			result = SearchUpdateDAO.updateStudent(student);
			session.setAttribute("student", ProfileSearchDAO.studentOne(user.getId()));
		} else if (role.equals("staff")) {
			StaffVO staff = new StaffVO();
			staff.setId(user.getId());
			staff.setName(name);
			staff.setAddress(address);
			staff.setTel(tel);
			result = SearchUpdateDAO.updateStaff(staff);
			session.setAttribute("staff", ProfileSearchDAO.staffOne(user.getId()));
		} else if (role.equals("professor")) {
			ProfessorVO professor = new ProfessorVO();
			professor.setId(user.getId());
			professor.setName(name);
			professor.setAddress(address);
			professor.setTel(tel);
			result = SearchUpdateDAO.updateProfessor(professor);
			session.setAttribute("professor", ProfileSearchDAO.professorOne(user.getId()));
		}
		
		if (result) {
			// 수정 완료 후 myPage 로 이동
			response.sendRedirect("mypage");
		} else {
			// 예외처리 추후 구현
		}
	}
}

