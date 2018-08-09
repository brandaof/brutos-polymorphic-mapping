package org.brandao.polymorphic.web;

import java.util.List;

import javax.inject.Inject;

import org.brandao.brutos.annotation.Action;
import org.brandao.brutos.annotation.Actions;
import org.brandao.brutos.annotation.Basic;
import org.brandao.brutos.annotation.Result;
import org.brandao.brutos.annotation.Transient;
import org.brandao.brutos.annotation.View;
import org.brandao.brutos.annotation.web.RequestMethod;
import org.brandao.brutos.web.RequestMethodTypes;
import org.brandao.brutos.web.WebFlowController;
import org.brandao.polymorphic.entity.SaleTransaction;
import org.brandao.polymorphic.entityaccess.SalesMemoryEntityAccess;

@Actions({
	@Action(value="/sales/add", view=@View("sales/edit")),
	@Action(value="/sales", view=@View("sales/list"))
})
public class SalesController {

	@Inject
	@Transient
	private SalesMemoryEntityAccess salesMemoryEntityAccess;

	@Action("/")
	public void index(){
		WebFlowController.redirectTo("/sales");
	}
	
	@Action("/sales")
	@RequestMethod(RequestMethodTypes.POST)
	@View("sales/edit")
	public void save(
			@Basic(bean="entity") 
			SaleTransaction entity ){
		this.salesMemoryEntityAccess.save(entity);
		WebFlowController.redirectTo("/sales");
	}
	
	@Action("/sales/{id:[0-9]{1,10}}/update")
	@View("sales/edit")
	@Result("entity")
	public SaleTransaction show(
			@Basic(bean="id") Long id ){
		SaleTransaction entity = this.salesMemoryEntityAccess.getById(id);
		return entity;
	}

	@Action("/sales/{id:[0-9]{1,10}}/delete")
	@RequestMethod(RequestMethodTypes.POST)
	public void remove(
			@Basic(bean="id") 
			Long id ){
		SaleTransaction entity = this.salesMemoryEntityAccess.getById(id);
		this.salesMemoryEntityAccess.remove(entity);
		WebFlowController.redirectTo("/sales");
	}
	
	@Transient
	public List<SaleTransaction> getAll(){
		return this.salesMemoryEntityAccess.getAll();
	}
	
}
