
module.exports = (sequelize, dataTypes) => {
    const Usuario = sequelize.define('Usuario', {
        id: {
            autoIncrement: true,
            primaryKey: true,
            type: dataTypes.INTEGER
        },
        nombre: {
            type: dataTypes.STRING,
            field: "nombre"
        },
        
       
    },{
        tableName: "usuarios",
        timestamps: false,
    });

    return Usuario; 
}