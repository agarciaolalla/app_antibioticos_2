const { Schema, model } = require('mongoose');

const caseSchema = new Schema({
    
                
                    numero: String,
                    
                            primerapregunta:
                                {   
                                    pregunta:String,
                                    respuestas:[
                                    {   
                                        prueba: String,
                                        solucion: String
                                    }
                                        ]
                                },
                            segundapregunta:{
                                  
                                    pregunta:String,
                                    respuestas:[
                                    {   
                                        antibiotico: String,
                                        duracion: String,
                                        intervalo: String,
                                        cantidad: String
                                    }
                                        ]
                                    }
                            ,
                            tercerapregunta:{
                                   
                                    pregunta:String,
                                    respuestas:[
                                    {   
                                        antibiotico: String,
                                        duracion: String,
                                        intervalo: String,
                                        dosis: String
                                    }
                                        ]
                                    }
                            ,
                            
                       
                    mochila:{
                    
                            antibiotico:[ 
                                {
                                    nombre :String,
                                    dosis: String,
                                    numero: String
                                }   
                            ]
                            
                        }   
                    

                
            
})

module.exports = model('cases', caseSchema);