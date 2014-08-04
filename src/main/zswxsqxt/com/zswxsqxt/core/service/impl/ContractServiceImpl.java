package com.zswxsqxt.core.service.impl;

import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import cn.org.rapid_framework.page.Page;
import cn.org.rapid_framework.web.util.HttpUtils;

import com.opendata.common.base.BaseManager;
import com.opendata.common.base.EntityDao;
import com.zswxsqxt.core.dao.ContractDao;
import com.zswxsqxt.core.model.Contract;
import com.zswxsqxt.core.query.ContractQuery;
import com.zswxsqxt.core.service.ContractService;

/**
 * 合约信息
 */
@Service
public class ContractServiceImpl extends BaseManager<Contract, String> implements ContractService {

	@Autowired
	private ContractDao dao;
	
	public void setDao(ContractDao dao)
	{
		this.dao = dao;
	}

	public EntityDao getEntityDao()
	{
		return this.dao;
	}

	@Override
	public Contract get(String id) {
		return dao.getById(id);
	}

	@Override
	public Page findList(ContractQuery param) {
		StringBuilder hql = new StringBuilder();
		hql.append(" from Contract where 1=1");
//		StringBuilder sql = new StringBuilder();
//		sql.append("SELECT cf.id id, cf.cucustnr cucustnr, node.id nodId, COUNT(node.id) auditorNum, SUM(au.result) auditValue")
//		   .append(" FROM core_Contract cf left join wf_Instance ins on cf.id=ins.target_id")
//		   .append(" left join wf_instance_node node on ins.id=node.instanceId")
//		   .append(" left join wf_instance_participan ip on ip.actId=node.id")
//		   .append(" left join wf_instance_audit au on au.iaId=node.id and au.auditUserId=ip.refId")
//		   .append(" group by cf.id,cf.cucustnr, node.id");
		List<Object> valueList = new ArrayList<Object>();
		if (param != null) {
			
		}
//		Page page = dao.findBySql(sql.toString(), param.getPageSize(), param.getPageNumber(), valueList.toArray());
//		List list = page.getResult();
//		list = organizationData(list);
//		page.setResult(list);
		Page page = 
				dao.findByHql(hql.toString(), param.getPageSize(), param.getPageNumber(), valueList.toArray());
		return page;
	}
	
	/**
	 * @return
	 */
	private List<Contract> organizationData(List<Object[]> list){
		
//		Map<String, Contract> map = 
//				new HashMap<String, Contract>();
//		
//		Object[] current = null;
//		Contract ci = null;
//		for ( int i=0; i<list.size(); i++ ) {
//			current = list.get(i);
//			
//			if ( map.get(current[0].toString())!=null ) {
//				ci = map.get(current[0].toString());
//				List<InstanceNodeBo> nodeList = ci.getNodes();
//				
//				InstanceNodeBo node = new InstanceNodeBo();
//				node.setNodeId(current[2].toString());//流程实例ID
//				node.setAuditorNum(Integer.parseInt(current[3].toString()));
//				node.setAuditValue(current[4]!=null?Integer.parseInt(current[4].toString()):0);
//				
//				nodeList.add(node);
//			}else{
//				ci = new Contract();
//				ci.setId(current[0].toString());
//				ci.setCucustnr(current[1].toString());
//				
//				InstanceNodeBo node = new InstanceNodeBo();
//				node.setNodeId(current[2].toString());//流程实例ID
//				node.setAuditorNum(Integer.parseInt(current[3].toString()));
//				node.setAuditValue(current[4]!=null?Integer.parseInt(current[4].toString()):0);
//				
//				List<InstanceNodeBo> nodeList = new ArrayList<InstanceNodeBo>();
//				nodeList.add(node);
//				ci.setNodes(nodeList);
//				
//				map.put(current[0].toString(), ci);
//			}
//		}
		List<Contract> result = new ArrayList<Contract>();
//		result.addAll(map.values());
		return result;
	}

	@Override
	@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT)
	public void saveOrUpdate(Contract entity) {
//		String action = null;
//		if ( StrUtil.isNullOrBlank(entity.getId()) ) {
//			action = "save";
//		}
		dao.saveOrUpdate(entity);
//		if ( "save".equals(action) ) {
//			//创建流程实例
//			instanceManager.createInstance(projectId, groupFlag, state);
//		}
	}

	@Override
	@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT)
	public void remove(String[] items) {
		for(int i = 0; i < items.length; i++){
			Hashtable params = HttpUtils.parseQueryString(items[i]);
			String id = (String)params.get("id");
			Contract entity = this.dao.getById(id);
			if ( entity!=null ) {
				this.dao.delete(entity);
			}
		}
	}
}
