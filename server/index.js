const express = require("express");
const mongoose = require("mongoose");
const PORT = 8000;
const app = express();
const cors = require("cors");
const helmet = require("helmet");

const authRouter = require("./routes/auth");
const DB =
  "mongodb+srv://khoahoccuathang2021:khoahoccuathang2021@cluster0.2elz1zn.mongodb.net/";
// const DB =
//   "mongodb+srv://thanhcong123976:thanhcong123976@cluster0.i54uikx.mongodb.net/";

app.use(express.json());
app.use(authRouter);

// app.use(
//   cors({
//     origin: "http://localhost:8080",
//     credentials: true,
//     optionSuccessStatus: 200,
//   })
// );
app.use(helmet({ crossOriginResourcePolicy: false }));

//connection
mongoose
  .connect(DB)
  .then(() => {
    console.log("connect success");
  })
  .catch((e) => {
    console.log(e);
  });

app.listen(PORT, () => {
  console.log(`connect to port ${PORT}`);
});
