function menuInitialize(){
	$('#float-close').click(function(){
		menu_close("float-news","float-open");
		return false;
	});
	$('#open-btn').click(function(){
		menu_open("float-open","float-news");
		return false;
	});
}

function menu_open(id0,id1){
//关闭id0 打开id1
	$('#'+id0).animate({
		left: '-900px'
	}, 100, function(){
		$('#'+id1).delay(50).animate({
			left: '0px'
		}, 300);
	});
}

function menu_close(id0,id1){
//关闭id0 打开id1
	$('#'+id0).animate({
	left: '-900px'
	}, 300, function(){
		$('#'+id1).delay(50).animate({
			left: '-2px'
		}, 300);
	});
}