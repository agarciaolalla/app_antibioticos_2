const { Schema, model } = require('mongoose');

const caseSchema = new Schema({                    
 idcaso: String,
 respuesta: String,
 solucion: String
})

module.exports = model('firstanswer', caseSchema);