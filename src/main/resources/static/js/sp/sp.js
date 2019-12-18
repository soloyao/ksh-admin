$(function() {
		var data4Vue = {
			itemList: [],
			sp4Add: {tid: "", mc: "", dz: "", bh: "", lx: "", shape: "", createtime: "", isdel: "", zzjgdm: "", zzjgmc: "", qydm: ""},
			pagination: {},
			keyword: "",
			isEditShow: false,
			isLoading: false,
			editTitle: "",
			size: 15,
			map: null,
			mouseTool: null,
			marker: null,
			activeItem: null,
			zzjgdm: ""
		};
		
		var vue = new Vue({
			el: "#app",
			data: data4Vue,
			mounted: function() {
				$("[data-toggle='tooltip']").tooltip();
				this.list(1);
				this.map = new AMap.Map("mapContainer", {
					zoom: 16
				});
				this.mouseTool = new AMap.MouseTool(this.map);
				this.listPcsTree();
			},
			methods: {
				listPcsTree() {
					var url = "listPcsTree";
					axios.get(url).then(function(res) {
						if (res.data.code == 0) {
							new $.tree("keyword-zzjgmc", res.data.data);
							$("#keyword-zzjgmc").data("id", "");
							new $.tree("zzjgmc", res.data.data);
						}
					});
				},
				addLocation: function() {
					if (this.marker) {
						this.map.remove(this.marker);
						this.marker = null;
					}
					this.map.setDefaultCursor("crosshair");
					this.mouseTool.marker();
					var _this = this;
					AMap.event.addListenerOnce(this.mouseTool, 'draw', function(obj) {
						_this.mouseTool.close(false);
						_this.marker = obj.obj;
						_this.sp4Add.shape = _this.marker.getPosition().toString();
						_this.map.setDefaultCursor();
					});
				},
				save: function() {
					var _this = this;
					if (!_this.sp4Add.mc || !$("#zzjgmc").val() || !$("#zzjgmc").data("id") || !_this.sp4Add.shape) {
						myzui._error("必填参数不能为空");
						return;
					}
					var url = "sps";
					_this.sp4Add.zzjgdm = $("#zzjgmc").data("id");
					_this.sp4Add.zzjgmc = $("#zzjgmc").val();
					console.log(_this.sp4Add);
					if (_this.sp4Add.tid == "") { //add
						_this.sp4Add.x = _this.sp4Add.shape.split(",")[0];
						_this.sp4Add.y = _this.sp4Add.shape.split(",")[1];
						axios.post(url, this.sp4Add).then(function(res) {
							myzui._success(res.data);
							_this.list(1);
							_this.sp4Add = {tid: "", mc: "", dz: "", bh: "", lx: "", shape: "", createtime: "", isdel: "", zzjgdm: "", zzjgmc: "", qydm: ""};
							_this.isEditShow = false;
							if (_this.marker) {
								_this.map.remove(_this.marker);
							}
						});
					} else { //update
						_this.sp4Add.x = _this.sp4Add.shape.split(",")[0];
						_this.sp4Add.y = _this.sp4Add.shape.split(",")[1];
						axios.put(url, _this.sp4Add).then(function(res) {
							myzui._success(res.data);
							_this.list(1);
							_this.sp4Add = {tid: "", mc: "", dz: "", bh: "", lx: "", shape: "", createtime: "", isdel: "", zzjgdm: "", zzjgmc: "", qydm: ""};
							_this.isEditShow = false;
							if (_this.marker) {
								_this.map.remove(_this.marker);
							}
						});
					}
				},
				cancel: function() {
					var _this = this;
					_this.activeItem = null;
					this.isEditShow = false;
					this.mouseTool.close(true);
					this.map.setDefaultCursor();
					if (this.marker) {
						_this.map.remove(_this.marker);
					}
				},
				addEdit: function() {
					this.isEditShow = true;
					this.activeItem = null;
					this.editTitle = "新建";
					$("#zzjgmc").data("id", "");
					$("#zzjgmc").val("");
					this.sp4Add= {tid: "", mc: "", dz: "", bh: "", lx: "", shape: "", createtime: "", isdel: "", zzjgdm: "", zzjgmc: "", qydm: ""};
					if (this.marker) {
						this.map.remove(this.marker);
					}
				},
				updateEdit: function(sp) {
					var _this = this;
					_this.activeItem = sp;
					this.isEditShow = true;
					this.editTitle = "修改";
					this.sp4Add.tid = sp.tid;
					this.sp4Add.mc = sp.mc;
					this.sp4Add.dz = sp.dz;
					this.sp4Add.bh = sp.bh;
					this.sp4Add.lx = sp.lx;
					this.sp4Add.shape = sp.shape;
					this.sp4Add.createtime = sp.createtime;
					this.sp4Add.isdel = sp.isdel;
					$("#zzjgmc").data("id", sp.zzjgdm);
					$("#zzjgmc").val(sp.zzjgmc);
					this.sp4Add.qydm = sp.qydm;
					if (this.marker) {
						_this.map.remove(_this.marker);
					}
					this.marker = new AMap.Marker({
						position: sp.shape.split(",")
					});
					this.map.add(this.marker);
					this.map.setZoomAndCenter(18, sp.shape.split(","));
				},
				list: function(start) {
					var _this = this;
					_this.isLoading = true;
					var url = "sps?start=" + start + "&keyword=" + _this.keyword + "&size=" + _this.size + "&zzjgdm=" + _this.zzjgdm;
					axios.get(url).then(function(res) {
						_this.pagination = res.data;
						_this.itemList = res.data.list;
						_this.isLoading = false;
					});
				},
				deleteItem: function(item) {
					var _this = this;
					_this.cancel();
					myzui.confirm("确认删除" + item.mc + "？", function() {
						var url = "sps/" + item.tid;
						axios.delete(url).then(function(res) {
							myzui._success(res.data);
							_this.list(1);
						});
					});
				},
				reset: function() {
					var _this = this;
					_this.cancel();
					$("#keyword").val("");
					_this.keyword = "";
					$("#keyword-zzjgmc").val("");
					$("#keyword-zzjgmc").data("id", "");
					_this.zzjgdm = "";
					_this.list(1);
				},
				search: function() {
					if (!$("#keyword").val() && !$("#keyword-zzjgmc").val()) {
						myzui._error("关键词或单位不能为空");
						return;
					}
					var _this = this;
					_this.cancel();
					_this.keyword = $("#keyword").val();
					_this.zzjgdm = $("#keyword-zzjgmc").data("id");
					_this.list(1);
				}
			}
		});
});