const req = require("express/lib/request");
const dbconnection = require("../../database/dbconnection");
//TODO: add all inputs
const assert = require("assert");
const { use } = require("chai");
const { type } = require("express/lib/response");

let shiftController = {
    validateInput: (req, res, next) => {
        const dateTestHelper = req.body.dateTime;
        const dateTest = new Date(dateTestHelper);
        const coordinatorID = req.body.coordinatorID;
        const description = req.body.description;
        try {
            assert(
                dateTest.getTime() == dateTest.getTime(),
                "dateTime must be a in a valid dateTime format (YYYY-MM-DD HH:MM:SS)"
            );
            assert(
                typeof coordinatorID === "number",
                "coordinatorID must be a number"
            );

            assert(
                typeof description === "string",
                "description must be a string"
            );
            next();
        } catch (err) {
            res.status(400).json({
                status: 400,
                message: err.message,
            });
        }
    },

    validateInputShiftSignup: (req, res, next) => {
        const shiftID = req.body.shiftID;
        const userID = req.body.userID;

        try {
            assert(typeof userID === "number", "userID must be a number");
            assert(typeof shiftID === "number", "shiftID must be a number");
            next();
        } catch (err) {
            res.status(400).json({
                status: 400,
                message: err.message,
            });
        }
    },

    createShift: (req, res) => {
        const coordinatorID = req.body.coordinatorID;
        const dateTimeHelper = req.body.dateTime;
        const dateTime = new Date(dateTimeHelper);

        const description = req.body.description;

        dbconnection.getConnection(function (err, connection) {
            if (err) {
                console.log(err);
                res.status(500).json({
                    status: 500,
                    message: "failed to connect to database",
                });
            } else {
                connection.query(
                    "INSERT INTO shift (CoordinatorID, DateTime, Description) VALUES (?,?,?)",
                    [coordinatorID, dateTime, description],
                    function (error, results, fields) {
                        connection.release();
                        if (error) {
                            console.log(error);
                            res.status(401).json({
                                status: 401,
                                message:
                                    "The coordinator must be an existing user",
                            });
                        } else {
                            res.status(200).json({
                                status: 200,
                                message: "shift created",
                            });
                        }
                    }
                );
            }
        });
    },

    signUpShift: (req, res) => {
        const shiftID = req.body.shiftID;
        const userID = req.body.userID;

        dbconnection.getConnection(function (err, connection) {
            if (err) {
                console.log(err);
                res.status(500).json({
                    status: 500,
                    message: "could not connect to database",
                });
            } else {
                connection.query(
                    "INSERT INTO user_shift VALUES (?, ?)",
                    [userID, shiftID],
                    function (error, results, fields) {
                        connection.release();
                        if (error) {
                            console.log(error);
                            res.status(400).json({
                                status: 400,
                                message: error.message,
                            });
                        } else {
                            res.status(200).json({
                                status: 200,
                                message: "user signed up for shift",
                            });
                        }
                    }
                );
            }
        });
    },
};

module.exports = shiftController;
