$(function () {

	console.log('movies.js loaded ...');
	listenForMovieClick()
})


function listenForMovieClick() {
	$('a').on('click', function (event) {
		event.preventDefault()

		// let url = this.href
		// get details

		$.ajax({
			url: this.href,
			method: 'get',
			dataType: 'json',
			success: function (response) {
				console.log("response: ", response);
				let movie = new Movie(response.data);
				console.log("newMovieData: ", movie);

				let html = movie.movieHTML()
				$('div#movie-details').html(html)

			}
		})
	})
}

class Movie {
	constructor(obj) {
		this.id = obj.id
		this.title = obj.attributes.title
	}
}

Movie.prototype.movieHTML = function () {
	return (`
		<hr>
		<div>
	      <p>Id: ${this.id}</p>
  	    <p>Title: ${this.title}</p>
				<button class='dog-details'>More Info</button>
		</div>
		<hr>
    `)
}