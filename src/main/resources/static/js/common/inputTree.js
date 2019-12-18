;(function($){
    tree.prototype.showMenu = function () {
    	if(this.isShow){
    		this.hideMenu()
    		return false
    	}
    	var _this = this
        var obj = this.domObj;
        var offset = this.domObj.offset();
        this.domMenuObj.css({left:offset.left + "px", top:offset.top + obj.outerHeight() + "px"}).slideDown("fast");
        if(!this.isShow){
        	$("body").on("mousedown", function(event){
	        	_this.onBodyDown(event)
	        });	
        }
        this.isShow = true
    }
    tree.prototype.hideMenu = function () {
    	this.isShow = false
        this.domMenuObj.fadeOut("fast");
        $("body").off("mousedown");
    }
    tree.prototype.onBodyDown = function (event) {
        if (!(event.target.id == this.domId || event.target.id == this.domMenuId || $(event.target).parents('#'+ this.domMenuId).length>0)) {
            this.hideMenu();
        }
    }
    tree.prototype.zNodes =[];

    tree.prototype.init = function () {
    	var _this = this
    	function onClick(e, treeId, treeNode) {
	        var v = treeNode.name
	        _this.domObj.val(v);
	        _this.domObj.data('id', treeNode.id)
	    }
	    var setting = {
	        view: {
	            dblClickExpand: false
	        },
	        data: {
	            simpleData: {
	                enable: true,
	                idKey: "id",
	                pIdKey: "pid",
	                rootPId: 0
	            }
	        },
	        callback: {
	            onClick: onClick,
	        }
	    }

	    var zTreeObj = $.fn.zTree.init(this.domTreeObj, setting, this.zNodes);
	    zTreeObj.expandNode(zTreeObj.getNodeByParam("id", "440000000000", null), true);
        this.domObj.on('click', function(){
        	_this.showMenu()
        })
    }

    function tree(domId, zNodes){
    	this.zNodes = zNodes
    	this.domId = domId
    	this.domMenuId = domId +'Menu'
    	this.domTreeId = domId +'Tree'
    	this.domObj = $('#'+ this.domId)
        var width = this.domObj.innerWidth()
    	$('#app').append('<div class="menuContent" id="'+ this.domMenuId +'"><ul id="'+ this.domTreeId +'" class="ztree" style="width:'+ width +'px"></ul></div>')
    	this.domMenuObj = $('#'+ this.domMenuId)
    	this.domTreeObj = $('#'+ this.domTreeId)
    	this.init()
    }

    $.tree = tree
})(jQuery);