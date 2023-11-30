const express = require('express');
const bodyParser = require('body-parser');
const oracledb = require('oracledb');

const app = express();
const PORT = 3002;

const dbConfig = {
    user: 'uthay1',
    password: 'goodluck',
    connectString: 'localhost:1521/xe',
};
oracledb.initOracleClient({ libDir: '' });

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(express.static('public'));

app.get("/", (req, res) => {
    res.sendFile(__dirname + '/ma_books.html');
});

app.post('/process_add_book', async (req, res) => {
    const bookData = {
        book_title: req.body['book_title'],
        author: req.body['author'],
        // Format the date to 'DD/MM/YYYY'
        publication_date: formatDate(req.body['publication_date']),
        genre: req.body['genre'],
        price: req.body['price'],
    };

    let connection;
    try {
        connection = await oracledb.getConnection(dbConfig);

        const result = await connection.execute(
            'INSERT INTO master_books (book_title, author, publication_date, genre, price) ' +
            "VALUES (:book_title, :author, TO_DATE(:publication_date, ''DD/MM/YYYY''), :genre, :price)",
            bookData
        );

        await connection.commit();

        console.log(result);

        res.send('Book added successfully');
    } catch (err) {
        console.error(err);
        res.status(500).send('Book added successfully');
    } finally {
        if (connection) {
            try {
                await connection.close();
            } catch (err) {
                console.error(err);
            }
        }
    }
});

function formatDate(inputDate) {
    const date = new Date(inputDate);
    const day = String(date.getDate()).padStart(2, '0');
    const month = String(date.getMonth() + 1).padStart(2, '0');
    const year = date.getFullYear();
    return `${day}/${month}/${year}`;
}

app.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`);
});
