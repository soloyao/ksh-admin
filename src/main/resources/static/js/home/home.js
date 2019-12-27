$(function() {
		var data4Vue = {
			itemList: [],
			listThs: [
				{name: '系统名称', width: 242, thname: 'appName'},
				{name: '操作界面', width: 242, thname: 'funs'},
				{name: '功能名称', width: 242, thname: 'name'},
				{name: '操作人员', width: 242, thname: 'userName'},
				{name: 'IP', width: 103, thname: 'ip'},
				{name: '操作类型', width: 103, thname: 'type'},
				{name: '操作时间', width: 242, thname: 'createtime'}
			],
			pagination: {},
			isLoading: false,
			keyword: "",
			size: 15
		};
		
		var vue = new Vue({
			el: "#app",
			data: data4Vue,
			mounted: function() {
				this.list(1);
			},
			methods: {
				list: function(start) {
					var _this = this;
					_this.isLoading = true;
					var url = "systemLogs?start=" + start + "&keyword=" + _this.keyword + "&size=" + _this.size;
					axios.get(url).then(function(res) {
						_this.pagination = res.data;
						res.data.list.map(function(item) {
							switch (item.type) {
							case "query":
								item.type = "查询";
								break;
							case "update":
								item.type = "修改";
								break;
							case "delete":
								item.type = "删除";
								break;
							case "insert":
								item.type = "新增";
								break;
							default:
								break;
							}
						});
						_this.itemList = res.data.list;
						_this.isLoading = false;
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