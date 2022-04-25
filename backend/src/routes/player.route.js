const { Router } = require('express');
const { consultarplayer, agregarplayer, modificarplayer, eliminarplayer} = require('../controllers/player.controller')
const router = Router();


router.get('/api/player', consultarplayer);
router.post('/api/player/registro', agregarplayer);
router.put('/api/player/modificar', modificarplayer);
router.delete('/api/player/eliminar/:id', eliminarplayer);



module.exports = router;