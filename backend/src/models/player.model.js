const { Schema, model } = require('mongoose');
const playerSchema = new Schema({
    nombre: String,
    apellido: String,
    puntuacion: String,
    retoscompletados: String,
    antibioticostotales: String,
    vida: String
    
})


module.exports = model('players', playerSchema);
