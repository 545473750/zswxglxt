package com.zswxsqxt.core.service;

import cn.org.rapid_framework.page.Page;

import com.zswxsqxt.core.model.Contract;
import com.zswxsqxt.core.query.ContractQuery;

/**
 * 合约信息
 */
public interface ContractService {
	
	/**
	 * 得到单个
	 * @param id
	 * @return
	 */
    public Contract get(String id);
    
    /**
     * 分页查询
     * 作者 于俊宇
     * 日期 2013-10-17
     *
     * @param page
     * @param param ExamAnswer
     */
    public Page findList(ContractQuery param);
    
    /**
     * 添加或修改
     * @param entity
     */
    public void saveOrUpdate(Contract entity);

    /**
     * 删除
     * @param items
     */
	public void remove(String[] items);
}
