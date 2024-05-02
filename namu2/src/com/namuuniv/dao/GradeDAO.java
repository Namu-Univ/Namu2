package com.namuuniv.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import com.namuuniv.mybatis.DBService;
import com.namuuniv.vo.EnrollStuVO;
import com.namuuniv.vo.GradeVO;
import com.namuuniv.vo.ProSubjectVO;

public class GradeDAO {
	
	// (교수)강의 - 전체 내 강의 수 조회
	public static int totalSubjectCount(int id) {
		int totalCount = 0;
		try (SqlSession ss = DBService.getFactory().openSession()) {
			totalCount = ss.selectOne("grade.totalSubjectCount", id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return totalCount;
	}
	
	// (교수)강의 - 내 강의 조회
	public static List<ProSubjectVO> proSubList(int begin, int end, int id) {
	    try (SqlSession ss = DBService.getFactory().openSession()){
	    	Map<String, Integer> map = new HashMap<>();
	    	map.put("id", id);
	        map.put("begin", begin);
	        map.put("end", end);

	        return ss.selectList("proSubList", map);
	    } catch(Exception e) {
	        e.printStackTrace();
	    }
	    return null;
	}
	
	// (교수)강의 - 전체 수강중인 학생 목록 수 조회
	public static int totalEnrollCount(EnrollStuVO vo) {
		int totalCount = 0;
		try (SqlSession ss = DBService.getFactory().openSession()) {
			totalCount = ss.selectOne("grade.totalEnrollCount", vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return totalCount;
	}
	
	// (교수)강의 - 수강중인 학생 목록
	public static List<EnrollStuVO> enrollStuList(EnrollStuVO vo) {
		try (SqlSession ss = DBService.getFactory().openSession()){
			return ss.selectList("grade.enrollStuList", vo);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	// (교수)성적 입력
	public static int insertGrade(GradeVO vo) {
		try (SqlSession ss = DBService.getFactory().openSession()){
			int result = ss.insert("grade.insertGrade", vo);
			if (result > 0) {
				ss.commit();
				return result;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	// (학생) 전체 내 강의 수 조회
	public static int totalStuSubCount(int id) {
		int totalCount = 0;
		try (SqlSession ss = DBService.getFactory().openSession()) {
			totalCount = ss.selectOne("grade.totalStuSubCount", id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return totalCount;
	}
	
	// (교수)강의 - 내 강의 조회
	public static List<EnrollStuVO> stuSubList(EnrollStuVO vo) {
		try (SqlSession ss = DBService.getFactory().openSession()){
			return ss.selectList("grade.stuSubList", vo);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
