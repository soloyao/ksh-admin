$(function() {
	var data4Vue = {
		active: null,
		parentPermissions: [],
		parentPermission: {},
//		permissions: [],
		itemList: [],
		listThs: [
			{name: '菜单名称', width: 338, thname: 'cdmc'},
			{name: '菜单描述', width: 338, thname: 'cdms'},
			{name: '创建时间', width: 338, thname: 'cjsj'},
			{name: '操作', width: 209, thname: 'operate'},
		],
		permissionParent4Add: {id: "", flzj: "", cdmc: "", cdms: "", cdlx: "", cjsj: "", isdel: ""},
		permission4Add: {id: "", flzj: "", cdmc: "", cdms: "", cdlx: "", cjsj: "", isdel: ""},
		pagination: {},
		keyword: "",
		isEditShow: false,
		isLoading: false,
		editTitle: "",
		parentEditTitle: "",
		flzj: "",
		size: 10
	};
	
	var vue = new Vue({
		el: "#app",
		data: data4Vue,
		mounted: function() {
			this.listParentPermission();
			$("[data-toggle='tooltip']").tooltip();
		},
		methods: {
			saveParent() {
				var _this = this;
				if (!_this.permissionParent4Add.cdmc || !_this.permissionParent4Add.cdms) {
					myzui._error("必填参数不能为空");
					return;
				}
				var url = "permissions";
				if (_this.permissionParent4Add.id == "") { //add
					_this.permissionParent4Add.flzj = _this.permissionParent4Add.id;
					_this.permissionParent4Add.cdlx = "0";
					axios.post(url, this.permissionParent4Add).then(function(res) {
						if (res.data.code == 0) {
							_this.listParentPermission();
							_this.permissionParent4Add = {id: "", flzj: "", cdmc: "", cdms: "", cdlx: "", cjsj: "", isdel: ""};
							myzui._success(res.data.msg);
							$("#parentEditModal").modal("hide");
						} else {
							myzui._error(res.data.msg);
						}
					});
				} else { //update
					axios.put(url, this.permissionParent4Add).then(function(res) {
						_this.listParentPermission();
						_this.permissionParent4Add = {id: "", flzj: "", cdmc: "", cdms: "", cdlx: "", cjsj: "", isdel: ""};
						myzui._success(res.data);
						$("#parentEditModal").modal("hide");
					});
				}
			},
			save: function() {
				var _this = this;
				if (!_this.permission4Add.cdmc || !_this.permission4Add.cdms) {
					myzui._error("必填参数不能为空");
					return;
				}
				var url = "permissions";
				this.permission4Add.flzj = _this.flzj;
				this.permission4Add.cdlx = "1";
				if (_this.permission4Add.id == "") { //add
					axios.post(url, this.permission4Add).then(function(res) {
						if (res.data.code == 0) {
							_this.list(1);
							_this.permission4Add = {id: "", flzj: "", cdmc: "", cdms: "", cdlx: "", cjsj: "", isdel: ""};
							myzui._success(res.data.msg);
							_this.isEditShow = false;
						} else {
							myzui._error(res.data.msg);
						}
					});
				} else { //update
					axios.put(url, this.permission4Add).then(function(res) {
						_this.list(1);
						_this.permission4Add = {id: "", flzj: "", cdmc: "", cdms: "", cdlx: "", cjsj: "", isdel: ""};
						myzui._success(res.data);
						_this.isEditShow = false;
					});
				}
			},
			cancel: function() {
				this.isEditShow = false;
			},
			addEdit: function() {
				this.isEditShow = true;
				this.editTitle = "新增子菜单";
				this.permission4Add = {id: "", flzj: "", cdmc: "", cdms: "", cdlx: "", cjsj: "", isdel: ""};
			},
			addEditParent: function() {
				$("#parentEditModal").modal({
					show: true
				});
				this.parentEditTitle = "新增父菜单";
				this.permissionParent4Add = {id: "", flzj: "", cdmc: "", cdms: "", cdlx: "", cjsj: "", isdel: ""};
			},
			updateEditParent: function() {
				this.permissionParent4Add.id = this.parentPermission.id;
				this.permissionParent4Add.flzj = this.parentPermission.flzj;
				this.permissionParent4Add.cdmc = this.parentPermission.cdmc;
				this.permissionParent4Add.cdms = this.parentPermission.cdms;
				this.permissionParent4Add.cdlx = this.parentPermission.cdlx;
				this.permissionParent4Add.cjsj = this.parentPermission.cjsj;
				this.permissionParent4Add.isdel = this.parentPermission.isdel;
				$("#parentEditModal").modal({
					show: true
				});
				this.parentEditTitle = "修改父菜单";
			},
			updateEdit: function(permission) {
				this.isEditShow = true;
				this.editTitle = "修改子菜单";
				this.permission4Add.id = permission.id;
				this.permission4Add.flzj = permission.flzj;
				this.permission4Add.cdmc = permission.cdmc;
				this.permission4Add.cdms = permission.cdms;
				this.permission4Add.cdlx = permission.cdlx;
				this.permission4Add.cjsj = permission.cjsj;
				this.permission4Add.isdel = permission.isdel;
			},
			listParentPermission: function() {
				var url = "parentPermissions";
				var _this = this;
				axios.get(url).then(function(res) {
					_this.parentPermissions = res.data;
					_this.flzj = _this.parentPermissions[0].id;
					_this.parentPermission = _this.parentPermissions[0];
					_this.active = _this.parentPermissions[0];
					_this.list(1);
				});
			},
			parentClick: function(p, $index) {
				this.active = p;
				this.parentPermission = p;
				this.flzj = p.id;
				this.list(1);
			},
			list: function(start) {
				var _this = this;
				_this.isLoading = true;
				var url = "permissions?start=" + start + "&keyword=" + _this.keyword + "&flzj=" + _this.flzj + "&size=" + _this.size;
				axios.get(url).then(function(res) {
					_this.pagination = res.data;
					_this.itemList = res.data.list;
					_this.isLoading = false;
				});
			},
			deletePermissionParent: function() {
				var id = this.parentPermission.id;
				var _this = this;
				myzui.confirm("确认删除?", function() {
					var url = "permissions/" + id;
					axios.delete(url).then(function(res) {
						_this.listParentPermission();
					});
				});
			},
			deleteItem: function(id) {
				var _this = this;
				myzui.confirm("确认删除?", function() {
					var url = "permissions/" + id;
					axios.delete(url).then(function(res) {
						_this.list(1);
					});
				});
			},
			reset: function() {
				var _this = this;
				$("#keyword").val("");
				_this.keyword = $("#keyword").val();
				_this.list(1);
			},
			search: function() {
				var _this = this;
				_this.keyword = $("#keyword").val();
				if (_this.keyword) {
					_this.list(1);
				}
			}
		}
	});
});