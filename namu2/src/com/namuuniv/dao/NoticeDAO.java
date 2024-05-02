package com.namuuniv.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.namuuniv.mybatis.DBService;
import com.namuuniv.vo.NoticeFileVO;
import com.namuuniv.vo.NoticeVO;
import com.sun.org.apache.bcel.internal.generic.Select;

public class NoticeDAO {
	
	// 전체 공지글 수 조회
	public static int totalNoticeCount() {
		int totalCount = 0;
		try (SqlSession ss = DBService.getFactory().openSession()) {
			totalCount = ss.selectOne("notice.totalNoticeCount");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return totalCount;
	}
	
	// 페이지에 해당하는 공지글 조회
	public static List<NoticeVO> noticeList(int begin, int end) {
		try (SqlSession ss = DBService.getFactory().openSession()) {
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("begin", begin);
			map.put("end", end);
			return ss.selectList("notice.noticeList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	// 공지글 상세보기	
	public static NoticeVO noticeDetail(int id) {
		try (SqlSession ss = DBService.getFactory().openSession()) {
			return ss.selectOne("notice.noticeDetail", id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	// 공지글 작성
	public static int noticeWrite(NoticeVO nvo, NoticeFileVO fvo) {
		int result = 0;
		SqlSession ss = DBService.getFactory().openSession(false);
		try {
			int noticeId = ss.selectOne("notice.nextNoticeId"); 
			nvo.setId(noticeId);
			result = ss.insert("notice.noticeWrite", nvo);
			// 첨부파일이 있을 경우 저장
			if (result == 1 && fvo != null && fvo.getFilename() != null) {
				int fileId = ss.selectOne("notice.nextFileId");
				fvo.setId(fileId);
				fvo.setNoticeId(noticeId);
				ss.insert("notice.insertFile", fvo);
			}
			ss.commit();
			return result;
		} catch (Exception e) {
			ss.rollback();
			e.printStackTrace();
		} finally {
			ss.close();
		}
		return result;
	}
	
	// 조회수 증가
	public static int updateView(int id) {
		try (SqlSession ss = DBService.getFactory().openSession(true)) {
			return ss.update("notice.updateViews", id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	// 공지글 수정
	public static int updateNotice(NoticeVO nvo) {
		int result = -1;
		try (SqlSession ss = DBService.getFactory().openSession(true)) {
			result = ss.update("notice.updateNotice", nvo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	// 공지글 삭제
	public static int deleteNotice(int id) {
		try (SqlSession ss = DBService.getFactory().openSession(true)) {
			return ss.delete("notice.deleteNotice", id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	// 파일 정보 저장
	public static void insertFile(NoticeFileVO fvo) {
	    SqlSession ss = DBService.getFactory().openSession();
	    try {
	        int fileId = ss.selectOne("notice.nextFileId");
	        fvo.setId(fileId);
	        ss.insert("notice.insertFile", fvo);
	        ss.commit();
	    } catch (Exception e) {
	        ss.rollback();
	        e.printStackTrace();
	    } finally {
	        ss.close();
	    }
	}
	
	// 파일 정보 조회
	public static NoticeFileVO getFile(int fileId) {
		try (SqlSession ss = DBService.getFactory().openSession()) {
			return ss.selectOne("notice.getFile", fileId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	// 파일 정보 삭제
	public static int deleteNoticeFile(int noticeId) {
		try (SqlSession ss = DBService.getFactory().openSession(true)) {
			return ss.delete("notice.deleteNoticeFiles", noticeId);
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
}
