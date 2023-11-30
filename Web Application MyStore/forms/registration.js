const express = require('express');
const bodyParser = require('body-parser');
const oracledb = require('oracledb');

const app = express();
const PORT = 3000;

// Configure Oracle Database connection
const dbConfig = {
    user: 'uthay1',
    password: 'goodluck',
    connectString: 'localhost:1521/xe'
};
oracledb.initOracleClient({ libDir: '' });

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

app.use(express.static('public'));

app.get("/", (req, res) => {
    res.sendFile(__dirname + '/registration.html');
});

app.post('/register', async (req, res) => {
    const UsersData = {
        FN: req.body['first_name'],
        LN: req.body['last_name'],
        Gender: req.body['gender'],
        Email: req.body['email'],
        UN: req.body['username'],
        PWD: req.body['password'],
    };

    let connection;
    try {
        connection = await oracledb.getConnection(dbConfig);

        const result = await connection.execute(
            'INSERT INTO users (first_name, last_name, gender, email, username, password, registration_date) ' +
            'VALUES (:FN, :LN, :Gender, :Email, :UN, :PWD, CURRENT_TIMESTAMP)',
            UsersData
        );
        
        await connection.commit();

        console.log(result);

        res.send('User registered successfully');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error registering User');
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
    console.log(`Server is running on http://localhost:${PORT}`);
});
