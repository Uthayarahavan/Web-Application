const express = require('express');
const bodyParser = require('body-parser');
const oracledb = require('oracledb');

const app = express();
const PORT = 3001; // Different port for the login server

// Configure Oracle Database connection
const dbConfig = {
    user: 'uthay1',
    password: 'goodluck',
    connectString: 'localhost:1521/xe'
};
oracledb.initOracleClient({ libDir: '' });

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

app.use(express.static('public')); // Serve static files from the public directory

app.get("/", (req, res) => {
    res.sendFile(__dirname + '/login.html');
});

app.post('/login', async (req, res) => {
    const username = req.body['username'];
    const password = req.body['password'];

    let connection;
    try {
        connection = await oracledb.getConnection(dbConfig);

        const result = await connection.execute(
            'SELECT * FROM users WHERE username = :username AND password = :password',
            { username, password },
            { outFormat: oracledb.OUT_FORMAT_OBJECT }
        );

        if (result.rows.length > 0) {
            //res.redirect('/homepage.html');
            res.sendFile(__dirname + '/homepage.html');
        } else {
            res.status(401).send('Invalid username or password');
        }
    } catch (err) {
        console.error(err);
        res.status(500).send('Error during login');
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



app.listen(PORT, () => {
    console.log(`Login server is running on http://localhost:${PORT}`);
});
