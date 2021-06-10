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
        }
        ).then(resultado => {
            res.render('index', {autos: resultado});
        })
        .catch(error => {
            console.log(error)
        })



    },
    buscar: (req, res) => {
        let filtro = {
            where: {
                nombre: {[Op.like]:'%' + req.query.search + '%'}
            }            
        }

        db.Producto.findAll(filtro).then(resultado => {
            res.render('search-results', {lista: resultado});
        });

    },
    crear: (req, res) => {
        db.Producto.create({
            nombre: req.body.nombre,
            descripcion: req.body.descripcion,
            fecha_creacion : req.body.fecha_creacion,
            image_URL: req.body.image_URL,
        }).then(productoAgregado => {
            res.redirect('/product/product/' + productoAgregado.id)
        }) 
    },
    borrar: (req, res) => {
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
            res.redirect('http://localhost:3000/')
        })
        .catch(error => console.log(error));
    },
    login: (req,res) => {
        res.render('login');
    },
    loginFiltrado: (req, res) => {

        const filtro = {
            where: {
            text : req.body.text
            }
        }
        db.Usuario.findOne(filtro).then(usuario => {
            if(bcrypt.compareSync(req.body.contrasena, usuario.contrasena)){
                req.session.usuario = usuario.text;
                req.session.userId = usuario.id;
                req.session.nombre = usuario.nombre;
                console.log("la contrasena esta bien");
                if(req.body.recordar){
                    res.cookie('idUsuario', usuario.id, { maxAge: 1000 * 60 * 5 });
                    
                }
            }
            res.redirect('/');
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

    register: (req,res) => {
        res.render('register');
    },
    registerPost : (req,res)=> {
        let cEncriptada = bcrypt.hashSync(req.body.contrasena);

        db.Usuario.create({
            nombre : req.body.nombre,
            text : req.body.text,
            fecha : req.body.fecha,
            contrasena : cEncriptada
        }).then (usuario =>{
            res.redirect('/');
        });
    },
    product: (req,res) => {
        let idProducto = req.params.id; 
       db.Producto.findByPk(idProducto).then(resultado =>{
        res.render('product', {product: resultado})
        });
    },
    profile: (req,res) => {
        if (req.session.usuario) {
            res.render('profile', {usuario: req.session.usuario}); //{autos: autos.lista}

        } else {
            res.render('profile', {usuario: "no registrado"}); //{autos: autos.lista}
 
        }
    },
    productAdd: (req,res) => {
        res.render('product-add', {title: 'ProductAdd'});
    },

    profileEdit: (req,res) => {
        res.render('profile-edit', {title: 'ProfileEdit'});
    },
    
    editarGet : (req,res) => {
        db.Producto.findByPk(req.query.id).then(autoEdit =>{
            res.render ('productEdit',{autoEditado: autoEdit})
        })
    },
    editarPost : (req, res) => {
        db.Producto.update({
            nombre: req.body.nombre,
            descripcion: req.body.descripcion,
            fecha_creacion : req.body.fecha_creacion,
            image_URL: req.body.image_URL,
        },{
            where: {
                id: req.body.id
            }
        }).then(productomodificado=> {
            res.redirect('/product/product/' + productomodificado.id);
        })
        .catch(error => console.log(error));
    },

};
 
module.exports = controller;