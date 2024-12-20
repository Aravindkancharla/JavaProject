package com.klef.jfsd.springboot.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.springboot.model.Student;

@Repository
public interface StudentRepository extends JpaRepository<Student, Long> {

	@Query("Select s from Student s where s.username =?1and s.pwd =?2")
	public Student checkstudentlogin(String uname ,String pwd);

	
}
