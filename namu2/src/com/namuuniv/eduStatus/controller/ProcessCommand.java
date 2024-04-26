package com.namuuniv.eduStatus.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.namuuniv.dao.EduStatusDAO;

public class ProcessCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String check = request.getParameter("check");
		int idx = Integer.parseInt(request.getParameter("idx"));
		if (check.equals("approve")) {
			EduStatusDAO.approve(idx);
		} else if (check.equals("reject")) {
			EduStatusDAO.reject(idx);
		}
		return "jsp/eduStatus/updateOk.jsp";
	}
}
