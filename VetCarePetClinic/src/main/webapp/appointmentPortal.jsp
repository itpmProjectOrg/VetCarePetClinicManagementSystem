<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
   
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title>Appointment Portal</title>
	<link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Spartan:wght@200;300;400;500;600;700;800;900&family=Supermercado+One&display=swap"
      rel="stylesheet"
    />
    <script
      src="https://kit.fontawesome.com/f6b58a74a1.js"
      crossorigin="anonymous"></script>
      
     <link rel="stylesheet" href="Styles/AppointmentStyles/css/appointmentPortal.css" />
     <link rel="stylesheet" href="Styles/Bootstrap/css/bootstrap.css" />
</head>

<body>
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
					    <a class="nav-link" href="appointmentAdd.jsp"><button type="submit" name = apppointSideBtn2 class="btn btn-outline-success appointBtn">Add New Appointment</button></a>
					  	</form>
					  </li>
					  <br/>
					 
					  <li class="nav-item">
					  	<form method = "post" action = "AppointmentVetSelectServlet">
					    <a class="nav-link" href="appointmentSummary.jsp"> <button type="submit"  name = apppointSideBtn3 class="btn btn-outline-success appointBtn">Appointment Summary</button> </a>
					  	</form>
					  </li>
					  <br/>
				</ul>
				<img src="Styles/AppointmentStyles/images/appointBg.png" class="rounded float-right">
				<br/>
			</div>
		
			<div class = "col-sm-8 col-md-8 col-lg-8">
				<h3>Appointment Portal  <i class="fa fa-calendar-check-o" aria-hidden="true"></i></h3>
				<br/><br/>
				<form method = "post" action = "AppointmentSearchServlet" autocomplete = "on">
				  	<div class="form-row">
	    				<div class="form-group col-md-3 ">
	      					<label for="aDate" class = "appointSearchLabel"><b>Date:</b></label>
	      					<input type="date" name = "aDate" class="form-control form-control-sm" placeholder="Select Date" required>
	    				</div>
	    				
	    				<div class="form-group col-md-4 ">
	      					<label for="vetSurgeon" class = "appointSearchLabel"><b>Veterinary Surgeon:</b></label>
	      					<select name = "vetSurgeon" class="form-control form-control-sm"  required>
							    <option selected value="" >Select Surgeon</option>
							    
							   	<c:forEach items="${vetSurgeons}" var="vet">
									<option value="${vet}">${vet} </option>
								</c:forEach>
							  </select>
	    				</div>
	    				
	    				<div class="form-group col-md-3 ">
	      					<label for="appointNo" class = "appointSearchLabel"><b>Appointment No:</b></label>
	      					<input type="number" name = "appointNo" class="form-control form-control-sm" placeholder="Appointment No" min = "1">
	    				</div>
	    				
	    				<div class="form-group col-md-1 ">
	    					<label for=""></label>
	      					<button type="submit" name = "appointSearchBtn" class="form-control form-control-sm btn  btn-success btn-sm">
    							<i class="fa fa-search" aria-hidden="true"></i> 
							</button>
	    				</div>
	    				
	    				<!-- Refresh button -->
						<div class = "form-group col-md-1">
			   				<label for=""></label>
		     				<button type="button" name = "appointRefreshBtn"  class="form-control form-control-sm btn btn-light btn-sm"  >
		  						<i class="fa fa-refresh" aria-hidden="true"></i> 
							</button>
				    	</div> 
    			 	</div>
				</form>
				
				<div class = "container" id = "appointPortalBg">
					<br/>
					<br/>
						
						<c:forEach items="${appoints}" var="appoint">
							<div class="card" style="width:42rem;" id = "appointCard">
					  			<div class="card-body">
					    			<h5 class="card-title"><i class="fa fa-calendar" aria-hidden="true"></i> Appointment No: ${appoint.aNo}</h5>
					    			<br/>
					    			<h6 class="card-subtitle mb-2 text-muted">Pet Owner ID: ${appoint.ownerID}</h6>
					    			<br/>
					    			<p class="card-text">Pet Owner Name: ${appoint.ownerName}</p> 
					    			<p class="card-text">Time: ${appoint.aTime}</p>
					    			<p class="card-text">Payment:  Rs.${appoint.payment}</p>
					    			<p class="card-text">Payment Status: ${appoint.status} </p>
					    			
					    			<div class = "row">
					    				<div class = "col-md-3 offset-md-6">
					    					<form method = "post" action = "AppointRedirectToUpdatePageServlet">
					    						<input type = "hidden" value = "${appoint.appID}" name = "appointIDForUpdate">
					    						<button type="submit" name = "appointUpdateBtn" class="btn  btn-success btn-sm">Update</button>
					    					</form>
					    					
					    				</div>
					    				<div class = "col align-self-end">
					    					<form method = "post" action = "AppointmentDeleteServlet">
					    						<button type="submit" name = "appointDeleteBtn" id = "appointDeleteBtn" class= "btn btn-danger btn-sm">Delete</button>
												<input type = "hidden" value = "${appoint.appID}" name = "appointIDForDelete">
					    					</form>
					    				</div>
					    				<br/>
					    			</div>
					  			</div>
							</div>
							<br/>
						</c:forEach>
						<div class = "container"><h5>${searchNoRsltMsg}</h5> </div>
					<br/>
				</div>
				<br/>
				
				<div class="alert alert-dark alert-dismissible fade show" role="alert">
					<!-- display delete form result -->	
				  	<h6 style = "color:black !important;text-align:center !important;font-size:16px !important;">${appointDeleteConfirmation} </h6>
				  	<!-- display update form result -->	
				  	<h6 style = "color:black !important;text-align:center !important;font-size:16px !important;">${updateConfirmation}</h6> 
				  	<h6 style = "color:blue !important;text-align:center !important;font-size:14px !important;">${updateConfirmation1}</h6> 
					
					<button type="button" class="close" data-dismiss="alert" aria-label="Close">
					  <span aria-hidden="true">&times;</span>
					</button>
				</div>
				
				<br/> <br/>
				<br/><br/>
				<div class="float-left">
					<a href = "main_homepage.jsp"><button class = "btn btn-light btn-sm"><i class="fa fa-angle-left" aria-hidden="true"></i>  Back </button></a>
				</div><br/>
			</div>
			
		</div>
	</div>
		
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