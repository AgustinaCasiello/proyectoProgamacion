let db = require('../database/models');
const Op = db.Sequelize.Op;
const bcrypt = require('bcryptjs');

const controller = {
    // Validar si la sesion tiene un usuario cargado (si el usuario hizo login)
    // En donde se hace el if para validar?
    index: (req, res) => {
            let filtro = { 
                order: [
                    ['createdAt', 'DESC'],
                ],
                include:
                    {association: 'userP'},
                limit: 4
            } 
            let filtro2 =  { 
                order: [
                ['createdAt', 'ASC'],
                ],
                include:
                    { association: 'userP'},
                limit: 4        
        }
        db.Producto.findAll(filtro).then(resultado => { 
            db.Producto.findAll(filtro2).then(resultado2 => {
                res.render ('index', {autos: resultado, autosViejos: resultado2});
            });
        });
    },
    buscar: (req, res) => {
        let filtro2 = {
            where: {
                [Op.or]: [{
            nombre: {
                [Op.like]: "%" + req.query.search + "%"
            }
        }, 
        {
            descripcion: {
                [Op.like]: "%" + req.query.search + "%"
            }
        }]},
        include: {
        association: 'userP'
        }
    }
        db.Producto.findAll(filtro2).then(resultado => { 
            if(resultado == '' || req.query.search == "" ) {
                res.render('search-results', {
                    resultado: resultado,
                    error: 'No existen resultados.',
                });
                
            } else {
                res.render('search-results', {
                    resultado: resultado,
                    error: null                 
                })
            }         
            }) .catch(errorsearch => console.log(errorsearch));
    },
    product: (req, res) => {
        let idProducto = req.params.id;
        const filtro = {
            include: [
                {association: 'comentarioP',include: 'Cuser'},
                {association: 'userP'}
            ],
            order : [['comentarioP', 'createdAt', 'DESC']]
        }
        db.Producto.findByPk(idProducto, filtro).then(resultado => {
            res.render('product', {
                product: resultado
            })
        });
    },
    crear: (req, res) => {
        db.Producto.create({
            nombre: req.body.nombre,
            descripcion: req.body.descripcion,
            fecha_creacion: req.body.fecha_creacion,
            image_URL: req.file.filename,
            id_usuario: req.session.idUsuario, //para que guarde qu?? usuario agreg?? cre?? el producto

        }).then(productoAgregado => {
            res.redirect('/product/product/' + productoAgregado.id)
        })
    },
    productAdd: (req, res) => {
        res.render('product-add', {
            title: 'ProductAdd'
        });
    },
    editarGet: (req, res) => {
        if (req.body.id_usuario == req.session.userP) {
            db.Producto.findByPk(req.query.id).then(autoEdit => {
                res.render('productEdit', {
                    autoEditado: autoEdit
                })
            }) 
        } else{
            res.redirect ('/')
        }
    },
    editarPost: (req, res) => {

        db.Producto.update({
            nombre: req.body.nombre,
            descripcion: req.body.descripcion,
            fecha_creacion: req.body.fecha_creacion,
            image_URL: req.file.filename,
        }, {
            where: {
                id: req.body.id
            }
        }).then(productomodificado => {
            res.redirect('/product/product/' + req.body.id);
        })
        .catch(error => console.log(error));


    },
    agregarComen: (req, res) => {
        db.Comentario.create({
            mail: req.body.mail,
            id_producto: req.params.id,
            id_usuario: req.session.idUsuario,           

        }).then(comenAgregado => {
            res.redirect('/product/product/' + req.params.id)
        })

    },

    borrarComentario: (req, res) => {
        db.Comentario.destroy({
            where: {
                id: req.body.id,
            }
        })
        .then((comentarioBorrado) => {
            res.redirect('/product/product/' + req.body.id_producto);
        })
    },

    borrar: (req, res) => {
        if (req.body.id_usuario == req.session.userP) {
            db.Producto.destroy({
                where: {
                    id: req.body.id,
                }
            })
            .then(() => {
                res.redirect('/')
            })
        }    
    },
    register: (req, res) => {
        if (req.session.usuario != undefined) {
            return res.redirect('/')
        } else {
            return res.render('register', {
                errors: null
            });
        }
    },
    registerPost: (req, res) => {

        if (!req.body.mail || !req.body.nombre || !req.body.fecha || !req.body.contrasena) { //para que salte error si est?? vac??o alg??n campo
            return res.render('register', {
                errors: "El campo no puede estar vac??o"
            });
        }
        if (req.body.contrasena.length < 4) {
            return res.render ('register', {errors : "La contrasena debe tener mas de 4 caracteres"})
        }

        db.Usuario.findOne({ //si ya existe un usuario con ese mail no me puedo registrar
            where: {
                mail: req.body.mail,
            }
        }).then(usuario => {
            if (usuario) {
                return res.render('register', {
                    errors: "Ya existe un usuario con este mail"
                })
            } else {
                let cEncriptada = bcrypt.hashSync(req.body.contrasena);
                db.Usuario.create({
                    nombre: req.body.nombre,
                    mail: req.body.mail,
                    fecha: req.body.fecha,
                    contrasena: cEncriptada,
                    foto: req.file.filename
                }).then(usuario => {
                    res.redirect('/');
                });
            }
        })
    },
    login: (req, res) => {
        if (req.session.usuario != undefined) {
            return res.redirect('/')
        } else {
            return res.render('login', {
                errors: null
            });
        }
    },
    loginFiltrado: (req, res) => {

        const filtro = {
            where: {
                mail: req.body.mail,
            }
        }

        if (!req.body.mail || !req.body.contrasena) { //para que salte error si est?? vac??o alg??n campo
            return res.render('login', {
                errors: "El campo no puede estar vac??o"
            });
        }
        db.Usuario.findOne(filtro).then(usuario => {

                if (usuario && bcrypt.compareSync(req.body.contrasena, usuario.contrasena)) { // SI existe el usuario + compara la contrase??a del inicio de sesi??n con la que estaba en la base de datos

                    req.session.usuario = usuario.mail;
                    req.session.idUsuario = usuario.id;
                    req.session.nombre = usuario.nombre;

                    if (req.body.recordar) {
                        res.cookie('idUsuario', usuario.id, {
                            maxAge: 1000 * 60 * 20
                        });
                    }
                    res.redirect('/');
                } else { //tanto el usuario como la contrase??a pueden estar mal
                    return res.render('login', {
                        errors: "El mail o la contrase??a son incorrectos"
                    });
                }
            })
            .catch(error1 => console.log(error1));
    },
    profile: (req, res) => {
        const filtro = {
            include: [
                {association: 'UserProdu', include: "comentarioP"},
                {association: 'comentarioUser'}
            ]
        }
        db.Usuario.findByPk(req.params.id, filtro).then(resultado => {
            res.render('profile', {
                usuario: resultado
            })
        })
    },
    profileUser: (req, res) => {
        let filtro = {
            include: [
                {association: 'UserProdu', include: "comentarioP"},
                {association: 'comentarioUser'}
            ]
        }
        db.Usuario.findByPk(req.session.idUsuario, filtro).then(resultado => {
            res.render('profile', {
                usuario: resultado
            })
        })

    },
    profileEdit: (req, res) => {
        db.Usuario.findByPk(req.query.id)
        .then(resultado =>{
            res.render('profile-edit', {usuarioEdit: resultado})
        })
    },
    profileEditPost: (req, res) => {
        
      db.Usuario.update({
          nombre : req.body.nombre,
          foto: req.file.filename
      }, {
          where: {
              id: req.session.idUsuario
          }
      }).then (perfilEditado =>{
          res.redirect('/');
      })
      .catch(error => console.log(error));
    },

    exit: (req, res) => {
        // Borramos la sesion del servidor
        req.session.destroy();
        // Eliminamos la cookie del cliente
        res.clearCookie('idUsuario');
        res.redirect('/');
    },
};

module.exports = controller;