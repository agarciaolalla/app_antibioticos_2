const playermodel = require('../models/player.model');



class PlayerService {
    PlayerService() {}

    async guardarplayer(cliente = new playermodel()) {
        try {
            var playerGuardado;
            await playermodel.create(cliente).then( (value) => {
                playerGuardado =  value;
            });

            return playerGuardado;

        } catch (error) {
            console.log(error);

        }
    }

    async consultarplayer() {
        try {

            return await playermodel.find();
        } catch (error) {
            return error;

        }
    }


    async eliminarplayer(idc) {
        console.log(idc);
        var playerEliminado;
        try {
            await playermodel.findOneAndRemove({
                _id: idc
            }).then( (value) => {
                console.log(value);
                playerEliminado = value;
            });

            return playerEliminado;
        } catch (error) {
            console.log(error);

        }
    }

    async modificarplayer(playermod) {

        var playerModificado;
        try {
            await playermodel.findOneAndUpdate({
                _id: playermod._id
            }, playermod).then( (value) => {

                playerModificado = playermod;
            });

            return playerModificado;
        } catch (error) {
            console.log(error);

        }
    }
}

module.exports = new PlayerService();
