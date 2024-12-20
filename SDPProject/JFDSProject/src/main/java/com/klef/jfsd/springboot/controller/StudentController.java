package com.klef.jfsd.springboot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.springboot.model.Admin;
import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.service.StudentService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public class StudentController {

	@Autowired
	private StudentService studentService;
	
	@GetMapping("")
	public ModelAndView home()
	{
		ModelAndView mv= new ModelAndView();
		mv.setViewName("mainhome");
		return mv;
	}
	
	@PostMapping("checkstudentlogin")
	public ModelAndView checkstudentlogin(HttpServletRequest request, HttpServletResponse response) {
		String uname = request.getParameter("auname");
		String pwd = request.getParameter("apwd");
		Student student = studentService.checkstudentlogin(uname, pwd);
		ModelAndView mv = new ModelAndView();
		if(student != null)
		{
			mv.setViewName("");
		}
		else
		{
			mv.setViewName(" ");
			mv.addObject("msg", "Invaild Credentials");
		}
		return mv;
	}
}
