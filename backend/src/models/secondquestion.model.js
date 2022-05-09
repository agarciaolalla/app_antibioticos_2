const { Schema, model } = require('mongoose');

const caseSchema = new Schema({                    
 idcaso: String,
 pregunta: String,
 descripcion: String
})

module.exports = model('secondquestion', caseSchema);