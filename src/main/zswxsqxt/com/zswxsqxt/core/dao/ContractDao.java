package com.zswxsqxt.core.dao;

import org.springframework.stereotype.Repository;

import com.opendata.common.base.BaseHibernateDao;
import com.zswxsqxt.core.model.Contract;

/**
 * 合约管理
 */
@Repository
public class ContractDao extends BaseHibernateDao<Contract, String>
{
	@Override
	public Class getEntityClass() {
		return Contract.class;
	}
}
