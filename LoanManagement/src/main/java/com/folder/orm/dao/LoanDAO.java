package com.folder.orm.dao;

import java.util.List;

import com.folder.orm.model.AUser;
import com.folder.orm.model.Customer;
import com.folder.orm.model.LoanApplicant;

public interface LoanDAO {
	List<LoanApplicant> getAllApplicants();

	List<AUser> getAllUser();

	void saveCustomer(Customer c);

	void saveApplication(LoanApplicant lA);
}
