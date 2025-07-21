package com.rain.service.impl;

import com.rain.dao.FeiJiDao;
import com.rain.domain.FeiJi;
import com.rain.domain.FeijiZuoWei;
import com.rain.dao.FeijiZuoWeiDao;
import com.rain.service.FeijiZuoWeiService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * (FeijiZuoWei)表服务实现类
 *
 * @author zhangxue
 * @since 2023-11-30 21:40:23
 */
@Service("feijiZuoWeiService")
public class FeijiZuoWeiServiceImpl implements FeijiZuoWeiService {
    @Resource
    private FeijiZuoWeiDao feijiZuoWeiDao;

    @Resource
    private FeiJiDao feiJiDao;

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    @Override
    public FeijiZuoWei queryById(Integer id) {
        return this.feijiZuoWeiDao.queryById(id);
    }

    /**
     * 新增数据
     *
     * @param feijiZuoWei 实例对象
     * @return 实例对象
     */
    @Override
    public FeijiZuoWei insert(FeijiZuoWei feijiZuoWei) {
        this.feijiZuoWeiDao.insert(feijiZuoWei);
        return feijiZuoWei;
    }

    /**
     * 修改数据
     *
     * @param feijiZuoWei 实例对象
     * @return 实例对象
     */
    @Override
    public FeijiZuoWei update(FeijiZuoWei feijiZuoWei) {
        this.feijiZuoWeiDao.update(feijiZuoWei);
        return this.queryById(feijiZuoWei.getId());
    }

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 是否success
     */
    @Override
    public boolean deleteById(Integer id) {
        return this.feijiZuoWeiDao.deleteById(id) > 0;
    }

    @Override
    public List<FeijiZuoWei> selectFeiJi(FeijiZuoWei feiji) {
        List<FeijiZuoWei> feijiZuoWeis = this.feijiZuoWeiDao.selectList(feiji);
        List<Integer> feiji_id = feijiZuoWeis.stream().map(FeijiZuoWei::getFei_ji_id).collect(Collectors.toList());
        List<FeiJi> feiJis = new ArrayList<>();
        if (feiji_id != null && feiji_id.size() > 0) {
            feiJis = feiJiDao.selectListByIdList(feiji_id);
        }
        Map<Integer, String> map = feiJis.stream().collect(Collectors.toMap(FeiJi::getId, FeiJi::getFei_ji_name));
        for (FeijiZuoWei feijiZuoWei : feijiZuoWeis) {
            feijiZuoWei.setFei_ji_name(map.getOrDefault(feijiZuoWei.getFei_ji_id(), "该飞机已被删除"));
        }
        return feijiZuoWeis;
    }
}
