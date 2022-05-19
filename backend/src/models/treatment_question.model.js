const { Schema, model } = require('mongoose');

const caseSchema = new Schema({                    
 idcaso: String,
 idpregunta: String,
 pregunta: String
})

module.exports = model('treatment_question', caseSchema);