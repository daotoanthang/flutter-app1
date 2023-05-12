const mongoose = require("mongoose");

const userSchema = mongoose.Schema({

  email: {
    required: true,
    type: String,
    // validate: {
    //   validator: (value) => {
    //     const re =
    //       /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
    //     value.match(re);
    //   },
    //   message: "Please enter a valid email address",
    // },
  },
  password: {
    required: true,
    type: String,
    // validate: {
    //   validator: (value) => {
    //     return value.length > 6;
    //   },
    //   message: "Please enter a long password",
    // },
  },
  address: {
    type: String,
    default: "",
  },
  type: {
    type: String,
    default: "user",
  },
});

const User = mongoose.model("User", userSchema);
module.exports = User;
