const { Schema, model } = require('mongoose');

const caseSchema = new Schema({                    
 idcaso: String,
 idPregunta: String,
 pregunta: String
})

module.exports = model('treatment_question', caseSchema);