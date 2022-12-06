package com.spring.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.LogicalExpression;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.entity.Customer;


@Repository
public class DataAccessObject {
	@Autowired
    private SessionFactory sessionFactory;
	
	public List<Customer> getAll(){
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Customer");
		return query.list();
	}
	public List<Customer> getAllByKeyWord(String key){
		Session session = sessionFactory.getCurrentSession();
		Criteria cr = session.createCriteria(Customer.class);
		Criterion fname = Restrictions.ilike("firstName","%"+key+"%");
		Criterion lname = Restrictions.ilike("lastName","%"+key+"%");
		LogicalExpression orExp = Restrictions.or(fname, lname);
		cr.add( orExp );
		return cr.list();
	}
	public void saveOrUpdate(Customer customer) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(customer);
	}
	public void delete(int id) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(session.byId(Customer.class).load(id));
	}
	public Customer getById(int id) {
		Session session = sessionFactory.getCurrentSession();
		return session.get(Customer.class, id);
	}
}
