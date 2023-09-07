package com.folder.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
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
import com.folder.orm.model.LoanApplicationForm;
import com.folder.orm.service.LoanService;

@Controller
public class LoanCRUDController {

	LoanService lservice;

	@Autowired
	LoanCRUDController(LoanService loanserv) {
		this.lservice = loanserv;
	}

	@RequestMapping(value = "/adminPage", method = RequestMethod.GET)
	public String adminPage(@Validated LoanApplicant l1, Model model) {

		List<LoanApplicant> l2 = lservice.getAllApplications();

		model.addAttribute("allApplicants", l2);

		System.out.println("\n\n");
		for (LoanApplicant i : l2) {
			System.out.println(i);
		}
		return "adminPage";
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String customerPage(Model model) {
		return "custApplication";
	}

	@RequestMapping(value = "/submitApplication", method = RequestMethod.GET)
	public String submitApplication(@Validated LoanApplicationForm l, Model model) throws ParseException {

		Calendar calendar = Calendar.getInstance();
		String todayDt = "" + calendar.get(Calendar.YEAR) + "-" + calendar.get(Calendar.MONTH) + 1 + "-"
				+ calendar.get(Calendar.DAY_OF_MONTH) + "";

		SimpleDateFormat dateFormat = new SimpleDateFormat("yyy-MM-dd");
		
		// Inserting customer record
		Customer c = new Customer(l.getFirstName(), l.getLastName(), dateFormat.parse(l.getDateOfBirth()),
				l.getpANNumber(), l.getPhNumber(), l.getAddress(), l.getGurdName(), dateFormat.parse(todayDt), 1);
		lservice.sendCustomerDetails(c);
		
		// Inserting application record
		LoanApplicant lA = new LoanApplicant(8, dateFormat.parse(todayDt), l.getLnType(), l.getLnAmount(), 0.0, 0.0,
				l.getMonthsRequired(), l.getaIncome(), l.getdIncome(), 0.0, "XXXX", "Application Generated", 1,
				dateFormat.parse(todayDt));
		lservice.sendApplicationDetails(lA);
		
		System.out.println(dateFormat.parse(todayDt));
		return "welcomePage";
	}
}
