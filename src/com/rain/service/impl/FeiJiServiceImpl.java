package com.rain.service.impl;

import com.rain.dao.FeiJiDao;
import com.rain.domain.FeiJi;
import com.rain.service.FeiJiService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * (Feiji)表服务实现类
 *
 * @author zhangxue
 * @since 2023-11-29 21:26:23
 */
@Service
public class FeiJiServiceImpl implements FeiJiService {
    @Resource
    private FeiJiDao feiJiDao;

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    @Override
    public FeiJi queryById(Integer id) {
        return this.feiJiDao.queryById(id);
    }

    @Override
    public List<FeiJi> selectFeiJi(FeiJi feiJi) {
        return this.feiJiDao.selectList(feiJi);
    }


    /**
     * 新增数据
     *
     * @param feiji 实例对象
     * @return 实例对象
     */
    @Override
    public FeiJi insert(FeiJi feiji) {
        this.feiJiDao.insert(feiji);
        return feiji;
    }

    /**
     * 修改数据
     *
     * @param feiji 实例对象
     * @return 实例对象
     */
    @Override
    public FeiJi update(FeiJi feiji) {
        this.feiJiDao.update(feiji);
        return this.queryById(feiji.getId());
    }

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 是否success
     */
    @Override
    public boolean deleteById(Integer id) {
        return this.feiJiDao.deleteById(id) > 0;
    }
}
