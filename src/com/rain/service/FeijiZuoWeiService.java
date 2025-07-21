package com.rain.service;

import com.rain.domain.FeiJi;
import com.rain.domain.FeijiZuoWei;

import java.util.List;

/**
 * (FeijiZuoWei)表服务接口
 *
 * @author zhangxue
 * @since 2023-11-30 21:40:23
 */
public interface FeijiZuoWeiService {

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    FeijiZuoWei queryById(Integer id);

    /**
     * 新增数据
     *
     * @param feijiZuoWei 实例对象
     * @return 实例对象
     */
    FeijiZuoWei insert(FeijiZuoWei feijiZuoWei);

    /**
     * 修改数据
     *
     * @param feijiZuoWei 实例对象
     * @return 实例对象
     */
    FeijiZuoWei update(FeijiZuoWei feijiZuoWei);

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 是否success
     */
    boolean deleteById(Integer id);

    List<FeijiZuoWei> selectFeiJi(FeijiZuoWei feiji);
}
