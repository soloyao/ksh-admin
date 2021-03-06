$(function() {
	var data4Vue = {
		user4Login: {yhzh: "", yhmm: ""}
	};
	
	var vue = new Vue({
		el: "#app",
		data: data4Vue,
		mounted: function() {
			$("#login-name").get(0).select();
			if ($.cookie("autoLogin") == "true") {
				$("#primaryCheckbox1").attr("checked", true);
				this.user4Login.yhzh = $.cookie("username");
				this.user4Login.yhmm = $.cookie("yhmm");
				this.login();
			}
		},
		methods: {
			loginKeyDown: function(e) {
				if (e.keyCode == 13) {
					this.login();
				}
			},
			login: function() {
				var _this = this;
				var url = "login";
				if (!_this.user4Login.yhzh || !_this.user4Login.yhmm) {
					myzui._error1("用户名或密码不能为空");
					return;
				}
				axios.post(url, _this.user4Login).then(function(res) {
					var data = res.data;
					if (data.code == "0") {
						if ($("#primaryCheckbox1").prop("checked")) {
							$.cookie("autoLogin", "true", {expires: 7});
							$.cookie("username", _this.user4Login.yhzh, {expires: 7});
							$.cookie("yhmm", _this.user4Login.yhmm, {expires: 7});
						} else {
							$.cookie("autoLogin", "false", { expire: -1 });
							$.cookie("username", "", { expires: -1 });
			                $.cookie("password", "", { expires: -1 });
						}
//						myzui._success1("登录成功");
						var user = data.user;
						sessionStorage.setItem("user", JSON.stringify(user));
//						setTimeout(() => {
							location.href = "index";
//						}, 1000);
					} else {
						myzui._error1("登录失败，用户名或密码错误");
					}
				});
			}
		}
	});
});