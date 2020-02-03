const express = require("express");
const router = express();
const config = require("./config");
const base_url = "http://" + config.IP + ":" + config.PORT + "/images/";
const category_url = "http://" + config.IP + ":" + config.PORT + "/images/category/";

router.post("/",(req,res) => {

    var data = {
        "code":"0",
        "message":"success",
        "data":{
            //banner轮播图片
            "slides": [{
                "image": base_url + "banner/1.jpeg",
                "goodsId": "001"
            },
                {
                    "image": base_url + "banner/2.jpeg",
                    "goodsId": "002"
                },
                {
                    "image": base_url + "banner/3.jpeg",
                    "goodsId": "003"
                },
                {
                    "image": base_url + "banner/4.jpeg",
                    "goodsId": "004"
                },
            ],

            //商品推荐上层
            "recommend": [
                {
                    "name": "法国代购新款江疏影同款翻领修身中长裙春夏印花连衣裙",
                    "image": base_url + "goods/001/cover.jpg",
                    "presentPrice": 98.88,
                    "goodsId": "001",
                    "oriPrice": 108.88
                }, {
                    "name": "柔美而精致~高贵而优雅~圆领金银丝春季毛衣羊毛开衫女短款白外套",
                    "image": base_url + "goods/002/cover.jpg",
                    "presentPrice": 229.90,
                    "goodsId": "002",
                    "oriPrice": 320.99
                }, {
                    "name": "明星同款高端西服2019春装新款韩版英伦风短款格子小西装女外套潮",
                    "image": base_url + "goods/003/cover.jpg",
                    "presentPrice": 318.88,
                    "goodsId": "003",
                    "oriPrice": 388.88
                }, {
                    "name": "复古廓形机车进口绵羊皮衣真皮外套女E142",
                    "image": base_url + "goods/004/cover.jpg",
                    "presentPrice": 238.99,
                    "goodsId": "004",
                    "oriPrice": 248.99
                }, {
                    "name": "单排扣高腰牛仔裤女春夏薄款紧身弹力小脚裤显瘦百搭网红浅色长裤",
                    "image": base_url + "goods/005/cover.jpg",
                    "presentPrice": 588.99,
                    "goodsId": "005",
                    "oriPrice": 888.88
                }, {
                    "name": "MIUCO女装夏季重工星星烫钻圆领短袖宽松显瘦百搭T恤上衣k",
                    "image": base_url + "goods/006/cover.jpg",
                    "presentPrice": 1028.88,
                    "goodsId": "006",
                    "oriPrice": 1888.88
                },
                {
                    "name": "春夏一步裙包臀裙开叉弹力修身显瘦短裙黑色高腰职业半身裙",
                    "image": base_url + "goods/007/cover.jpg",
                    "presentPrice": 2388.66,
                    "goodsId": "007",
                    "oriPrice": 2888.88
                }, {
                    "name": "夏季新款短袖圆领紧身小黑超短裙开叉包臀性感连衣裙夜店女装",
                    "image": base_url + "goods/008/cover.jpg",
                    "presentPrice": 666.88,
                    "goodsId": "008",
                    "oriPrice": 888.88
                },
            ],
            //商品中间广告
            "floor1Pic": {
                "PICTURE_ADDRESS": base_url + "advert/ad02.png",
                "TO_PLACE": "4"
            },
            //商品推荐底部
            "floor1": [{
                "image": base_url + "floor/1.png",
                "goodsId": "001"
            }, {
                "image": base_url + "floor/2.png",
                "goodsId": "002"
            }, {
                "image": base_url + "floor/3.png",
                "goodsId": "003"
            }, {
                "image": base_url + "floor/4.png",
                "goodsId": "004"
            }, {
                "image": base_url + "floor/5.png",
                "goodsId": "005"
            }],
            "category":
                [
                    {
                        "firstCategoryId": "1",
                        "firstCategoryName": "毛衣",
                        "secondCategoryVO": [{
                            "secondCategoryId": "11",
                            "firstCategoryId": "1",
                            "secondCategoryName": "羊绒",
                            "comments": ""
                        },
                        ],
                        "comments": null,
                        "image": category_url + "1.png"
                    },
                    {
                        "firstCategoryId": "2",
                        "firstCategoryName": "西服",
                        "secondCategoryVO": [{
                            "secondCategoryId": "21",
                            "firstCategoryId": "2",
                            "secondCategoryName": "小西服",
                            "comments": ""
                        }, {
                            "secondCategoryId": "22",
                            "firstCategoryId": "2",
                            "secondCategoryName": "职业装",
                            "comments": ""
                        },
                        ],
                        "comments": null,
                        "image": category_url + "2.png"
                    },
                    {
                        "firstCategoryId": "3",
                        "firstCategoryName": "皮衣",
                        "secondCategoryVO": [{
                            "secondCategoryId": "31",
                            "firstCategoryId": "3",
                            "secondCategoryName": "真皮皮衣",
                            "comments": ""
                        }, {
                            "secondCategoryId": "32",
                            "firstCategoryId": "3",
                            "secondCategoryName": "仿皮皮衣",
                            "comments": ""
                        }],
                        "comments": null,
                        "image": category_url + "3.png"
                    },
                    {
                        "firstCategoryId": "4",
                        "firstCategoryName": "连衣裙",
                        "secondCategoryVO": [{
                            "secondCategoryId": "41",
                            "firstCategoryId": "4",
                            "secondCategoryName": "半身裙",
                            "comments": ""
                        }, {
                            "secondCategoryId": "42",
                            "firstCategoryId": "4",
                            "secondCategoryName": "打底裙",
                            "comments": ""
                        },
                        ],
                        "comments": null,
                        "image": category_url + "4.png"
                    },
                    {
                        "firstCategoryId": "5",
                        "firstCategoryName": "牛仔裤",
                        "secondCategoryVO": [{
                            "secondCategoryId": "51",
                            "firstCategoryId": "5",
                            "secondCategoryName": "阔腿牛仔裤",
                            "comments": ""
                        }, {
                            "secondCategoryId": "52",
                            "firstCategoryId": "5",
                            "secondCategoryName": "紧身牛仔裤",
                            "comments": ""
                        }],
                        "comments": null,
                        "image": category_url + "5.png"
                    },
                    {
                        "firstCategoryId": "6",
                        "firstCategoryName": "T恤",
                        "secondCategoryVO": [{
                            "secondCategoryId": "61",
                            "firstCategoryId": "6",
                            "secondCategoryName": "印花T恤",
                            "comments": ""
                        }, {
                            "secondCategoryId": "62",
                            "firstCategoryId": "6",
                            "secondCategoryName": "字母T恤",
                            "comments": ""
                        },
                        ],
                        "comments": null,
                        "image": category_url + "6.png"
                    },
                    {
                        "firstCategoryId": "7",
                        "firstCategoryName": "运动装",
                        "secondCategoryVO": [{
                            "secondCategoryId": "71",
                            "firstCategoryId": "7",
                            "secondCategoryName": "春季运动装",
                            "comments": ""
                        }, {
                            "secondCategoryId": "72",
                            "firstCategoryId": "7",
                            "secondCategoryName": "秋季运动装",
                            "comments": ""
                        },
                        ],
                        "comments": null,
                        "image": category_url + "7.png"
                    },
                    {
                        "firstCategoryId": "8",
                        "firstCategoryName": "短裙",
                        "secondCategoryVO": [{
                            "secondCategoryId": "81",
                            "firstCategoryId": "8",
                            "secondCategoryName": "宽松",
                            "comments": ""
                        }, {
                            "secondCategoryId": "82",
                            "firstCategoryId": "8",
                            "secondCategoryName": "包臀",
                            "comments": ""
                        },
                        ],
                        "comments": null,
                        "image": category_url + "8.png"
                    },
                    {
                        "firstCategoryId": "9",
                        "firstCategoryName": "礼服",
                        "secondCategoryVO": [{
                            "secondCategoryId": "91",
                            "firstCategoryId": "9",
                            "secondCategoryName": "晚礼服",
                            "comments": ""
                        }, {
                            "secondCategoryId": "92",
                            "firstCategoryId": "9",
                            "secondCategoryName": "婚纱",
                            "comments": ""
                        },
                        ],
                        "comments": null,
                        "image": category_url + "9.png"
                    },
                    {
                        "firstCategoryId": "10",
                        "firstCategoryName": "风衣",
                        "secondCategoryVO": [{
                            "secondCategoryId": "101",
                            "firstCategoryId": "10",
                            "secondCategoryName": "中长款",
                            "comments": ""
                        }, {
                            "secondCategoryId": "102",
                            "firstCategoryId": "10",
                            "secondCategoryName": "长款",
                            "comments": ""
                        },
                        ],
                        "comments": null,
                        "image": category_url + "10.png"
                    },
                ],

        }
    };

    res.send(data);

});

module.exports = router;