<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Pet Report Search</title>

    <!-- our style sheet should be here -->
     <link rel="stylesheet" href="Styles/PetProfileStyles/css/PetProfileStyle.css" />
     <link rel="stylesheet" href="Styles/Bootstrap/css/bootstrap.css" />
  
</head>
<body  style="background-color:#e3ebea;">
  
       <section id="header"></section>

<!-- coding  starts from here -->
    <br/>
    <br/>
    <br/>
    <br/>
     <div class="container" style="background-color:#ffffff; width:50%">
            <br/>
            <br/> 
            <h4 class="text-body" style="text-align:center;">Select a specific month </h4>
             <br/>
             <br/>  
             <div class="container" >
               <div class="row"> 
                   <div class="col-sm">
              <form name="RE_month" action="petprofile_petcount_report.jsp" method="post">	
			  <select class="custom-select" name="Month" id="Month"  style="width:150px;">
			
 				 <option value="2022-01">January</option>
  				 <option value="2022-02">February</option>
                 <option value="2022-03">March</option>
                <option value="2022-04">April</option>
                <option value="2021-05">May</option>
                <option value="2021-06">June </option>
                <option value="2021-07">July </option>
                <option value="2021-08">August</option>
                <option value="2021-09">September</option>
                <option value="2021-10">October </option>
                <option value="2021-11">November </option>
                <option value="2021-12">December</option>
            </select>
            
            
        
          <input type="submit" class="btn btn-success" value="submit" class="button2" style="width:150px;">  
		</form>
               </div>
              
                   
                   <div class="col-sm">
                     <a href="petprofile_petlist.jsp">
                      <center><button type="button" class="btn btn-success" style="width:150px;">Back</button></center>
                     </a>
                   </div>
                      
               </div>
             
              
              
             </div>
             <br/>
             <br/>
             
     </div>
    
    
    
    
    
    
    
     <!-- coding ends from here -->
        <section id="footer" class="section-p1"></section>

       <script src="main_js/nav.js"></script>
       <script src="main_js/footer.js"></script>



</body>
</html>