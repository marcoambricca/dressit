import express from "express";
import cors from "cors";
import UserRouter from "./src/controllers/user-controller.js"

const app = express();
const port = 3000;

app.use(cors());
app.use(express.json());

app.use("/api/users", UserRouter);

app.listen(port, () => {
    console.log("Listening on port 3000");
});