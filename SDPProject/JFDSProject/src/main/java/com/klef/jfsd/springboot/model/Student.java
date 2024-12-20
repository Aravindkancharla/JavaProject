package com.klef.jfsd.springboot.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "student_table")
public class Student 
{
  
  @Column(name = "suname")
  private String username;
  @Id
  @Column(name = "sid")
  private long id;
  @Column(name = "sfname", length = 20, nullable = false)
  private String fname;
  @Column(name = "slname", length = 20, nullable = false)
  private String lname;
  @Column(name = "scontact", length = 10, nullable = false, unique = true)
  private String contact;
  @Column(name = "semail", length = 30, nullable = false, unique = true)
  private String email;
  @Column(name = "sgender", length = 10, nullable = false)
  private String gender;
  @Column(name = "sdob", length = 10, nullable = false)
  private String dob;
  @Column(name = "spwd", length = 30, nullable = false)
  private String pwd;
  
public String getUsername() {
	return username;
}
public void setUsername(String username) {
	this.username = username;
}
public long getId() {
	return id;
}
public void setId(long id) {
	this.id = id;
}
public String getFname() {
	return fname;
}
public void setFname(String fname) {
	this.fname = fname;
}
public String getLname() {
	return lname;
}
public void setLname(String lname) {
	this.lname = lname;
}
public String getContact() {
	return contact;
}
public void setContact(String contact) {
	this.contact = contact;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getGender() {
	return gender;
}
public void setGender(String gender) {
	this.gender = gender;
}
public String getDob() {
	return dob;
}
public void setDob(String dob) {
	this.dob = dob;
}
public String getPwd() {
	return pwd;
}
public void setPwd(String pwd) {
	this.pwd = pwd;
}

}