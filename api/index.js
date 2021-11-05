import express from 'express';
import bodyParser from 'body-parser';
import cors from 'cors';
import routes from './routes.js';

const app = express();

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(cors());

// REGISTER OUR ROUTES
app.use(routes);

// START THE SERVER
const port = process.env.PORT || 8080; // set our port
app.listen(port);
console.log('Magic on port ' + port);
