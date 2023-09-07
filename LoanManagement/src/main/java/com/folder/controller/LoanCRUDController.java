package com.folder.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.folder.orm.model.AUser;
import com.folder.orm.model.Customer;
import com.folder.orm.model.LoanApplicant;
import com.folder.orm.model.LoanType;
import com.folder.orm.service.LoanService;

@Controller
public class LoanCRUDController {

	LoanService lservice;

	@Autowired
	LoanCRUDController(LoanService loanserv) {
		this.lservice = loanserv;
	}
	
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String getApplicants(@Validated LoanApplicant l1, Model model) {

		model.addAttribute("allApplicants", lservice.getAllApplications());
		return "adminPage";
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String homePage(Model model) {
		return "customerPage";
	}
	
	@RequestMapping(value = "/createCustomer", method = RequestMethod.GET)
	public String createCustomer(AUser a, Customer c, LoanApplicant l, LoanType lt, Model model) {
		
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		System.out.println(a + "\n\n" + c + "\n\n" + l + "\n\n" + lt);
		
		model.addAttribute("allApplicants", lservice.getAllApplications());
		return "adminPage";
	}
}
