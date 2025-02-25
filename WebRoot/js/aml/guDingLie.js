//表中固定列不随滑动框移动的JS
		$('.scroll').scroll(function(){
			var left = $('.scroll').scrollLeft();
			var header_trs = $("#simple-table thead tr");
			header_trs.each(function(){
				$(this).children().eq(0).css({
					'position':'relative',
					'top':'0px',
					'left':left,
					'background-color':'#1693f1'
				});
			});
			header_trs.each(function(){
				$(this).children().eq(1).css({
					'position':'relative',
					'top':'0px',
					'left':left,
					'background-color':'#1693f1'
				});
			});

			var trs = $("#simple-table tbody tr");
			trs.each(function(){
				$(this).children().eq(0).css({
					'position':'relative',
					'top':'0px',
					'left':left,
					'background-color':'#FFFFFF'
				});
			});
			trs.each(function(){
				$(this).children().eq(1).css({
					'position':'relative',
					'top':'0px',
					'left':left,
					'background-color':'#FFFFFF'
				});
			});
		});