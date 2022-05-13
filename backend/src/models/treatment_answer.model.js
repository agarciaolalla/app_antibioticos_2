const { Schema, model } = require('mongoose');

const caseSchema = new Schema({                    
 idcaso: String,
 idpregunta: String,
 solucion: String
})

module.exports = model('treatment_answer', caseSchema);