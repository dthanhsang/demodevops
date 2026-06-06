const express = require('express');
const path = require('path');
const app = express();
const port = 3000;

app.use(express.static(path.join(__dirname, 'public')));

// Health check route
//app.get("/health", (req, res) => {
  //res.status(200).json({
    //status: "ok",
    //time: new Date()
 // });
//});
app.get("/health", (req, res) => {
  res.status(200).json({
   status: "fail"
  });
});//

app.listen(port, () => {
  console.log(`VPS Shop app listening at http://localhost:${port}`);
});