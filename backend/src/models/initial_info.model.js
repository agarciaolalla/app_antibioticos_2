const { Schema, model } = require('mongoose');
const playerSchema = new Schema({
    idcaso: String,
    info: String
})


module.exports = model('initial_info', playerSchema);
