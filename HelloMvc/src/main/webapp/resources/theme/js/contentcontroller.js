/*İçerik Sayfasını kontrol eder*/
contentApp.controller("contentController",function($scope,$http){
	$scope.contents = {id:"0",baslik:"",icerik:"",durum:false,update:false};
	$scope.formError = "HATA!";
	$scope.showError = false;
	$scope.title = "İçerik Kayıt";
	
	//Form Temizleme işlemi
	$scope.reset = function(){
		$scope.contents.update = false;
		$scope.title = "İçerik Kayıt";
	}
	
	//Form Alanlarının Kontrolü
	$scope.formControl = function(frm){
		if(frm.baslik.$invalid){
			$scope.formError = "Lütfen başlık giriniz";
			return true;
		}else if(frm.icerik.$invalid){
			$scope.formError = "Lütfen içerik giriniz";
			return true;
		}else{
			return false;
		}
	}
	
	//İçerik güncelle
	$scope.update = function(){
		if(!($scope.showError = $scope.formControl($scope.contentForm))){
			$scope.updateFormToJSON = function(){
				var durum = $scope.contents.durum;
				if(!durum)
					durum = false;
				console.log($scope.contents.date)
				return JSON.stringify({
					"id" : $scope.contents.id,
					"title": $scope.contents.baslik,
					"content" : $scope.contents.icerik,
					"date" : $scope.contents.date,
					"status" : durum
				});
			}
			
			$http.post("/HelloMvc/content/update",$scope.updateFormToJSON())
			.success(function(response){
				console.log(response);
				//location.reload(true);
				$scope.contentList();
				$scope.title = "İçerik Kayıt";
			});
			
		}
	}
	
	
	
	//Kayıt formunu gönderir
	$scope.submit = function(){
		
		if(!($scope.showError = $scope.formControl($scope.contentForm))){
			$scope.contentFormToJSON = function(){
				var durum = $scope.contents.durum;
				if(!durum)
					durum = false;
				return JSON.stringify({
					"title": $scope.contents.baslik,
					"content" : $scope.contents.icerik,
					"status" : durum
				});
			}
			//Tüm hatalar giderildiyse submit işlemini yap
			console.log("hata yok");
			$http.post("/HelloMvc/content/add",$scope.contentFormToJSON())
			.success(function(){
				console.log("gönderildi");
				//location.reload(true);
				$scope.contentList();
			});
		}
	}
	
	//İçerik listesini çek
	$scope.contentList = function(){
		$http.get("/HelloMvc/content/list").
		success(function(response){
			$scope.contents = response;
		});
	}
	
	$scope.contentList();
	
	//Kullanıcı Sil
	$scope.deleteContent = function(id){
		
		$http.get("/HelloMvc/content/delete/"+id).
		success(function(response){
			console.log(response);
			//location.reload(true);
			$scope.contentList();
		});
	}
	
	//İçerik Verilerini Form a yükle
	$scope.loadContentInfoToForm = function(param){
		$scope.contents.id = param.id;
		$scope.contents.baslik = param.title;
		$scope.contents.icerik = param.content;
		$scope.contents.durum = param.status;
		$scope.contents.date = param.date;
		$scope.contents.update = true;
		$scope.title = "İçerik Güncelle";
	}
	
});