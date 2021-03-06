const { Schema, model } = require('mongoose');

const caseSchema = new Schema({                    
 idcaso: String,
 antibiotico: String,
 dosis: String,
 via: String,
 intervalo: String,
 activo: String,
 comentario: String,
 vida: String,
 dias: String,
})

module.exports = model('treatment_feedback', caseSchema);