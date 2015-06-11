var userId;

var fix_layout = function(layout) {
  return $.ajax({
    url: 'http://localhost:3030/fix_layout',
    type: 'POST',
    dataType: 'html',
    data: {
      userId: userId,
      layout: layout
    }
  });
};

function renderFromServer(email) {
  var widgetContainer = $('.widgetContainer');
  var scrollContainer = $('.scrollContainer');
  var gridster = $('.gridster');

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
		// just another layer of protection
		// if(JSON.parse(response).email !== email) {
		// 	return;
		// }

		JSON.parse(response).data.forEach(function(line) {
			if(line.activated === 1) {
				var widgetOuter = $(document.createElement('li'))
					.attr({'data-row': line.dataRow})
					.attr({'data-col': line.dataCol})
					.attr({'data-sizex': line.dataSizex})
					.attr({'data-sizey': line.dataSizey});

        var link = 'activate_widget(' + line.widgetId + ',false)';
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

				widgetContainer.append(widgetOuter);
	    }
	    else if(line.activated === 0) {
				var link = 'activate_widget(' + line.widgetId + ',true)';
				var widgetOuter = $(document.createElement('li'))
					.attr({'onClick': link});
				widgetOuter.text(line.dataTitle);
				scrollContainer.append(widgetOuter);
	    }
		});

    gridster.append(JSON.parse(response).data[0].layout);
    userId = JSON.parse(response).data[0].userId;
	});
}

function activate_widget(widgetId, isActivated) {
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