$(function () {
	console.log('movies.js loaded ...');
	listenForAllMoviesClick()
	listenForMovieClick()
})

function listenForAllMoviesClick() {
	$('a#all-movies').on('click', function (event) {
		event.preventDefault()
		$.ajax({
			url: this.href,
			method: 'get',
			dataType: 'json',
			success: function (response) {
				let movies = response.data
				let moviesHTML = movies.map((movie, index) => {
					let movieObject = new Movie(movie)
					return (`
					${movieObject.movieHTML()}
					`)
				})
				$('div#all-movies-container').html(moviesHTML)
				listenMovieDetails()
			}
		})
	})
}

function listenForMovieClick() {
	$('td a').on('click', function (event) {
		event.preventDefault()
		$.ajax({
			url: this.href,
			method: 'get',
			dataType: 'json',
			success: function (response) {
				let movie = new Movie(response.data);
				let html = movie.movieHTML()
				$('div#movie-details').html(html)
			}
		})
	})
}

function listenMovieDetails() {
	let movieDetailsButtons = document.querySelectorAll('.details')
	movieDetailsButtons.forEach(function (elem) {
		elem.addEventListener("click", function (event) {
			event.preventDefault()
			let url = `/movies/${this.dataset.id}`
			$.ajax({
				url: url,
				method: 'get',
				dataType: 'json',
				success: function (response) {
					let movie = new Movie(response.data);
					let html = movie.movieRentalHTML()
					$("div#" + movie.id).append(html)
				}
			})
			listenMovieRental()
		});
	});
}

function listenMovieRental() {
	let movieRentalButtons = document.querySelectorAll('button.rent-movie')



	movieRentalButtons.forEach(function (elem) {
		elem.addEventListener("click", function (event) {
			event.preventDefault()
			let url = `/rentals/${this.dataset.id}`
			console.log('reached movieRental url');
			debugger;
			$.ajax({
				url: url,
				method: 'get',
				dataType: 'json',
				success: function (response) {
					let movie = new Movie(response.data);
					let html = movie.movieRentalHTML()
					$("div#" + movie.id).append(html)
				}
			})
		});
	});
}

class Movie {
	constructor(obj) {
		// console.log("class Movie: ", obj);
		this.id = obj.id
		this.title = obj.attributes.title
		this.rentals = obj.relationships.rentals
	}
}

Movie.prototype.movieHTML = function () {
	return (`
		<div id=${this.id}>
			<hr>
				<p>Id: ${this.id}</p>
				<p>Title: ${this.title}</p>
				<p>Rentals: ${this.rentals}</p>
				<button class = "details" data-id=${this.id}>Movie Details</button>
				<p>move details show up appended here ... </p>
			<hr>
		</div>
  `)
}

Movie.prototype.movieRentalHTML = function () {
	let rentalsHTML = this.rentals.data.map((rental, index) => {
		return (`
		<li id=${index}>${rental.id}</li>
		`)
	})

	return (`
		<div style="background-color:gray">
			<strong>Current rentals: </strong>
			<ol>
				${rentalsHTML}
			</ol>
			<button class = "rent-movie" data-id=${this.id}>Rent Movie</button>
		</div>
	`)
}