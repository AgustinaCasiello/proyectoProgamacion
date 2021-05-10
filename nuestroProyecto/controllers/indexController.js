let autos = require('../products/nuestrosProductos');
let db = require('../database/models');
const Op = db.Sequelize.Op;

const controller = {
    index: (req, res) => {
        db.Producto.findAll({ 
            order: [
                ['nombre', 'ASC'],
              ],
            limit: 10 
        }
        ).then(resultado => {
            res.render('index', {autos: resultado});
        })
        .catch(error => {
            console.log(error)
        })
    },
    login: (req,res) => {
        res.render('login', {title: 'Login'});
    },
    register: (req,res) => {
        res.render('register');
    },
    product: (req,res) => {
        let idProducto = req.params.id; 
        autos.lista.forEach(element => {
            if (element.id == idProducto) {
                res.render('product',{product: element})
            } 
        });
    },
    profile: (req,res) => {
        res.render('profile', {autos: autos.lista});
    },
    productAdd: (req,res) => {
        res.render('product-add', {title: 'ProductAdd'});
    },
    search: (req,res) => {
        res.render('search-results', {autos: autos.lista});
    },
    profileEdit: (req,res) => {
        res.render('profile-edit', {title: 'ProfileEdit'});
    },
};
 
module.exports = controller; 