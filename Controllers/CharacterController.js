const { Character } = require('../database/models/Character');

module.exports = {

    index(req, res) {
        Character.findAll().then(character => {
            res.json(character)
        }).catch(function (err) {
            res.status(500).json({ message: err.message });
        });
    },

    show(req, res) {

        let id = req.params.id;

        Character.findAll({
            where: {
                name: id
            }
        }).then(character => {
            res.json(character)
        }).catch(function (err) {
            res.status(500).json({ message: err.message });
        });
    }

}