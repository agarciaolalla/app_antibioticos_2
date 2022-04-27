const { Router } = require('express');
const { consultar, guardar, modificar, eliminar} = require('../controllers/secondquestion.controller')
const router = Router();


router.get('/api/secondquestion', consultar);
router.post('/api/secondquestion/registro', guardar);
router.put('/api/secondquestion/modificar', modificar);
router.delete('/api/secondquestion/eliminar/:id', eliminar);



module.exports = router;