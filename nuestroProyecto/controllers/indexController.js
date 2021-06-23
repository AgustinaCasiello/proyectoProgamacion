let db = require('../database/models');
const Op = db.Sequelize.Op;
const bcrypt = require('bcryptjs');

const controller = {
    // Validar si la sesion tiene un usuario cargado (si el usuario hizo login)
    // En donde se hace el if para validar?
    index: (req, res) => {
        db.Producto.findAll({
                order: [
                    ['nombre', 'ASC'],
                ],
                limit: 20
            }).then(resultado => {
                res.render('index', {
                    autos: resultado
                });
            })
            .catch(error => {
                console.log(error)
            })



    },
    buscar: (req, res) => {
        let filtro = {
            where: {
                nombre: {
                    [Op.like]: '%' + req.query.search + '%'
                }
            }
        }

        db.Producto.findAll(filtro).then(resultado => {
            res.render('search-results', {
                lista: resultado
            });
        });

    },
    crear: (req, res) => {
        db.Producto.create({
            nombre: req.body.nombre,
            descripcion: req.body.descripcion,
            fecha_creacion: req.body.fecha_creacion,
            image_URL: req.body.image_URL,
            id_usuario: req.session.idUsuario, //para que guarde qué usuario agregó creó el producto

        }).then(productoAgregado => {
            res.redirect('/product/product/' + productoAgregado.id)
        })
    },
    borrar: (req, res) => {
        if (req.session.usuario == req.session.idUsuario) {
            db.Producto.destroy({
                where: {
                    id: req.body.id,
                }
            })
            //.then(() => {
            //let alerta = prompt("¿Seguro de que deseas eliminar el producto?");
            //if(alerta == null || alerta == "")
            //})
            .then(() => {
                res.redirect('/')
            })
        }    
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

        if (!req.body.mail || !req.body.contrasena) { //para que salte error si está vacío algún campo
            return res.render('login', {
                errors: "El campo no puede estar vacío"
            });
        }

        db.Usuario.findOne(filtro).then(usuario => {

                if (usuario && bcrypt.compareSync(req.body.contrasena, usuario.contrasena)) { // SI existe el usuario + compara la contraseña del inicio de sesión con la que estaba en la base de datos

                    req.session.usuario = usuario.mail;
                    req.session.idUsuario = usuario.id;
                    req.session.nombre = usuario.nombre;

                    if (req.body.recordar) {
                        res.cookie('idUsuario', usuario.id, {
                            maxAge: 1000 * 60 * 20
                        });
                    }
                    res.redirect('/');
                } else { //tanto el usuario como la contraseña pueden estar mal
                    return res.render('login', {
                        errors: "El mail o la contraseña son incorrectos"
                    });
                }
            })
            .catch(error1 => console.log(error1));

    },
    exit: (req, res) => {
        // Borramos la sesion del servidor
        req.session.destroy();
        // Eliminamos la cookie del cliente
        res.clearCookie('idUsuario');
        res.redirect('/');
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

        if (!req.body.mail || !req.body.nombre || !req.body.fecha || !req.body.contrasena) { //para que salte error si está vacío algún campo
            return res.render('register', {
                errors: "El campo no puede estar vacío"
            });
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
    product: (req, res) => {
        let idProducto = req.params.id;
        const filtro = {
            include: [{
                    association: 'comentarioP',
                    include: 'Cuser',
                    order: [
                        ['createdAt', 'DESC']
                    ],
                },
                {
                    association: 'userP'
                },
                {
                    association: 'Fuser',
                }
            ],

        }
        db.Producto.findByPk(idProducto, filtro).then(resultado => {
            console.log(resultado.toJSON());
            res.render('product', {
                product: resultado
            })
        });
    },
    agregarComen: (req, res) => {
        db.Comentarios.create({
            mail: req.body.mail,
            id_producto: req.params.id,
            id_usuario: req.session.idUsuario

        }).then(comenAgregado => {
            res.redirect('/product/product/' + req.params.id)
        })
    },
    profile: (req, res) => {
        const filtro = {
            include: [
                {association: 'UserProdu'},
                {association: 'comentarioUser'}
            ]
        }
        db.Usuario.findByPk(req.params.id, filtro).then(resultado => {
            console.log(resultado.toJSON());
            res.render('profile', {
                usuario: resultado
            })
        })
    },
    profileUser: (req, res) => {
        console.log('hola');
        let filtro = {
            include: [
                {association: 'UserProdu'},
                {association: 'comentarioUser'}
            ]

        }

        db.Usuario.findByPk(req.session.idUsuario, filtro).then(resultado => {
            console.log(resultado.toJSON());
            res.render('profile', {
                usuario: resultado
            })
        })

    },
    productAdd: (req, res) => {
        res.render('product-add', {
            title: 'ProductAdd'
        });
    },

    profileEdit: (req, res) => {
        res.render('profile-edit', {
            title: 'ProfileEdit'
        });
    },

    editarGet: (req, res) => {
        db.Producto.findByPk(req.query.id).then(autoEdit => {
            res.render('productEdit', {
                autoEditado: autoEdit
            })
        })
    },
    editarPost: (req, res) => {
        db.Producto.update({
                nombre: req.body.nombre,
                descripcion: req.body.descripcion,
                fecha_creacion: req.body.fecha_creacion,
                image_URL: req.body.image_URL,
            }, {
                where: {
                    id: req.body.id
                }
            }).then(productomodificado => {
                res.redirect('/product/product/' + productomodificado.id);
            })
            .catch(error => console.log(error));
    },

};

module.exports = controller;