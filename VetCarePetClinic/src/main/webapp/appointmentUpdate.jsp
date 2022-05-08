<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title>Update Appointment</title>
	<link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Spartan:wght@200;300;400;500;600;700;800;900&family=Supermercado+One&display=swap"
      rel="stylesheet"
    />
    <script
      src="https://kit.fontawesome.com/f6b58a74a1.js"
      crossorigin="anonymous"></script>
      
    <link rel="stylesheet" href="Styles/AppointmentStyles/css/appointmentUpdate.css" />
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
					    <a class="nav-link" href="appointmentSummary.jsp"> <button type="submit"  name="apppointSideBtn3" class="btn btn-outline-success appointBtn">Appointment Summary</button> </a>
					  	</form>
					  </li>
					  <br/>
				</ul>
				<img src="Styles/AppointmentStyles/images/appointBg.png" class="rounded float-right">
				
			</div>
			
			<div class = "col-8">
				<h3>Update Appointment</h3>
				<br/><br/>
				<div class = "container appointAddFormBg">
					<br/>
					<form class = "container" method = "post" action = "AppointmentUpdateServlet" autocomplete = "on">
						
						<div class="form-row">
							<div class= "form-group col-md-4 offset-md-4">
					      		<label for="aNo" class = "appointAddLabel">Appointment No:</label>
					      		<input type="text" class="form-control form-control-sm" name="aNo" value = "${appointment.aNo}" readonly >
					      	</div>
					    </div> 
					
					   	<div class="form-group">
					      <label for="aOwnerID" class = "appointAddLabel">Pet Owner ID:</label>
					      <input type="number"  class="form-control form-control-sm" name="aOwnerID" value = "${appointment.ownerID}"  readonly>
					    </div>
					   
					    <div class="form-group" >
					      <label for="aVetSurgeon" class = "appointAddLabel">Veterinary Surgeon:</label>
					      <select class = "form-control form-control-sm" name = "aVetSurgeon" readonly>
					      				   	<c:forEach items="${vetSurgeonNames}" var="vet">
												<option value="${vet}"  <c:if test="${vet eq appointment.vetSurgeon}">selected="selected"</c:if> disabled> ${vet} </option>
											</c:forEach>
					      				  
					      </select>
					    </div>
					   	<br/>
					    
				    	<div class="form-row">
						  <div class="form-group col-md-6">
						    <label for="aDate" class = "appointAddLabel">Date:</label>
						    <input type="date" class="form-control form-control-sm" name="aDate" value = "${appointment.aDate}" readonly>
						  </div>
						   <div class="form-group col-md-6">
						    <label for="aTime" class = "appointAddLabel">Time:</label>
						    <input type="time" class="form-control form-control-sm" name="aTime" value ="${appointment.aTime}" readonly>
						  </div>
						</div>
						
						<div class="form-row">
						  <div class="form-group col-md-6">
						    <label for="aPayment" class = "appointAddLabel">Payment:</label>
						    <input type="number"  class="form-control form-control-sm" name="aPayment" min = "0"  value="${appointment.payment}" placeholder="Select Amount" required>
						 </div>
						<div class="form-group col-md-6">
						    <label for="aStatus" class = "appointAddLabel">Status:</label>
						    <select class = "form-control form-control-sm" name = "aStatus" id = "aStatus" required>
						    				<option value = "" disabled> Select Status </option>
					      				   	<c:forEach items="${status}" var="s">
												<option value="${s}"  <c:if test="${s eq appointment.status}">selected="selected"</c:if>> ${s} </option>
											</c:forEach>
					      	</select>
						  </div>
						</div> 
						<div class="form-group">
					      <input type="hidden"  class="form-control form-control-sm" name="appointIDForUpdateForm" value = "${appointment.appID}">
					    </div>
						<br/>
					    <br/>
					    
					    <div class="form-row">
					    	<div class="form-group col-md-6">
						    	<button type = "submit" class = "btn btn-success btn-sm appointSubmitBtns" name = "appointUpdateFormBtn">Update</button>
						    </div>
						    <div class="form-group col-md-6">
						    	<input type = "reset" class = "btn btn-secondary btn-sm appointSubmitBtns" name = "appointUpdateResetBtn" value = "Reset">
					 		</div>
					 	</div>
					 </form>
					 <br/><br/>
			
				</div>
			</div>
		</div>
	</div>
	

	<div class = container>
		<section id="footer" class="section-p1"></section>
	</div>
	
	<script src="main_js/nav.js"></script>
	<script src="main_js/footer.js"></script> 
	
</body>
</html>