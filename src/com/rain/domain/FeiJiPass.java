package com.rain.domain;

import java.io.Serializable;

public class FeiJiPass implements Serializable {

    private Integer id;
    private String feiji_name;
    private String chu_fa_di;
    private String mu_di_di;
    private String qi_fei_time;
    private String dao_da_time;
    private String tou_deng_number;
    private String tou_deng_price;
    private String shang_ye_number;
    private String shang_ye_price;
    private String jing_ji_price;
    private String jing_ji_number;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFeiji_name() {
        return feiji_name;
    }

    public void setFeiji_name(String feiji_name) {
        this.feiji_name = feiji_name;
    }

    public String getChu_fa_di() {
        return chu_fa_di;
    }

    public void setChu_fa_di(String chu_fa_di) {
        this.chu_fa_di = chu_fa_di;
    }

    public String getMu_di_di() {
        return mu_di_di;
    }

    public void setMu_di_di(String mu_di_di) {
        this.mu_di_di = mu_di_di;
    }

    public String getQi_fei_time() {
        return qi_fei_time;
    }

    public void setQi_fei_time(String qi_fei_time) {
        this.qi_fei_time = qi_fei_time;
    }

    public String getDao_da_time() {
        return dao_da_time;
    }

    public void setDao_da_time(String dao_da_time) {
        this.dao_da_time = dao_da_time;
    }

    public String getTou_deng_number() {
        return tou_deng_number;
    }

    public void setTou_deng_number(String tou_deng_number) {
        this.tou_deng_number = tou_deng_number;
    }

    public String getTou_deng_price() {
        return tou_deng_price;
    }

    public void setTou_deng_price(String tou_deng_price) {
        this.tou_deng_price = tou_deng_price;
    }

    public String getShang_ye_number() {
        return shang_ye_number;
    }

    public void setShang_ye_number(String shang_ye_number) {
        this.shang_ye_number = shang_ye_number;
    }

    public String getShang_ye_price() {
        return shang_ye_price;
    }

    public void setShang_ye_price(String shang_ye_price) {
        this.shang_ye_price = shang_ye_price;
    }

    public String getJing_ji_price() {
        return jing_ji_price;
    }

    public void setJing_ji_price(String jing_ji_price) {
        this.jing_ji_price = jing_ji_price;
    }

    public String getJing_ji_number() {
        return jing_ji_number;
    }

    public void setJing_ji_number(String jing_ji_number) {
        this.jing_ji_number = jing_ji_number;
    }
}
