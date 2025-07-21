package com.rain.controller;

import org.springframework.stereotype.Controller;//导入Spring框架中标记一个类为控制器的注解
import org.springframework.web.bind.annotation.PathVariable;//导入用于处理URL中路径变量的注解
import org.springframework.web.bind.annotation.RequestMapping;//导入用于映射HTTP请求到处理方法的注解

@Controller
public class CommonController {
	@RequestMapping(value = "/{formName}")//这个注解用于映射任何形式的`/{formName}`URL到下面的方法。`{formName}`是一个路径变量。
	//这个方法用于处理`/{formName}`路径的请求，`@PathVariable`注解表示方法参数`formName`将从URL路径中获取。
	public String loginForm(@PathVariable String formName) {
		// 作为一个空方法，可以匹配任何无效输入，再跳转到404
		return formName;//根据URL中的`formName`，将会返回相应的视图名称。
//		String blank = "blank";
//		return blank;
	}

	@RequestMapping(value = "/")//映射根URL（即`/`）到下面的方法。
	public String index() {//处理根URL的请求。
		String blank = "index";
		return blank;//加载名为`index`的视图
	}

	@RequestMapping(value = "/welcome")//映射`/welcome`URL到下面的方法。
	public String welcome() {//处理`/welcome`路径的请求。
		String blank = "welcome";
		return blank;
	}
}

//根据URL路径映射并返回相应的视图。
// 例如，当用户访问网站根路径时，它会返回`index`视图；
// 当访问`/welcome`时，返回`welcome`视图。这些视图是JSP页面。

