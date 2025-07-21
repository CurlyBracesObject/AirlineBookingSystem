package com.rain.controller;

import com.rain.domain.FeiJi;
import com.rain.service.FeiJiService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class FeiJiController {

    @Resource
    private FeiJiService feiJiService;

    @RequestMapping(value = "/feiji/pass",method = RequestMethod.GET)
    public ModelAndView pass(Integer id, ModelAndView modelAndView) {
        FeiJi feiJi = new FeiJi();
        feiJi.setId(id);
        feiJi.setStatus("PASS");
        feiJiService.update(feiJi);
        modelAndView.setViewName("redirect:/feiji/list");
        return modelAndView;
    }

    @RequestMapping(value = "/feiji/list",method = RequestMethod.GET)
    public ModelAndView selectFeiJiList(@ModelAttribute FeiJi feiji, ModelAndView modelAndView, HttpSession session) {
        List<FeiJi> feiJiList = feiJiService.selectFeiJi(feiji);
        modelAndView.addObject("feiJiList", feiJiList);
        modelAndView.setViewName("feiji/list");
        if ("3".equals(session.getAttribute("tip"))) {
            modelAndView.addObject("hasRole", true);
        }
        return modelAndView;
    }
    @RequestMapping(value = "/feiji_pass/list",method = RequestMethod.GET)
    public ModelAndView selectFeiJiListPass(FeiJi feiJi, ModelAndView modelAndView) {
        feiJi.setStatus("PASS");
        System.out.println(feiJi);
        List<FeiJi> feiJiList = feiJiService.selectFeiJi(feiJi);
        modelAndView.addObject("feiJiList", feiJiList);
        modelAndView.setViewName("feiji/pass/list");
        return modelAndView;
    }



    @RequestMapping(value = "/feiji/delete",method = RequestMethod.POST)
    public ModelAndView deleteFeiJi(@ModelAttribute FeiJi feiji,ModelAndView modelAndView) {
        feiJiService.deleteById(feiji.getId());
        modelAndView.setViewName("redirect:/feiji/list");
        return modelAndView;
    }

    @RequestMapping(value = "/feiji/toUpdate",method = RequestMethod.GET)
    public ModelAndView toUpdate(Integer id, ModelAndView modelAndView) {
        FeiJi feiJi = feiJiService.queryById(id);
        modelAndView.addObject("feiji", feiJi);
        modelAndView.setViewName("/feiji/update");
        return modelAndView;
    }

    @RequestMapping(value = "/feiji/add",method = RequestMethod.GET)
    public ModelAndView toAdd(ModelAndView modelAndView) {
        modelAndView.setViewName("feiji/add");
        return modelAndView;
    }


    @RequestMapping(value = "/feiji/save/entity",method = RequestMethod.POST)
    public ModelAndView saveEntity(@ModelAttribute FeiJi feiJi, ModelAndView modelAndView) {
        modelAndView.setViewName("redirect:/feiji/list");
        feiJi.setSheng_yu_total(feiJi.getZuo_wei_total());

        feiJiService.insert(feiJi);
        return modelAndView;
    }

    @RequestMapping(value = "/feiji/update/entity",method = RequestMethod.POST)
    public ModelAndView updateEntity(@ModelAttribute FeiJi feiJi, ModelAndView modelAndView) {
        modelAndView.setViewName("redirect:/feiji/list");
        feiJiService.update(feiJi);
        return modelAndView;
    }



}
