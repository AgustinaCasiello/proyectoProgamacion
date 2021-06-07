let createError = require('http-errors');
let express = require('express');
let path = require('path');
let cookieParser = require('cookie-parser');
let logger = require('morgan');

let indexRouter = require('./routes/index');
let usersRouter = require('./routes/users');
let productsRouter = require('./routes/product');
let resultsRouter = require('./routes/results');

let app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');



app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

// Habilitamos a express a usar sesiones (req.session.abc)

const session = require('express-session');

app.use(session( {
  secret: "login Fasten",
	resave: false,
	saveUninitialized: true
}));

// Leer la cookie y loguear al usuario, si no esta logueado (no esta cargado en la sesion)

const db = require('./database/models');

app.use(function(req, res, next) {
  if(req.cookies.idUsuario && !req.session.usuario) {
    db.Usuario.findByPk(req.cookies.idUsuario).then(resultado => {
      req.session.usuario = resultado.nombre;
      return next();
    });
  } else {
  	return next();
  }}
);

// Cargamos variables en locals, para que puedan ser usadas en todas las vistas (por ej, logueado)

app.use(function(req, res, next) {
  if(req.session.usuario){
    res.locals = {
      logueado: true
    }
  } else {
    res.locals = {
      logueado: false
    }
  }

	return next();
});

app.use('/', indexRouter);
app.use('/', resultsRouter);
app.use('/users', usersRouter);
app.use('/product', productsRouter);



// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;