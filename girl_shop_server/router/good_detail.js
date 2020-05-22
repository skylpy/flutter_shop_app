const express = require("express");
const router = express();
const config = require("./config");
var bodyParser = require('body-parser');
// 创建 application/x-www-form-urlencoded 编码解析
var urlencodedParser = bodyParser.urlencoded({extended:false});
const base_url = "http://" + config.IP + ":" + config.PORT + "/images/goods/";


router.post("/",urlencodedParser,(req,res) => {
	//const goodId = req.query.goodId;
	//console.log(goodId);
	var goodId = req.body.goodId;
	console.log(goodId);

	//商品详情
	var detail_001 = {
		"code": "0",
		"message": "success",
		"data": {
			"goodInfo": {
				"amount": 10000,
				"goodsId": "001",
				"image1": base_url + "001/cover.jpg",
				"goodsSerialNumber": "6901435325888",
				"oriPrice": 108.88,
				"presentPrice": 98.88,
				"shopId": "402880e860166f3c0160167897d60002",
				"goodsName": "法国代购新款江疏影同款翻领修身中长裙春夏印花连衣裙",
				"goodsDetail": '<img width="100%" height="auto" alt="" src="' + base_url + '001/1.jpg" />' +
					'<img width="100%" height="auto" alt="" src="' + base_url + '001/2.jpg" />' +
					'<img width="100%" height="auto" alt="" src="' + base_url + '001/3.jpg" />' +
					'<img width="100%" height="auto" alt="" src="' + base_url + '001/4.jpg" />' +
					'<img width="100%" height="auto" alt="" src="' + base_url + '001/5.jpg" />'
			}
		}
	};


	var detail_002 = {
		"code": "0",
		"message": "success",
		"data": {
			"goodInfo": {
				"amount": 10000,
				"goodsId": "002",
				"image1": base_url + "002/cover.jpg",
				"goodsSerialNumber": "6901435325888",
				"oriPrice": 320.99,
				"presentPrice": 229.90,
				"shopId": "402880e860166f3c0160167897d60002",
				"goodsName": "柔美而精致~高贵而优雅~圆领金银丝春季毛衣羊毛开衫女短款白外套",
				"goodsDetail": '<img width="100%" height="auto" alt="" src="' + base_url + '002/1.jpg" />' +
					'<img width="100%" height="auto" alt="" src="' + base_url + '002/2.jpg" />' +
					'<img width="100%" height="auto" alt="" src="' + base_url + '002/3.jpg" />' +
					'<img width="100%" height="auto" alt="" src="' + base_url + '002/4.jpg" />' +
					'<img width="100%" height="auto" alt="" src="' + base_url + '002/5.jpg" />'
			}
		}
	};


	var detail_003 = {
		"code": "0",
		"message": "success",
		"data": {
			"goodInfo": {
				"amount": 10000,
				"goodsId": "003",
				"image1": base_url + "003/cover.jpg",
				"goodsSerialNumber": "6901435325888",
				"oriPrice": 388.88,
				"presentPrice": 318.88,
				"shopId": "402880e860166f3c0160167897d60002",
				"goodsName": "明星同款高端西服2019春装新款韩版英伦风短款格子小西装女外套潮",
				"goodsDetail": '<img width="100%" height="auto" alt="" src="' + base_url + '003/1.jpg" />' +
					'<img width="100%" height="auto" alt="" src="' + base_url + '003/2.jpg" />' +
					'<img width="100%" height="auto" alt="" src="' + base_url + '003/3.jpg" />' +
					'<img width="100%" height="auto" alt="" src="' + base_url + '003/4.jpg" />' +
					'<img width="100%" height="auto" alt="" src="' + base_url + '003/5.jpg" />'
			}
		}
	};


	var detail_004 = {
		"code": "0",
		"message": "success",
		"data": {
			"goodInfo": {
				"amount": 10000,
				"goodsId": "004",
				"image1": base_url + "004/cover.jpg",
				"goodsSerialNumber": "6901435325888",
				"oriPrice": 248.99,
				"presentPrice": 238.99,
				"shopId": "402880e860166f3c0160167897d60002",
				"goodsName": "复古廓形机车进口绵羊皮衣真皮外套女E142",
				"goodsDetail": '<img width="100%" height="auto" alt="" src="' + base_url + '004/1.jpg" />' +
					'<img width="100%" height="auto" alt="" src="' + base_url + '004/2.jpg" />' +
					'<img width="100%" height="auto" alt="" src="' + base_url + '004/3.jpg" />' +
					'<img width="100%" height="auto" alt="" src="' + base_url + '004/4.jpg" />' +
					'<img width="100%" height="auto" alt="" src="' + base_url + '004/5.jpg" />'
			}
		}
	};



	var detail_005 = {
		"code": "0",
		"message": "success",
		"data": {
			"goodInfo": {
				"amount": 10000,
				"goodsId": "005",
				"image1": base_url + "005/cover.jpg",
				"goodsSerialNumber": "6901435325888",
				"oriPrice": 888.88,
				"presentPrice": 588.99,
				"shopId": "402880e860166f3c0160167897d60002",
				"goodsName": "单排扣高腰牛仔裤女春夏薄款紧身弹力小脚裤显瘦百搭网红浅色长裤",
				"goodsDetail": '<img width="100%" height="auto" alt="" src="' + base_url + '005/1.jpg" />' +
					'<img width="100%" height="auto" alt="" src="' + base_url + '005/2.jpg" />' +
					'<img width="100%" height="auto" alt="" src="' + base_url + '005/3.jpg" />' +
					'<img width="100%" height="auto" alt="" src="' + base_url + '005/4.jpg" />' +
					'<img width="100%" height="auto" alt="" src="' + base_url + '005/5.jpg" />'
			}
		}
	};


	var detail_006 = {
		"code": "0",
		"message": "success",
		"data": {
			"goodInfo": {
				"amount": 10000,
				"goodsId": "006",
				"image1": base_url + "006/cover.jpg",
				"goodsSerialNumber": "6901435325888",
				"oriPrice": 1888.88,
				"presentPrice": 1028.88,
				"shopId": "402880e860166f3c0160167897d60002",
				"goodsName": "MIUCO女装夏季重工星星烫钻圆领短袖宽松显瘦百搭T恤上衣k",
				"goodsDetail": '<img width="100%" height="auto" alt="" src="' + base_url + '006/1.jpg" />' +
					'<img width="100%" height="auto" alt="" src="' + base_url + '006/2.jpg" />' +
					'<img width="100%" height="auto" alt="" src="' + base_url + '006/3.jpg" />' +
					'<img width="100%" height="auto" alt="" src="' + base_url + '006/4.jpg" />' +
					'<img width="100%" height="auto" alt="" src="' + base_url + '006/5.jpg" />'
			}
		}
	};


	var detail_007 = {
		"code": "0",
		"message": "success",
		"data": {
			"goodInfo": {
				"amount": 10000,
				"goodsId": "007",
				"image1": base_url + "007/cover.jpg",
				"goodsSerialNumber": "6901435325888",
				"oriPrice": 2888.88,
				"presentPrice": 2388.66,
				"shopId": "402880e860166f3c0160167897d60002",
				"goodsName": "春夏一步裙包臀裙开叉弹力修身显瘦短裙黑色高腰职业半身裙",
				"goodsDetail": '<img width="100%" height="auto" alt="" src="' + base_url + '007/1.jpg" />' +
					'<img width="100%" height="auto" alt="" src="' + base_url + '007/2.jpg" />' +
					'<img width="100%" height="auto" alt="" src="' + base_url + '007/3.jpg" />' +
					'<img width="100%" height="auto" alt="" src="' + base_url + '007/4.jpg" />' +
					'<img width="100%" height="auto" alt="" src="' + base_url + '007/5.jpg" />'
			}
		}
	};


	var detail_008 = {
		"code": "0",
		"message": "success",
		"data": {
			"goodInfo": {
				"amount": 10000,
				"goodsId": "008",
				"image1": base_url + "008/cover.jpg",
				"goodsSerialNumber": "6901435325888",
				"oriPrice": 888.88,
				"presentPrice": 666.88,
				"shopId": "402880e860166f3c0160167897d60002",
				"goodsName": "夏季新款短袖圆领紧身小黑超短裙开叉包臀性感连衣裙夜店女装",
				"goodsDetail": '<img width="100%" height="auto" alt="" src="' + base_url + '008/1.jpg" />' +
					'<img width="100%" height="auto" alt="" src="' + base_url + '008/2.jpg" />' +
					'<img width="100%" height="auto" alt="" src="' + base_url + '008/3.jpg" />' +
					'<img width="100%" height="auto" alt="" src="' + base_url + '008/4.jpg" />' +
					'<img width="100%" height="auto" alt="" src="' + base_url + '008/5.jpg" />'
			}
		}
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
	}else if(goodId == '006'){
		goodDetail = detail_006
	}else if(goodId == '007'){
		goodDetail = detail_007
	}else if(goodId == '008'){
		goodDetail = detail_008
	}


	res.send(goodDetail);

});

module.exports = router;