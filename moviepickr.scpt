JsOsaDAS1.001.00bplist00�Vscript_�currentApp = Application.currentApplication()
currentApp.includeStandardAdditions = true
Reminders = Application('Reminders')

function shuffle() {
	var movies = Reminders.lists.byName('Movies').reminders.whose({completed: false});
	var index = Math.floor(Math.random() * movies.length)
	var movie = movies[index];
	return {'name': movie.name(), 'note': movie.body()}
}

// Returns the text of the button that the user clicked
function selectMovie() {
	var movie = shuffle();
	
	var dialogText = 'You will watch ' + movie.name;
	
	if(movie.note !== null) {
		dialogText += ' on ' + movie.note; 
	}
	
	var dialogOptions = {
		text: dialogText,
		buttons: ['Shuffle', 'OK'],
		defaultButton: 'OK',
		withTitle: 'Moviepickr'
	}
	
	return currentApp.displayDialog(dialogOptions.text, dialogOptions).buttonReturned
}

var btn = null;

// Shuffle again until user clicks OK
while(btn !== "OK") {
	btn = selectMovie()
}
                              � jscr  ��ޭ