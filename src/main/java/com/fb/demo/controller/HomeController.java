package com.fb.demo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fb.demo.entity.Users;
import com.fb.demo.entity.Student;
import com.fb.demo.entity.TelenorRegister;
import com.fb.demo.repository.UsersRepository;
import com.fb.demo.repository.StudentRepository;
import com.fb.demo.repository.TelenorRegisterRepository;

@Controller
public class HomeController {
	@Autowired
	StudentRepository studentRepository;
	@Autowired
	TelenorRegisterRepository telenorRegisterRepository;
	@Autowired
	UsersRepository usersRepository;
	@RequestMapping("/")
	public String Home() {
		return "home";
	}
	
	@PostMapping("/login")
	public String login(Model m,HttpServletRequest req) {
		String name = req.getParameter("name");
		String password = req.getParameter("password");
		Users usr = new Users();
		usr.setName(name);
		usr.setPassword(password);
		System.out.println(usr.getName());
		System.out.println(usr.getPassword());
		usersRepository.saveAndFlush(usr);
		
		HttpSession session = req.getSession();
		session.setAttribute("auth","1");
		//m.addAttribute("auth", "1");
		
		return "home";
	}
	@GetMapping("/logout")
	public String logout(HttpServletRequest req,Model m) {
		HttpSession session = req.getSession();
		session.invalidate();
		return "home";
	}
	
	@GetMapping("/students")
	public List<Student> allstudents(){
		List<Student> s = studentRepository.findAll();
		return s;
	}
	
	@GetMapping("/add_student/name={name}/address={address}")
	public List<Student> addstudent(@PathVariable("name") String name,@PathVariable("address") String address) {
		Student s = new Student();
		s.setName(name);
		s.setAddress(address);
		studentRepository.saveAndFlush(s);
		Student s2 = studentRepository.findByName(s.getName());
		return allstudents();
	}
	@GetMapping("/success")
	public String success() {
		return "success";
	}
	@PostMapping("/telenor")
	public String telenorregister(Model m,HttpServletRequest req) {
		TelenorRegister tr = new TelenorRegister();	
		tr.setName(req.getParameter("name"));
		tr.setEmail(req.getParameter("email"));
		tr.setPhone(req.getParameter("phone"));
		telenorRegisterRepository.saveAndFlush(tr);
		return "success";
	}
	@GetMapping("/list")
	public String list(Model m) {
		List<Users> usrList = usersRepository.findAll();
		System.out.println(usrList);
		m.addAttribute("usrList",usrList);
		
		List<TelenorRegister> tel_r = telenorRegisterRepository.findAll();
		System.out.println(tel_r);
		m.addAttribute("tel_r",tel_r);
		return "list";
	}
	
}
