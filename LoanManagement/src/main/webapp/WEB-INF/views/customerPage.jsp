<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Form</title>
    
    <style>
    /* Reset some default browser styles */
    body {
        margin: 0;
        padding-top: 10px;
        font-size:18px;
        background-color: grey;
    }

    .form-container {
        max-width: 900px;
        margin: 0 auto;
        padding: 20px;
        border: 1px solid #ccc;
        background-color: #f9f9f9;
        border-radius: 5px;
        font-size : 20px;
    }
    h2{
    	text-align:center;
    }

    /* Style the tabs */
    .tabs {
        display: flex;
        justify-content: space-around;
        margin-bottom: 20px;
    }
    
    input{
    	padding:10px;
    	font-size:10px;
    }

    .tab {
        background-color: blue;
        font-size:20px;
        color: #fff;
        border: none;
        width : 300px;
        padding: 10px 20px;
        cursor: pointer;
        border-color: black
        transition: background-color 0.3s;
    }

    .tab.active-tab {
        background-color: #007bff;
    }

    /* Style the form box */
    .form-box {
    	width : 95%;
        background-color: #fff;
        padding: 20px;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .form-part h2 {
        margin-bottom: 20px;
        color: #333;
    }

    input[type="text"] {
        width: 90%;
        padding: 10px;
        margin-bottom: 10px;
        border: 1px solid #ccc;
        border-radius: 3px;
        font-size: 16px;
    }
	input[type="date"] {
    width: 90%;
    padding: 10px;
    margin-bottom: 10px;
    border: 1px solid #ccc;
    border-radius: 3px;
    font-size: 16px;
	}
	input[type="tel"] {
	    width: 90%;
	    padding: 10px;
	    margin-bottom: 10px;
	    border: 1px solid #ccc;
	    border-radius: 3px;
	    font-size: 16px;
	}
	input[type="number"] {
	    width: 90%;
	    padding: 10px;
	    margin-bottom: 10px;
	    border: 1px solid #ccc;
	    border-radius: 3px;
	    font-size: 16px;
	}
    button.form-button {
        background-color: green;
        color: #fff;
        border: none;
        padding: 10px 20px;
        font-size: 16px;
        cursor: pointer;
        border-radius: 5px;
        transition: background-color 0.3s;
    }

    button.form-button:hover {
        background-color: #0056b3;
    }

    form:invalid {
        border-color: #ff0000;
    }

    #submission-message {
        color: #009900;
        font-weight: bold;
        margin-top: 10px;
    }
    </style>
    
    <script>
    let currentTab = 0;

    function showTab(tabIndex) {
        const formParts = document.querySelectorAll('.form-part');
        formParts[currentTab].style.display = 'none';
        formParts[tabIndex].style.display = 'block';
        
        // Remove the 'active-tab' class from all tab buttons
        const tabButtons = document.querySelectorAll('.tab');
        tabButtons.forEach(button => button.classList.remove('active-tab'));
        
        // Add the 'active-tab' class to the current tab button
        tabButtons[tabIndex].classList.add('active-tab');
        
        currentTab = tabIndex;
    }

    function nextTab(tabIndex) {
        const form = document.getElementById(`form-part-${tabIndex + 1}`);
        if (form.checkValidity()) {
            showTab(tabIndex + 1);
        } else {
            alert('Please fill in all required fields.');
        }
    }

    function prevTab(tabIndex) {
        showTab(tabIndex - 1);
    }
    </script>
</head>
<body>
    <center><h2 style="color: white; font-size: 40px;">Loan Application</h2></center>
    <div class="form-container">
        <div class="tabs">
            <button class="tab" onclick="showTab(0)">Step - 1</button>
            <button class="tab" onclick="showTab(1)">Step - 2</button>
            <button class="tab" onclick="showTab(2)">Step - 3</button>
        </div>
        <div class="form-box">
            <div class="form-part">
            	<h2>Personal Details</h2>
                <form action="createCustomer" id="form-part-1">
                	<b>FirstName : </b>
                    <input type="text" name="firstName" placeholder="Enter FirstName"><br>
                    <b>LastName : </b>
                    <input type="text" name="lastName" placeholder="Enter Last name"><br>
                    <b>Date of Birth : </b><br>
                    <input type="date" name="dateOfBirth" placeholder="Enter date of birth"><br>
                    <b>Mobile Number : </b><br>
                    <input type="tel" name="mobileNumber" placeholder="Enter mobile number"><br>
                    <b>Address : </b>
                    <input type="text" name="address" placeholder="Enter address"><br>
                    <button class="form-button" type="button" onclick="nextTab(0)">Next</button>
            </div>
            <div class="form-part" style="display: none;">
                <h2>Loan Details</h2>
                   	<b>PAN card No : </b>
                    <input type="text" name="panNumber" placeholder="Enter PAN number"><br>
                    <b>Loan Amount : </b><br>
                    <input type="text" name="amount" placeholder="Enter Amount"><br>
                    <b>Loan Type: </b>
                    <input type="text" name="name" placeholder="Enter Loan Type"><br>
                    <b>Number of months : </b>
                    <input type="text" name="nominalRequested" placeholder="Enter guardian name"><br>
                    
                    <button class="form-button" type="button" onclick="prevTab(1)">Previous</button>
                    <button class="form-button" type="button" onclick="nextTab(1)">Next</button>
            </div>
            <div class="form-part" style="display: none;">
               		<b>Guardian Name : </b>
                    <input type="text" name="cust_gname" placeholder="Enter guardian name"><br>
                    <h2>Nominee Details</h2>
                    <b>Enter Nominee name </b>
                    <input type="text" name="lnap_nominee" placeholder="Enter FullName"><br>
                    <b>Relation </b>
                    <input type="text" name="lanp_relation" placeholder="Enter Relation with Nominee"><br>
                    <button class="form-button" type="button" onclick="prevTab(2)">Previous</button>
                    <button class="form-button" type="submit">Submit</button>
               </form>
            </div>
        </div>
    </div><br><br>
</body>
</html>