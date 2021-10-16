const jwt = require('jsonwebtoken');
const auth = require('../config/auth');

module.exports = (req, res, next) => {

    if (!req.headers.authorization) {
        res.status(401).json({ message: "Unauthorized access. Please login." });
    } else {

        let token = req.headers.authorization.split(" ")[1];

        jwt.verify(token, auth.secret, (err) => {
            if (err) {
                res.status(401).json({ message: "Unauthorized access. Invalid Token." });
            } else {
                next();
            }
        })

    }

}