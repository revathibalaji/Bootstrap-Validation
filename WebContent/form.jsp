<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript" src="resources/jquery-1.11.0.min.js"></script>


<title>Bootstrap Form</title>

<link rel="stylesheet" href="resources/bootstrap.min.css">
<link rel="stylesheet" href="resources/bootstrap.css" />
<link rel="stylesheet" href="resources/formValidation.css" />
<script type="text/javascript" src="resources/jquery.min.js"></script>
<script type="text/javascript" src="resources/formValidation.js"></script>
<script src="resources/bootstrap.min.js"></script>
<script type="text/javascript" src="resources/bootstrap.js"></script>

<script>
	function fun1() {		
		var btnId = $('.btn1').attr('id');		
		$("#btnIdHidden").val(btnId);
	}

	function fun2() {
		var btnId = $('.btn2').attr('id');	
		$("#btnIdHidden").val(btnId);
	}
	
</script>
</head>
<body>
	<div class="page">
		<script type="text/javascript">
			$(document)
					.ready(
							function() {

								$('#form')
										.formValidation(
												{
													message : 'This value is not valid',
													excluded : [ ':disabled',
															':hidden',
															':not(:visible)' ],												
													fields : {	

														gender : {
															row : '.rowContainer',
															validators : {
																callback : {
																	message : 'gender is not valid',
																	callback : function(
																			value,
																			validator,
																			$field) {

																		var gender = $(
																				"#gender")
																				.val();

																		if (gender == ''
																				|| gender == null) {

																			return {
																				valid : false,
																				message : 'Gender is Required'
																			};
																		}
																		return true;
																	}
																}
															}
														},

														firstName : {
															row : '.rowContainer',
															validators : {
																callback : {
																	message : 'firstName is not valid',
																	callback : function(
																			value,
																			validator,
																			$field) {

																		r = value.replace(/\s/g,"")

																		if (r.length == 0
																				|| r.length == ' ') {
																			return {
																				valid : false,
																				message : 'First Name is required And Not Empty'
																			};
																		}
																		return {
																			valid : true,

																		};
																	}

																}
															}
														},

														lastName : {
															row : '.rowContainer',
															validators : {
																callback : {
																	message : 'lastName is not valid',
																	callback : function(
																			value,
																			validator,
																			$field) {
																		
																		r = value.replace(/\s/g,"")
				
																		if (r.length == 0 || r.length == ' ') {
																			return {
																				valid : false,
																				message : 'Last Name is required And Not Empty'
																			};
																		}

																		return true;
																	}
																},
															}
														}
													}
												})

							});
			/* dom end */
		</script>

		<main>


		<div class="container">
			<div class="page-header">
				<h1>Web Service</h1>
			</div>


			<form id="form" method="post" class="form-horizontal"
				autocomplete="off" action="./"
				modelAttribute="formBean">

				<div class="form-group">
					<div class="rowContainer">
						<label class="col-sm-2 control-label">Gender<font
							size="3" color="red"><sup>*</sup></font></label>
						<div class="col-sm-4">
							<select class="form-control" name="gender"
								id="gender">
								<option selected="selected" value="">--Please Select --</option>
								<option value="MALE">MALE</option>
								<option value="FEMALE">FEMALE</option>
							</select>
						</div>
					</div>
				</div>
				<input type="hidden" id="btnIdHidden" name="btnId" path="btnId" id="btnId">
				<div class="form-group">
					<div class="rowContainer">
						<label class="col-sm-2 control-label">First Name<font
							size="3" color="red"><sup>*</sup></font></label>
						<div class="col-sm-4">
							<input type="text" class="form-control" maxlength="25"
								id="firstName" name="firstName" path="firstName">
						</div>
					</div>
				</div>

				<div class="form-group">
					<div class="rowContainer">
						<label class="col-sm-2 control-label">Last Name<font
							size="3" color="red"><sup>*</sup></font></label>
						<div class="col-sm-4">
							<input type="text" class="form-control" maxlength="25"
								path="lastName" name="lastName" id="lastName">
						</div>
					</div>
				</div>	


				<div class="form-group">
					<div class="col-xs-offset-2 col-xs-2">

						<button type="submit" id="success" class="btn1 btn btn-primary"
							onclick="fun1()">Success</button>
					</div>
					<div class="col-xs-5">

						<button type="submit" id="failure" class="btn2 btn btn-primary"
							onclick="fun2()">Failure</button>
					</div>
				</div>
			</form>

			<hr>
			<c:if test="${msg != null && msg eq 'success' }">
				<font color="green">Success Button Clicked</font>				
			</c:if>
			<c:if test="${msg != null && msg eq 'failure' }">
				<font color="green">Failure Button Clicked</font>				
			</c:if>		
			
			

		</div>
	</div>
	</main>
</body>
</html>
