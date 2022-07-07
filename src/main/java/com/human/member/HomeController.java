package com.human.member;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private SqlSession sqlSession;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/")
	public String home(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		if(session.getAttribute("userid")==null) { //로그인 하기 전 상태
			model.addAttribute("userinfo","");
//			model.addAttribute("statusLine","<a href='/member/login'>Login</a>&nbsp;<a href='/member/signin'>회원가입</a>");
//			model.addAttribute("newbutton","<input type=button value='New Post' hidden>");
		}else { //로그인 성공 후
			model.addAttribute("userinfo",session.getAttribute("userid"));
//			model.addAttribute("statusLine",session.getAttribute("userid")+"&nbsp;<a href='/member/logout'>Logout</a>");
//			model.addAttribute("newbutton","<input type=button value='New Post'>");
		}
		iJoin join=sqlSession.getMapper(iJoin.class);
		ArrayList<boardDTO> listpost=join.postlist();
		model.addAttribute("listPost",listpost);
		model.addAttribute("userid",session.getAttribute("userid"));
		return "home";  //jsp file name
	}
	
	@RequestMapping(value="/login") //requestMethod가 get방식이면 method=RequestMethod.GET 생략 가능
	public String doLogin() {
		return "login";
	}
	
	@RequestMapping(value="/signin")
	public String doSignin() {
		return "signin";
	}
	
	@RequestMapping(value="/user_check",method=RequestMethod.POST)
	public String doUserCheck(HttpServletRequest req, Model model) {
		System.out.println("doUserCheck called");
		String user_id=req.getParameter("userid");
		String password=req.getParameter("pwd");
		iJoin join=sqlSession.getMapper(iJoin.class);
		int a=join.count(user_id, password);
		System.out.println(a);
		HttpSession session = req.getSession();
		if(a==0) {
			model.addAttribute("login","fail");
			return "login";
		}
		else{
			session.setAttribute("userid", user_id);
			return "redirect:/";
		}
	}
	@RequestMapping("/user_signin")
//	public String doUserSignin(@RequestParam String userid, @RequestParam String pwd,
//								@RequestParam String pwd1) {
	public String doUserSignin(HttpServletRequest req,Model model) {
		String newUser=req.getParameter("id");
		String pwd=req.getParameter("pwd");
		String name=req.getParameter("user_name");
		String mobile=req.getParameter("mobile");
		iJoin join=sqlSession.getMapper(iJoin.class);
		join.insert(newUser,pwd,name,mobile);
		return "redirect:/login"; //URL in RequestMapping
		
	}
	
	@RequestMapping("/logout")
	public String doLogout(HttpServletRequest req) {
		HttpSession session=req.getSession();
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping("/newpost")
	public String doNewPost() {
		return "new";
	}
	@RequestMapping("/addpost")
	public String doAddPost(HttpServletRequest req) {
		HttpSession session=req.getSession();
		iJoin join=sqlSession.getMapper(iJoin.class);
		String title=req.getParameter("title");
		String content=req.getParameter("content");
		String writer=(String) session.getAttribute("userid");
		System.out.println(title);
		System.out.println(content);
		System.out.println(writer);
		join.add(title, content, writer);
		return "redirect:/";
	}
	@RequestMapping("/addlist")
	public String doAddList(Model model) {
		iJoin join=sqlSession.getMapper(iJoin.class);
		ArrayList<boardDTO> listpost=join.postlist();
		model.addAttribute("listPost",listpost);
		return "addlist";
	}
	@RequestMapping("/delete/{seqbb}")
	public String doDelete(@PathVariable int seqbb) {
		iJoin join=sqlSession.getMapper(iJoin.class);
		join.delete(seqbb);
		return "redirect:/";
	}
	
	@RequestMapping("/modify")
	public String domodify(Model model,HttpServletRequest req) {
		iJoin join=sqlSession.getMapper(iJoin.class);
		int seqbb=Integer.parseInt(req.getParameter("seqbb"));
		boardDTO bdto=join.selectpost(seqbb);
		model.addAttribute("boardDTO",bdto);
		return "update";
	}
	@RequestMapping("/update")
	public String doUpdate(HttpServletRequest req) {
		iJoin join=sqlSession.getMapper(iJoin.class);
		String title=req.getParameter("title");
		String content=req.getParameter("content");
		int seqbb=Integer.parseInt(req.getParameter("seqbb"));
		join.update(title, content,seqbb);
		return "redirect:/";
	}
	@RequestMapping("/view")
	public String doView(@RequestParam int seqbb, Model model) {
		iJoin join=sqlSession.getMapper(iJoin.class);
		boardDTO boardDTO=join.selectview(seqbb);
		model.addAttribute("boardDTO",boardDTO);
		return "view";
	}
}

