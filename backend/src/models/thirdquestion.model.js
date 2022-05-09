const { Schema, model } = require('mongoose');

const caseSchema = new Schema({                    
 idcaso: String,
 informacion72h: String,
 analisisDeControl: String,
 informacionAdicional: String
})

module.exports = model('thirdquestion', caseSchema);