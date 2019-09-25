// 引入模块
let express = require('express')
let mysql = require('mysql')

// 创建一个数据库链接
let dbConnect = mysql.createConnection({
    host:"127.0.0.1",
    user: "root",
    password: "root",
    port:3306,
    database:"goods"
})
// 链接数据库
dbConnect.connect()

// 执行express方法
let app = express()
app.all("*",function(req,res,nextfunction){
    res.header("Access-Control-Allow-Origin","*")
    res.header('Access-Control-Allow-Headers', 'Content-Type, Content-Length, Authorization, Accept, X-Requested-With , yourHeaderFeild');
    nextfunction()
})


// 监听get地址
app.get("/index",function(req,res){  
    // 数据库查询
    
    dbConnect.query("select * from shop",function(err,data){
        // data为一个数组,内容为对象
        for(let item of data){
            console.log(data)
        }
        res.json({data})  
        
    })
    


        
    
})
// 监听端口
app.listen(3000)
