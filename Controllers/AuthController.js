const { User } = require('../database/models/User')
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const auth = require('../config/auth');

module.exports = {

    login(req, res) {

        let { username, password } = req.body;

        User.findOne({
            where: {
                username: username
            }
        }).then(user => {
            if (!user) {
                res.status(401).json({ message: "Unauthorized access. Check username and password." });
            } else {

                if (bcrypt.compareSync(password, user.password)) {

                    let token = jwt.sign({ user: user }, auth.secret, {
                        expiresIn: auth.expieres
                    });

                    res.status(200).json({
                        token: token
                    });

                } else {
                    res.status(401).json({ message: "Unauthorized access. Check username and password." });
                }

            }

        }).catch(function (err) {
            res.status(500).json({ message: err.message });
        });

    },

    register(req, res) {

        let password = bcrypt.hashSync(req.body.password, 10);

        User.create({
            username: req.body.username,
            password: password
        }).then(function () {
            res.status(201).json({ message: "User created" });
        }).catch(function (err) {
            res.status(500).json({ message: err.message });
        });
    }

}