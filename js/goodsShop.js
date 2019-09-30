// ajax请求

let goodsBox = $(".shops-goods-box")
console.log(goodsBox)
var shopHtml = ''
let imgurl = 'http://127.0.0.1:3000/'
$.ajax({
    url: imgurl+"index",
    type:"get",
    data:{

    },
    datatype:"json",
    success:function(res){
        // res是一个数组，循环数组得到里面的值
        // for(let item of res.data){
         
        //     // 通过模板字符串将数据渲染
            
        //     // 定义一个模板字符串
        //     shopHtml += `
        // <li class="shops-goods-content">
        //     <div>
        //         <input type="checkbox">
        //     </div>
        //     <div class="goods-num">${item.id}</div>
        //     <div class="goods-name">${item.name}</div>
        //     <div class="goods-classify text-hidden">${item.text}</div>
        //     <div class="goods-price">￥${item.price}</div>
        //     <div class="goods-stock">${item.stock}</div>
        //     <div class="goods-order">1</div>
        //     <div class="goods-up">对</div>
        //     <div class="goods-option"><a>修改</a> <a>删除</a></div>
        // </li>`

        // goodsBox.html(shopHtml)
        // }
        

        // 模板引擎template(需要渲染的ID ，要渲染的数据 )
        res.imgurl = imgurl
        var HTML = template('tablist',res)
        goodsBox.html(HTML)
        }
})

// 获取分类表数据
$.ajax({
    url:imgurl+"class",
    type:"get",
    datatype:"json",
    success:function(res){
        let goodsclassify = ''
        for(let item of res.data){
            goodsclassify += `<option value="${item.class_id}">${item.class_name}</option>`
        }
        $(".goodsClass").html(goodsclassify)
    }
})



// 添加的点击事件
$(".goods-add-btn").click(function(){
    let form = document.querySelector(".goods-add")
    
    let formdata = new FormData(form)
    console.log(formdata)
    $.ajax({
        url:imgurl+"addgoods",
        type:"post",
        data:formdata,
        datatype:"json",
        contentType:false,
        processData:false,
        success:function(res){
            console.log(res)
            if(status == 200){
                $(".modal-add").modal("hide")
            }
            
        }
    })
})






