let express = require('express');
let router = express.Router();
let controllers = require('../controllers/indexController');

let db = require('../database/models')

router.get('/', controllers.index)
router.post('/borrar', controllers.borrar);


module.exports = router;
