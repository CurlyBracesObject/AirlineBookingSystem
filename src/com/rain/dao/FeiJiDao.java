package com.rain.dao;

import com.rain.domain.FeiJi;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * (FeiJi)表数据库访问层
 *
 * @author makejava
 * @since 2023-11-29 21:24:03
 */
@Mapper
public interface FeiJiDao {

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    FeiJi queryById(Integer id);



    /**
     * 统计总行数
     *
     * @param FeiJi 查询条件
     * @return 总行数
     */
    long count(FeiJi FeiJi);

    /**
     * 新增数据
     *
     * @param FeiJi 实例对象
     * @return 影响行数
     */
    int insert(FeiJi FeiJi);



    /**
     * 修改数据
     *
     * @param FeiJi 实例对象
     * @return 影响行数
     */
    int update(FeiJi FeiJi);

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 影响行数
     */
    int deleteById(Integer id);

    List<FeiJi> selectList(FeiJi feiJi);

    List<FeiJi> selectListByIdList(List<Integer> list);
}

