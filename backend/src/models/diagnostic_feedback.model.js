const { Schema, model } = require('mongoose');

const caseSchema = new Schema({                    
 idcaso: String,
 feedback: String
})

module.exports = model('diagnostic_feedback', caseSchema);