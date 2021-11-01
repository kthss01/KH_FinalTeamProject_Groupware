const express = require('express');
const path = require('path');

const app = express();

app.listen(process.env.PORT || 3000, () => {
  console.log("Server is running...");
});

// 정적파일 설정
app.use("/assets", express.static(path.resolve(__dirname, "assets")));
app.use("/dist", express.static(path.resolve(__dirname, "dist")));

// 일단 이건 놔두자 이렇게하면 의미 없는듯
// 어떤 요청이 들어오든 다 index.html로 전송
app.get("/*", (req, res) => {
  res.sendFile(path.resolve(__dirname, "calendar.html"));
});

