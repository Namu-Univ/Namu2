package com.namuuniv.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.namuuniv.mybatis.DBService;
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
	

}
