const express = require("express");
const router = express();
const config = require("./config");
const category_url = "http://" + config.IP + ":" + config.PORT + "/images/homecategory/";


router.post("/",(req,res) => {

    var data = {
        "code":"0",
        "message":"success",
        "data":[
            {
                "firstCategoryId": "001",
                "firstCategoryName": "推荐",
                "secondCategoryVO": [{
                    "secondCategoryId": "11",
                    "firstCategoryId": "1",
                    "secondCategoryName": "羊绒",
                    "comments": ""
                },
                ],
                "comments": null,
                "normalImage": category_url + "normal001_1.png",
                "selectedImage": category_url + "selected001_1.png"
            },
            {
                "firstCategoryId": "002",
                "firstCategoryName": "彩票",
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
                "normalImage": category_url + "normal001_2.png",
                "selectedImage": category_url + "selected001_2.png"
            },
            {
                "firstCategoryId": "003",
                "firstCategoryName": "棋牌",
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
                "normalImage": category_url + "normal001_3.png",
                "selectedImage": category_url + "selected001_3.png"
            },
            {
                "firstCategoryId": "004",
                "firstCategoryName": "电竞",
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
                "normalImage": category_url + "normal001_4.png",
                "selectedImage": category_url + "selected001_4.png"
            },
            {
                "firstCategoryId": "005",
                "firstCategoryName": "体育",
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
                "normalImage": category_url + "normal001_5.png",
                "selectedImage": category_url + "selected001_5.png"
            },

        ]
    };

    res.send(data);

});

module.exports = router;