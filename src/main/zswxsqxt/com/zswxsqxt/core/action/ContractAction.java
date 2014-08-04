package com.zswxsqxt.core.action;

import java.util.Date;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;

import cn.org.rapid_framework.page.Page;
import cn.org.rapid_framework.web.scope.Flash;

import com.opendata.common.base.BaseStruts2Action;
import com.opendata.common.util.StrUtil;
import com.opendata.login.model.LoginInfo;
import com.opendata.organiz.model.User;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import com.zswxsqxt.core.model.Contract;
import com.zswxsqxt.core.query.ContractQuery;
import com.zswxsqxt.core.service.ContractService;

/**
 * 合约管理
 */
@Namespace("/core")
@Action("contract")
@Results({
@Result(name="list",location="/WEB-INF/pages/customer/list.jsp", type = "dispatcher"),
@Result(name="input",location="/WEB-INF/pages/customer/input.jsp", type = "dispatcher"),
@Result(name="view",location="/WEB-INF/pages/customer/view.jsp", type = "dispatcher"),
@Result(name="listAction",location="../core/customer!list.do?${params}", type = "redirectAction")
})
public class ContractAction extends BaseStruts2Action implements ModelDriven<Contract>, Preparable
{
    private static final long serialVersionUID = 1L;
    private static final Log logger = LogFactory.getLog(ContractAction.class);

    @Autowired
    private ContractService contractInfoService;
    
    private Contract entity;
    private ContractQuery query = new ContractQuery();
    
    private String[] items;//数组Id
    
    /**
     * 客户列表
     * @return
     */
    public String list()
    {
    	String deptId = getCurrUser().getDeptIDs();
    	Page page = contractInfoService.findList(query);
    	saveCurrentPage(page, query);
    	return "list";
    }
    
    public String toAdd(){
    	if(StrUtil.isNotNullOrBlank(entity.getId())){
    		entity = contractInfoService.get(entity.getId());
    	}
    	return "input";
    }
    
    /**	
	 *删除
	 */
	public String remove()
	{
		try{
			if ( items!=null ) {
				contractInfoService.remove(items);
				Flash.current().success("客户信息已删除！");
			}else{
				Flash.current().error("参数错误请稍候在试！");
			}
		}catch(Exception e){
			e.printStackTrace();
			Flash.current().error("出现异常请稍候在试！");
			logger.error(e);
		}
		return "input";
	}
    
    /**
     * 保存
     * @return
     * @throws Exception
     */
    public String save() throws Exception{
    	String msg = null;
    	LoginInfo li = getCurrUser();
    	if(StrUtil.isNullOrBlank(entity.getId())){
    		entity.setId(null);
    		entity.setTs(new Date());
    		entity.setChangeTime(new Date());
    		User user = new User();
    		user.setId(li.getUserID());
    		entity.setChangeUser(user);
    		entity.setCreationUser(user);
    		msg = "已保存";
    	}else{
    		Contract persistence = contractInfoService.get(entity.getId());
    		BeanUtils.copyProperties(entity, persistence, new String[]{"id"});
    		entity = persistence;
    		msg = "已更新";
    	}
    	try{
    		contractInfoService.saveOrUpdate(entity);
    		Flash.current().success(msg);
    	}catch(Exception e){
    		e.printStackTrace();
    		Flash.current().error("出现异常请稍候在试！");
			logger.error(e);
    	}
    	return "listAction";
    }
    
    public void validateSave() {
		
		//初始化表单数据
		if ( getFieldErrors().size()>0 ) {
			
		}
	}
    
    @Override
	public Contract getModel() {
    	entity = entity==null?new Contract():entity;
		return entity;
	}

	@Override
	public void prepare() throws Exception {
		this.items=getRequest().getParameterValues("items");
		saveParameters();
	}

	public String[] getItems() {
		return items;
	}

	public void setItems(String[] items) {
		this.items = items;
	}

	public Contract getEntity() {
		return entity;
	}

	public void setEntity(Contract entity) {
		this.entity = entity;
	}

	public ContractQuery getQuery() {
		return query;
	}

	public void setQuery(ContractQuery query) {
		this.query = query;
	}
}