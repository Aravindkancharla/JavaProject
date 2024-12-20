package com.klef.jfsd.springboot.service;


import java.util.List;

import com.klef.jfsd.springboot.model.Admin;
import com.klef.jfsd.springboot.model.Event;
import com.klef.jfsd.springboot.model.Student;

public interface AdminService {
	
	public Admin checkadminlogin(String uname, String pwd);
	
	public String addstudent(Student s);
	
	public List<Student> ViewAllStudents();
	
	public String deletestudent(long sid);

	public String addevent (Event e);
	
	public List<Event> ViewAllEvents();

	public Event ViewEventById(long eventid);
	
	public String deleteevent(long eid);
}
