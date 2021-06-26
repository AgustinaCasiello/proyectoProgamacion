let express = require('express');
let router = express.Router();
let controllers = require('../controllers/indexController');

let db = require('../database/models')

const multer = require('multer');
const path = require('path');

const perfil = multer.diskStorage({
    destination: (req, file, cb) => {
      let rutaDirectorio = 'public/images/users';
      cb(null, rutaDirectorio);
    },
    filename: (req, file, cb) => {
      let fotoDePerfil = file.fieldname + '-' + Date.now() + path.extname(file.originalname);
      cb(null, fotoDePerfil);
    }
  });

  const upload = multer({
    storage: perfil
  });

router.get('/profile-edit', controllers.profileEdit);
router.post('/profile-edit',upload.single('foto'), controllers.profileEditPost)


router.get('/profile', controllers.profileUser);
router.get('/profile/:id', controllers.profile);


router.get('/register', controllers.register);
router.post('/register',upload.single('foto'), controllers.registerPost);

router.get('/login', controllers.login);
router.post('/login', controllers.loginFiltrado);

module.exports = router;