<%@page import="com.customer.orm.model.LoanApplicant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Application</title>
</head>
<body>
	<h1>Application</h1>
	<% LoanApplicant l = (LoanApplicant) request.getAttribute("lAppl"); %>
	<table>
		<thead>
			<tr>
				<td>Field Name</td>
				<td>Description</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>Loan Application Id</td>
				<td><input type="text" id="appId" name="appId" value="<%= l.getId() %>" readonly></td>
			</tr>
			<tr>
				<td>Customer Id</td>
				<td><input type="text" id="custId" name="custId" value="<%= l.getCustomerId() %>" readonly></td>
			</tr>
			<tr>
				<td>Application Date</td>
				<td><input type="text" id="appDate" name="appDate" value="<%= l.getApplicationDate() %>" readonly></td>
			</tr>
			<tr>
				<td>Loan Type Id</td>
				<td><input type="text" id="lnTypeId" name="lnTypeId" value="<%= l.getLoanTypeId() %>" readonly></td>
			</tr>
			<tr>
				<td>Loan Amount</td>
				<td><input type="text" id="lnAmt" name="lnAmt" value="<%= l.getLoanAmount() %>"></td>
			</tr>
			<tr>
				<td>EMI Range From</td>
				<td><input type="text" id="emiFrom" name="emiFrom" value="<%= l.getEmiRangeFrom() %>"></td>
			</tr>
			<tr>
				<td>EMI Range To</td>
				<td><input type="text" id="emiTo" name="emiTo" value="<%= l.getEmiRangeTo() %>"></td>
			</tr>
			<tr>
				<td>No. of Months Requested</td>
				<td><input type="text" id="nomR" name="nomR" value="<%= l.getNoOfMonthsRequested() %>"></td>
			</tr>
			<tr>
				<td>Customer's Annual Income</td>
				<td><input type="text" id="annInc" name="annInc" value="<%= l.getAnnualIncome() %>" readonly></td>
			</tr>
			<tr>
				<td>Customer's Disposal Income</td>
				<td><input type="text" id="disInc" name="disInc" value="<%= l.getDisposableIncome() %>" readonly></td>
			</tr>
			<tr>
				<td>Cibil Score</td>
				<td><input type="text" id="cblScr" name="cblScr" value="<%= l.getCibilScore() %>"></td>
			</tr>
			<tr>
				<td>Application Status<br>(INPR/APRV/RJCD)</td>
				<td><input type="text" id="appSts" name="appSts" value="<%= l.getStatus() %>"></td>
			</tr>
			<tr>
				<td>Remarks</td>
				<td><input type="text" id="remarks" name="remarks" value="<%= l.getConclusionRemarks() %>"></td>
			</tr>
		</tbody>
	</table><br>
	<button type="submit" onclick="loanApprove()">APPROVE</button>
	<button type="submit" onclick="">REJECT</button>
	<button type="submit" onclick="">SUSPEND</button>
	
	<script>
		function loanApprove(){
			
		}
	</script>
</body>
</html>