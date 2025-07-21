package com.rain.config;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;

@Component
public class ApplicationContextProvider implements ApplicationContextAware {//表示这个类可以访问ApplicationContext
    private static ApplicationContext context;
    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        context = applicationContext;
    }//实现了ApplicationContextAware接口的setApplicationContext方法，Spring容器会调用这个方法，注入ApplicationContext。

    public static <T> T getBean(Class<T> beanClass) {
        return context.getBean(beanClass);
    }//于从应用程序上下文中获取指定类型的bean。
    // 返回应用程序上下文中请求类型的bean。

    public static Object getBean(String beanName) {
        return context.getBean(beanName);
    }

}
