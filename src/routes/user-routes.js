const express = require("express");
const router = express.Router();
const userController = require("../controllers/user-controllers");
const authController = require("../controllers/auth-controller");

// router.post("/api/user", userController.validateUser, userController.addUser);

router.put(
    "/api/user/updatepassword",
    authController.validateToken,
    userController.changePassword
);

router.get(
    "/api/user/getsignedlessons",
    authController.validateToken,
    userController.getSignedLessons
);

router.get(
    "/api/user/getobtainedcompetencies",
    authController.validateToken,
    userController.getAchievedCompetencies
);

// router.get(
//     "/api/user",
//     authController.validateToken,
//     userController.getAllUsers
// );

// router.get(
//     "/api/user/profile",
//     authController.validateToken,
//     userController.getUserProfile
// );

// router.get(
//     "/api/user/:userID",
//     authController.validateToken,
//     userController.getUserById
// );

// router.put(
//     "/api/user/:userID",
//     authController.validateToken,
//     userController.validateUser,
//     userController.updateUser
// );

	router.post(
		"/api/user/",
	//     authController.validateToken,
		userController.validateUser,
		userController.createUser
	);

// router.delete(
//     "/api/user/:userID",
//     authController.validateToken,
//     userController.deleteUserById
// );
module.exports = router;
