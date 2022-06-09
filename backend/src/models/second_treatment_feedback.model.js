const { Schema, model } = require('mongoose');

const caseSchema = new Schema({                    
 idcaso: String,
 antibiotico: String,
 dosis: String,
 via: String,
 intervalo: String,
 activo: String,
 dias: String,
 favorable: String,
 lastfeedback: String
})

module.exports = model('second_treatment_feedback', caseSchema);