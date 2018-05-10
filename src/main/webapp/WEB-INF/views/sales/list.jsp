<%@page session="false" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<html>

	<head>
		<jsp:include page="../fragments/header.jsp"/>
	</head>

<body>

	<jsp:include page="../fragments/navigation.jsp"/>
	
    <div class="container">
    	<section>
    	
	    	<div class="col-lg-8 col-lg-offset-2">
	    		<div class="page-header">
					<h1>Booking list</h1>
                </div>
	    	</div>
	    	
			<table class="table table-striped">
				<thead>
					<tr>
						<th>#ID</th>
						<th>Price</th>
						<th>Type</th>
						<th>Action</th>
					</tr>
				</thead>
	
				<c:forEach items="${Controller.all}" var="item">
					<tr>
						<td>${item.id}</td>
						<td>${item.price}</td>
						<th>${item.service}</th>
						<td>
							  <button class="btn btn-primary"
			                                          onclick="get('/sales/${item.id}/update')">Update</button>
							  <button class="btn btn-danger"
			                                          onclick="post('/sales/${item.id}/delete', true)">Delete</button>
						</td>
					</tr>
				</c:forEach>
			</table>
			
    	</section>
    	
    </div>

	<jsp:include page="../fragments/footer.jsp"/>

</body>

</html>