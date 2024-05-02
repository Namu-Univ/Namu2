package com.namuuniv.staff.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.namuuniv.mybatis.DBService;
import com.namuuniv.vo.StaffVO;

@WebServlet("/StaffUpdateStaff")
public class StaffUpdateStaffController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
        request.setCharacterEncoding("UTF-8");
        
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String dept = request.getParameter("dept");
        String birthDate = request.getParameter("birthDate");
        String tel = request.getParameter("tel");
        String address = request.getParameter("address");
        
        int uid = Integer.parseInt(id);
        
        StaffVO vo = new StaffVO();
        vo.setId(uid);
        vo.setName(name);
        vo.setDept(dept);
        vo.setBirthDate(birthDate);
        vo.setTel(tel);
        vo.setAddress(address);
        
        SqlSession ss = DBService.getFactory().openSession(true);
        PrintWriter out = response.getWriter();
        
        try {
            int result = ss.update("namu.updateStaff", vo);
            System.out.println(">> 수정 성공 ");
            
            response.sendRedirect("jsp/staffSearch/staffSearchOne.jsp?id=" + id);
        } catch(Exception e) {
            System.out.println(">>[예외발생] 수정 실패");
            e.printStackTrace();
         
            request.getRequestDispatcher("jsp/staffSearch/staffProfileUpdate.jsp?id=" + id).forward(request, response);
        } finally {
            ss.close();
        }
	}

}
