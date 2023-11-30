const express = require('express');
const bodyParser = require('body-parser');
const mongoose = require('mongoose');

const app = express();
const PORT = 3000;

// Configure MongoDB connection (replace 'your_connection_string' with your actual connection string)
mongoose.connect('mongodb://localhost:27017/ma_movies', { useNewUrlParser: true, useUnifiedTopology: true });

// Define a schema for movie details
const movieSchema = new mongoose.Schema({
    movie_title: String,
    director: String,
    release_date: Date,
    genre: String,
    price: Number,
});

const Movie = mongoose.model('Movie', movieSchema);

// Middleware to parse the request body
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

// Serve static files from the 'public' directory (if needed)
app.use(express.static('public'));

// Route for serving the HTML file
app.get("/", (req, res) => {
    res.sendFile(__dirname + '/ma_movies.html');
});

// Handle form submission
app.post('/submit-movie', async (req, res) => {
    // Extract movie data from the request body
    const movieData = {
        movie_title: req.body['movie_title'],
        director: req.body['director'],
        release_date: new Date(req.body['release_date']),  // Convert to Date object
        genre: req.body['genre'],
        price: parseFloat(req.body['price']),
    };

    // Create a new movie document
    const newMovie = new Movie(movieData);

    try {
        // Save the movie to the MongoDB
        const savedMovie = await newMovie.save();
        res.send('Movie added successfully');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error adding movie');
    }
});
// Start the server
app.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`);
});
