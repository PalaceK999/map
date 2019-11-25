<%--
  Created by IntelliJ IDEA.
  User: 22950
  Date: 2019/11/25
  Time: 14:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>this is a title</title>
    <script src="http://code.jquery.com/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=S9f6GHogvKVwKFk2mZAwnpEslsjOe8cC"></script>
    <script type="text/javascript" src="http://api.map.baidu.com/library/AreaRestriction/1.2/src/AreaRestriction_min.js"></script>



    <style type="text/css">
        html, body {
            margin: 0;
            padding: 0;
        }
        #container {
            height: 600px;
        }
    </style>
</head>
<body>
<div id="container"></div>


<script type='text/javascript'>

    //需引用api.map.baidu.com/library/AreaRestriction/1.2/src/AreaRestriction_min.js
    var map = new BMap.Map("container",{ minZoom : 5,maxZoom:20 }); // 创建地图实例
    //设置个性化样式
    map.setMapStyle({
        styleJson:  [{
            "featureType": "road",
            "elementType": "all",
            "stylers": {
                "color": "#ffffff",
                "visibility": "off"
            }
        }]
    });
    map.enableScrollWheelZoom();
    map.enableDragging();
    map.disableDoubleClickZoom();


    var blist = [];
    var districtLoading = 0;

    /*
    =====获取行政区域边界=====
    */
    function getBoundary() {
        addDistrict("辽宁省");
        addDistrict("河北省");
        addDistrict("陕西省");
        addDistrict("江西省");
        addDistrict("石家庄");
        addDistrict("青岛");
    }

    /*
    =====添加行政区域=====
    */
    function addDistrict(districtName) {
        //使用计数器来控制加载过程
        districtLoading++;
        var bdary = new BMap.Boundary();
        bdary.get(districtName, function (rs) {       //获取行政区域
            var count = rs.boundaries.length; //行政区域的点有多少个
            for (var i = 0; i < count; i++) {
                blist.push({ points: rs.boundaries[i], name: districtName });
            }
            //加载完成区域点后计数器-1
            districtLoading--;
            if (districtLoading === 0) {
                //全加载完成后画端点
                drawBoundary();
            }
        });
    }

    /*

    =====绘制边界=====
    */
    function drawBoundary() {
        //包含所有区域的点数组
        var pointArray = [];
        //循环添加各闭合区域
        for (var i = 0; i < blist.length; i++) {
            //添加多边形层并显示
            var ply = new BMap.Polygon(blist[i].points, {
                strokeWeight: 1,   //边框宽度
                fillColor: "#2810f0" //填充颜色
            }); //建立多边形覆盖物
            ply.name = blist[i].name;
            map.addOverlay(ply);

            //将点增加到视野范围内
            var path = ply.getPath();
            pointArray = pointArray.concat(path);
        }

        map.setViewport(pointArray);    //调整视野
    }

    setTimeout(function () {
        getBoundary();
    }, 100);

</script>
</body>
</html>


