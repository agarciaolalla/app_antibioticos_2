const { Router } = require('express');
const { consultar, guardar, modificar, eliminar} = require('../controllers/firstanswer.controller')
const router = Router();


router.get('/api/firstanswer', consultar);
router.post('/api/firstanswer/registro', guardar);
router.put('/api/firstanswer/modificar', modificar);
router.delete('/api/firstanswer/eliminar/:id', eliminar);



module.exports = router;