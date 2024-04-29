package com.namuuniv.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.namuuniv.mybatis.DBService;
import com.namuuniv.vo.NoticeVO;
import com.namuuniv.vo.SubjectVO;

public class GradeDAO {
	
	// 강의 리스트 조회
	public static List<SubjectVO> subjectList(int id) {
		try (SqlSession ss = DBService.getFactory().openSession()){
			return ss.selectList("grade.subjectList", id);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
