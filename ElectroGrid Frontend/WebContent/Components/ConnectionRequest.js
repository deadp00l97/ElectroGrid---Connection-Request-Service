$(document).ready(function() {
	
	if ($("#alertSuccess").text().trim() == "") {
		$("#alertSuccess").hide();
	}
	$("#alertError").hide();
});
// SAVE ============================================
$(document).on("click", "#btnSave", function(event) {
	

	// Clear alerts---------------------
	$("#alertSuccess").text("");
	$("#alertSuccess").hide();
	$("#alertError").text("");
	$("#alertError").hide();

	// Form validation-------------------
	var status = validateConnectionRequestForm();
	if (status != true) {
		$("#alertError").text(status);
		$("#alertError").show();
		return;
	}
	// If valid------------------------
	var type = ($("#hidConnReqIdSave").val() == "") ? "POST" : "PUT";

	$.ajax({
		url : "ConnectionRequestAPI",
		type : type,
		data : $("#formConnectionRequest").serialize(),
		dataType : "text",
		complete : function(response, status) {
			onConnReqSaveComplete(response.responseText, status);
		}
	});
});

function onConnReqSaveComplete(response, status) {
	if (status == "success") {
		var resultSet = JSON.parse(response);
		if (resultSet.status.trim() == "success") {
			$("#alertSuccess").text("Successfully saved.");
			$("#alertSuccess").show();
			$("#divPaymentGrid").html(resultSet.data);
		} else if (resultSet.status.trim() == "error") {
			$("#alertError").text(resultSet.data);
			$("#alertError").show();
		}
	} else if (status == "error") {
		$("#alertError").text("Error while saving.");
		$("#alertError").show();
	} else {
		$("#alertError").text("Unknown error while saving..");
		$("#alertError").show();
	}
	$("#hidConnReqIdSave").val("");
	$("#formConnectionRequest")[0].reset();
}
// UPDATE==========================================
$(document).on(
		"click",
		".btnUpdate",
		function(event) {
			$("#hidConnReqIdSave").val(
					$(this).closest("tr").find('#hidConnReqIdUpdate').val());
			$("#nicNo").val($(this).closest("tr").find('td:eq(0)').text());
			$("#firstName").val($(this).closest("tr").find('td:eq(1)').text());
			$("#lastName").val($(this).closest("tr").find('td:eq(2)').text());
			$("#address").val($(this).closest("tr").find('td:eq(3)').text());
			$("#tpNo").val($(this).closest("tr").find('td:eq(4)').text());
		});

// REMOVE ====================================================

$(document).on("click", ".btnRemove", function(event) {
	
	$.ajax({
		url : "ConnectionRequestAPI",
		type : "DELETE",
		data : "connReqId=" + $(this).data("itemid"),
		dataType : "text",
		complete : function(response, status) {
			onConnReqDeleteComplete(response.responseText, status);
		}
	});
});
function onConnReqDeleteComplete(response, status) {
	if (status == "success") {
		var resultSet = JSON.parse(response);
		if (resultSet.status.trim() == "success") {
			$("#alertSuccess").text("Successfully deleted.");
			$("#alertSuccess").show();
			$("#divPaymentGrid").html(resultSet.data);
		} else if (resultSet.status.trim() == "error") {
			$("#alertError").text(resultSet.data);
			$("#alertError").show();
		}
	} else if (status == "error") {
		$("#alertError").text("Error while deleting.");
		$("#alertError").show();
	} else {
		$("#alertError").text("Unknown error while deleting..");
		$("#alertError").show();
	}
}

// CLIENTMODEL=========================================================================
function validateConnectionRequestForm() {
	// NIC Number
	if ($("#nicNo").val().trim() == "") {
		return "Insert NIC Number";
	}
	// First Name
	if ($("#firstName").val().trim() == "") {
		return "Insert First Name";
	}
	// Last Name
	if ($("#lastName").val().trim() == "") {
		return "Insert Last Name";
	}
	// Address
	if ($("#address").val().trim() == "") {
		return "Insert Address";
	}
	
	// Telephone Number
	if ($("#tpNo").val().trim() == "") {
		return "Insert Telephone Number";
	}
	// is numerical value
	//var tmpCharge = $("#amount").val().trim();
	//if (!$.isNumeric(tmpCharge)) {
	//	return "Insert a numerical value for Amount.";
	//}

	
	
	return true;

}
