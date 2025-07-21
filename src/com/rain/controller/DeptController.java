package com.rain.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.rain.domain.Dept;
import com.rain.service.RainService;

@Controller
public class DeptController {
	@Autowired
	@Qualifier("RainService")//自动注入`RainService`。
	// `@Autowired`表示自动连接到Spring容器中匹配的bean，
	// `@Qualifier`指定注入的bean的名称。
	private RainService rainservice;//用于访问部门相关的业务逻辑
	
	// 如果在目录下输入为空，则跳转到指定链接
	@RequestMapping(value="/dept/")//映射URL`/dept/`到`index2(ModelAndView mv)`方法。
	 public ModelAndView index2(ModelAndView mv){//用于处理访问`/dept/`的请求
		mv.setViewName("dept/list");//设置视图名称为`dept/list`，这通常对应一个JSP页面。
		return mv;
	}
	// 如果在目录下输入任何不存在的参数，则跳转到list
	@RequestMapping(value="/dept/{formName}")//映射URL`/dept/{formName}`方法。
	 public String index2(@PathVariable String formName){// 处理`/dept/{formName}`的请求
//		return formName;
		String blank = "/dept/list";
		return blank;
	}


	@RequestMapping(value="/dept/list",method=RequestMethod.GET)//映射GET请求的`/dept/list`方法。
	 public String index(Model model,String content){//用于处理显示部门列表的请求
//		System.out.println("4234");
		List<Dept> dept_list = rainservice.findAllDept();
		if (content!=null){
			dept_list = rainservice.findAllDept(content);
		}
		
		model.addAttribute("list",dept_list);
//		for(Dept attribute : dept_list) {
//			  System.out.println(attribute.getName());
//			}
		return "dept/list";
	}
	@RequestMapping(value="/dept/add",method=RequestMethod.GET)
	 public String add(Model model,Integer id){
//		System.out.println(id);
		if(id!=null){
			Dept dept = rainservice.get_Info(id);
			model.addAttribute("dept",dept);
//			System.out.println(dept.getName());
		}
		return "/dept/add";
	}
	@RequestMapping(value="/dept/add",method=RequestMethod.POST)
	 public ModelAndView add(ModelAndView mv,@ModelAttribute Dept dept ,Integer id){
		System.out.println(id);
//		System.out.println(dept.getId());
		if(id!=null){
			rainservice.update_Info(dept);
			System.out.println(dept.getId());
		}else{
			rainservice.addDept(dept);
		}
//		System.out.println(dept.getName());
		mv.setViewName("redirect:/dept/list");
		return mv;
	}
	@RequestMapping(value="/dept/delete",method=RequestMethod.GET)
	 public void delete(Integer id){
		System.out.println(id);
		if(id!=null){
			rainservice.delete_Info(id);
		}
	}
}



