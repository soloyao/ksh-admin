$(function() {
	var zTreeObjDljg;
	var settingDljg = {
		view: {
			selectedMulti: true
		},
		check: {
			enable: true,
			chkStyle: "radio",
			radioType: "all"
		},
		data: {
			simpleData: {
				enable: true,
				idKey: "id",
				pIdKey: "pid",
				rootPId: 0
			},
			key: {
				url: "xUrl"
			}
		},
		callback: {
			beforeClick: function() {
				return false;
			},
			onClick: function(e, treeId, treeNode, clickFlag) {
				return false;
			}
		}
	};
	var zTreeNodesDljg = [];
	
	var zTreeObjZzjg;
	var settingZzjg = {
		view: {
			selectedMulti: false
		},
		data: {
			simpleData: {
				enable: true,
				idKey: "id",
				pIdKey: "pid",
				rootPId: 0
			},
			key: {
				url: "xUrl"
			}
		},
		callback: {
			onClick: function(e, treeId, treeNode, clickFlag) {
				vue.zzjgdm = treeNode.id;
				vue.list(1);
			}
		}
	};
	var zTreeNodesZzjg = [];
	
	var zTreeObj;
	var setting = {
		data: {
			key: {
				name: "jsmc"
			}
		},
		check: {
			enable: true,
			chkStyle: "radio"
		},
		view: {
			selectedMulti: false
		},
		callback: {
			onClick: function(e, treeId, treeNode, clickFlag) {
				zTreeObj.checkNode(treeNode, !treeNode.checked, true);
			}
		}
	};
	var zTreeNodes = [];
	
	var zTreeObjBatch;
	var settingBatch = {
		data: {
			key: {
				name: "jsmc"
			}
		},
		check: {
			enable: true,
			chkStyle: "radio"
		},
		view: {
			selectedMulti: false
		},
		callback: {
			onClick: function(e, treeId, treeNode, clickFlag) {
				zTreeObjBatch.checkNode(treeNode, !treeNode.checked, true);
			}
		}
	};
	var zTreeNodesBatch = [];
	
	var data4Vue = {
		roles: [],
		users: [],
		user4Add: {id: "", yhzh: "", yhmm: "", yhxm: "", jybh: "", jylx: "", zw: "", yhxb: "", sjhm: "", cjsj: "", isdel: "",zzjgdm: "", zzjgmc: "", qydm: "", dljgid: "", dljgname: "", roles: []},
		pagination: {},
		keyword: "",
		isEditShow: false,
		isLoading: false,
		isZzjgLoading: false,
		editTitle: "",
		size: 10,
		checkboxAllFlag: false,
		zzjgdm: ""
	};
	
	var vue = new Vue({
		el: "#app",
		data: data4Vue,
		mounted: function() {
			this.list(1);
			this.listRoles();
			this.listPcsTree();
			$("[data-toggle='tooltip']").tooltip();
		},
		methods: {
			listPcsTree() {
				var _this = this;
				_this.isZzjgLoading = true;
				var url = "listPcsTree";
				axios.get(url).then(function(res) {
					if (res.data.code == 0) {
						zTreeNodesDljg = res.data.data;
						zTreeObjDljg = $.fn.zTree.init($("#treeDljg"), settingDljg, zTreeNodesDljg);
//						zTreeObjDljg.expandAll(true);
						zTreeObjDljg.expandNode(zTreeObjDljg.getNodeByParam("id", "440000000000", null), true);
						zTreeNodesZzjg = res.data.data;
						zTreeObjZzjg = $.fn.zTree.init($("#treeZzjg"), settingZzjg, zTreeNodesZzjg);
						zTreeObjZzjg.expandNode(zTreeObjZzjg.getNodeByParam("id", "440000000000", null), true);
						_this.isZzjgLoading = false;
						new $.tree("zzjgmc", res.data.data);
						new $.tree("dljg", res.data.data);
					}
				});
			},
			cancelTreeZzjg() {
				if (!this.zzjgdm) return;
				this.zzjgdm = "";
				zTreeObjZzjg.cancelSelectedNode();
				this.list(1);
			},
			list: function(start) {
				var _this = this;
				_this.isLoading = true;
				var url = "users?start=" + start + "&keyword=" + _this.keyword + "&size=" + _this.size + "&zzjgdm=" + _this.zzjgdm;
				axios.get(url).then(function(res) {
					_this.pagination = res.data;
					_this.users = res.data.list;
					_this.isLoading = false;
				});
			},
			checkboxAll: function() {
				if (!this.checkboxAllFlag) {
					$(".checkbox-parent").addClass("checked");
					$(".checkbox-children").addClass("checked");
					this.checkboxAllFlag = true;
				} else {
					$(".checkbox-parent").removeClass("checked");
					$(".checkbox-children").removeClass("checked");
					this.checkboxAllFlag = false;
				}
			},
			checkbox: function(e) {
				var el = e.target;
				$(el).parent(".checkbox-primary").toggleClass("checked");
				var allFlag = true;
				$(".checkbox-children").map(function(item, ele) {
					if (!$(ele).hasClass("checked")) {
						allFlag = false;
					}
				});
				if (allFlag) {
					$(".checkbox-parent").addClass("checked");
				} else {
					$(".checkbox-parent").removeClass("checked");
				}
			},
			listRoles: function() {
				var _this = this;
				var url = "listRoles"
				axios.get(url).then(function(res) {
					_this.roles = res.data;
					zTreeNodesBatch = res.data;
					zTreeNodes = res.data;
					zTreeObjBatch = $.fn.zTree.init($("#treeBatch"), settingBatch, zTreeNodesBatch);
					zTreeObjBatch.checkNode(zTreeObjBatch.getNodeByParam("jsmc", "默认潮州警员角色", null), true ,false);
					zTreeObj = $.fn.zTree.init($("#tree"), setting, zTreeNodes);
					zTreeObjBatch.expandAll(true);
					zTreeObj.expandAll(true);
				});
			},
			saveBatchDljg() {
				var _this = this;
				var nodes = zTreeObjDljg.transformToArray(zTreeObjDljg.getNodes());
				var dljgId = "";
				var dljgName = "";
				for (var i = 0, l = nodes.length; i < l; i++) {
					if (nodes[i].checked) {
						dljgId = nodes[i].id;
						dljgName = nodes[i].name;
						break;
					}
				}
				var userIds = $("tbody .checked").map(function(item, ele) {
					return $(ele).data("id");
				}).get().join(",");
				if (!userIds) {
					myzui._error("所选用户不能为空");
					return;
				}
				if (!dljgId && !dljgName) {
					myzui.confirm("该操作将会去除用所选用户的代理机构，确认继续？", function() {
						axios.post("dljgBatch", {userIds: userIds, dljgId: dljgId, dljgName: dljgName}).then(function(res) {
							myzui._success("代理机构分配成功");
							
							var node = zTreeObjDljg.getNodes();
							var nodes = zTreeObjDljg.transformToArray(node);
							for (var i = 0; i < nodes.length; i++) {
								if (nodes[i].checked) {
									zTreeObjDljg.checkNode(nodes[i], false, false);
									break;
								}
							}
							
							_this.list(1);
							_this.checkboxAllFlag = true;
							_this.checkboxAll();
						});
					});
					return;
				}
				axios.post("dljgBatch", {userIds: userIds, dljgId: dljgId, dljgName: dljgName}).then(function(res) {
					myzui._success("代理机构分配成功");
					
					var node = zTreeObjDljg.getNodes();
					var nodes = zTreeObjDljg.transformToArray(node);
					for (var i = 0; i < nodes.length; i++) {
						if (nodes[i].checked) {
							zTreeObjDljg.checkNode(nodes[i], false, false);
							break;
						}
					}
					
					_this.list(1);
					_this.checkboxAllFlag = true;
					_this.checkboxAll();
				});
			},
			saveBatch() {
				var _this = this;
				var nodes = zTreeObjBatch.transformToArray(zTreeObjBatch.getNodes());
				var arr = [];
				for (var i = 0, l = nodes.length; i < l; i++) {
					if(nodes[i].checked && nodes[i].id != "pid"){
						arr.push(nodes[i].id);
					}
				}
				var roleIds = arr.join(",");
				var userIds = $("tbody .checked").map(function(item, ele) {
					return $(ele).data("id");
				}).get().join(",");
				if (!userIds || !roleIds) {
					myzui._error("所选用户或角色不能为空");
					return;
				}
				axios.post("usersBatch", {userIds: userIds, roleIds: roleIds}).then(function(res) {
					myzui._success("角色分配成功");
					zTreeObjBatch.checkNode(zTreeObjBatch.getNodeByParam("jsmc", "默认警员角色", null), true ,false);
					_this.list(1);
					_this.checkboxAllFlag = true;
					_this.checkboxAll();
				});
			},
			save: function() {
				var _this = this;
				if (!this.user4Add.yhzh || !this.user4Add.yhmm || !this.user4Add.yhxm || !$("#zzjgmc").data("id") || !$("#zzjgmc").val()) {
					myzui._error("必填参数不能为空");
					return;
				}
				if (zTreeObj.getCheckedNodes(true).length == 0) {
					myzui._error("请给用户分配一个角色");
					return;
				}
				var url = "users";
				_this.user4Add.zzjgdm = $("#zzjgmc").data("id");
				_this.user4Add.zzjgmc = $("#zzjgmc").val();
				_this.user4Add.dljgid = $("#dljg").data("id");
				_this.user4Add.dljgname = $("#dljg").val();
				_this.user4Add.roles = [];
				zTreeObj.getCheckedNodes(true).map(function(item) {
					_this.user4Add.roles.push({id: item.id});
				});
				if (_this.user4Add.id == 0) { //add
					axios.post(url, _this.user4Add).then(function(res) {
						if (res.data.code == 0) {
							_this.list(1);
							_this.user4Add = {id: "", yhzh: "", yhmm: "", yhxm: "", jybh: "", jylx: "", zw: "", yhxb: "", sjhm: "", cjsj: "", isdel: "",zzjgdm: "", zzjgmc: "", qydm: "", dljgid: "", dljgname: "", roles: []};
							myzui._success(res.data.msg);
							_this.isEditShow = false;
						} else {
							myzui._error(res.data.msg);
						}
					});
				} else { //update
					axios.put(url, _this.user4Add).then(function(res) {
						_this.list(1);
						_this.user4Add = {id: "", yhzh: "", yhmm: "", yhxm: "", jybh: "", jylx: "", zw: "", yhxb: "", sjhm: "", cjsj: "", isdel: "",zzjgdm: "", zzjgmc: "", qydm: "", dljgid: "", dljgname: "", roles: []};
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
				this.editTitle = "新增";
				$("#zzjgmc").data("id", "");
				$("#zzjgmc").val("");
				this.user4Add = {id: "", yhzh: "", yhmm: "", yhxm: "", jybh: "", jylx: "", zw: "", yhxb: "", sjhm: "", cjsj: "", isdel: "",zzjgdm: "", zzjgmc: "", qydm: "", dljgid: "", dljgname: "", roles: []};
				zTreeObj.checkNode(zTreeObj.getNodeByParam("jsmc", "默认警员角色", null), true ,false);
			},
			updateEdit: function(user) {
				console.log(user);
				this.isEditShow = true;
				this.editTitle = "修改";
				this.user4Add.id = user.id;
				this.user4Add.yhzh = user.yhzh;
				this.user4Add.yhmm = user.yhmm;
				this.user4Add.yhxm = user.yhxm;
				this.user4Add.jybh = user.jybh;
				this.user4Add.jylx = user.jylx;
				this.user4Add.zw = user.zw?user.zw:"";
				this.user4Add.yhxb = user.yhxb;
				this.user4Add.sjhm = user.sjhm;
				this.user4Add.cjsj = user.cjsj;
				this.user4Add.isdel = user.isdel;
				$("#zzjgmc").data("id", user.zzjgdm);
				$("#zzjgmc").val(user.zzjgmc);
				$("#dljg").data("id", user.dljgid);
				$("#dljg").val(user.dljgname);
				this.user4Add.qydm = user.qydm;
				zTreeObj.checkNode(zTreeObj.getNodeByParam("id", user.roles.length > 0 ? user.roles[0].id : 0, null), true, false);
			},
			add: function() {
				var _this = this;
				var url = "users";
				if (!this.user4Add.yhzh || !this.user4Add.yhmm || !this.user4Add.yhxm || !this.user4Add.zzjgdm || !this.user4Add.zzjgmc) {
					myzui._error("必填参数不能为空");
					return;
				}
				axios.post(url, this.user4Add).then(function(res) {
					if (res.data.code == 0) {
						_this.list(1);
						_this.user4Add = {id: "", yhzh: "", yhmm: "", yhxm: "", jybh: "", jylx: "", zw: "", yhxb: "", sjhm: "", cjsj: "", isdel: "",zzjgdm: "", zzjgmc: "", qydm: "", dljgid: "", dljgname: "", roles: []};
						myzui._success(res.data.msg);
					} else {
						myzui._error(res.data.msg);
					}
				});
			},
			deleteUser: function(id) {
				var _this = this;
				myzui.confirm("确认删除？", function() {
					var url = "users/" + id;
					axios.delete(url).then(function(res) {
						myzui._success(res.data);
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