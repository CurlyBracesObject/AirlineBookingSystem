package com.rain.domain;

import java.io.Serializable;

/**
 * (FeijiZuoWei)实体类
 *
 * @author makejava
 * @since 2023-11-30 21:40:23
 */
public class FeijiZuoWei implements Serializable {
    private static final long serialVersionUID = -42396704009552780L;

    private Integer id;

    private Integer fei_ji_id;

    private Integer row;

    private Integer col;

    private String type;

    private String price;

    private Integer number;

    private String fei_ji_name;

    private String status;

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getFei_ji_name() {
        return fei_ji_name;
    }

    public void setFei_ji_name(String fei_ji_name) {
        this.fei_ji_name = fei_ji_name;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getFei_ji_id() {
        return fei_ji_id;
    }

    public void setFei_ji_id(Integer fei_ji_id) {
        this.fei_ji_id = fei_ji_id;
    }

    public Integer getRow() {
        return row;
    }

    public void setRow(Integer row) {
        this.row = row;
    }

    public Integer getCol() {
        return col;
    }

    public void setCol(Integer col) {
        this.col = col;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "FeijiZuoWei{" +
                "id=" + id +
                ", fei_ji_id=" + fei_ji_id +
                ", row=" + row +
                ", col=" + col +
                ", type='" + type + '\'' +
                ", price='" + price + '\'' +
                ", number=" + number +
                ", fei_ji_name='" + fei_ji_name + '\'' +
                ", status='" + status + '\'' +
                '}';
    }
}

