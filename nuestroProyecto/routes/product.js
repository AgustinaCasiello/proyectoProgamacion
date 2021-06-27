let express = require('express');
let router = express.Router();
let controllers = require('../controllers/indexController');

let db = require('../database/models')

const multer = require('multer');
const path = require('path');

const product = multer.diskStorage({
    destination: (req, file, cb) => {
      let rutaDirectorio = 'public/images/autos';
      cb(null, rutaDirectorio);
    },
    filename: (req, file, cb) => {
      let fotoProducto = file.fieldname + '-' + Date.now() + path.extname(file.originalname);
      cb(null, fotoProducto);
    }
  });

  const upload = multer({
    storage: product
  });

router.get('/product-add',  controllers.productAdd);
router.post('/product-add', upload.single('image_URL'), controllers.crear);

router.get('/', controllers.product);
router.get('/product/:id?', controllers.product);
router.post('/product/:id?', controllers.agregarComen);


router.get('/productEdit', controllers.editarGet);
router.get('/editar', controllers.editarGet);
router.post('/editar', upload.single('image_URL'), controllers.editarPost);
router.post('/borrar', controllers.borrar);


module.exports = router;