var userId;
var dashboardId;
var layout;
var widgets;
var parentId;
var pageTitle;

function fetchLayout(email) {
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

		userId = reply.user.userId;
		dashboardId = reply.user.currentDash;
		layout = reply.user.layout;
		widgets = reply.widgets;
		parentId = reply.parent ? reply.parent.parentId : 0;
		pageTitle = reply.parent ? reply.parent.dataTitle : 'My Dashboard';

		render();
	});
}

function render() {
	// render back button
	if(dashboardId !== 0) {
		$('.backButton').text('Back').attr({'onClick': 'changeDashboard(' + parentId + ')'});
	}

	// append saved layout
	$('.gridster').append(layout);

	// render page title
	$('h1.header').text(pageTitle);

	// render activated widgets and links for deactivated widgets
	widgets.forEach(function(widget) {
		if(widget.activated && widget.parentId === dashboardId) {
			var widgetContainer = buildWidget(widget);
			$('.dashboard').append(widgetContainer);
		}
		else if(!widget.activated && widget.parentId === dashboardId) {
			var link = 'activateWidget(' + widget.widgetId + ',true)';
			var widgetContainer = $(document.createElement('li'))
				.attr({'onClick': link});
			widgetContainer.text(widget.dataTitle);
			$('.scrollContainer').append(widgetContainer);

			var widgetContainer = buildWidget(widget);
			$('.hiddenDashboard').append(widgetContainer);
		}
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
	// $.ajax({
	// 	url: 'http://localhost:3030/activate_widget',
	// 	type: 'POST',
	// 	dataType: 'html',
	// 	data: {
	// 		userId: userId,
	// 		widgetId: widgetId,
	// 		isActivated: isActivated
	// 	}
	// })
	// .done(function(response, status, jqXHR) {
	// 	if(response === 'Refresh') {
	// 		location.reload();
	// 	}
	// });

	console.log("id w" + widgetId);

	console.log("??? ", $('#w' + widgetId));

	var widget = $('#w' + widgetId);
	$('.dashboard').append(widget);
	// $('.dashboard').gridster().
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
}

function buildWidget(widget) {
	var widgetContainer = $(document.createElement('li'))
		.attr({'data-row': widget.dataRow})
		.attr({'data-col': widget.dataCol})
		.attr({'data-sizex': widget.dataSizex})
		.attr({'data-sizey': widget.dataSizey})
		.attr({'id': 'w' + widget.widgetId});

	if(widget.isParent) {
		var link = 'changeDashboard(' + widget.widgetId + ')';
		var widgetOpener = $(document.createElement('div'))
			.attr({'class': 'entrance'})
			.attr({'onClick': link});
		widgetOpener.text('I');
		widgetContainer.append(widgetOpener);
	}

	var link = 'activateWidget(' + widget.widgetId + ',false)';
	var widgetCloser = $(document.createElement('div'))
		.attr({'class': 'closer'})
		.attr({'onClick': link});
	widgetCloser.text('X');
	widgetContainer.append(widgetCloser);

	var widgetConfig = $(document.createElement('div'))
		.attr({'data-view': widget.dataView});
	if(widget.dataId != null) { widgetConfig.attr({'data-id': widget.dataId})}
	if(widget.dataTitle != null) { widgetConfig.attr({'data-title': widget.dataTitle})}
	if(widget.dataText != null) { widgetConfig.attr({'data-text': widget.dataText})}
	if(widget.dataMoreinfo != null) { widgetConfig.attr({'data-moreinfo': widget.dataMoreinfo})}
	if(widget.dataMin != null) { widgetConfig.attr({'data-min': widget.dataMin})}
	if(widget.dataMax != null) { widgetConfig.attr({'data-max': widget.dataMax})}
	if(widget.dataUnordered != null) { widgetConfig.attr({'data-unordered': widget.dataUnordered})}
	if(widget.dataPrefix != null) { widgetConfig.attr({'data-prefix': widget.dataPrefix})}
	if(widget.style != null) { widgetConfig.attr({'style': widget.style})}
	widgetContainer.append(widgetConfig);

	return widgetContainer;
}
