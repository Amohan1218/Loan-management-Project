package com.lms.controller;

import java.io.IOException;
import java.text.ParseException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.admin.orm.model.ProccessingAppl;
import com.admin.orm.model.RegisterUser;
import com.admin.orm.model.ValidateUser;
import com.customer.orm.model.LoanApplicant;
import com.lms.excel.ExcelGenerator;
import com.lms.orm.service.AdminService;
import com.lms.orm.service.CustomerService;
import com.lms.utility.LMSUtilityClass;

@Controller
public class AdminController {
	
	AdminService aservice;
	CustomerService lservice;
	
	@Autowired
	public AdminController(AdminService adminServ, CustomerService loanserv){
		this.aservice = adminServ;
		this.lservice = loanserv;
	}
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String login() {
		return "login";
	}
	
	@RequestMapping(value = "/authenticate", method = RequestMethod.POST)
	public String authentication(@Validated ValidateUser vu, Model model, HttpServletRequest request) throws ParseException {
		
		HttpSession session = request.getSession();
		String sessionId = session.getId(); // getting sessionid
		String hostname = request.getHeader("Host"); // getting hostname
		String rKey = LMSUtilityClass.encryptString(aservice.generateRandomKey()); // getting random key
		//System.out.println(sessionId + " - - " + hostname  + " - - " + rKey);
		
		String result = aservice.ValidateUserDetails(vu);
		String s[] = result.split("-");
		
		Integer usId = aservice.createSession(Integer.parseInt(s[1]), sessionId, hostname, rKey);
		
		session.setAttribute("authKey", rKey);
		session.setAttribute("userSessionId", usId);
		session.setAttribute("userId", s[1]);
		
		return s[0];
	}
	
	@RequestMapping(value = "/CustomerHome", method = RequestMethod.GET)
	public String customerHomepage(Model model, HttpServletRequest request) {
		return "CustomerHomepage";
	}
	
	@RequestMapping(value = "/adminPage", method = RequestMethod.GET)
	public String adminPage(@Validated LoanApplicant l1, Model model) {
	
		List<LoanApplicant> l2 = lservice.getAllApplications();
		model.addAttribute("allApplicants", l2);

		return "adminHomePage";
	}
	
	@RequestMapping(value = "/filterData", method = RequestMethod.GET)
	public String filterData(@RequestParam String filterDate, String filterLoanAmountFrom, String filterLoanAmountTo, Model model) throws ParseException {
		if(filterDate.equals("") && filterLoanAmountFrom.equals("") && filterLoanAmountTo.equals("")) {
			return "redirect:/adminPage";
		}
		if(!filterDate.equals("") && filterLoanAmountFrom.equals("") && filterLoanAmountTo.equals("")) {
			List<LoanApplicant> fbd = aservice.getListBydate(filterDate);
			model.addAttribute("allApplicants", fbd);
			return "adminHomePage";
		}
		if(filterDate.equals("") && !filterLoanAmountFrom.equals("") && !filterLoanAmountTo.equals("")) {
			List<LoanApplicant> fba = aservice.getListByLoanAmount(filterLoanAmountFrom, filterLoanAmountTo);
			model.addAttribute("allApplicants", fba);
			return "adminHomePage";
		}
		return "Error";
	}

	@RequestMapping(value = "/redirectToRegistration", method = RequestMethod.GET)
	public String register() {
		return "registration";
	}

	@RequestMapping(value = "/redirectToLogin", method = RequestMethod.GET)
	public String LoginPage() {
		return "login";
	}
	
	@RequestMapping(value = "/createUser", method = RequestMethod.POST)
	public String createUser(@Validated RegisterUser r) throws NumberFormatException, ParseException {
		aservice.createUser(r);
		return "registrationSuccess";
	}
	
	@RequestMapping(value = "/getCustApplication", method = RequestMethod.GET)
	public String getCustomerApplication(@RequestParam String appId, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.setAttribute("applicationId", appId);
		
		Long applId = Long.parseLong(appId);
		LoanApplicant l = aservice.getLoanApplication(applId);
		model.addAttribute("lAppl", l);
		return "ViewCustApplication";
	}
	
	@RequestMapping(value = "/downloadExcel", method = RequestMethod.GET)
	public void downloadExcel(HttpServletResponse response, HttpServletRequest request) throws IOException {
		HttpSession session = request.getSession();
		@SuppressWarnings("unchecked")
		List<LoanApplicant> lData = (List<LoanApplicant>) session.getAttribute("pageData");;
		Workbook workbook = ExcelGenerator.generateExcel(lData);

		// Set the response headers for Excel download
		response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
		response.setHeader("Content-Disposition", "attachment; filename=loan_applicants.xlsx");

		// Write the workbook to the response output stream
		workbook.write(response.getOutputStream());
		workbook.close();
	}
	
	@RequestMapping(value = "/updateApplication", method = RequestMethod.POST)
	public String updateApplication(@Validated ProccessingAppl p, Model model, HttpServletRequest request) {
		System.out.println(p);
		aservice.updateApplication(p.getLnAmt(), p.getEmiFrom(), p.getEmiTo(), p.getNomR(), p.getCblScr(), p.getAppSts(), p.getRemarks());
		return "redirect:/getCustApplication";
	}
}
