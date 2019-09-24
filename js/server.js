// 引入模块
let express = require('express')
let mysql = require('mysql')

// 创建一个数据库链接
let dbConnect = mysql.createConnection({
    host:"192.168.97.251~",
    user: "root",
    password: "root",
    port:3306,
    database:"goods"
})
// 链接数据库
dbConnect.connect()

// 执行express方法
let app = express()

// 监听get地址
app.get("/index",function(req,res){  
    // 数据库查询
    
    dbConnect.query("select * from shop",function(err,data){
        // data为一个数组,内容为对象
        for(let item of data){
            console.log(item)
        }
        res.json({data})  
        
    })
    


        
    
})
// 监听端口
app.listen(3000)
