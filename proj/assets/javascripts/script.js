var userId;

function renderFromServer(email) {
	$.ajax({
		url: 'http://localhost:3030/fetch_layout',
		type: 'POST',
		dataType: 'html',
		async: false,
		data: {
			email: email
		}
	})
	.success(function(response, status, jqXHR) {
		var reply = JSON.parse(response);
		var dashboardId = reply.user.currentDash;
		var parentId = reply.parent ? reply.parent.parentId : 0;
		var pageTitle = reply.parent ? reply.parent.dataTitle : 'My Dashboard';
		userId = reply.user.userId;

		// render back button
		if(dashboardId !== 0) {
			$('.backButton').text('Back').attr({'onClick': 'changeDashboard(' + parentId + ')'});
		}

		// append saved layout
		$('.gridster').append(reply.user.layout);

		// render page title
		$('h1.header').text(pageTitle);

		// render activated widgets and links for deactivated widgets
		reply.widgets.forEach(function(line) {
			if(line.activated) {
				var widgetOuter = $(document.createElement('li'))
					.attr({'data-row': line.dataRow})
					.attr({'data-col': line.dataCol})
					.attr({'data-sizex': line.dataSizex})
					.attr({'data-sizey': line.dataSizey});

				if(line.isParent) {
					var link = 'changeDashboard(' + line.widgetId + ')';
					var widgetOpener = $(document.createElement('div'))
						.attr({'class': 'entrance'})
						.attr({'onClick': link});
					widgetOpener.text('I');
					widgetOuter.append(widgetOpener);
				}

				var link = 'activateWidget(' + line.widgetId + ',false)';
				var widgetCloser = $(document.createElement('div'))
					.attr({'class': 'closer'})
					.attr({'onClick': link});
				widgetCloser.text('X');
				widgetOuter.append(widgetCloser);

				var widgetData = $(document.createElement('div'))
					.attr({'data-view': line.dataView});
				if(line.dataId != null) { widgetData.attr({'data-id': line.dataId})}
				if(line.dataTitle != null) { widgetData.attr({'data-title': line.dataTitle})}
				if(line.dataText != null) { widgetData.attr({'data-text': line.dataText})}
				if(line.dataMoreinfo != null) { widgetData.attr({'data-moreinfo': line.dataMoreinfo})}
				if(line.dataMin != null) { widgetData.attr({'data-min': line.dataMin})}
				if(line.dataMax != null) { widgetData.attr({'data-max': line.dataMax})}
				if(line.dataUnordered != null) { widgetData.attr({'data-unordered': line.dataUnordered})}
				if(line.dataPrefix != null) { widgetData.attr({'data-prefix': line.dataPrefix})}
				if(line.style != null) { widgetData.attr({'style': line.style})}
				widgetOuter.append(widgetData);

				$('.widgetContainer').append(widgetOuter);
			}
			else if(!line.activated) {
				var link = 'activateWidget(' + line.widgetId + ',true)';
				var widgetOuter = $(document.createElement('li'))
					.attr({'onClick': link});
				widgetOuter.text(line.dataTitle);
				$('.scrollContainer').append(widgetOuter);
			}
		});
	});
}

function changeDashboard(widgetId) {
	$.ajax({
		url: 'http://localhost:3030/change_dashboard',
		type: 'POST',
		dataType: 'html',
		data: {
			userId: userId,
			widgetId: widgetId
		}
	})
	.done(function(response, status, jqXHR) {
		if(response === 'Refresh') {
			location.reload();
		}
	});
}

function activateWidget(widgetId, isActivated) {
	$.ajax({
		url: 'http://localhost:3030/activate_widget',
		type: 'POST',
		dataType: 'html',
		data: {
			userId: userId,
			widgetId: widgetId,
			isActivated: isActivated
		}
	})
	.done(function(response, status, jqXHR) {
		if(response === 'Refresh') {
			location.reload();
		}
	});
}

function fixLayout(layout) {
	$.ajax({
		url: 'http://localhost:3030/fix_layout',
		type: 'POST',
		dataType: 'html',
		data: {
			userId: userId,
			layout: layout
		}
	});
};
