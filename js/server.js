// 引入模块
let express = require('express')
let mysql = require('mysql')
let path = require('path')
let formidable = require("formidable")


// 创建一个数据库链接
let dbConnect = mysql.createConnection({
    host:"127.0.0.1",
    user: "root",
    password: "12345678",
    port:3306,
    database:"newshop"
})
// 链接数据库
dbConnect.connect()

// 执行express方法
let app = express()

app.use(express.static(path.join(__dirname,'../upfile')))



app.all("*",function(req,res,nextfunction){
    res.header("Access-Control-Allow-Origin","*")
    res.header('Access-Control-Allow-Headers', 'Content-Type, Content-Length, Authorization, Accept, X-Requested-With , yourHeaderFeild');
    nextfunction()
})


// 监听get地址
app.get("/index",function(req,res){  
    // 数据库查询
    
    dbConnect.query("select * from goods",function(err,data){
        // data为一个数组,内容为对象
        // for(let item of data){
        //     console.log(item.title)
        // }
        if(!err){
            res.json({
                status:200,
                data:data})  
        }else{
            res.json({
                status:200,
                data:{}
            })
        }
        
    // console.log(data)
    })
    
        
})

// 监听商品类型get 地址
app.get("/class",function(req,res){
    // 数据查询
    dbConnect.query("select * from class",function(err,data){
        if(!err){
            res.json({
                status:200,
                data:data})
        }else{
            res.json({
                status:500,
                data:{}
            })
        }  
    })
})


// 监听获得前端提交的数据
app.post("/addgoods",function(req,res){

    let form = new formidable.IncomingForm();


    // 设置图片上传的地址
    form.uploadDir = path.join(__dirname,'../upfile')
    // 是否保留文件的后缀名
    form.keepExtensions  = true
    // 解析参数
    form.parse(req,function(err,fields,files){
        // fields 除了上传图片的其他文件
        // files 上传的文件
        
        // console.log(files.img.path)
        // 获取上传的图片的额路径的文件名
        let imgbase =  path.parse(files.img.path).base

        // 将前端的文件写入数据库

        // 先定义一个数据库语句
        let sql = "insert into goods(id,title,price,brand,stock,class,detail,spu,img) values(?) "
        // 将前台的数据存为数组
        console.log(fields)
        let data = [fields.number,fields.name,fields.price,fields.brand,fields.stock,fields.class,fields.detials,fields.spu,imgbase]
        console.log(data)
        dbConnect.query(sql,[data],function(err,data){
            
            if(!err){
                res.json({
                    status:200,
                    data:''
                })
            }
            else{
                console.log(err)
            }
        })

    })
    
})


// 监听端口
console.log(3000)
app.listen(3000)
