package com.rain.controller;

import com.rain.domain.FeiJi;
import com.rain.domain.FeijiZuoWei;
import com.rain.domain.FeijiZuoWeiYuDing;
import com.rain.service.FeiJiService;
import com.rain.service.FeijiZuoWeiService;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;
import java.util.Properties;

@Controller
public class FeiJiZuoWeiController {

    @Resource
    private FeijiZuoWeiService feiJiZuoWeiService;
    @Resource
    private FeiJiService feiJiService;


    @RequestMapping(value = "/feijizuowei/list",method = RequestMethod.GET)
    public ModelAndView selectFeiJiList(FeijiZuoWei feiji, ModelAndView modelAndView) {
        List<FeijiZuoWei> feiJiList = feiJiZuoWeiService.selectFeiJi(feiji);
        modelAndView.addObject("feiJiZuoWeiList", feiJiList);
        modelAndView.setViewName("feijizuowei/list");
        return modelAndView;
    }
    @RequestMapping(value = "/feijizuowei/delete",method = RequestMethod.POST)
    public ModelAndView deleteFeiJi(@ModelAttribute FeijiZuoWei feiji,ModelAndView modelAndView) {
        feiJiZuoWeiService.deleteById(feiji.getId());
        modelAndView.setViewName("redirect:/feiji/list");
        return modelAndView;
    }

    @RequestMapping(value = "/feijizuowei/toUpdate",method = RequestMethod.GET)
    public ModelAndView toUpdate(Integer id, ModelAndView modelAndView) {
        FeijiZuoWei feiJi = feiJiZuoWeiService.queryById(id);
        modelAndView.addObject("feijizuowei", feiJi);

        List<FeiJi> feijiList = feiJiService.selectFeiJi(new FeiJi());
        modelAndView.addObject("feijiList", feijiList);

        modelAndView.setViewName("/feijizuowei/update");
        return modelAndView;
    }

    @RequestMapping(value = "/feijizuowei/add",method = RequestMethod.GET)
    public ModelAndView toAdd(ModelAndView modelAndView) {
        List<FeiJi> feijiList = feiJiService.selectFeiJi(new FeiJi());
        modelAndView.addObject("feijiList", feijiList);
        modelAndView.setViewName("feijizuowei/add");
        return modelAndView;
    }


    @RequestMapping(value = "/feijizuowei/save/entity",method = RequestMethod.POST)
    public ModelAndView saveEntity(@ModelAttribute FeijiZuoWei feiJi, ModelAndView modelAndView) {
        modelAndView.setViewName("redirect:/feijizuowei/list");
        feiJiZuoWeiService.insert(feiJi);
        return modelAndView;
    }

    @RequestMapping(value = "/feijizuowei/update/entity",method = RequestMethod.POST)
    public ModelAndView updateEntity(@ModelAttribute FeijiZuoWei feiJi, ModelAndView modelAndView) {
        modelAndView.setViewName("redirect:/feijizuowei/list");
        feiJiZuoWeiService.update(feiJi);
        return modelAndView;
    }



    @RequestMapping(value = "/feijizuowei/toyuding",method = RequestMethod.GET)
    public ModelAndView toYuDing(@RequestParam("fei_ji_id") Integer fei_ji_id, ModelAndView modelAndView) {
        FeijiZuoWei feijiZuoWei = new FeijiZuoWei();
        feijiZuoWei.setFei_ji_id(fei_ji_id);
        List<FeijiZuoWei> feiJiList = feiJiZuoWeiService.selectFeiJi(feijiZuoWei);
        modelAndView.addObject("feiJiZuoWeiList", feiJiList);
        modelAndView.addObject("fei_ji_id", fei_ji_id);
        System.out.println("fei_ji_id" + fei_ji_id);
        modelAndView.setViewName("feiji/pass/zuoWeiList");
        return modelAndView;
    }



