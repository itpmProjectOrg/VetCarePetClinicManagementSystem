   
<%@page import="com.mysql.fabric.xmlrpc.base.Data"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import ="java.util.Date" %>




<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String id = request.getParameter("id");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "vetcaredb";
String userid = "rame123";
String password = "rootpwd";
try {
	Class.forName(driver);
} catch (ClassNotFoundException e) {
	e.printStackTrace();
}
Connection connection = null;
Statement statement = null;

ResultSet resultSet = null;
ResultSet resultSet1 = null;
%>    
    
    
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>VetCare Pet Clinic</title>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Spartan:wght@200;300;400;500;600;700;800;900&family=Supermercado+One&display=swap"
      rel="stylesheet"
    />

     <script
      src="https://kit.fontawesome.com/f6b58a74a1.js"
      crossorigin="anonymous"
    ></script>
    
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.3/html2pdf.bundle.min.js"></script>
    <script src="JavaScriptSources/St_search.js"></script>

    
    
   <title>Pet count report</title>
   
    <!-- our style sheet should be here -->
     <link rel="stylesheet" href="Styles/PetProfileStyles/css/PetProfileStyle.css" />
     <link rel="stylesheet" href="Styles/Bootstrap/css/bootstrap.css" />
  

</head>
<body  style="background-color:#e3ebea;">

   <section id="header"></section>
    
     <!-- coding starts from here -->
   
        
       <div className="container" id="list" >
          <br/>
          <br/>     
              
        <div class="container" style="background-color:#ffffff;">
            <br/>
            <br/> 
            <h3 class="text-body" style="text-align:center;">Pet Count Report </h3> 
             <br/>
             <br/>  
            
            <center> 
            <p style="width: 50%;margin:0% 5%">Date&Time:<%=new Date().toString()%> </p>  
            </center>  
            <br/>
            
             <table class="table table-striped">
                <thead>
                   <tr>
                     <th scope="col">Pet ID</th>
                     <th scope="col">Owner ID</th>
                     <th scope="col">Pet Name</th>
                     <th scope="col">Pet Type</th>
                     <th scope="col">Breed</th>
                     <th scope="col">Sex</th>
                     <th scope="col">DOB</th>
                     <th scope="col">Registered Date</th>
                    
                    
                  </tr>
               </thead>
               <tbody>
                  <%
		            try {
			           String month = request.getParameter("Month");

			            connection = DriverManager.getConnection(connectionUrl + database, userid, password);
			            statement = connection.createStatement();
			
		
				        String sql = "select *   from pet where date like '"+month+"%'";
				        resultSet = statement.executeQuery(sql);
				

				       while (resultSet.next()) {

		           %>

                  <tr>
                    <td><%=resultSet.getString("petID") %></td>
                    <td><%=resultSet.getString("ownerID") %></td>
                    <td><%=resultSet.getString("name") %></td>
                    <td><%=resultSet.getString("petType") %></td>
                    <td><%=resultSet.getString("breed") %></td>
                    <td><%=resultSet.getString("sex") %></td>
                    <td><%=resultSet.getString("dob") %></td>
                    <td><%=resultSet.getString("date") %></td>
                 </tr>
                 <%
		          }
				
				   String sql1 = "select COUNT(petID) AS count from pet where date like '"+month+"%' ";
				   resultSet1 = statement.executeQuery(sql1);

				   Float count;	
					
				   if(resultSet1.next()){
					
					  count =resultSet1.getFloat("count");

				 }
				
				 %>
				<tr>
				    <br/><br/><center>
				    <td><h6> Total number of pets have visited to the clinic</h6> </td>
					<td><h6><%=resultSet1.getString("count")%></h6></td>
					</center>
					 
					
					
				</tr>
		  <%
			 connection.close();
		   } catch (Exception e) {
		    	e.printStackTrace();
		   }
		  %>
		    			
              </tbody>
           </table>
            
             <br/> 
              <center>     
	          <p class="font-weight-bold m-0 p-0 mt-1 ml-5">Prepaired By: ................................................ </p><br/>
	          <p class="font-weight-bold m-0 p-0 mt-1 ml-5">Prepaired Date: ................................................ </p>
	         </center>
	         <br/>
	 
	         <center>  
	          <button onclick="print()" class="btn btn-success">Download  Report</button>
	          <br/>
	       
              <a href="petprofile_report_search.jsp">
                  <button type="button" class="btn btn-success" style="width:150px;">Back</button>
              </a>
                 
	          
             </center>

	
	       <script >
	
	          function print(){
	          var element = document.getElementById("list");
	          var opt = {
	             margin:       1,
	             filename:     'Pet count report.pdf',
	             image:        { type: 'jpeg', quality: 0.98 },
	             html2canvas:  { scale: 2 },
	             jsPDF:        { unit: 'in', format: 'letter', orientation: 'portrait' }
	         };
	 
	           // New Promise-based usage:
	            html2pdf().from(element).set(opt).save();
	
	        }
	
	     </script>
	     <br/>
        </div>
         
       
         <br/>
         <br/>
      </div>
     
    
    
  
    
    <section id="footer" class="section-p1"></section>

    <script src="main_js/nav.js"></script>
    <script src="main_js/footer.js"></script>
  

</body>
</html>