const { Schema, model } = require('mongoose');

const caseSchema = new Schema({                    
 idcaso: String,
 solucion: String
})

module.exports = model('thirdanswer', caseSchema);