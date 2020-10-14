const express = require("express");
const path = require("path");
const app = express();

app.use(express.static(path.resolve(__dirname,"public")));

app.use(function(req,res,next){
    const proxy = req.query.proxy;
    if(proxy){
        req.header.cookie = req.header.cookie + `__proxy__${proxy}`;
    }
    next();
});

//获取数据 路由到不同的数据接口

app.use("/getTestData",require("./router/test"));
app.use("/getHomePageContent",require("./router/home_page_content"));
app.use("/getHotGoods",require("./router/hotgoods"));
app.use("/getCategory",require("./router/category"));
app.use("/getCategoryGoods",require("./router/category_goods"));
app.use("/getGoodDetail",require("./router/good_detail"));
app.use("/getHomeCategory",require("./router/homecategory"));
app.use("/getHomeDetail",require("./router/home_dateil"));

const port = process.env.PORT || 3000;
app.listen(port,()=>{
    console.log(`server running @http://localhost:${port}`);
});

module.exports = app;