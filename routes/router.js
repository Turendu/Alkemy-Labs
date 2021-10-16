const express = require('express');
const router = express.Router();
const auth = require('../midelware/auth');
const AuthController = require('../Controllers/AuthController');
const CharacterController = require('../Controllers/CharacterController');

router.get('/', (req, res) => {
  res.status(200).json({ message: 'Hello World!' });
})

router.get('/api/characters/', auth, CharacterController.index);
router.get('/api/characters/:id', auth, CharacterController.show);

router.post('/api/auth/login', AuthController.login);
router.post('/api/auth/register', AuthController.register);


module.exports = router;