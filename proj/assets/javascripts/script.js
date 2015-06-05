function toggle_widget(userId, widgetId, isOpened) {
	$.ajax({
		url: 'http://localhost:3030/set_widget',
		type: 'POST',
		dataType: 'html',
		data: {
			userId: userId,
			widgetId: widgetId,
			isOpened: isOpened
		}
	});
}