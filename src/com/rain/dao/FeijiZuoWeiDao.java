package com.rain.dao;

import com.rain.domain.FeijiZuoWei;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * (FeijiZuoWei)表数据库访问层
 *
 * @author makejava
 * @since 2023-11-30 21:38:56
 */
public interface FeijiZuoWeiDao {

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    FeijiZuoWei queryById(Integer id);


    /**
     * 统计总行数
     *
     * @param tFeijiZuoWei 查询条件
     * @return 总行数
     */
    long count(FeijiZuoWei tFeijiZuoWei);

    /**
     * 新增数据
     *
     * @param tFeijiZuoWei 实例对象
     * @return 影响行数
     */
    int insert(FeijiZuoWei tFeijiZuoWei);



    /**
     * 修改数据
     *
     * @param tFeijiZuoWei 实例对象
     * @return 影响行数
     */
    int update(FeijiZuoWei tFeijiZuoWei);

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 影响行数
     */
    int deleteById(Integer id);

    List<FeijiZuoWei> selectList(FeijiZuoWei feiji);
}

