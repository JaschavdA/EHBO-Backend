const bcrypt = require("bcrypt");
const saltRounds = 10;
const myPlaintextPassword = "secret";
const someOtherPlaintextPassword = "not_bacon";

bcrypt.hash(myPlaintextPassword, saltRounds, function (err, hash) {
    // Store hash in your password DB.

    console.log(hash);
});

// bcrypt.compare(
//     myPlaintextPassword,
//     "$2b$10$XeeUbr9I0iFLfbRCFxJ8uuRTnhE5cBS6jOsW6mIFnT1Z8qe3Iz./y",
//     function (err, result) {
//         console.log(result);
//     }
// );
