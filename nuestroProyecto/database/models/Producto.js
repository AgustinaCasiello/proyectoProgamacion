
module.exports = (sequelize, dataTypes) => {
    const Produ = sequelize.define('Producto', {
        id: {
            autoIncrement: true,
            primaryKey: true,
            type: dataTypes.INTEGER
        },
        nombre: {
            type: dataTypes.STRING
        },
        image_URL: {
            type: dataTypes.STRING
        },
        fecha_creacion: {
            type: dataTypes.DATE
        }, 
        id_usuario:{
            type: dataTypes.INTEGER
        },
        descripcion: {
            type: dataTypes.STRING
        },
    },{
        tableName: "productos",
        timestamps: false, //"By default, Sequelize will add the attributes createdAt and updatedAt to your model so you will be able to know when the database entry went into the db and when it was updated last."
    });

    return Produ; 
}
