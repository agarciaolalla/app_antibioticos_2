const { Schema, model } = require('mongoose');

const caseSchema = new Schema({                    
 antibiotico: String,
 dosis: String,
 via: String,
 intervalo: String,
 dias: String,
})

module.exports = model('backpack', caseSchema);