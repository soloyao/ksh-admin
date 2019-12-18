$(function() {
		var data4Vue = {
			itemList: [],
			yy4Add: {tid: "", mc: "", dz: "", bh: "", lxdh: "", fzr: "", shape: "", createtime: "", isdel: "", zzjgdm: "", zzjgmc: "", qydm: ""},
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
						_this.yy4Add.shape = _this.marker.getPosition().toString();
						_this.map.setDefaultCursor();
					});
				},
				save: function() {
					var _this = this;
					if (!_this.yy4Add.mc || !$("#zzjgmc").val() || !$("#zzjgmc").data("id") || !_this.yy4Add.shape) {
						myzui._error("必填参数不能为空");
						return;
					}
					var url = "yys";
					_this.yy4Add.zzjgdm = $("#zzjgmc").data("id");
					_this.yy4Add.zzjgmc = $("#zzjgmc").val();
					if (_this.yy4Add.tid == "") { //add
						_this.yy4Add.x = _this.yy4Add.shape.split(",")[0];
						_this.yy4Add.y = _this.yy4Add.shape.split(",")[1];
						axios.post(url, this.yy4Add).then(function(res) {
							myzui._success(res.data);
							_this.list(1);
							_this.yy4Add = {tid: "", mc: "", dz: "", bh: "", lxdh: "", fzr: "", shape: "", createtime: "", isdel: "", zzjgdm: "", zzjgmc: "", qydm: ""};
							_this.isEditShow = false;
							if (_this.marker) {
								_this.map.remove(_this.marker);
							}
						});
					} else { //update
						_this.yy4Add.x = _this.yy4Add.shape.split(",")[0];
						_this.yy4Add.y = _this.yy4Add.shape.split(",")[1];
						axios.put(url, _this.yy4Add).then(function(res) {
							myzui._success(res.data);
							_this.list(1);
							_this.yy4Add = {tid: "", mc: "", dz: "", bh: "", lxdh: "", fzr: "", shape: "", createtime: "", isdel: "", zzjgdm: "", zzjgmc: "", qydm: ""};
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
					this.yy4Add= {tid: "", mc: "", dz: "", bh: "", lxdh: "", fzr: "", shape: "", createtime: "", isdel: "", zzjgdm: "", zzjgmc: "", qydm: ""};
					if (this.marker) {
						this.map.remove(this.marker);
					}
				},
				updateEdit: function(yy) {
					var _this = this;
					_this.activeItem = yy;
					this.isEditShow = true;
					this.editTitle = "修改";
					this.yy4Add.tid = yy.tid;
					this.yy4Add.mc = yy.mc;
					this.yy4Add.dz = yy.dz;
					this.yy4Add.bh = yy.bh;
					this.yy4Add.lxdh = yy.lxdh;
					this.yy4Add.fzr = yy.fzr;
					this.yy4Add.shape = yy.shape;
					this.yy4Add.createtime = yy.createtime;
					this.yy4Add.isdel = yy.isdel;
					$("#zzjgmc").data("id", yy.zzjgdm);
					$("#zzjgmc").val(yy.zzjgmc);
					this.yy4Add.qydm = yy.qydm;
					if (this.marker) {
						_this.map.remove(_this.marker);
					}
					this.marker = new AMap.Marker({
						position: yy.shape.split(",")
					});
					this.map.add(this.marker);
					this.map.setZoomAndCenter(18, yy.shape.split(","));
				},
				list: function(start) {
					var _this = this;
					_this.isLoading = true;
					var url = "yys?start=" + start + "&keyword=" + _this.keyword + "&size=" + _this.size + "&zzjgdm=" + _this.zzjgdm;
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
						var url = "yys/" + item.tid;
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