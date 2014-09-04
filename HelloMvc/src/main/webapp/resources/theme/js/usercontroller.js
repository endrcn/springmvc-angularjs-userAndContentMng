/*Kayıt Formundaki alanları kontrol eder*/
userApp.controller("userController",function($scope,$http){
	$scope.title = "Kullanıcı Kayıt";
	$scope.users = {id:"0",name:"",surname:"",email:"",password:"",update:false};
	$scope.formError = "HATA!";
	$scope.showError = false;
	
	
	/*Form Temizleme işlemi*/
	$scope.reset = function(){
		$scope.users.update = false;
		$scope.title = "Kullanıcı Kayıt";
	}
	
	/*Form Alanlarının Kontrolü*/
	$scope.formControl = function(frm){
		if(frm.userName.$invalid){
			$scope.formError = "Lütfen adınızı giriniz";
			return true;
		}else if(frm.surname.$invalid){
			$scope.formError = "Lütfen soyadınızı giriniz";
			return true;
		}else if(frm.email.$invalid){
			if(frm.email.$error.email){
				$scope.formError = "Lütfen doğru bir email giriniz";
				return true;
			}else{
				$scope.formError = "Lütfen email giriniz";
				return true;
			}
		}else if(frm.password.$invalid && frm.re_password.$invalid){
			$scope.formError = "Lütfen şifre alanlarını doldurunuz";
			return true;
		}else if($scope.users["password"] != $scope.users["re_password"]){
			$scope.formError = "Şifre alanlarınız uyuşmuyor";
			return true;
		}else{
			return false;
		}
	}
	
	$scope.update = function(){
		if(!($scope.showError = $scope.formControl($scope.signupForm))){
			$scope.updateFormToJSON = function(){
				console.log($scope.users)
				return JSON.stringify({
					"id" : $scope.users.id,
					"firstName": $scope.users.name,
					"lastName" : $scope.users.surname,
					"email" : $scope.users.email,
					"password" : $scope.users.password
				});
			}
			
			$http.post("/HelloMvc/user/updateUser",$scope.updateFormToJSON()).success(function(response){
				console.log("gönderildi");
				//location.reload(true);
				$scope.userList();
				$scope.title = "Kullanıcı Kayıt";
			});
			
		}
	}
	
	
	
	/*Kayıt formunu gönderir*/
	$scope.submit = function(){
		
		if(!($scope.showError = $scope.formControl($scope.signupForm))){
			$scope.signupFormToJSON = function(){
				return JSON.stringify({
					"firstName": $scope.users.name,
					"lastName" : $scope.users.surname,
					"email" : $scope.users.email,
					"password" : $scope.users.password
				});
			}
			//Tüm hatalar giderildiyse submit işlemini yap
			console.log("hata yok");
			$http.post("/HelloMvc/user/addUser",$scope.signupFormToJSON())
			.success(function(){
				console.log("gönderildi");
				//location.reload(true);
				$scope.userList();
			});
		}
	}
	
	//Kullanıcı listesi
	$scope.userList = function(){
		$http.get("/HelloMvc/user/list").
		success(function(response){
			$scope.users = response;
		});
	}
	
	$scope.userList();
	
	/*Kullanıcı Sil*/
	$scope.deleteUser = function(id){
		
		$http.get("/HelloMvc/user/deleteUser/"+id).
		success(function(response){
			console.log(response);
			//location.reload(true);
			$scope.userList();
		});
	}
	
	/*Kullanıcı Verilerini Form a yükle*/
	$scope.loadUserInfoToForm = function(param){
		$scope.users.id = param.id;
		$scope.users.name = param.firstName;
		$scope.users.surname = param.lastName;
		$scope.users.email = param.email;
		$scope.users.update = true;
		
		$scope.title = "Kullanıcı Güncelle";
		
	}
	
	//Kullanıcı listesi
	$scope.userList = function(){
		$http.get("/HelloMvc/user/list").
		success(function(response){
			$scope.users = response;
		});
	}
	
	$scope.userList();
	
});