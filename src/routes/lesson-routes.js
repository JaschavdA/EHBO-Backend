const express = require("express");
const router = express.Router();
const lessonController = require("../controllers/lesson-controller");
const authController = require("../controllers/auth-controller");

router.get(
    "/api/lesson",
    authController.validateToken,
    lessonController.getAllLessons
);

router.get(
    "/api/lesson/:lessonID",
    authController.validateToken,
    lessonController.getLessonsByLessonID
);

module.exports = router;
