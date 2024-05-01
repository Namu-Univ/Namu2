package com.namuuniv.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import com.namuuniv.mybatis.DBService;
import com.namuuniv.vo.EnrollStuVO;
import com.namuuniv.vo.GradeVO;
import com.namuuniv.vo.ProSubjectVO;

public class GradeDAO {
	
	// 강의 리스트 조회
	public static List<ProSubjectVO> proSubList(int id) {
		try (SqlSession ss = DBService.getFactory().openSession()){
			return ss.selectList("grade.proSubList", id);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	// 수강 중인 학생 리스트 조회
	public static List<EnrollStuVO> enrollStuList(EnrollStuVO vo) {
		try (SqlSession ss = DBService.getFactory().openSession()){
			return ss.selectList("grade.enrollStuList", vo);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	// 성적 입력 가능 여부
	
	// 성적 입력
	public static int insertGrade(GradeVO vo) {
		try (SqlSession ss = DBService.getFactory().openSession()){
			return ss.insert("grade.enrollStuList", vo);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

}
