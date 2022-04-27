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
app.use(require('./routes/firstquestion.route'))
app.use(require('./routes/secondquestion.route'))
app.use(require('./routes/firstanswer.route'))
app.use(require('./routes/thirdquestion.route'))




module.exports = app;