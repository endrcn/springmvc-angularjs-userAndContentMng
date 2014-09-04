<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Proje Görev 5</title>
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
<!--AngularJS Include-->
<script src="${pageContext.request.contextPath}/resources/js/angular-1.2.15.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/apps.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/usercontroller.js"></script>
</head>
<body ng-app="userApp" ng-controller="userController">

	<div class="mainDiv">
		<div class="topMenu">
		<ul>
			<li><a href="${pageContext.request.contextPath}/user/">Kullanıcı Yönetimi</a></li>
			<li><a href="${pageContext.request.contextPath}/content/">İçerik Yönetimi</a></li>
		</ul>
		</div>
		<div class="header">
			<div class="title">Kullanıcı Yönetimi</div>
		</div>
		<div class="content">

			<div class="loginBox">
				<span>{{title}}</span><br />
				<form name="signupForm" method="POST" novalidate>
					<table>
						<tr>
							<td><label for="name">Adı: </label></td>
							<td><input type="text" name="userName" ng-model="users.name"
								id="userName" required /></td>
						</tr>
						<tr>
							<td><label for="surname">Soyadı: </label></td>
							<td><input type="text" name="surname" ng-model="users.surname" 
								id="surname" required /></td>
						</tr>
						<tr>
							<td><label for="email">E-Mail Adresi: </label></td>
							<td><input type="email" name="email" ng-model="users.email"
								id="email" required /></td>
						</tr>
						<tr>
							<td><label for="password">Şifre: </label></td>
							<td><input type="password" name="password"
								ng-model="users.password" id="password" required /></td>
						</tr>
						<tr>
							<td><label for="re_password">Şifre(Tekrar): </label></td>
							<td><input type="password" name="re_password"
								ng-model="users.re_password" id="re_password" required /></td>
						</tr>
						<tr ng-show="showError" style="color: red;">
							<td colspan="2">{{formError}}</td>
						</tr>
						<tr>
							<td colspan="2" align="right">
							<input type="reset" name="btnReset" ng-click="reset()" value="Temizle" />
								<button ng-click="submit()" ng-hide="users.update">Kaydet</button>
								<button ng-click="update()" ng-show="users.update">Güncelle</button>
							</td>
						</tr>
					</table>
				</form>
			</div>
			<div class="userBox">
				<span>Kullanıcı Listesi</span><br /> <br />
				<table class="table table-striped">
					<thead>
						<tr>
							<th></th>
							<th>Adı</th>
							<th>Soyadı</th>
							<th>E-Posta</th>
						</tr>
					</thead>
					<tbody>
					<tr ng-repeat="user in users">
						<td>
							<button class="btn" ng-click="loadUserInfoToForm(user)">
								<span class="glyphicon glyphicon-pencil"></span>  Düzenle
							</button>
							<button class="btn btn-delete" ng-click="deleteUser(user.id)">
								<span class="glyphicon glyphicon-trash"></span>  Sil
							</button>
							
						</td>
						<td>{{user.firstName}}</td>
						<td>{{user.lastName}}</td>
						<td>{{user.email}}</td>
					</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>