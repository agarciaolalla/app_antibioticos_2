const { Router } = require('express');
const { consultar, guardar, modificar, eliminar} = require('../controllers/thirdquestion.controller')
const router = Router();


router.get('/api/thirdquestion', consultar);
router.post('/api/thirdquestion/registro', guardar);
router.put('/api/thirdquestion/modificar', modificar);
router.delete('/api/thirdquestion/eliminar/:id', eliminar);



module.exports = router;