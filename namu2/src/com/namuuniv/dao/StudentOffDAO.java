package com.namuuniv.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.namuuniv.mybatis.DBService;
import com.namuuniv.vo.EduStatusVO;
import com.namuuniv.vo.NoticeVO;

public class StudentOffDAO {
	//휴학 신청서 제출
	public static int application(EduStatusVO vo) {
		SqlSession ss = DBService.getFactory().openSession();
		try {			
			int result = ss.insert("semesteroff.application", vo);
			if (result > 0) {
				ss.commit();
				return result;
			}
		} catch (Exception e) {
			ss.rollback();
			e.printStackTrace();
		} finally {
			ss.close();
		}
		return -1;
	}
	
	//휴학 신청서 조회
	public static List<EduStatusVO> myList(int id) {
		try (SqlSession ss = DBService.getFactory().openSession()) {
			return ss.selectList("semesteroff.myList", id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
