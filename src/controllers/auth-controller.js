const req = require("express/lib/request");
const jwtSecretKey = process.env.JWT_Key;
const jwt = require("jsonwebtoken");
const dbconnection = require("../../database/dbconnection");
//TODO: add all inputs
const assert = require("assert");
const { use } = require("chai");
const bcrypt = require("bcrypt");

let authController = {
    login: (req, res) => {
        const email = req.body.emailAddress;
        const password = req.body.password;
        dbconnection.getConnection(function (err, connection) {
            if (err) {
                console.log(err);
            }

            connection.query(
                "SELECT ID, Password, IsFirstLogin FROM user WHERE Email = ?",
                [email],
                function (error, results, fields) {
                    connection.release;
                    if (error) {
                        console.log(error);
                    }
                    if (results.length < 1) {
                        res.status(400).json({
                            status: 400,
                            message: "Invalide inloggegevens",
                        });
                    } else {
                        bcrypt.compare(
                            password,
                            results[0].Password,
                            function (err, result) {
                                if (err) {
                                    console.log(err);
                                }
                                if (result) {
                                    const userID = results[0].ID;
                                    const payload = { id: userID };
                                    const isFirstLogin =
                                        results[0].IsFirstLogin[0];
                                    console.log(isFirstLogin);

                                    jwt.sign(
                                        payload,
                                        jwtSecretKey,
                                        { expiresIn: "7d" },
                                        function (err, token) {
                                            if (err) {
                                                console.log(error);
                                            }

                                            res.status(200).json({
                                                statusCode: 200,
                                                results: token,
                                                IsFirstLogin: isFirstLogin,
                                            });
                                        }
                                    );
                                } else {
                                    res.status(400).json({
                                        status: 400,
                                        message: "Invalide inloggegevens",
                                    });
                                }
                            }
                        );
                    }
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
                typeof user.emailAddress === "string",
                "Email must be a string"
            );
            assert(
                /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(
                    user.emailAddress
                ),
                "please enter a valid emailAddress"
            );
            assert(
                typeof user.password === "string",
                "password may not be empty"
            );
            assert(user.password.length > 0, "password may not be empty");

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
