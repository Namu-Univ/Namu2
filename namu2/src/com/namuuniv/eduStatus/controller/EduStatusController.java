package com.namuuniv.eduStatus.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/eduStatus")
public class EduStatusController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private Map<String, Command> commands;

	@Override
	public void init(ServletConfig config) throws ServletException {
		commands = new HashMap<String, Command>();
		commands.put("list", new ListAllCommand());
		commands.put("check", new CheckCommand());
		commands.put("process", new ProcessCommand());
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();

		// 직원이 아닐 경우 교수나,학생 같은 경우에는 페이지 접근이 안되게 다른 페이지로 redirect하는 함수구현
		if (session.getAttribute("staff") == null) {
			response.sendRedirect("mypage");
			return;
		}

		String type = request.getParameter("type");
		Command command = commands.get(type);
		String pat = command.exec(request, response);
		request.getRequestDispatcher(pat).forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
