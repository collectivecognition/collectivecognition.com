$(document).ready(function(){
	
	// Fetch the latest images from my public google+ feed

	var photos = [];

	$.getJSON("https://www.googleapis.com/plus/v1/people/113722147613162969173/activities/public?key=AIzaSyDoUOT4fIpb3W5ujKcIpDR9fYsyUiadA9E", function(data){
		if(data.items){
			$.each(data.items, function(index, item){
				if(item.object && item.object.attachments){
					$.each(item.object.attachments, function(index, attachment){
						if(attachment.objectType === "photo"){
							photos.push({
								image: attachment.image.url,
								url: item.url
							});
						}
					});
				}
			});

			// Add 3 latest images to the homepage

			for(var ii = 0; ii < photos.length && ii < 3; ii++){
				var photo = photos[ii];
				$("#photos").append("<a class='cell' href='" + photo.url + "'><div class='inner' style='background-image: url(" + photo.image + ");'></div></a>");
			}
		}
	});
});