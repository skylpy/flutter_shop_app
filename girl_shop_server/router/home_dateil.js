const express = require("express");
const router = express();
const config = require("./config");
var bodyParser = require('body-parser');
// 创建 application/x-www-form-urlencoded 编码解析
var urlencodedParser = bodyParser.urlencoded({extended:false});
const base_url = "http://" + config.IP + ":" + config.PORT + "/images/homedetail/";


router.post("/",urlencodedParser,(req,res) => {
    //const goodId = req.query.goodId;
    //console.log(goodId);
    var goodId = req.body.goodId;
    console.log(goodId);

    //商品详情
    var detail_001 = {
        "code": "0",
        "message": "success",
        "data": [
            {
                "goodsId": "1001",
                "image1": base_url + "001_1.png",
                "goodsSerialNumber": "6901435325888",
                "shopId": "402880e860166f3c0160167897d60002",
                "goodsName": "商品",
            },
            {
                "goodsId": "1002",
                "image1": base_url + "001_2.png",
                "goodsSerialNumber": "6901435325888",
                "shopId": "402880e860166f3c0160167897d60002",
                "goodsName": "商品",
            }
        ]
    };


    var detail_002 = {
        "code": "0",
        "message": "success",
        "data": [
            {
                "goodsId": "2001",
                "image1": base_url + "002_1.png",
                "goodsSerialNumber": "6901435325888",
                "shopId": "402880e860166f3c0160167897d60002",
                "goodsName": "商品",
            },
            {
                "goodsId": "2002",
                "image1": base_url + "002_2.png",
                "goodsSerialNumber": "6901435325888",
                "shopId": "402880e860166f3c0160167897d60002",
                "goodsName": "商品",
            },
            {
                "goodsId": "2001",
                "image1": base_url + "002_1.png",
                "goodsSerialNumber": "6901435325888",
                "shopId": "402880e860166f3c0160167897d60002",
                "goodsName": "商品",
            },
            {
                "goodsId": "2002",
                "image1": base_url + "002_2.png",
                "goodsSerialNumber": "6901435325888",
                "shopId": "402880e860166f3c0160167897d60002",
                "goodsName": "商品",
            },
            {
                "goodsId": "2001",
                "image1": base_url + "002_1.png",
                "goodsSerialNumber": "6901435325888",
                "shopId": "402880e860166f3c0160167897d60002",
                "goodsName": "商品",
            },
            {
                "goodsId": "2002",
                "image1": base_url + "002_2.png",
                "goodsSerialNumber": "6901435325888",
                "shopId": "402880e860166f3c0160167897d60002",
                "goodsName": "商品",
            },
            {
                "goodsId": "2002",
                "image1": base_url + "002_2.png",
                "goodsSerialNumber": "6901435325888",
                "shopId": "402880e860166f3c0160167897d60002",
                "goodsName": "商品",
            },
            {
                "goodsId": "2001",
                "image1": base_url + "002_1.png",
                "goodsSerialNumber": "6901435325888",
                "shopId": "402880e860166f3c0160167897d60002",
                "goodsName": "商品",
            },
            {
                "goodsId": "2002",
                "image1": base_url + "002_2.png",
                "goodsSerialNumber": "6901435325888",
                "shopId": "402880e860166f3c0160167897d60002",
                "goodsName": "商品",
            }

        ]
    };


    var detail_003 = {
        "code": "0",
        "message": "success",
        "data": [
            {
                "goodsId": "3001",
                "image1": base_url + "003_1.png",
                "goodsSerialNumber": "6901435325888",
                "shopId": "402880e860166f3c0160167897d60002",
                "goodsName": "商品",
            },{
                "goodsId": "3001",
                "image1": base_url + "003_1.png",
                "goodsSerialNumber": "6901435325888",
                "shopId": "402880e860166f3c0160167897d60002",
                "goodsName": "商品",
            },{
                "goodsId": "3001",
                "image1": base_url + "003_1.png",
                "goodsSerialNumber": "6901435325888",
                "shopId": "402880e860166f3c0160167897d60002",
                "goodsName": "商品",
            }

        ]
    };


    var detail_004 = {
        "code": "0",
        "message": "success",
        "data": [
            {
                "goodsId": "4001",
                "image1": base_url + "004_1.png",
                "goodsSerialNumber": "6901435325888",
                "shopId": "402880e860166f3c0160167897d60002",
                "goodsName": "商品",
            },{
                "goodsId": "4001",
                "image1": base_url + "004_1.png",
                "goodsSerialNumber": "6901435325888",
                "shopId": "402880e860166f3c0160167897d60002",
                "goodsName": "商品",
            },{
                "goodsId": "4001",
                "image1": base_url + "004_1.png",
                "goodsSerialNumber": "6901435325888",
                "shopId": "402880e860166f3c0160167897d60002",
                "goodsName": "商品",
            },{
                "goodsId": "4001",
                "image1": base_url + "004_1.png",
                "goodsSerialNumber": "6901435325888",
                "shopId": "402880e860166f3c0160167897d60002",
                "goodsName": "商品",
            }
        ]
    };



    var detail_005 = {
        "code": "0",
        "message": "success",
        "data": [
            {
                "goodsId": "5001",
                "image1": base_url + "005_1.png",
                "goodsSerialNumber": "6901435325888",
                "shopId": "402880e860166f3c0160167897d60002",
                "goodsName": "商品",
            },{
                "goodsId": "5001",
                "image1": base_url + "005_1.png",
                "goodsSerialNumber": "6901435325888",
                "shopId": "402880e860166f3c0160167897d60002",
                "goodsName": "商品",
            },{
                "goodsId": "5001",
                "image1": base_url + "005_1.png",
                "goodsSerialNumber": "6901435325888",
                "shopId": "402880e860166f3c0160167897d60002",
                "goodsName": "商品",
            },{
                "goodsId": "5001",
                "image1": base_url + "005_1.png",
                "goodsSerialNumber": "6901435325888",
                "shopId": "402880e860166f3c0160167897d60002",
                "goodsName": "商品",
            },{
                "goodsId": "5001",
                "image1": base_url + "005_1.png",
                "goodsSerialNumber": "6901435325888",
                "shopId": "402880e860166f3c0160167897d60002",
                "goodsName": "商品",
            },{
                "goodsId": "5001",
                "image1": base_url + "005_1.png",
                "goodsSerialNumber": "6901435325888",
                "shopId": "402880e860166f3c0160167897d60002",
                "goodsName": "商品",
            }
        ]
    };





    var goodDetail = detail_001;
    if(goodId == '001'){
        goodDetail = detail_001;
    }else if(goodId == '002'){
        goodDetail = detail_002
    }else if(goodId == '003'){
        goodDetail = detail_003
    }else if(goodId == '004'){
        goodDetail = detail_004
    }else if(goodId == '005'){
        goodDetail = detail_005
    }


    res.send(goodDetail);

});

module.exports = router;