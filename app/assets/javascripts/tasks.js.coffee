jQuery ->
	$('.picker').focusout ->
		task_id = $(this).attr("id")
		setTimeout ->
			$('#pick_' + task_id).hide()
		, 150
		setTimeout ->
			$('#' + task_id).show()
		, 150