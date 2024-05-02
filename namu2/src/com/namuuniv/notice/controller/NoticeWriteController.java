package com.namuuniv.notice.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.namuuniv.dao.NoticeDAO;
import com.namuuniv.vo.NoticeFileVO;
import com.namuuniv.vo.NoticeVO;
import com.namuuniv.vo.UsersVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/*@MultipartConfig(
		fileSizeThreshold = 1024 * 1024 * 2,
		maxFileSize = 1024 * 1024 * 10,
		maxRequestSize = 1024 * 1024 * 50
		)*/
@WebServlet("/noticeWrite")
public class NoticeWriteController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("jsp/notice/noticeWrite.jsp"
				).forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
/*		
		Collection<Part>parts = request.getParts();
		for (Part part : parts) {
			if (part.getSubmittedFileName() == null) {
				continue;
			} else {
				System.out.println(part.getContentType());
				File tempFile = File.createTempFile("upload-", ".tmp");
				System.out.println("파일 위치 : " + tempFile.getAbsolutePath());
				try (InputStream input = part.getInputStream();
					OutputStream output = new FileOutputStream(tempFile)) {
					byte[] buffer = new byte[1024];
					int bytesRead;
					while ((bytesRead = input.read(buffer)) != -1) {
						output.write(buffer, 0, bytesRead);
					}
				}
						
			}
		}
*/		
		HttpSession session = request.getSession();
		
		UsersVO user = (UsersVO) session.getAttribute("user");
		int staffId = user.getId();
		request.getParameter("noticeId");
		
		// 파일 업로드 처리
		String addPath = request.getServletContext().getRealPath("/upload"); // 실제 경로
		File uploadDir = new File(addPath);
		if (!uploadDir.exists()) {
			uploadDir.mkdir();
		}
		//System.out.println(addPath); //파일 저장 위치
		
		// 최대크기 10MB, 같은 파일명이면 이름변경
		MultipartRequest multi = new MultipartRequest
				(request, addPath, 10 * 1024 * 1024, "UTF-8", new DefaultFileRenamePolicy());
		
		String title = multi.getParameter("title");
		String content = multi.getParameter("content");
		String fileName = multi.getFilesystemName("file"); // 서버 저장이름
		
		NoticeVO notice = new NoticeVO();
		notice.setStaffId(staffId);
		notice.setTitle(title);
		notice.setContent(content);
		
		// 파일 정보
		NoticeFileVO fvo = null;
		if (fileName != null && !fileName.isEmpty()) {
			fvo = new NoticeFileVO();
			fvo.setFilename(fileName);
			fvo.setOriginFilename(multi.getOriginalFileName("file"));
		}
		
		try {
			int result = NoticeDAO.noticeWrite(notice, fvo);
			if (result > 0) {
				response.sendRedirect("noticeList");
				return;
			} else {
				throw new ServletException("작성에 실패했습니다.");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.getRequestDispatcher("jsp/notice/noticeWrite.jsp").forward(request, response);
	}
}
