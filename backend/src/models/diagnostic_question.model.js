const { Schema, model } = require('mongoose');

const caseSchema = new Schema({                    
 idcaso: String,
 pregunta: String
})

module.exports = model('diagnostic_question', caseSchema);