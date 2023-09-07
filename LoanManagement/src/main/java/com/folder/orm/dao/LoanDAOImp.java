package com.folder.orm.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.transaction.annotation.Transactional;

import com.folder.orm.model.AUser;
import com.folder.orm.model.LoanApplicant;

public class LoanDAOImp implements LoanDAO{
	
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
	@Transactional
	public LoanApplicant updateField() {
		LoanApplicant c = (LoanApplicant) em.createQuery("SELECT e FROM LoanApplicant e where lnap_id =: v").setParameter("v", 1).getResultList();
		c.setStatus("APPROVE");
		return null;
	}
}
