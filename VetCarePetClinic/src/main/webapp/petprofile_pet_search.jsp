<%@ page import="java.util.*" %>
 
 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Pet Search</title>
 
      <link rel="stylesheet" href="Styles/Bootstrap/css/bootstrap.css" />
  

</head>
<body style="background-color:#e3ebea;">
 
    <!-- search starts from here -->
     <div className="container" >
          <br/>
          <br/>     
              
        <div class="container" style="background-color:#ffffff;">
            <br/>
            <br/> 
            <h4 class="text-body" style="text-align:center;">Pets Search Result </h4> 
             <br/>
             <br/>  
              <div class="container">
               <div class="row"> 
                   <div class="col-sm">
                     <a href="petprofile_petlist.jsp">
                      <center><button type="button" class="btn btn-success" style="width:200px;">Back</button></center>
                     </a>
                   </div>
                       <div class="col-sm"></div>
                       <div class="col-sm"></div>
               </div>
            </div> 
            <br/>
            <br/> 
              <table  class="table table-striped">
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
                int count = 0;
                String color = "#F9EBB3";
                if (request.getAttribute("piList") != null) {
                    ArrayList al = (ArrayList) request.getAttribute("piList");
                    System.out.println(al.toString());
                    
                    Iterator itr = al.iterator();
                    while (itr.hasNext()) {
 
                        if ((count % 2) == 0) {
                            color = "#eeffee";
                        }
                        count++;
                        ArrayList pList = (ArrayList) itr.next();
                        
            %>
            <tr style="background-color:<%=color%>;">
                <td><%=pList.get(0)%></td>
                <td><%=pList.get(1)%></td>
                <td><%=pList.get(2)%></td>
                <td><%=pList.get(3)%></td>
                <td><%=pList.get(4)%></td>
                <td><%=pList.get(5)%></td>
                <td><%=pList.get(6)%></td>
                <td><%=pList.get(7)%></td>
              
              
                
            </tr>
            <%
                    }
                }
                
            %>
            <%
            if (count == 0) {
            %>
            <tr>
                <td colspan=8 align="center"
                    style="background-color:#eeffee"><b>No Record Found..</b></td>
            </tr>
            <%            
            	}
            %>
           </tbody>
        </table>
            <br/>
            <br/>  
           </div>
            
    </div>
         
         <br/>
         <br/>
        
     
    
    
    <!-- pet list ends from here -->


</body>
</html>