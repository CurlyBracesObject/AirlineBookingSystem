package com.rain.service;

import com.rain.domain.FeiJi;

import java.util.List;

/**
 * (FeiJi)表服务接口
 *
 * @author zhangxue
 * @since 2023-11-29 21:26:23
 */
public interface FeiJiService {

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    FeiJi queryById(Integer id);

    List<FeiJi> selectFeiJi(FeiJi feiJi);

    /**
     * 新增数据
     *
     * @param FeiJi 实例对象
     * @return 实例对象
     */
    FeiJi insert(FeiJi FeiJi);

    /**
     * 修改数据
     *
     * @param FeiJi 实例对象
     * @return 实例对象
     */
    FeiJi update(FeiJi FeiJi);

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 是否success
     */
    boolean deleteById(Integer id);

}
