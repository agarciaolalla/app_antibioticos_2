const { Schema, model } = require('mongoose');

const caseSchema = new Schema({                    
 idcaso: String,
 pregunta: String
})

module.exports = model('firstquestion', caseSchema);