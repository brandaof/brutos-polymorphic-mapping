<%@page session="false" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>

	<head>
		<jsp:include page="../fragments/header.jsp"/>
		
		<script type="text/javascript">
			function showServiceData() {
				
				var type = $("#serviceType").val();
				
				if (type == "air") {
					$('.air').show();
					$('.hosting').hide();
				} else {
					$('.air').hide();
					$('.hosting').show();
				}
			}
		</script>
	</head>

<body >

	<jsp:include page="../fragments/navigation.jsp"/>
	
    <div class="container">
    	<section>
    	
	    	<div class="col-lg-8 col-lg-offset-2">
	    		<div class="page-header">
					<h1>Booking edit</h1>
                </div>
	    	</div>
	    	
			<form method="POST"
				action="${pageContext.servletContext.contextPath}/sales">
				
						<input name="entity.id" type="hidden" value="${entity.id}">
				
						  <div class="form-group row">
							<label class="col-sm-2 control-label">Booking ID</label>
							<div class="col-sm-10">
								# ${empty entity? '0000000000' : entity.id}
							</div>
						  </div>
						  
						  <div class="form-group row">
							<label class="col-sm-2 control-label">Price</label>
							<div class="col-sm-10">
								<input type="text" name="entity.price"
									value="${empty entity.price? '0' : entity.price}">
								<c:forEach var="ex" items="${exception.causes['entity.price']}">
									<div class="text-danger"><small>${ex.message}</small></div>
								</c:forEach>
							</div>
						  </div>
						  
						  <div class="form-group row">
							<label class="col-sm-2 control-label">Service type</label>
							<div class="col-sm-10">
								<select id="serviceType" name="entity.service.serviceType"
									onchange="javascript:showServiceData()">
										<option ${entity.service.serviceType == 'air'? "selected " : ""} 
										    value="air">Air</option>
										<option ${empty entity || entity.service.serviceType == 'hosting'? "selected " : ""} 
										    value="hosting">Hosting</option>
								</select>		
								<c:forEach var="ex" items="${exception.causes['entity.service.serviceType']}">
									<div class="text-danger"><small>${ex.message}</small></div>
								</c:forEach>
							</div>
						  </div>
				
							<!--  Air -->
							
						  <div class="form-group row air">
							<label class="col-sm-2 control-label">Airplane</label>
							<div class="col-sm-10">
									<input type="text" name="entity.service.airplane"
										value="${entity.service.serviceType != 'air'? null : entity.service.airplane}">		
								<c:forEach var="ex" items="${exception.causes['entity.service.airplane']}">
									<div class="text-danger"><small>${ex.message}</small></div>
								</c:forEach>
							</div>
						  </div>
				
						  <div class="form-group row air">
							<label class="col-sm-2 control-label">Departure date</label>
							<div class="col-sm-10">
								<input type="text" name="entity.service.departureDate"
									value="<fmt:formatDate 
									value="${entity.service.serviceType != 'air'? null : entity.service.departureDate}" 
									pattern="yyyy-MM-dd hh:mm" />">
								<c:forEach var="ex" items="${exception.causes['entity.service.departureDate']}">
									<div class="text-danger"><small>${ex.message}</small></div>
								</c:forEach>
							</div>
						  </div>
				
						  <div class="form-group row air">
							<label class="col-sm-2 control-label">Arrival date</label>
							<div class="col-sm-10">
								<input type="text" name="entity.service.arrivalDate"
									value="<fmt:formatDate 
									value="${entity.service.serviceType != 'air'? null : entity.service.arrivalDate}" 
									pattern="yyyy-MM-dd hh:mm" />">
								<c:forEach var="ex" items="${exception.causes['entity.service.arrivalDate']}">
									<div class="text-danger"><small>${ex.message}</small></div>
								</c:forEach>
							</div>
						  </div>
				
							<!-- hosting  -->
							
						  <div class="form-group row hosting">
							<label class="col-sm-2 control-label">Hotel</label>
							<div class="col-sm-10">
								<input type="text" name="entity.service.hotel"
										value="${entity.service.serviceType != 'hosting'? null : entity.service.hotel}">
								<c:forEach var="ex" items="${exception.causes['entity.service.hotel']}">
									<div class="text-danger"><small>${ex.message}</small></div>
								</c:forEach>
							</div>
						  </div>

						  <div class="form-group row hosting">
							<label class="col-sm-2 control-label">Checkin</label>
							<div class="col-sm-10">
								<input type="text" name="entity.service.checkin"
												value="<fmt:formatDate 
												  value="${entity.service.serviceType != 'hosting'? null : entity.service.checkin}" 
												   pattern="yyyy-MM-dd" />">
								<c:forEach var="ex" items="${exception.causes['entity.service.checkin']}">
									<div class="text-danger"><small>${ex.message}</small></div>
								</c:forEach>
							</div>
						  </div>

						  <div class="form-group row hosting">
							<label class="col-sm-2 control-label">Checkout</label>
							<div class="col-sm-10">
								<input type="text" name="entity.service.checkout"
												value="<fmt:formatDate 
												  value="${entity.service.serviceType != 'hosting'? null : entity.service.checkout}" 
												  pattern="yyyy-MM-dd" />">
								<c:forEach var="ex" items="${exception.causes['entity.service.checkout']}">
									<div class="text-danger"><small>${ex.message}</small></div>
								</c:forEach>
							</div>
						  </div>

						  <div class="form-group row hosting">
							<label class="col-sm-2 control-label">Mealplan</label>
							<div class="col-sm-10">
								<input type="text" name="entity.service.mealPlan"
												value="${entity.service.serviceType != 'hosting'? null : entity.service.mealPlan}">
								<c:forEach var="ex" items="${exception.causes['entity.service.mealPlan']}">
									<div class="text-danger"><small>${ex.message}</small></div>
								</c:forEach>
							</div>
						  </div>
						
						  <div class="form-group row hosting">
							<label class="col-sm-2 control-label">Room</label>
							<div class="col-sm-10">
								<input type="text" name="entity.service.room"
												value="${entity.service.serviceType != 'hosting'? null : entity.service.room}">
								<c:forEach var="ex" items="${exception.causes['entity.service.room']}">
									<div class="text-danger"><small>${ex.message}</small></div>
								</c:forEach>
							</div>
						  </div>
						  
						<div class="form-group row">
						  <div class="col-sm-offset-2 col-sm-12">
							<c:choose>
							  <c:when test="${empty entity.id}">
							     <button type="submit" class="btn-lg btn-primary float-right">Book
				                             </button>
							  </c:when>
							  <c:otherwise>
							     <button type="submit" class="btn-lg btn-primary float-right">Update 
				                             </button>
							  </c:otherwise>
							</c:choose>
						  </div>
						</div>
			
			</form>
			
    	</section>
    	
    </div>

	<jsp:include page="../fragments/footer.jsp"/>

		<script type="text/javascript">
			$(function() {
				showServiceData();
			});
		</script>

</body>

</html>