const { Schema, model } = require('mongoose');

const caseSchema = new Schema({                    
 nombre: String,
 numero: String,
})

module.exports = model('backpack', caseSchema);