const { Schema, model } = require('mongoose');

const caseSchema = new Schema({                    
 idcaso: String,
 preguntaHtml: String
})

module.exports = model('diagnostic_question', caseSchema);