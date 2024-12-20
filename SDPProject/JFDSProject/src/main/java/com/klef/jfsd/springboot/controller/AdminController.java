package com.klef.jfsd.springboot.controller;

import java.sql.Blob;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.springboot.model.Admin;
import com.klef.jfsd.springboot.model.Event;
import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.service.AdminService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class AdminController{
	
	@Autowired
	private AdminService adminService;
	

	
	@GetMapping("")
	public ModelAndView adminlogin() {
	    ModelAndView mv = new ModelAndView();
	    mv.setViewName("mainhome");
	    return mv;
	}

	
	@PostMapping("checkadminlogin")
	public ModelAndView checkadminlogin(HttpServletRequest request, HttpServletResponse response) {
		String uname = request.getParameter("auname");
		String pwd = request.getParameter("apwd");
		Admin admin = adminService.checkadminlogin(uname, pwd);
		ModelAndView mv = new ModelAndView();
		if(admin != null)
		{
			mv.setViewName("adminhome");
		}
		else
		{
			mv.setViewName("mainhome");
			mv.addObject("msg", "Invaild Credentials");
		}
		return mv;
	}
	
	@GetMapping("adminhome")
	public ModelAndView adminhome() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("adminhome");
		return mv;
		
	}
	
	@GetMapping("addstudent")
	public String addstudent(Model m) {
		m.addAttribute("student", new Student());
		return "addstudent";
	}
	
	@PostMapping("insertstudent")
	  public ModelAndView insertStudent(HttpServletRequest request, HttpServletResponse response)
	  {
	    long id =  Long.parseLong(request.getParameter("sid"));
	    String fname =  request.getParameter("sfname");
	    String lname =  request.getParameter("slname");
	    String gender = request.getParameter("sgender");
	    String email = request.getParameter("semail");
	    String contact = request.getParameter("scontact");
	    String dob = request.getParameter("sdob");
	    String pwd = request.getParameter("spwd");
	    String username = id+"_"+lname;
	    
	    Student s = new Student();
	    
	    s.setId(id);
	    s.setUsername(username);
	    s.setFname(fname);
	    s.setLname(lname);
	    s.setGender(gender);
	    s.setEmail(email);
	    s.setContact(contact);
	    s.setDob(dob);
	    s.setPwd(pwd);
	    
	    String msg = adminService.addstudent(s);
	    
	    ModelAndView mv = new ModelAndView();
	    mv.setViewName("addstudent");
	    mv.addObject("message", msg);
	    return mv;
	  }
    
    @GetMapping("viewallstudents")
    public ModelAndView viewallstudents()
    {
      ModelAndView mv = new ModelAndView();
    List<Student> studlist = adminService.ViewAllStudents();
    mv.setViewName("viewallstudents");
    mv.addObject("studlist", studlist);
    
      return mv;
    }
    

    @GetMapping("deletestudents")
    public ModelAndView deletestudents()
    {
      ModelAndView mv = new ModelAndView();
      List<Student> studlist = adminService.ViewAllStudents(); 
      mv.setViewName("deletestudents");
      mv.addObject("studlist",studlist);
      return mv;
    }
    
    @GetMapping("delete")
    public String deleteoperation(@RequestParam("id") long sid) {
    	
   	 adminService.deletestudent( sid);
   	 
   	 return "redirect:/deletestudents";
    }
    
   
    
    @GetMapping("adminlogout")
    public ModelAndView adminlogout()
       {
         ModelAndView mv = new ModelAndView();
         mv.setViewName("mainhome");
         return mv;
       }
	
    @GetMapping("addevent")
    public ModelAndView addevent()
    {
      ModelAndView mv = new ModelAndView("addevent");
      return mv;
    }
    
    @PostMapping("insertevent")
    public ModelAndView insertproductdemo(HttpServletRequest request, @RequestParam("eventimage") MultipartFile file) throws Exception
    {
      String msg = null;
      
      ModelAndView mv = new ModelAndView();
      
      try
      {
      
         String id = request.getParameter("id");
         String name = request.getParameter("name");
         String description = request.getParameter("description");
         String category = request.getParameter("category");
         String addedby = request.getParameter("addedby");
         String venue = request.getParameter("venue");
         String availableSlots = request.getParameter("availableSlots");
         
       byte[] bytes = file.getBytes();
       Blob blob = new javax.sql.rowset.serial.SerialBlob(bytes);
       //  creates a Blob object in Java from a byte array (bytes).
       
       Event e = new Event();
      
       
       e.setName(name);
       e.setDescription(description);
       e.setCategory(category);
       e.setAddedby(addedby);
       e.setVenue(venue);
       e.setAvailableSlots(0);
      
       e.setImage(blob);
       
       msg=adminService.addevent(e);
       System.out.println(msg);
       mv.setViewName("addevent");
       mv.addObject("message",msg);
      }    
      catch(Exception e)
      {
        msg = e.getMessage();
        System.out.println(msg.toString());
        mv.setViewName("eventerror");
        mv.addObject("message",msg);
      }
      return mv;
      }
    
    @GetMapping("Viewallevents")
    public ModelAndView viewAllEvents(@RequestParam(defaultValue = "0") int page) {
      
      
        ModelAndView mv = new ModelAndView("Viewallevents");
        List<Event> eventList = adminService.ViewAllEvents(); 
        mv.addObject("eventList", eventList);
        return mv;
    }
    @GetMapping("displayeventimage")
    public ResponseEntity<byte[]> displayeventimagedemo(@RequestParam int id) throws Exception
    {
      Event event =  adminService.ViewEventById(id);
      byte [] imageBytes = null;
      imageBytes = event.getImage().getBytes(1,(int) event.getImage().length());

      return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(imageBytes);
      
    // Response Body, HTTP Status Code, Headers
    }
    
    @GetMapping("deleteevents")
    public ModelAndView deleteevent() {
    	
    	ModelAndView mv = new ModelAndView();
    	List<Event> eventList = adminService.ViewAllEvents();
    	mv.setViewName("deleteevent");
    	mv.addObject("eventList", eventList);
    	
    	return mv;
    }
    
    @PostMapping("removeevent")
    public String removeevent(HttpServletRequest request)
    {
    	long eid = Long.parseLong(request.getParameter("eid"));
    	adminService.deleteevent(eid);
    	return "redirect:/deleteevents";
    }
    
}
