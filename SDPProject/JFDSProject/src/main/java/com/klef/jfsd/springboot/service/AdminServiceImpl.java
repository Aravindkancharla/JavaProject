package com.klef.jfsd.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.Admin;
import com.klef.jfsd.springboot.model.Event;
import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.repository.AdminRepository;
import com.klef.jfsd.springboot.repository.EventRepository;
import com.klef.jfsd.springboot.repository.StudentRepository;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminRepository adminRepository;
	
	@Autowired
	private StudentRepository studentRepository;
	
	@Autowired
	private EventRepository eventRepository;

	@Override
	public Admin checkadminlogin(String uname, String pwd) {
		
		return adminRepository.checkadminlogin(uname, pwd);
	}

	@Override
	public String addstudent(Student s) {
		studentRepository.save(s);
		return "Student added sucessfully";
		
	}

	@Override
	public List<Student> ViewAllStudents() {
	
		return studentRepository.findAll();
	}


	@Override
	public String deletestudent(long sid) {
		studentRepository.deleteById(sid);
		return "Student Deleted Successfully";
	}

	@Override
	public String addevent(Event e) {
		eventRepository.save(e);
		return "Event added successfully";
	}

	@Override
	public List<Event> ViewAllEvents() {
		return (List<Event>) eventRepository.findAll();
	}

	
	@Override
	public Event ViewEventById(long eventid) {
		return eventRepository.findById(eventid).get();
	}

	@Override
	public String deleteevent(long eid) {
		eventRepository.deleteById(eid);
		return "Event deleted successfully";
	}

	
}
