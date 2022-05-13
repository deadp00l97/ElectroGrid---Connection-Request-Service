<%@page import="model.ConnectionRequest"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Connection Request Service</title>
<link rel="stylesheet" href="Views/bootstrap.min.css">

<script src="Components/jquery-3.2.1.min.js"></script>
<script src="Components/ConnectionRequest.js"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-6">
				<h1>Connection Request</h1>
				<form id="formConnectionRequest" name="formConnectionRequest">
						
					NIC Number :
					<input id="nicNo" name="nicNo" type="text"
						class="form-control form-control-sm"> <br>	
				
			
					First Name :
					<input id="firstName" name="firstName" type="text"
						class="form-control form-control-sm"> <br>
						
					Last Name : 
					 <input id="lastName" name="lastName" type="text"
						class="form-control form-control-sm"> <br> 
						
					Address : 
					 <input id="address" name="address" type="text"
						class="form-control form-control-sm"> <br> 
						
					Telephone Number : 
					 <input id="tpNo" name="tpNo" type="text"
						class="form-control form-control-sm"> <br> 
									
						
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