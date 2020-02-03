const express = require("express");
const router = express();
const config = require("./config");
const category_url = "http://" + config.IP + ":" + config.PORT + "/images/category/";


router.post("/",(req,res) => {

    var data = {
        "code":"0",
        "message":"success",
        "data":[
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
        ]
    };

    res.send(data);

});

module.exports = router;