package dao;

import org.springframework.stereotype.Repository;

import domain.Grade;

@Repository("gradeDao")
public class GradeDaoImpl extends BaseDaoImpl<Grade> implements GradeDao {
	
}
