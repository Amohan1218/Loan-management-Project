package com.customer.orm.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import com.customer.orm.model.AUser;
import com.customer.orm.model.Customer;
import com.customer.orm.model.LoanApplicant;
import com.customer.orm.model.LoanApplicantNominees;

public class CustomerDAOImp implements CustomerDAO{
	
	@PersistenceContext
	private EntityManager em;
	
	@Override
	public List<LoanApplicant> getAllApplicants() {
		return em.createQuery("SELECT l FROM LoanApplicant l").getResultList();
	}
	
	@Override
	public List<AUser> getAllUser() {
		return em.createQuery("SELECT e FROM AUser e").getResultList();
	}

	@Override
	public void saveCustomer(Customer c) {
		em.persist(c);
	}

	@Override
	public void saveApplication(LoanApplicant lA) {
		em.persist(lA);
	}

	@Override
	public void saveNominee(LoanApplicantNominees lN) {
		em.persist(lN);
	}
}
