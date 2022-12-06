package com.spring.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.dao.DataAccessObject;
import com.spring.entity.Customer;

@Service
public class Services {
	@Autowired
	private DataAccessObject dao;
	
	@Transactional
	public List<Customer> getAll(){
		return dao.getAll();
	}
	@Transactional
	public void saveOrUpdate(Customer customer) {
		 dao.saveOrUpdate(customer);
	}
	@Transactional
	public void delete(int id) {
		dao.delete(id);
	}
	@Transactional
	public Customer getById(int id) {
		return dao.getById(id);
	}
	@Transactional
	public List<Customer> getAllByKeyWord(String key){
		return dao.getAllByKeyWord(key);
	}
}
