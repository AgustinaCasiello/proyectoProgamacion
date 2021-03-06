module.exports = (sequelize, dataTypes) => {
    const Comentario = sequelize.define('Comentario', {  
        id: {
            autoIncrement: true,
            primaryKey: true,
            type: dataTypes.INTEGER,
        },
        mail: {
            type: dataTypes.STRING,
        },
        foto: {
            type: dataTypes.STRING,
        },
        id_usuario: {
            type: dataTypes.INTEGER
        },
        id_producto: {
            type: dataTypes.INTEGER
        }

    },{
        tableName: "comentarios",
        timestamps: false, //"By default, Sequelize will add the attributes createdAt and updatedAt to your model so you will be able to know when the database entry went into the db and when it was updated last."
    });
    Comentario.associate = (db) => {
        Comentario.belongsTo(db.Producto, {
            as: 'Cprodu', //Para indicar como vamos a hacer referencia a esa relación más adelante, en donde querramos utilizarlo
            foreignKey: 'id_producto',
        });
        Comentario.belongsTo(db.Usuario,{
            as: 'Cuser',
            foreignKey: 'id_usuario',
        });
        
    };

    return Comentario; 
}