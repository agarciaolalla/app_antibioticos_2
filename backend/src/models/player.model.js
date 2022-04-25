const { Schema, model } = require('mongoose');
const playerSchema = new Schema({
    nombre: String,
    apellido: String,
    puntuacion: String
    
})


module.exports = model('players', playerSchema);
