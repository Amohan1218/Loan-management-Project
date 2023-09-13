<%@page import="com.customer.orm.model.LoanApplicant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Application</title>

<!-- Add Bootstrap CSS link -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
	<style type="text/css">
		.btn{
			margin:6px;
		}
	</style>
</head>
<body>

	<!-- Add Bootstrap container class -->
	<div class="container">

		<br><h1>Application</h1><br>
		<%
		LoanApplicant l = (LoanApplicant) request.getAttribute("lAppl");
		%>
		<form id="myForm" action="updateApplication" method="POST">
			<!-- Add Bootstrap table class to the table element -->
			<table class="table">
				<thead>
					<tr>
						<th>Field Name</th>
						<th>Description</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>Loan Application Id</td>
						<td><input type="text" id="applId" name="applId"
							value="<%=l.getId()%>" readonly class="form-control"></td>
					</tr>
					<tr>
						<td>Customer Id</td>
						<td><input type="text" id="custId" name="custId"
							value="<%=l.getCustomerId()%>" readonly class="form-control"></td>
					</tr>
					<tr>
						<td>Application Date</td>
						<td><input type="text" id="appDate" name="appDate"
							value="<%=l.getApplicationDate()%>" readonly
							class="form-control"></td>
					</tr>
					<tr>
						<td>Loan Type Id</td>
						<td><input type="text" id="lnTypeId" name="lnTypeId"
							value="<%=l.getLoanTypeId()%>" readonly class="form-control"></td>
					</tr>
					<tr>
						<td>Loan Amount</td>
						<td><input type="text" id="lnAmt" name="lnAmt"
							value="<%=l.getLoanAmount()%>" class="form-control"></td>
					</tr>
					<tr>
						<td>EMI Range From</td>
						<td><input type="text" id="emiFrom" name="emiFrom"
							value="<%=l.getEmiRangeFrom()%>" class="form-control"></td>
					</tr>
					<tr>
						<td>EMI Range To</td>
						<td><input type="text" id="emiTo" name="emiTo"
							value="<%=l.getEmiRangeTo()%>" class="form-control"></td>
					</tr>
					<tr>
						<td>No. of Months Requested</td>
						<td><input type="text" id="nomR" name="nomR"
							value="<%=l.getNoOfMonthsRequested()%>" class="form-control"></td>
					</tr>
					<tr>
						<td>Customer's Annual Income</td>
						<td><input type="text" id="annInc" name="annInc"
							value="<%=l.getAnnualIncome()%>" readonly class="form-control"></td>
					</tr>
					<tr>
						<td>Customer's Disposal Income</td>
						<td><input type="text" id="dispInc" name="dispInc"
							value="<%=l.getDisposableIncome()%>" readonly
							class="form-control"></td>
					</tr>
					<tr>
						<td>Cibil Score</td>
						<td><input type="text" id="cblScr" name="cblScr"
							value="<%=l.getCibilScore()%>" class="form-control"></td>
					</tr>
					<tr>
						<td>Application Status<br>(INPR/APRV/RJCD)
						</td>
						<td><input type="text" id="appSts" name="appSts"
							value="<%=l.getStatus()%>" class="form-control"></td>
					</tr>
					<tr>
						<td>Remarks</td>
						<td><input type="text" id="remarks" name="remarks"
							value="<%=l.getConclusionRemarks()%>" class="form-control"></td>
					</tr>
				</tbody>
			</table>

		<!-- Add Bootstrap card class to the container -->
			<div class="card">
	
				<!-- Add Bootstrap card-header class to the header -->
				<div class="card-header">Action</div>
	
				<!-- Add Bootstrap card-body class to the body -->
				<div class="card-body text-center">
					<button type="submit" class="btn btn-success" id="aprv">APPROVE</button>
					<button type="submit" class="btn btn-danger" id="rjct">REJECT</button>
					<button type="submit" class="btn btn-warning" id="susp">SUSPEND</button>
				</div>
	
			</div><br><br><br>
			<!-- End of card -->
		</form>

	</div>
	<!-- End of container -->

	<!-- Add Bootstrap JS files at the end of the page -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-J6qa4849blEJp7kvOIX+IputkZYZI5gaNczGTNAfTPIcJ8yUHXpGK5X7hF3NlgQv"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZWrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRib+AtyXa+nMwk6Uti+M9GXju68NVvapt7ByLyJ6cYfwFA/n"
		crossorigin="anonymous"></script>

	<script>
		const form = document.getElementById("myForm");
		
		const apprv = document.getElementById("aprv");
		apprv.addEventListener("click", function(event){
			event.preventDefault();
			document.getElementById("appSts").value = "APRV";
			form.submit();
		});
		const rjct = document.getElementById("rjct");
		rjct.addEventListener("click", function(event){
			event.preventDefault();
			document.getElementById("appSts").value = "RJCD";
			form.submit();
		});
		const susp = document.getElementById("susp");
		susp.addEventListener("click", function(event){
			event.preventDefault();
			document.getElementById("appSts").value = "INPR";
			form.submit();
		});
	</script>
</body>
</html>