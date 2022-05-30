const req = require("express/lib/request");
const jwtSecretKey = process.env.JWT_Key;
const jwt = require("jsonwebtoken");
const dbconnection = require("../../database/dbconnection");
//TODO: add all inputs
const assert = require("assert");

let authController = {
    login: (req, res) => {
        dbconnection.getConnection(function (err, connection) {
            if (err) {
                console.log(err);
            }

            connection.query(
                "SELECT * FROM user",
                function (error, results, fields) {
                    connection.release;
                    if (error) {
                        console.log(error);
                    }

                    console.log(results);
                }
            );
        });
    },

    validateToken: (req, res, next) => {
        const authHeader = req.headers.authorization;
        if (!authHeader) {
            res.status(401).json({
                statusCode: 401,
                message: "Authorization header missing!",
            });
        } else {
            const token = authHeader.substring(7, authHeader.length);
            jwt.verify(token, jwtSecretKey, (err, payload) => {
                if (err) {
                    console.log(err);
                    res.status(401).json({
                        statusCode: 401,
                        message: "Invalid token",
                        dateTime: new Date().toISOString(),
                    });
                }
                if (payload) {
                    req.userID = payload.id;
                    next();
                }
            });
        }
    },

    validateLoginInfo: (req, res, next) => {
        user = req.body;

        try {
            assert(
                typeof user.emailAdress === "string",
                "Email must be a string"
            );
            assert(
                /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(
                    user.emailAdress
                ),
                "please enter a valid emailAdress"
            );
            assert(user.password.length > 0, "password may not be empty");

            console.log("made it through");
            next();
        } catch (err) {
            res.status(400).json({
                status: 400,
                message: err.message,
            });
        }
    },
};

module.exports = authController;
