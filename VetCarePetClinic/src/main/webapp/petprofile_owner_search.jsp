<%@ page import="java.util.*" %>
 
 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>pet owner search</title>
    
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
            <h4 class="text-body" style="text-align:center;">Pet Owners Search Result </h4> 
            <br/>
            <br/>
           <div class="container">
               <div class="row"> 
                   <div class="col-sm">
                     <a href="petprofile_ownerlist.jsp">
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
                  
                     <th scope="col">Owner ID</th>
                     <th scope="col">Owner Name</th>
                     <th scope="col">Address</th>
                     <th scope="col">Contact No</th>
                    
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