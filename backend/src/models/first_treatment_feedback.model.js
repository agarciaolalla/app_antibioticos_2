const { Schema, model } = require('mongoose');

const caseSchema = new Schema({                    
 idcaso: String,
 antibiotico: String,
 dosis: String,
 via: String,
 intervalo: String,
 activo: String,
 comentario: String,
 consecuencia: String
})

module.exports = model('first_treatment_feedback', caseSchema);