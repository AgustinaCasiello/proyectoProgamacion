let express = require('express');
let router = express.Router();
let controllers = require('../controllers/indexController');

router.get('/', controllers.register);
router.post('/', controllers.registerPost);

module.exports = router;