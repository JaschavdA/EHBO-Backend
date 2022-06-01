const req = require("express/lib/request");
const bcrypt = require('bcrypt');
const dbconnection = require("../../database/dbconnection");
const generator = require('generate-password');
//TODO: add all inputs
const assert = require("assert");
const { type } = require("express/lib/response");
const { doesNotMatch } = require("assert");
const res = require("express/lib/response");
const { rmSync } = require("fs");
const saltRounds = 10;

let userController = {
	createUser(req, res){
		
		const name = req.body.name;
		const email = req.body.emailAddress;
        const password = generator.generate({
											length: 10,
											numbers: true
										});
		
		dbconnection.getConnection(function (err, connection) {
            if (err) {
                console.log(err);
            } else {
                bcrypt.hash(password, 10, function(error, hash) {
                    connection.query("INSERT INTO user (name, email, password) VALUES(?, ? , ?)",
                    [name, email, hash], function(queryError, results, fields) {
    

                        if(queryError) {
                            console.log("Create user aborted")
                            res.status(400).json({
                                status: 400,
                                 message: "this user already exists"})
                        } else {
                            res.status(200).json({
                                status: 200,
                                request: "Create user",
                            })
                        }
                    })                    
                })
            } 				
        });
	},
	validateUser(req, res, next){
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
                "please enter a valid emailAdress"
            );

            next();
        } catch (err) {
            res.status(400).json({
                status: 400,
                message: err.message,
            });
        }		
	},
    passWordRecovery: (req, res) => {
        const email = req.body.emailAddress;
    },

    //Updates and encrypts users password and sets the IsFirstLogin boolean to false.
    changePassword: (req, res) => {
        const newPassword = req.body.newPassword;
        const id = req.userID;

        dbconnection.getConnection(function (err, connection) {
            if (err) {
                res.status(500).json({
                    status: 500,
                    message: "Could not connect to database",
                });
            }

            bcrypt.hash(newPassword, saltRounds, function (err, hash) {
                connection.query(
                    "UPDATE user SET Password = ?, IsFirstLogin = 0 where ID = ?",
                    [hash, id],
                    function (error, results, fields) {
                        if (error) {
                            res.status(503).json({
                                status: 503,
                                message: "internal server error",
                            });
                        } else {
                            res.status(201).json({
                                status: 201,
                                message: "password has been updated",
                            });
                        }
                    }
                );
            });
        });
    },

    //Possible queryparameter is showOldLessons = 1 (true) or 0 (false)
    getSignedLessons: (req, res) => {
        const queryParams = req.query;
        const { hideOldLessons } = queryParams;
        const id = req.userID;

        let queryString =
            "SELECT * FROM lesson WHERE LessonID IN (SELECT LessonID FROM user_lesson WHERE UserID = ?)";

        if (hideOldLessons && hideOldLessons == 1) {
            queryString += "AND DateTime > now()";
        }

        dbconnection.getConnection(function (err, connection) {
            if (err) {
                console.log(err);
            } else {
                connection.query(
                    queryString,
                    [id],
                    function (error, results, fields) {
                        if (error) {
                            console.log(error);
                        } else {
                            res.status(200).json({
                                status: 200,
                                result: results,
                            });
                        }
                    }
                );
            }
        });
    },

    getAchievedCompetencies: (req, res) => {
        const id = req.userID;
        dbconnection.getConnection(function (err, connection) {
            if (err) {
                console.log(err);
            } else {
                connection.query(
                    "SELECT diploma_competency.CompetencyID, competency.Name, competency.Description, diploma_competency.DateObtained FROM diploma_competency JOIN competency ON diploma_competency.CompetencyID = competency.ID WHERE UserID = ?;",
                    [id],
                    function (error, results, fields) {
                        if (error) {
                            res.status(500).json({
                                status: 500,
                                message: "internal server error",
                            });
                        } else {
                            res.status(200).json({
                                status: 200,
                                result: results,
                            });
                        }
                    }
                );
            }
        });
    },
};


module.exports = userController;