    @RequestMapping(value = "/feijizuowei_pass/list",method = RequestMethod.GET)
    public ModelAndView selectFeiJiPassList(FeijiZuoWei feiji, ModelAndView modelAndView) {
        System.out.println(feiji.toString());
        List<FeijiZuoWei> feiJiList = feiJiZuoWeiService.selectFeiJi(feiji);
        modelAndView.addObject("feiJiZuoWeiList", feiJiList);
        modelAndView.addObject("fei_ji_id", feiji.getFei_ji_id());
        modelAndView.setViewName("feiji/pass/zuoWeiList");
        return modelAndView;
    }


    @RequestMapping(value = "/feijizuowei_pass/toyuding",method = RequestMethod.GET)
    public ModelAndView toYuDing(FeijiZuoWei feiji, ModelAndView modelAndView) {
        FeijiZuoWei feijiZuoWei = feiJiZuoWeiService.queryById(feiji.getId());
        Integer feiJiId = feijiZuoWei.getFei_ji_id();
        FeiJi feiJi = feiJiService.queryById(feiJiId);
        modelAndView.addObject("feijizuowei", feijiZuoWei);
        modelAndView.addObject("feiji", feiJi);
        modelAndView.setViewName("feiji/pass/yuding");
        return modelAndView;
    }
    @RequestMapping(value = "/feijizuowei_pass/save/yuding",method = RequestMethod.POST)
    public ModelAndView saveYuDing(@ModelAttribute FeijiZuoWeiYuDing feijiZuoWeiYuDing, ModelAndView modelAndView) {
        FeijiZuoWei feijiZuoWei = feiJiZuoWeiService.queryById(feijiZuoWeiYuDing.getId());
        FeiJi feiJi = feiJiService.queryById(feijiZuoWei.getFei_ji_id());

        JavaMailSenderImpl javaMailSender = new JavaMailSenderImpl();
        javaMailSender.setHost("smtp.qq.com");
        javaMailSender.setUsername("809726074@qq.com");
        javaMailSender.setPassword("xkivwnfymutfbejg");
        javaMailSender.setPort(587);
        Properties properties = new Properties();
        properties.put("mail.smtp.auth", true);
        properties.put("mail.smtp.starttls.enable", true);
        javaMailSender.setJavaMailProperties(properties);

        SimpleMailMessage simpleMailMessage = new SimpleMailMessage();
        simpleMailMessage.setFrom("809726074@qq.com");
        simpleMailMessage.setTo(feijiZuoWeiYuDing.getEmail());
        simpleMailMessage.setSubject("Your flight ticket information");
        String type = "";
        if ("TOUDENG".equals(feijiZuoWeiYuDing.getType())) {
            type = "First Clas";
        }
        if ("JINGJI".equals(feijiZuoWeiYuDing.getType())) {
            type = "Economy";
        }
        if ("SHANGYE".equals(feijiZuoWeiYuDing.getType())) {
            type = "Business";
        }
        FeijiZuoWei updateFeijiZuoWei = new FeijiZuoWei();
        updateFeijiZuoWei.setId(feijiZuoWei.getId());
        updateFeijiZuoWei.setStatus("BUY");
        feiJiZuoWeiService.update(updateFeijiZuoWei);
        FeiJi updateFeiji = new FeiJi();
        updateFeiji.setId(feiJi.getId());
        updateFeiji.setSheng_yu_total(feiJi.getSheng_yu_total() - 1);
        feiJiService.update(updateFeiji);
        modelAndView.setViewName("feiji/pass/success");
        modelAndView.addObject("feijizuowei", feijiZuoWei);
        modelAndView.addObject("feiji", feiJi);

        String text = "The flight name you are taking is:" + feiJi.getFei_ji_name() + "\n"
                + "Seating is:" + "No." + feijiZuoWei.getRow() + "row\t" + "No." + feijiZuoWei.getCol() + "\n"
                + "The departure time is:" + feiJi.getQi_fei_time() + "\tThe arrival time is:" + feiJi.getDao_da_time() + "\n"
                + "The departure point is:" + feiJi.getChu_fa_di() + "\tThe destination is:" + feiJi.getMu_di_di() + "\n"
                + "The seat type is: " + type + "\n"
                + "The price is: " + feijiZuoWei.getPrice() + "RMB";

        simpleMailMessage.setText(text);
        javaMailSender.send(simpleMailMessage);


        return modelAndView;
    }



}
