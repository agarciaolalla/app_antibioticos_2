const caseModel = require('../models/last_treatment_feedback.model');



class CaseService {
    CaseService() {}

    async guardar(caso = new caseModel()) {
        try {
            var caseGuardado;
            await caseModel.create(caso).then( (value) => {
                caseGuardado =  value;
            });

            return caseGuardado;

        } catch (error) {
            console.log(error);

        }
    }

    async consultar() {
        try {

            return await caseModel.find();
        } catch (error) {
            return error;

        }
    }

    async eliminar(idc) {
        console.log(idc);
        var caseEliminado;
        try {
            await caseModel.findOneAndRemove({
                _id: idc
            }).then( (value) => {
                console.log(value);
                caseEliminado = value;
            });

            return caseEliminado;
        } catch (error) {
            console.log(error);

        }
    }

    async modificar(casemod) {

        var caseModificado;
        try {
            await caseModel.findOneAndUpdate({
                _id: casemod._id
            }, casemod).then( (value) => {

                caseModificado = casemod;
            });

            return caseModificado;
        } catch (error) {
            console.log(error);

        }
    }
}

module.exports = new CaseService();
