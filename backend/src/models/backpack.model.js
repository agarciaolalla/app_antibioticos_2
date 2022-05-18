const { Schema, model } = require('mongoose');

const caseSchema = new Schema({                    
 antibiotico: String,
 dosis: String,
 via: String,
 intervalo: String,
 dias: String,
 cantidad: String,
 numpastillas: String
})

module.exports = model('backpack', caseSchema);