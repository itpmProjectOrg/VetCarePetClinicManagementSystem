<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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

    <!-- our style sheet should be here -->
     <link rel="stylesheet" href="Styles/PetProfileStyles/css/PetProfileStyle.css" />
     <link rel="stylesheet" href="Styles/Bootstrap/css/bootstrap.css" />
    

</head>
<body style="background-color:#e3ebea;">

    <section id="header"></section>
    
    <!-- owner insert  starts from here -->
    <br/>
    <br/>
    <br/>
    <br/>
     <div class="container" style="background-color:#ffffff; width:50%">
            <br/>
            <br/> 
            <h3 class="text-body" style="text-align:center;">Add Owner </h3>
             <br/>
             <br/>  
             <div class="container" style="width:50%">
              
             <form action="ownerinsert" method="post">
              <div class="form-group" >
                <label>Name</label>
                <input type="text" name="name" class="form-control"  placeholder="Anna Silva" id="name" required="required">
             </div>
 
             <div class="form-group">
               <label>Address</label>
               <input type="text" name="addr" class="form-control"  placeholder="162 Wijayaba pl,Malabe" id="address" required="required" >
             </div>
 
             <div class="form-group">
               <label>Contact Number</label>
               <input type="tel" name="contactNo" class="form-control"  placeholder="0812050664" pattern = "[0-9]{10}"  id="contactno" required="required" >
             </div>
  
             <button type="submit" class="btn btn-success" style="width:100%">ADD</button>
            
             </form>
              
              
              
             </div>
             <br/>
             <br/>
             
     </div>
    
    
    
    
    
    
    
     <!-- owner insert ends from here -->
    
    <section id="footer" class="section-p1"></section>

    <script src="main_js/nav.js"></script>
    <script src="main_js/footer.js"></script>
</body>
</html>