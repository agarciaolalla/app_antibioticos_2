const { Schema, model } = require('mongoose');

const caseSchema = new Schema({                    
 idcaso: String,
 respuesta: String,
 solucion: String,
 feedback: String
})

module.exports = model('diagnostic_answer', caseSchema);