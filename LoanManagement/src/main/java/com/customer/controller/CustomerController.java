package com.customer.controller;


import java.text.ParseException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.customer.orm.model.LoanApplicationForm;
import com.customer.orm.service.CustomerService;

@Controller
public class CustomerController {

	CustomerService lservice;

	@Autowired
	CustomerController(CustomerService loanserv) {
		this.lservice = loanserv;
	}

	@RequestMapping(value = "/getApplicationForm", method = RequestMethod.GET)
	public String customerPage(Model model) {
		return "custApplication";
	}
	
	@RequestMapping(value = "/submitApplication", method = RequestMethod.GET)
	public String submitApplication(@Validated LoanApplicationForm l, Model model, HttpServletRequest request) throws ParseException {
		String cname = lservice.sendApplicationDetails(l);
		HttpSession session = request.getSession();
		session.setAttribute("custName", cname);
		return "redirect:/applicationStatus";
	}
	
	@RequestMapping(value = "/applicationStatus", method = RequestMethod.GET)
	public String getApplicationStatus(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		model.addAttribute("custName", (String) session.getAttribute("custName"));
		return "applicationStatus";
	}
	
}
