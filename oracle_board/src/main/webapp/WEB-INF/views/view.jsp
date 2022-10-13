<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	/* The Modal (background) */
	.modal {
	    display: none; /* Hidden by default */
	    position: fixed; /* Stay in place */
	    z-index: 1; /* Sit on top */
	    left: 0;
	    top: 0;
	    width: 100%; /* Full width */
	    height: 100%; /* Full height */
	    overflow: auto; /* Enable scroll if needed */
	    background-color: rgb(0,0,0); /* Fallback color */
	    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
	}
	
	/* Modal Content/Box */
	.modal-content {
	    background-color: #fefefe;
	    margin: 15% auto; /* 15% from the top and centered */
	    padding: 20px;
	    border: 1px solid #888;
	    width: 50%; /* Could be more or less, depending on screen size */                          
	}
	
	/* The Close Button */
	.close {
	    color: #aaa;
	    float: right;
	    font-size: 28px;
	    font-weight: bold;
	}
	.close:hover,
	.close:focus {
	    color: black;
	    text-decoration: none;
	    cursor: pointer;
	}
</style>

</head>
<body>
	
	<table width="600" border="1">
		<tr>
			<th>ID</th>
			<td>${board.id}</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${board.title}</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${board.content}</td>
		</tr>
		<tr>
			<th>조회수</th>
			<td>${board.readnum}</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td>${board.writeday}</td>
		</tr>			
	</table>
	
	<a href="list">list</a><p>
	<%-- <a href="delete?${board.id}">delete</a> --%>
	
	<!-- Trigger/Open The Modal -->
	<button class="myBtn">modify</button>
	<button class="myBtn">delete</button>
	
	<!-- The Modal -->
    <div id="myModal" class="modal">
 
		<!-- Modal content -->
		<div class="modal-content">
			<span class="close">&times;</span>
			<p>Check password</p>
			<form name="modalForm" method="post" action="">
				<input type="hidden" name="id" value="${board.id}" />
				<input type="password" name="pwd" placeholder="password" />
				<input type="submit" name="submit" value="" />
			</form>
			<p>
		</div>
		
    </div>
	
<script>
	//Get the modal
	var modal = document.getElementById('myModal');
	
	// Get the button that opens the modal
	var btn = document.getElementsByClassName("myBtn");
	
	// Get the <span> element that closes the modal
	var span = document.getElementsByClassName("close")[0];                                          
	
	// When the user clicks on the button, open the modal 
	btn[0].onclick = function() {
	    modal.style.display = "block";
	    modalForm.action = "update";
	    modalForm.submit.value = "modify";
	}
	btn[1].onclick = function() {
	    modal.style.display = "block";
	    modalForm.action = "delete";
	    modalForm.submit.value = "delete";
	}
	
	// When the user clicks on <span> (x), close the modal
	span.onclick = function() {
	    modal.style.display = "none";
	}
	
	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
	    if (event.target == modal) {
	        modal.style.display = "none";
	    }
	}
</script>
</body>
</html>