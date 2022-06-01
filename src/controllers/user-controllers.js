const req = require("express/lib/request");
const bcrypt = require('bcrypt');
const dbconnection = require("../../database/dbconnection");
const generator = require('generate-password');
//TODO: add all inputs
const assert = require("assert");
const { type } = require("express/lib/response");
const { doesNotMatch } = require("assert");

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
	}
};

module.exports = userController;
