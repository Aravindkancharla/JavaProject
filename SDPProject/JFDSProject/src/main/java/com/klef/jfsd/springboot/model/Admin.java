package com.klef.jfsd.springboot.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="admin_table")
public class Admin 
{
  @Id
  @Column(name = "ausername", length = 30)
  private String username;
  @Column(name = "aemail", nullable = false, length = 50)
  private String email;
  @Column(name = "acontact", nullable = false, length = 10)
  private String contact;
  @Column(name = "apwd", nullable = false, length = 30)
  private String password;
  
  public String getUsername() 
  {
    return username;
  }
  public void setUsername(String username) 
  {
    this.username = username;
  }
  public String getEmail() 
  {
    return email;
  }
  public void setEmail(String email) 
  {
    this.email = email;
  }
  public String getContact() 
  {
    return contact;
  }
  public void setContact(String contact) 
  {
    this.contact = contact;
  }
  public String getPassword() {
    return password;
  }
  public void setPassword(String password) 
  {
    this.password = password;
  }
}