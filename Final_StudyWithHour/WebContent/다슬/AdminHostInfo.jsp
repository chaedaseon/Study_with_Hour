<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Template.jsp</title>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="css/mainStyle.css">
<link rel="stylesheet" type="text/css" href="css/menuStyle.css">
<link rel="stylesheet" type="text/css" href="css/sideMenuStyle.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/adminPage.css">
</head>
<body>
	<header>
		<c:import url="Menu.jsp"></c:import>
	</header>
	
	<section>
			<div id="content">
			<c:import url="SideMenu.jsp"></c:import>
			
			<div class="rightContent_div">
				
				
				
					<div class="list_head">
						<div class="row  justify-content-start text-center">
							<div class="col-2 list_name">회원 번호</div>
							<div class="col-1 head-number">8</div>
						</div>


					</div>
					<!-- list_head -->



					<div class="admin-box shadow-sm">
						<table class="table ">
							<tbody>
								<tr>
									<th>아이디</th>
									<td>아이디아이디아이디</td>
									<th>비밀번호</th>
									<td>**************</td>
									<th>등록한 스터디카페</th>
									<td>3개</td>
								</tr>
								<tr>
									<th>이름</th>
									<td>홍길동</td>
									<th>주민등록번호</th>
									<td>999999-1******</td>
								</tr>
								<tr>
									<th>전화번호</th>
									<td>000-0000-0000</td>
									<th>이메일</th>
									<td colspan="2">asdfasd1234@gmail.com</td>
								</tr>
								<tr>
									<th>가입일자</th>
									<td>9999-99-99</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="admin-box shadow-sm">
						<table class="table ">
							<tbody>
								<tr>
									<th>등록한 스터디 카페</th>
								</tr>
								<tr>
									<td class="text-center"><a href="#">0000000000스터디카페</a></td>
									<td class="text-center"><a href="#">0000000000스터디카페</a></td>
								</tr>
								<tr>
									<td class="text-center"><a href="#">0000000000스터디카페</a></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="admin-box shadow-sm">
						<table class="table ">
							<tbody>
								<tr>
									<th>탈퇴 일자</th>
									<td>9999-99-99</td>
									<th>탈퇴 사유</th>
									<td>ㅁㅁㅁㅁㅁ</td>
								</tr>
							</tbody>
						</table>
					</div>


					<br>
					<div class="list-foot">
						<div class="row justify-content-center">
							<div class="col-4 list-page">
								<button type="button" class="btn btn-custom">수정</button>
								<button type="button" class="btn btn-custom">비활성화</button>
								<button type="button" class="btn btn-custom">목록</button>
							</div>
						</div>

					</div>
					<!-- list-foot -->
				
				
				
			</div>
		</div>
	</section>
	
	<footer>
		<c:import url="Footer.jsp"></c:import>
	</footer>

</body>
</html>