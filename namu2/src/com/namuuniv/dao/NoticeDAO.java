package com.namuuniv.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.namuuniv.mybatis.DBService;
import com.namuuniv.vo.NoticeVO;

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
	
}
