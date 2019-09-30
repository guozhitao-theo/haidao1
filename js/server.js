// 引入模块
let express = require('express')
let path = require("path")
let router = require("../router")
// 执行express方法
let app = express()
app.use(express.static(path.join(__dirname,'../upfile')))

app.all("*",function(req,res,nextfunction){
    res.header("Access-Control-Allow-Origin","*")
    res.header('Access-Control-Allow-Headers', 'Content-Type, Content-Length, Authorization, Accept, X-Requested-With , yourHeaderFeild');
    nextfunction()
})


// 监听get地址
app.get("/index",router.getLists) 
app.get("/class",router.getClass)
app.post("/addgoods",router.getAddgoods)

// 监听端口
console.log(3000)
app.listen(3000)
