<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="tr">
<head>
<meta charset="UTF-8">
<title>Proje Görev 5</title>
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style.css">
<!--AngularJS Include-->
<script
	src="${pageContext.request.contextPath}/resources/js/angular-1.2.15.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/apps.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/contentcontroller.js"></script>
</head>
<body ng-app="contentApp" ng-controller="contentController">

	<div class="mainDiv">
		<div class="topMenu">
		<ul>
			<li><a href="${pageContext.request.contextPath}/user/">Kullanıcı Yönetimi</a></li>
			<li><a href="${pageContext.request.contextPath}/content/">İçerik Yönetimi</a></li>
		</ul>
		</div>
		<div class="header">
			<div class="title">İçerik Yönetimi</div>
		</div>
		<div class="content">

			<div class="loginBox">
				<span>{{title}}</span><br />
				<form name="contentForm" method="POST" novalidate>
					<table>
						<tr>
							<td><label for="baslik">Başlık: </label></td>
							<td><input type="text" name="baslik" ng-model="contents.baslik"
								id="baslik" required /></td>
						</tr>
						<tr>
							<td><label for="icerik">İçerik: </label></td>
							<td><textarea name="icerik" ng-model="contents.icerik"
								id="icerik" required ></textarea></td>
						</tr>
						<tr>
							<td><label for="durum">Durum: </label></td>
							<td><input type="checkbox" name="durum" value="1" ng-model="contents.durum"
								id="durum" /></td>
						</tr>
						<tr ng-show="showError" style="color: red;">
							<td colspan="2">{{formError}}</td>
						</tr>
						<tr>
							<td colspan="2" align="right"><input type="reset"
								name="btnReset" ng-click="reset()" value="Temizle" />
								<button ng-click="submit()" ng-hide="contents.update">Kaydet</button>
								<button ng-click="update()" ng-show="contents.update">Güncelle</button>
							</td>
						</tr>
					</table>
				</form>
			</div>
			<div class="userBox">
				<span>İçerik Listesi</span><br /> <br />
				<table class="table table-striped">
					<thead>
						<tr>
							<th></th>
							<th>Başlık</th>
							<th>İçerik</th>
							<th>Tarih</th>
							<th>Durum</th>
						</tr>
					</thead>
					<tbody>
						<tr ng-repeat="content in contents">
							<td>
								<button class="btn" ng-click="loadContentInfoToForm(content)">
									<span class="glyphicon glyphicon-pencil"></span>  Düzenle
								</button>
								<button class="btn btn-delete" ng-click="deleteContent(content.id)">
									<span class="glyphicon glyphicon-trash"></span>  Sil
								</button>

							</td>
							<td>{{content.title}}</td>
							<td>{{content.content}}</td>
							<td>{{content.date | date:'dd/MM/yyyy'}}</td>
							<td><span class="glyphicon glyphicon-ok" ng-show="{{content.status}}"></span>
								<span class="glyphicon glyphicon-remove" ng-hide="{{content.status}}"></span></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>