package com.namuuniv.staff.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import com.namuuniv.mybatis.DBService;
import com.namuuniv.vo.StudentVO;
import com.namuuniv.vo.UsersVO;

@WebServlet("/StaffUpdateStudent")
public class StaffUpdateStudentController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String college = request.getParameter("college");
        String deptName = request.getParameter("deptName");
        String birthDate = request.getParameter("birthDate");
        String tel = request.getParameter("tel");
        String address = request.getParameter("address");
        
        int uid = Integer.parseInt(id);
        
        StudentVO vo = new StudentVO();
        vo.setId(uid);
        vo.setName(name);
        vo.setDeptName(deptName);
        vo.setCollege(college);
        vo.setBirthDate(birthDate);
        vo.setTel(tel);
        vo.setAddress(address);
        
        SqlSession ss = DBService.getFactory().openSession(true);
        PrintWriter out = response.getWriter();
        
        try {
            int result = ss.update("namu.updateStudent", vo);
            System.out.println(">> 수정 성공 ");
            
            response.sendRedirect("SearchOneStudent?id=" + id);
        } catch(Exception e) {
            System.out.println(">>[예외발생] 수정 실패");
            e.printStackTrace();
         
            request.getRequestDispatcher("StaffUpdateStudent?id=" + id).forward(request, response);
        } finally {
            ss.close();
        }

	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		UsersVO user = (UsersVO) session.getAttribute("user");
		
		String id = req.getParameter("id");
		req.getRequestDispatcher("jsp/staffSearch/studentProfileUpdate.jsp?id=" + id).forward(req, resp);
	}

}
