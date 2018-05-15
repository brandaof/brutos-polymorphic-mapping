package org.brandao.polymorphic.entity;

import org.brandao.brutos.annotation.Any;
import org.brandao.brutos.annotation.Basic;
import org.brandao.brutos.annotation.MetaValue;

public class SaleTransaction {

	private Long id;

	private Long price;

	@Any(
		metaBean = 
			@Basic(bean = "serviceType"),
		metaType=
			String.class,
		metaValues = {
			@MetaValue(name = "air", target = AirService.class),
			@MetaValue(name = "hosting", target = HostingService.class) 
		}
	)
	private Service service;

	public Service getService() {
		return service;
	}

	public void setService(Service service) {
		this.service = service;
	}
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getPrice() {
		return price;
	}

	public void setPrice(Long price) {
		this.price = price;
	}

}
