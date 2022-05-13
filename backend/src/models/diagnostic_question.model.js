const { Schema, model } = require('mongoose');

const caseSchema = new Schema({                    
 idcaso: String,
 preguntaHtml: String
})

module.exports = model('diagnosticquestion', caseSchema);