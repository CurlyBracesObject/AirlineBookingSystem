package com.rain.domain;

import java.io.Serializable;
import java.time.LocalTime;

public class FeiJi implements Serializable {

    private Integer id;
    private String fei_ji_name;
    private String chu_fa_di;
    private String mu_di_di;
    private String qi_fei_time;
    private String dao_da_time;

    private Integer zuo_wei_total;

    private Integer sheng_yu_total;

    private String status;

    public Integer getSheng_yu_total() {
        return sheng_yu_total;
    }

    public void setSheng_yu_total(Integer sheng_yu_total) {
        this.sheng_yu_total = sheng_yu_total;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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

    public String getFei_ji_name() {
        return fei_ji_name;
    }

    public void setFei_ji_name(String fei_ji_name) {
        this.fei_ji_name = fei_ji_name;
    }

    public Integer getZuo_wei_total() {
        return zuo_wei_total;
    }

    public void setZuo_wei_total(Integer zuo_wei_total) {
        this.zuo_wei_total = zuo_wei_total;
    }


    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
