const express =  require('express');
const bodyParser = require('body-parser');
const app = express();

const morgan = require('morgan');
const cors = require('cors');

app.use(express.urlencoded({extended: true})); 
app.use(express.json());

app.use(morgan('dev'));
app.use(cors());

app.use(require('./routes/player.route'))
app.use(require('./routes/initial_info.route'))

app.use(require('./routes/diagnostic_question.route'))
app.use(require('./routes/diagnostic_answer.route'))

app.use(require('./routes/treatment_question.route'))

app.use(require('./routes/first_treatment_feedback.route'))
app.use(require('./routes/last_treatment_feedback.route'))
app.use(require('./routes/diagnostic_feedback.route'))

app.use(require('./routes/backpack.route'))

module.exports = app;