package com.namuuniv.eduStatus.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.namuuniv.dao.EduStatusDAO;

public class CheckCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("list", EduStatusDAO.eduStatusAllList());
		
		int idx = Integer.parseInt(request.getParameter("idx"));
		request.setAttribute("absence", EduStatusDAO.eduStatusSelOne(idx));
		
		return "jsp/eduStatus/eduStatusOneList.jsp";
	}

}
