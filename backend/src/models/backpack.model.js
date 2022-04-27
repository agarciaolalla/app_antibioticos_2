const { Schema, model } = require('mongoose');

const caseSchema = new Schema({                    
 idcaso: String,
 nombre: String,
 dosis: String,
 numero: String,
})

module.exports = model('backpack', caseSchema);