const { DataTypes, Model } = require('sequelize');
const sequelize = require('../../config/database');

class User extends Model { }

User.init({
    username: {
        type: DataTypes.STRING,
        allowNull: false,
        validate: {
            notEmpty: true
        }
    },
    password: {
        type: DataTypes.STRING,
        allowNull: false,
        validate: {
            notEmpty: true
        }
    }
}, {
    sequelize,
    modelName: 'User',
    tableName: 'users'
});

module.exports.User = User;