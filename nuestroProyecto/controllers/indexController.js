let autos = require('../products/nuestrosProductos');
let db = require('../database/models');
const Op = db.Sequelize.Op;

const controller = {
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
            image_URL: req.body.image_URL,
        }).then(productoAgregado => {
            res.redirect('/product/' + productoAgregado.id)
        }) 
    },
    borrar: (req, res) => {
        db.Producto.destroy({
            where: {
                id: req.body.id,
            }
        })//.then(() => {
            //let alerta = prompt("¿Seguro de que deseas eliminar el producto?");
            //if(alerta == null || alerta == "")
        //})
        .then(() => {
            res.redirect('/')
        }).catch(error => console.log(error));
    },
    login: (req,res) => {
        res.render('login', {title: 'Login'});
    },
    register: (req,res) => {
        res.render('register');
    },
    product: (req,res) => {
        let idProducto = req.params.id; 
       db.Producto.findByPk(idProducto).then(resultado =>{
        res.render('product', {product: resultado})
        });
    },
    profile: (req,res) => {
        res.render('profile', {autos: autos.lista});
    },
    productAdd: (req,res) => {
        res.render('product-add', {title: 'ProductAdd'});
    },

    profileEdit: (req,res) => {
        res.render('profile-edit', {title: 'ProfileEdit'});
    },
};
 
module.exports = controller; 