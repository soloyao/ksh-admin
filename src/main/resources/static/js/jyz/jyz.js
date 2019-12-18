$(function() {
		var data4Vue = {
			itemList: [],
			jyz4Add: {tid: "", mc: "", dz: "", bh: "", lxdh: "", fzr: "", shape: "", createtime: "", isdel: "", zzjgdm: "", zzjgmc: "", qydm: ""},
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
						_this.jyz4Add.shape = _this.marker.getPosition().toString();
						_this.map.setDefaultCursor();
					});
				},
				save: function() {
					var _this = this;
					if (!_this.jyz4Add.mc || !$("#zzjgmc").val() || !$("#zzjgmc").data("id") || !_this.jyz4Add.shape) {
						myzui._error("必填参数不能为空");
						return;
					}
					var url = "jyzs";
					_this.jyz4Add.zzjgdm = $("#zzjgmc").data("id");
					_this.jyz4Add.zzjgmc = $("#zzjgmc").val();
					if (_this.jyz4Add.tid == "") { //add
						_this.jyz4Add.x = _this.jyz4Add.shape.split(",")[0];
						_this.jyz4Add.y = _this.jyz4Add.shape.split(",")[1];
						axios.post(url, this.jyz4Add).then(function(res) {
							myzui._success(res.data);
							_this.list(1);
							_this.jyz4Add = {tid: "", mc: "", dz: "", bh: "", lxdh: "", fzr: "", shape: "", createtime: "", isdel: "", zzjgdm: "", zzjgmc: "", qydm: ""};
							_this.isEditShow = false;
							if (_this.marker) {
								_this.map.remove(_this.marker);
							}
						});
					} else { //update
						_this.jyz4Add.x = _this.jyz4Add.shape.split(",")[0];
						_this.jyz4Add.y = _this.jyz4Add.shape.split(",")[1];
						axios.put(url, _this.jyz4Add).then(function(res) {
							myzui._success(res.data);
							_this.list(1);
							_this.jyz4Add = {tid: "", mc: "", dz: "", bh: "", lxdh: "", fzr: "", shape: "", createtime: "", isdel: "", zzjgdm: "", zzjgmc: "", qydm: ""};
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
					this.jyz4Add= {tid: "", mc: "", dz: "", bh: "", lxdh: "", fzr: "", shape: "", createtime: "", isdel: "", zzjgdm: "", zzjgmc: "", qydm: ""};
					if (this.marker) {
						this.map.remove(this.marker);
					}
				},
				updateEdit: function(jyz) {
					var _this = this;
					_this.activeItem = jyz;
					this.isEditShow = true;
					this.editTitle = "修改";
					this.jyz4Add.tid = jyz.tid;
					this.jyz4Add.mc = jyz.mc;
					this.jyz4Add.dz = jyz.dz;
					this.jyz4Add.bh = jyz.bh;
					this.jyz4Add.lxdh = jyz.lxdh;
					this.jyz4Add.fzr = jyz.fzr;
					this.jyz4Add.shape = jyz.shape;
					this.jyz4Add.createtime = jyz.createtime;
					this.jyz4Add.isdel = jyz.isdel;
					$("#zzjgmc").data("id", jyz.zzjgdm);
					$("#zzjgmc").val(jyz.zzjgmc);
					this.jyz4Add.qydm = jyz.qydm;
					if (this.marker) {
						_this.map.remove(_this.marker);
					}
					this.marker = new AMap.Marker({
						position: jyz.shape.split(",")
					});
					this.map.add(this.marker);
					this.map.setZoomAndCenter(18, jyz.shape.split(","));
				},
				list: function(start) {
					var _this = this;
					_this.isLoading = true;
					var url = "jyzs?start=" + start + "&keyword=" + _this.keyword + "&size=" + _this.size + "&zzjgdm=" + _this.zzjgdm;
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
						var url = "jyzs/" + item.tid;
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