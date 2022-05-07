<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title>Appointment Summary Report</title>
	<link rel="preconnect" href="https://fonts.googleapis.com" />
	   <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
	   <link
	     href="https://fonts.googleapis.com/css2?family=Spartan:wght@200;300;400;500;600;700;800;900&family=Supermercado+One&display=swap"
	     rel="stylesheet"/>
   	<script
	     src="https://kit.fontawesome.com/f6b58a74a1.js"
	     crossorigin="anonymous"></script>
	      
	 <link rel="stylesheet" href="Styles/AppointmentStyles/css/appointmentSummary.css" />
     <link rel="stylesheet" href="Styles/Bootstrap/css/bootstrap.css" />
</head>

<body>

	<!-- Header  -->
	<section id="header"></section>
	<br/><br/>
	<div class = "container">
		<div class = "row">
			<div class = "col-sm-4 col-md-4 col-lg-4">
				<ul class="nav flex-column">
					  <li class="nav-item">
					  	<form method = "post" action = "AppointmentVetSelectServlet">
					    <a class="nav-link active" href="appointmentPortal.jsp"><button type="submit" name = "apppointSideBtn1" class="btn btn-outline-success appointBtn">Appointment Portal</button></a>
					  	</form>
					  </li>
					  <br/>
					
					  <li class="nav-item">
					  	<form method = "post" action = "AppointmentVetSelectServlet">
					    <a class="nav-link" href="appointmentAdd.jsp"><button type="submit" name ="apppointSideBtn2" class="btn btn-outline-success appointBtn">Add New Appointment</button></a>
					  	</form>
					  </li>
					  <br/>
					 
					  <li class="nav-item">
					  	<form method = "post" action = "AppointmentVetSelectServlet">
					    <a class="nav-link" href="appointmentSummary.jsp"> <button type="submit" name ="apppointSideBtn3" class="btn btn-outline-success appointBtn">Appointment Summary</button> </a>
					  	</form>
					  </li>
					  <br/>
				</ul>
				<img src="Styles/AppointmentStyles/images/appointBg.png" class="rounded float-right">
				<br/>
			</div>
		
			<div class = "col-sm-8 col-md-8 col-lg-8">
				<h3>Appointment Summary  <i class="fa fa-list-alt" aria-hidden="true"></i></h3>
				<br/><br/>
				<form method = "post" action = "AppointmentSummaryServlet" autocomplete = "on">
				  	<div class="form-row">
	    				<div class="form-group col-md-3">
	      					<label for="aFromDate" class = "appointSearchLabel"><b>From:</b></label>
	      					<input type="date" name = "aFromDate" class="form-control form-control-sm" placeholder="Select Date" required>
	    				</div>
	    				
	    				<div class="form-group col-md-3">
	      					<label for="aToDate" class = "appointSearchLabel"><b>To:</b></label>
	      					<input type="date" name = "aToDate" class="form-control form-control-sm" placeholder="Select Date" required>
	    				</div>
	    				
	    				<div class="form-group col-md-4">
	      					<label for="vetSurgeon" class = "appointSearchLabel"><b>Veterinary Surgeon:</b></label>
	      					<select name = "avetSurgeon" class="form-control form-control-sm"  required>
							    <option selected value="" disabled>Select Surgeon</option>
							    
							   	<c:forEach items="${vetSurgeons}" var="vet">
									<option value="${vet}">${vet} </option>
								</c:forEach>
							  </select>
	    				</div>

	    				<div class="form-group col-md-1">
	    					<label for="" ></label><br>
	      					<button type="submit" name = "appointSearchBtn" class="form-control form-control-sm btn btn-success btn-sm">
    							 <i class="fa fa-search" aria-hidden="true"></i> 
							</button>
	    				</div>	
    			 	</div>
				</form>
				
				<br/><br/>
				
				<!-- Error message -->
				<div class="alert alert-dark alert-dismissible fade show" role="alert">
					<!-- display no result found message -->	
				  	<h6 style = "color:black !important;text-align:center !important;font-size:16px !important;">${NoReportMsg} </h6>
  
					<button type="button" class="close" data-dismiss="alert" aria-label="Close">
					  <span aria-hidden="true">&times;</span>
					</button>
				</div>
				
				<!-- appointment report -->
				<div class = "container" id = "appointPortalBg">
					<br/>
						<div class = "row">
							<div class = "col-md-6">
								<h6 class = "areportFontHeader">VetCare Pet Clinic </h6>
							</div>
							<div class = "col-md-3">
								<h6 class = "areportFontHeader">From: ${appointReport.fromDate}</h6>
							</div>
							<div class = "col-md-3">
								<h6 class = "areportFontHeader">To: ${appointReport.toDate} </h6>
							</div>
						</div>
						<br/><br/>
						<h6 class = "areportFontH6Bolded">Veterinary Surgeon: ${appointReport.vetName}</h6>
						<br/>
						<h6 class = "areportFontH6">Total No of Appointments: ${appointReport.totalAppointments}</h6>
						<br/>
						<h6 class = "areportFontH6">Payment Pending Appointments: </h6>
						<div class = row>
							<div class = "col-md-6 offset-md-1">
								<h6 class = "areportFontH6Bolded">Total Number: ${appointReport.pendingAppointmentCount} </h6>
							</div>
						</div>
						<div class = row>
							<div class = "col-md-6 offset-md-1">
								<h6 class = "areportFontH6Bolded">Average Percentage: ${appointReport.pendingAppointmentAvg}%</h6>
							</div>
						</div>
						<br/>
						<h6 class = "areportFontH6">Payment Completed Appointments: </h6>
						<div class = row>
							<div class = "col-md-6 offset-md-1">
								<h6 class = "areportFontH6Bolded">Total Number: ${appointReport.completedAppointmentCount}</h6>
							</div>
						</div>
						<div class = row>
							<div class = "col-md-6 offset-md-1">
								<h6 class = "areportFontH6Bolded">Average Percentage: ${appointReport.completedAppointmentAvg}%</h6>
							</div>
						</div>
						<div class = row>
							<div class = "col-md-6 offset-md-1">
								<h6 class = "areportFontH6Bolded">Total Income: ${appointReport.totalIncome}</h6>
							</div>
						</div>
					<br/>
				</div>
			</div>
		</div>
	</div>
	<br/><br/>
	
	<!-- Footer  -->
	<div class = container>
		<section id="footer" class="section-p1"></section>
	</div>

	<script src="main_js/nav.js"></script>
	<script src="main_js/footer.js"></script> 
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


</body>
</html>