<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    
<!DOCTYPE html>
<html>
<head>

	<meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title>Add Appointment</title>
	<link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Spartan:wght@200;300;400;500;600;700;800;900&family=Supermercado+One&display=swap"
      rel="stylesheet"
    />
    <script
      src="https://kit.fontawesome.com/f6b58a74a1.js"
      crossorigin="anonymous"></script>
      
    <link rel="stylesheet" href="Styles/AppointmentStyles/css/appointmentAdd.css" />
    <link rel="stylesheet" href="Styles/Bootstrap/css/bootstrap.css" />
</head>

<body>
	<section id="header"></section>
 	
 	<br/><br/>
	
	<div class = "container">
		<div class = "row">
			<div class = "col-4">
				
				<ul class="nav flex-column">
					
					  <li class="nav-item">
					  	<form method = "post" action = "AppointmentVetSelectServlet">
					    <a class="nav-link active" href="appointmentPortal.jsp"><button type="submit" name="apppointSideBtn1" class="btn btn-outline-success appointBtn">Appointment Portal</button></a>
					  	</form>
					  </li>
					  <br/>
					  <li class="nav-item">
					  	<form method = "post" action = "AppointmentVetSelectServlet">
					    <a class="nav-link" href="appointmentAdd.jsp"><button type="submit" name="apppointSideBtn2" class="btn btn-outline-success appointBtn">Add New Appointment</button></a>
					  	</form>
					  </li>
					  <br/>
					  <li class="nav-item">
					  	<form method = "post" action = "AppointmentVetSelectServlet">
					    <a class="nav-link" href="appointmentSummary.jsp"> <button type="submit" name="apppointSideBtn3" class="btn btn-outline-success appointBtn">Appointment Summary</button> </a>
					 	</form>
					  </li>
					  <br/>
				</ul>
				<img src="Styles/AppointmentStyles/images/appointBg.png" class="rounded float-right">
				
			</div>
			
			<div class = "col-8">
				<h3>Add New Appointment</h3>
				<br/><br/>
				<div class = "container appointAddFormBg">
					<br/>
					<form class = "container" method = "post" action = "AppointmentAddServlet" autocomplete = "on">
					
					   	<div class="form-group">
					      <label for="aOwnerID" class = "appointAddLabel">Pet Owner ID:</label>
					      <input type="number" class="form-control form-control-sm" name="aOwnerID" placeholder="Enter Owner ID" min = "1" required>
					    </div>
					    <h6 class = "appointRefLinks"><a href="petprofile_ownerlist.jsp">Don't know Owner ID?</a></h6>
					   	<br/>
					   
					    <div class="form-group" >
					      <label for="aVetSurgeon" class = "appointAddLabel">Veterinary Surgeon:</label>
					      <select class = "form-control form-control-sm" name = "aVetSurgeon" required>
					      				<option value = "" selected disabled>Select Surgeon</option>
					      				<c:forEach items="${vetSurgeons}" var="vet">
									    	<option value="${vet}">${vet} </option>
										</c:forEach>	    
					      </select>
					    </div>
					    <h6 class = "appointRefLinks"><a href="">Need to check Surgeon availability?</a></h6>
					   	<br/>
					    
				    	<div class="form-row">
						  <div class="form-group col-md-6">
						    <label for="aDate" class = "appointAddLabel">Date:</label>
						    <input type="date" class="form-control form-control-sm" name="aDate" required>
						  </div>
						   <div class="form-group col-md-6">
						    <label for="aTime" class = "appointAddLabel">Time:</label>
						    <input type="time" class="form-control form-control-sm" name="aTime" required>
						  </div>
						</div>
						
						<div class="form-row">
						  <div class="form-group col-md-6">
						    <label for="aPayment" class = "appointAddLabel">Payment:</label>
						    <input type="number" class="form-control form-control-sm" name="aPayment" min = "0" placeholder="Select Amount" required>
						 </div>
						<div class="form-group col-md-6">
						    <label for="aStatus" class = "appointAddLabel">Status:</label>
						    <select class = "form-control form-control-sm" name = "aStatus" required>
					      				<option value = "" selected disabled>Select Status</option>
									    <option value="pending">Pending</option>
									    <option value="completed">Completed</option>
					      	</select>
						  </div>
						</div> 
						<br/>
						
						<div class="form-group">
					      	<label for="aNo" class = "appointAddLabel">Appointment No:</label>
					      	<input type="text" class="form-control form-control-sm" name="aNo" value = "${appointNo}" readonly autocomplete="off">
				
					    </div> 
					    <br/>
					    
					    <div class="form-row">
					    	<div class="form-group col-md-6">
						    	<button type = "submit" class = "btn btn-success btn-sm appointSubmitBtns" name = "appointAddBtn">Add</button>
						    </div>
						    <div class="form-group col-md-6">
						    	<input type = "reset" class = "btn btn-secondary btn-sm appointSubmitBtns" name = "appointResetBtn" value = "Reset">
					 		</div>
					 	</div>
					 </form>
					 <br/><br/>
					 <!-- display error message if appointment Number exceeds the maximum limit (50)  -->
					 <div><h5 style = "color:red; text-align:center;">${appointNoError}</h5></div>
					 <br/>
					 
					  <!-- display form result -->
					 <div class="alert alert-light alert-dismissible fade show" role="alert">
					 	<h6 style = "color:green !important;font-size:15px !important; font-style:bold;">${Msg}</h6>
					 	<h6 style = "color:blue !important;font-size:18px !important; font-weight:50%;">${AppointNoMsg} ${appointNo}</h6>
					 	<h6 style = "color: red !important;">${ErrorMsg1} </h6>
						<a href="#" class="alert-link" style = "font-size: 12px !important;">${ErrorMsg2}</a>
						 
						<button type="button" class="close" data-dismiss="alert" aria-label="Close">
						  <span aria-hidden="true">&times;</span>
						</button>
					</div>
					 <br/>
					 <br/>
				</div>
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