const { Schema, model } = require('mongoose');

const caseSchema = new Schema({                    
 idcaso: String,
 idpregunta: String,
 preguntaHtml: String
})

module.exports = model('diagnosticquestion', caseSchema);