<%@page import="model.ConnectionRequest"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<!DOCTYPE html>
<html>
<head>
<style>
table {
  border-collapse: collapse;
  width: 200%;
}
th, td {
  height: 50px;
  padding: 8px;
  width: 20%;
  text-align: left;
  border-bottom: 2px solid #ddd;
}
tr:hover {background-color: #d4cfcf;}
</style>
<meta charset="ISO-8859-1">
<title>Connection Request Service</title>
<link rel="stylesheet" href="Views/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="Components/jquery-3.2.1.min.js"></script>
<script src="Components/ConnectionRequest.js"></script>
</head>
<body>
	<div class="col-sm-4 col-lg-4">
		<img img src="Images/elec.jpg" alt="Logo"
          	class="img-fluid mx-auto d-block upload-img zoomIn animDelay02 animated pulse-hvr lazyload"/>
                         </div>
                         
	<div class="container">
		<div class="row">
			<div class="col-6">
				<h1 style="color:blue;"><b>Connection Request Service<b></h1>
				<br>
				<br>
				
				<form id="formConnectionRequest" name="formConnectionRequest">
				
				
						<div class="form-outline mb-4">
						    <label class="form-label" for="form6Example3" class="col-sm-2 col-form-label col-form-label-sm">NIC Number :</label>
						    <input type="text" id="nicNo" class="form-control" name="nicNo" placeholder="Enter NIC number..">						    
						</div>
						
						<div class="form-outline mb-4">
						    <label class="form-label" for="form6Example3" class="col-sm-2 col-form-label col-form-label-sm">First Name :</label>
						    <input type="text" id="firstName" class="form-control" name="firstName" placeholder="Enter first name..">						    
						</div>
						
						<div class="form-outline mb-4">
						    <label class="form-label" for="form6Example3" class="col-sm-2 col-form-label col-form-label-sm">Last Name :</label>
						    <input type="text" id="lastName" class="form-control" name="lastName" placeholder="Enter last name..">						    
						</div>
						
						<div class="form-outline mb-4">
						    <label class="form-label" for="form6Example3" class="col-sm-2 col-form-label col-form-label-sm">Address :</label>
						    <input type="text" id="address" class="form-control" name="address" placeholder="Enter address..">						    
						</div>
						
						<div class="form-outline mb-4">
						    <label class="form-label" for="form6Example3" class="col-sm-2 col-form-label col-form-label-sm">Telephone Number :</label>
						    <input type="text" id="tpNo" class="form-control" name="tpNo" placeholder="Enter telephone number..">						    
						</div>
						
						<input id="btnSave" name="btnSave" type="button" value="Save" class="btn btn-primary"> 
						<input type="hidden" id="hidConnReqIdSave" name="hidConnReqIdSave" value="">
						
				</form>
				
				<div id="alertSuccess" class="alert alert-success"></div>
				<div id="alertError" class="alert alert-danger"></div>
				<br>
				<div id="divConnReqGrid">
					<%
					ConnectionRequest connectionRequestObj = new ConnectionRequest();
					                  out.print(connectionRequestObj.readConnRequest());
					%>
				</div>
			</div>
		</div>
	</div>
</body>
</html>