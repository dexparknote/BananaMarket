package com.spring.service;

public interface BuylistService {

	Object getList(String mid);
	Object insert(Object vo);
	Object getContent(Object id);
	Object update(Object vo);
	Object getUpdateContent(Object id);
	Object delete(Object id);
	
}
