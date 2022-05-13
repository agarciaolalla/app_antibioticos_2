const { Schema, model } = require('mongoose');

const caseSchema = new Schema({                    
 idcaso: String,
 feedback: String
})

module.exports = model('lasttreatmentfeedback', caseSchema);