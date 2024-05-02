package com.namuuniv.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.namuuniv.mybatis.DBService;
import com.namuuniv.vo.EduStatusVO;

public class EduStatusDAO {

	// 학생 휴학신청서 전체 리스트 조회
	public static List<EduStatusVO> eduStatusAllList() {
		try (SqlSession ss = DBService.getFactory().openSession()) {
			return ss.selectList("eduStatus.allList");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	//학생 휴학신청서 해당 idx문서 조회
	public static EduStatusVO eduStatusSelOne(int idx) {
		try (SqlSession ss = DBService.getFactory().openSession()) {
			return ss.selectOne("eduStatus.selectOne", idx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	//승인시
	public static boolean approve(int idx) {
	    try (SqlSession ss = DBService.getFactory().openSession()) {
	        boolean result = ss.update("eduStatus.approve", idx) > 0;
	        ss.commit();
	        return result;
	    } catch (Exception e) {
	        e.printStackTrace();
	        // 예외가 발생하면 롤백 수행
	        try (SqlSession ss = DBService.getFactory().openSession()) {
	            ss.rollback();
	        }
	    }
	    return false;
	}

	//반려시
	public static boolean reject(int idx) {
	    try (SqlSession ss = DBService.getFactory().openSession()) {
	        boolean result = ss.update("eduStatus.reject", idx) > 0; // 수정된 부분
	        ss.commit();
	        return result;
	    } catch (Exception e) {
	        e.printStackTrace();
	        try (SqlSession ss = DBService.getFactory().openSession()) {
	            ss.rollback();
	        }
	    }
	    return false;
	}
	

}
