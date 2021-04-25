let express = require('express');
let router = express.Router();
let controllers = require('../controllers/indexController');

router.get('/', controllers.profile);
router.get('/:id', controllers.profile);

module.exports = router;