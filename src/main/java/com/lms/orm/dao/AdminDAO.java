package com.lms.orm.dao;

import java.util.Date;
import java.util.List;

import com.admin.orm.model.UserSession;
import com.admin.orm.model.Users;
import com.customer.orm.model.LoanApplicant;

public interface AdminDAO {
	
	Users getUser(String username);
	
	void saveUser(Users r);

	void saveSession(UserSession us);
	
	UserSession getSession(Integer id);

	List<LoanApplicant> getApplicantsByDate(Date targetDate);

	List<LoanApplicant> getApplicantsByLAmount(Double amtFrom, Double amtTo);

	LoanApplicant getApplication(Long applId);

	LoanApplicant getApplicationByUserId(Integer userId);

	void updateApplication(Long loanAmt, Double emifrom, Double emito, Integer nom, Double cblscr, String appSts,
			String remarks);
}
