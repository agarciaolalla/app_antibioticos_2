const { Router } = require('express');
const { consultar, guardar, modificar, eliminar} = require('../controllers/firstquestion.controller')
const router = Router();


router.get('/api/firstquestion', consultar);
router.post('/api/firstquestion/registro', guardar);
router.put('/api/firstquestion/modificar', modificar);
router.delete('/api/firstquestion/eliminar/:id', eliminar);



module.exports = router;