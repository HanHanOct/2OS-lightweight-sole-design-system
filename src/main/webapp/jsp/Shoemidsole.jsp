<%--
  Created by IntelliJ IDEA.
  User: WZL
  Date: 2023/2/1
  Time: 14:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <title>3D定制模型-鞋中底</title>
    <script type="text/javascript" src=""></script>
    <script src="../layui-v2.6.8/layui/layui.js"></script>
    <link rel="stylesheet" href="../layui-v2.6.8/layui/css/layui.css"
          media="all">
    <style>
        body,
        html {
            background: rgb(242, 246, 251);
            margin: 0;
            padding: 0;
        }

        /*  */

        li {
            list-style: none;
        }

        /*导航栏通栏背景*/
        .bg {
            position: relative;
            border-bottom: 1px solid #383E48;
            background-color: rgba(56, 62, 72);
        }

        img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .nav {
            margin: 0 auto;
            width: 100%;
            min-width: 910px;
            height: 70px;
            /* background-color: #383E48; */
            background: rgb(39, 46, 59);
            box-shadow: 0px 2px 7px rgba(0, 21, 41, 0.09);
            position: fixed;
            top: 0;
            z-index: 100001;
        }

        .drop {
            position: absolute;
            top: 70px;
            width: 100%;
            height: 0;
            /* background-color: rgba(56, 62, 72); */
            background: rgb(39, 46, 59);
            box-shadow: 0px 2px 7px rgba(0, 21, 41, 0.09);
            transition: height .5s ease;
        }

        /*  */
        .sub-nav {
            position: absolute;
            width: 100%;
            z-index: 3;
            transition: all .3s ease;
            overflow: hidden;
            box-sizing: border-box;
        }

        .sub-nav-inner {
            margin: 0 auto;
            overflow: hidden;
            zoom: 1;
            padding: 15px 0 10px 20px;
        }

        .down-nav {
            float: left;
            display: inline;
            width: 100px;
            padding: 0px 50px 0;
            text-align: center;
            white-space: nowrap;
        }

        .down-nav-a {
            height: 20px;
            line-height: 20px;
            display: block;
            padding: 0;
            font-size: 14px;
            color: #ffffff;
        }

        .nav ul {
            width: 90%;
            margin-left: -80px;
        }

        .nav li {
            float: left;
        }

        .nav a {
            display: block;
            height: 30px;
            line-height: 30px;
            color: #7D8086;
            font-size: 14px;
            text-decoration: none;
            text-align: center;
            font-family: AlibabaPuHui-light;
        }

        .nav a:hover {
            color: #ffffff;
            font-size: 14px;
            border-bottom: solid 3px #03CED5;
        }

        .logopic a:hover{
            color: #ffffff;
            font-size: 14px;
            border:none;
        }

        .down-nav a:hover {
            color: #03CED5;
            border: none;
        }

        /*鼠标经过bg盒子 让drop高度变高*/
        .nav li:hover .drop {
            height: 120px;
            /* background-color: rgba(56, 62, 72); */
            background: rgb(39, 46, 59);
            box-shadow: 0px 2px 7px rgba(0, 21, 41, 0.09);
        }

        .navLogo1 {
            float: right;
        }

        .navLogo2 {
            display: none;
        }

        @media screen and (max-width:1300px) {
            .navLogo1 {
                display: none;
            }

            .navLogo2 {
                display: block;
                float: right;
            }
        }

        .box {
            margin: auto;
            width: 100%;
            line-height: 20px;
            background-color: rgba(230, 230, 230);
            background: rgb(242, 246, 251);
        }

        .logo {
            width: 183px;
            background: url("${pageContext.request.contextPath }/resource/webLogo.png") no-repeat 0;
            background-size: contain;
        }

        .totalbox {
            width: 1440px;
            height: 2024px;
            margin: auto;
            /* background-color: #fff; */
        }

        .box1 {
            margin-top: 89px;
            width: 100%;
            height: 537px;
            background-color: #ECECEC;
        }

        .divleft1 {
            float: left;
            width: 445px;
            height: 350px;
            margin-left: 97px;
            margin-top: 107px;
            /* background-color: red; */
        }

        .divleft1 h2 {
            font-weight: normal;
            margin-bottom: 0;
            padding-left: 10px;
            width: 315px;
            height: 35px;
            line-height: 35px;
            color: rgba(16, 16, 16, 100);
            font-size: 24px;
            text-align: left;
            font-family: AlibabaPuHui-regular;
            border-left: 5px solid #03CED5;
        }

        .divleft1 h4 {
            font-weight: normal;
            margin-top: 20px;
            margin-left: 15px;
            width: 418px;
            height: 297px;
            color: rgba(121, 119, 119, 100);
            font-size: 15px;
            text-align: left;
            font-family: SourceHanSansSC-regular;
        }

        .divright1 {
            width: 786px;
            height: 578px;
            float: left;
            margin-left: 103px;
            margin-top: -20px;
            /* background-color: skyblue; */
        }

        .divright1 img {
            width: 100%;
            height: 100%;
        }

        .conceptualDesign {
            float: left;
            margin-left: 124px;
            margin-top: 30px;
            width: 195px;
            height: 72px;
            line-height: 72px;
            border-radius: 15px 15px 15px 15px;
            background-color: rgba(3, 206, 213, 100);
            color: #ffffff;
            font-size: 22px;
            text-align: center;
            font-family: Roboto;
        }

        .layui-nav {
            background-color: rgba(3, 206, 213);
            border-radius: 15px 15px 15px 15px;
            color: #ffffff;
        }

        .layui-nav-item a {
            line-height: 72px;
            height: 72px;
            color: #ffffff;
            font-size: 22px;
        }

        .layui-nav-child {
            margin-left: -35px;
            width: 195px;
            background-color: #fbfbfb;
            color: #9d9399;
            padding: 0;
        }

        .layui-nav .layui-nav-item a {
            color: rgba(255, 255, 255, .90);
        }

        .layui-nav .layui-nav-child a {
            height: 40px;
            line-height: 40px;
            color: #9d9399;
        }

        .layui-nav .layui-nav-child a:hover {
            background-color: rgba(3, 206, 213, .4);
        }

        .box2 {
            width: 100%;
            height: 676px;
            background-color: #ffffff;
            /* background-color: red; */
        }

        .divleft2 {
            float: left;
            margin-left: -198px;
            margin-top: 111px;
            width: 455px;
            height: 455px;
            /* background-color: red; */
        }

        .divright2 {
            float: left;
            height: 455px;
            width: 650px;
            margin-left: 129px;
            margin-top: 140px;
            /* background-color: skyblue; */
        }

        .box3 {
            width: 100%;
            height: 664px;
            padding-top: 100px;
            background-color: #F3F3F3;
            text-align: center;
        }

        .processContent {
            width: 266px;
            height: 100px;
            margin: auto;
            /* background-color: red; */
        }

        .processContent h2 {
            height: 56px;
            line-height: 56px;
            color: rgba(64, 64, 64);
            font-size: 30px;
            text-align: center;
            font-family: SourceHanSansSC-regular;
        }

        .processContent h4 {
            height: 20px;
            line-height: 20px;
            color: rgba(107, 107, 107);
            font-size: 14px;
            text-align: center;
            font-family: SourceHanSansSC-regular;
        }

        .icon span {
            float: left;
            display: block;
            width: 174px;
            height: 114px;
            margin-top: 120px;
            margin-left: 5px;
            padding-top: 40px;

        }

        .icon span li {
            color: rgba(81, 81, 81);
            font-size: 18px;
            font-family: SourceHanSansSC-regular;
        }

        .experience {
            margin-top: 400px;
        }

        .footer {
            position: absolute;
            /*left: 50%;*/
            /*margin-top: -46px;*/
            /*margin-left: -720px;*/
            height: 50px;
            width: 100%;
            background-color: #333333;
            color: #ffffff;
            text-align: center;
            line-height: 50px;
        }
    </style>
</head>

<body>
<div class="box">
    <div class="bg">
        <div class="nav">
            <ul>
                <li style="text-align: center;" class="logopic"><a href="${pageContext.request.contextPath }/jsp/frame.jsp" target="_self" class="logo"
                                                   style="margin-left:100px;height: 67px;line-height: 67px;"></a>
                </li>
                <li style="text-align: center;"><a href="#" target="_self"
                                                   style="margin-left:100px;height: 67px;line-height: 67px;">应用解决示例</a>
                    <div class="sub-nav drop" style="margin-left:-203px;">
                        <ul class="sub-nav-inner" style="padding-left:327px;">
                            <li class="down-nav">
                                <a href="${pageContext.request.contextPath }/jsp/Shoemidsole.jsp" target="_self">鞋中底解决示例</a>
                                <a href="${pageContext.request.contextPath }/jsp/shoePad.jsp" target="_self" class="down-nav-a">鞋垫解决示例</a>
                            </li>
                        </ul>
                    </div>
                </li>
                <li style="text-align: center;"><a href="#" target="_self"
                                                   style="margin-left:100px;height: 67px;line-height: 67px;">轻量化鞋垫定制模型</a>
                    <div class="sub-nav drop" style="margin-left:-387px;">
                        <ul class="sub-nav-inner" style="padding-left:530px;">
                            <li class="down-nav">
                                <a href="${pageContext.request.contextPath }/forwardToSole" target="_self">3d模型生成</a>
                                <a href="${pageContext.request.contextPath }/forwardToSole" target="_self">3d鞋垫模型生成</a>
                            </li>
                        </ul>
                    </div>
                </li>
                <li style="text-align: center;"><a href="#" target="_self"
                                                   style="margin-left:100px;height: 67px;line-height: 67px;">轻量化鞋中底定制模型</a>
                    <div class="sub-nav drop" style="margin-left:-613px;">
                        <ul class="sub-nav-inner" style="padding-left:763px;">
                            <li class="down-nav">
                                <a href="${pageContext.request.contextPath }/forwardToSole" target="_self">3d模型生成</a>
                                <a style="margin-left: -7px;" href="${pageContext.request.contextPath }/forwardToSole" target="_self">3d鞋中底模型生成</a>
                            </li>
                        </ul>
                    </div>
                </li>
                <li class="navLogo2" style="text-align: center;"><a href="#" target="_self"
                                                                    style="margin-left:100px;height: 67px;line-height: 67px;">我的</a>
                    <div class="sub-nav drop" style="margin-left:-590px;">
                        <ul class="sub-nav-inner" style="padding-left:685px;">
                            <li class="down-nav">
                                <a href="${pageContext.request.contextPath }/forwardToPersonalCenterServlet" target="_self">个人中心</a>
                                <a href="${pageContext.request.contextPath }/login.jsp" target="_self">退出登录</a>
                            </li>
                        </ul>
                    </div>
                </li>
                <li class="navLogo1" style="float:right;margin-right:-155px;"><a href="${pageContext.request.contextPath }/forwardToPersonalCenterServlet"
                                                                                 style="margin-top: 10px;height: 48px;line-height: 68px;">
                    <img style="object-fit:none;" src="${pageContext.request.contextPath }/resource/user.png" alt="图片无法显示"></a></li>
                <li class="navLogo1" style="float:right;margin-right: -195px;"><a href="${pageContext.request.contextPath }/login.jsp"
                                                                                  style="margin-top: 10px;height: 48px;line-height: 68px;">
                    <img style="object-fit:none;" src="${pageContext.request.contextPath }/resource/close.png" alt="图片无法显示"></a></li>
            </ul>
        </div>
    </div>
    <div class="totalbox">
        <div class="box1">
            <div class="divleft1">
                <h2>轻量化鞋中底解决示例</h2>
                <h4 style="line-height:1.8em;">
                    近些年，随着公民健身意识不断增强，跑步健身逐渐成为公众关注的热点，这也使就得运动鞋的需求不断增长。
                    也随着3D打印技术的出现和发展，使得具有复杂结构，符合人体脚部曲线，具有良好回弹性能的鞋底结构能够
                    快速制造出来。我们将符合使用者脚部受力情况的多孔结构填充运动鞋中底，为使用者提供最合理的力学反馈，
                    来支持其技术动作的完成，设计的目标就是要优化鞋中底的填充结构来实现鞋中底的轻量化，并且结合打印技术
                    ，来实现打造一款真正具有个性化定制效果的运动鞋。
                </h4>
            </div>
            <div class="divright1">
                <img src="../resource/snapshot01.png" alt="图片无法显示">
            </div>
            <div class="conceptualDesign">
                <span>
                        <ul class="layui-nav">
                            <li class="layui-nav-item">
                                <a href="#">方案设计</a>
                                <dl class="layui-nav-child">
                                    <dd><a href="${pageContext.request.contextPath }/jsp/Shoemidsole.jsp">鞋中底</a></dd>
                                    <dd><a href="${pageContext.request.contextPath }/jsp/shoePad.jsp">鞋垫</a></dd>
                                </dl>
                            </li>
                        </ul>
                    </span>
            </div>
        </div>
        <div class="box2">
            <div class="divleft2">
                <div class="layui-carousel" id="test1" lay-filter="test1" style="background-color:#ffffff;">
                    <div carousel-item="" style="border-radius:50%;">
                        <div class="shoes">
                            <img src="../resource/snapmidshot01.png" alt="图片无法显示">
                        </div>
                        <div class="shoes">
                            <img src="../resource/snapmidshot02.png" alt="图片无法显示">
                        </div>
                        <div class="shoes">
                            <img src="../resource/snapmidshot03.png" alt="图片无法显示">
                        </div>
                    </div>
                </div>
            </div>
            <div class="divright2">
                <div id="timeLine">
                    <ul class="layui-timeline">
                        <li class="layui-timeline-item">
                            <i class="layui-icon layui-timeline-axis" style="color:#0052D9"></i>
                            <div class="layui-timeline-content layui-text">
                                <div class="layui-timeline-title"
                                     style="color:rgba(16, 16, 16, 0.9);font-size: 16px;">
                                    自主上传照片</div>
                                <div class="layui-timeline-title">
                                        <span style="color:rgba(16, 16, 16, 0.6);font-size: 14px;">
                                            可利用前置摄像头扫描脚部，将脚底部分照片上传网站。<br><br><br><br>
                                        </span>
                                </div>
                            </div>
                        </li>
                        <li class="layui-timeline-item">
                            <i class="layui-icon layui-timeline-axis" style="color:#0052D9"></i>
                            <div class="layui-timeline-content layui-text">
                                <div class="layui-timeline-title"
                                     style="color:rgba(16, 16, 16, 0.9);font-size: 16px;">
                                    定制3D模型
                                </div>
                                <div class="layui-timeline-title">
                                        <span style="color:rgba(16, 16, 16, 0.6);font-size: 14px;">
                                            系统将根据用户的脚部形状和应力数据生成更加符合人体脚部的模型，并在此基础上通过对基础鞋
                                        </span>
                                </div>
                                <div class="layui-timeline-title">
                                        <span style="color:rgba(16, 16, 16, 0.6);font-size: 14px;">
                                            垫模型进行多孔结构形状和壁厚调整，使得设计的矫形鞋垫能够更加贴合人体脚部，给予足底充分
                                        </span>
                                </div>
                                <div class="layui-timeline-title">
                                        <span style="color:rgba(16, 16, 16, 0.6);font-size: 14px;">
                                            透气的良好生物环境，减少由于过湿、过热等情况引起的额外病变可能，并且能够对载荷进行充分
                                        </span>
                                </div>
                                <div class="layui-timeline-title">
                                        <span style="color:rgba(16, 16, 16, 0.6);font-size: 14px;">
                                            分压，减少由于局部化的冲击、挤压、摩擦力导致的病变可能。对于已经产生溃疡的用户， 不同的
                                        </span>
                                </div>
                                <div class="layui-timeline-title">
                                        <span style="color:rgba(16, 16, 16, 0.6);font-size: 14px;">
                                            区域设计方式增加了接触处的柔软度，极大减少了走动时的不适感。<br>
                                        </span>
                                </div>
                            </div>
                        </li>
                        <li class="layui-timeline-item">
                            <i class="layui-icon  layui-icon-circle-dot layui-timeline-axis"
                               style="color:#0052D9; display:inline-block;"></i>
                            <div class="layui-timeline-content layui-text">
                                <div class="layui-timeline-title" style="color:#0052D9;font-size: 16px;">
                                    工厂交付打印
                                </div>
                                <div class="layui-timeline-title">
                                        <span
                                                style="color:rgba(16, 16, 16, 0.6);font-size: 14px;">智能工厂将鞋中底数据模型自动分配到相应的打印设备，添加料液后即可进行打印，仅需几个小</span>
                                </div>
                                <div class="layui-timeline-title">
                                        <span
                                                style="color:rgba(16, 16, 16, 0.6);font-size: 14px;">时，一双完整的定制鞋中底即可打印完成，进行后处理后直接发货。</span>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="box3">
            <div class="processContent">
                <h2>定制化使用流程</h2>
                <h4>流程简单清晰，快速响应需求</h4>
            </div>
            <div class="icon">
                    <span style="margin-left:89px;">
                        <li><img style="object-fit:none;" src="../resource/icon1.png" alt="图片无法显示"></li>
                        <li style="margin-top: 20px;">数据准备</li>
                    </span>
                <span style="padding-top:52px;"><img style="object-fit:none;" src="../resource/icon5.png" alt="图片无法显示"></span>
                <span>
                        <li><img style="object-fit:none;" src="../resource/icon2.png" alt="图片无法显示"></li>
                        <li style="margin-top: 20px;">模型定制</li>
                    </span>
                <span style="padding-top:52px;"><img style="object-fit:none;" src="../resource/icon5.png" alt="图片无法显示"></span>
                <span>
                        <li><img style="object-fit:none;" src="../resource/icon3.png" alt="图片无法显示"></li>
                        <li style="margin-top: 20px;">线上发布</li>
                    </span>
                <span style="padding-top:52px;"><img style="object-fit:none;" src="../resource/icon5.png" alt="图片无法显示"></span>
                <span>
<%--                    style="background-color: #ffffff;"--%>
                        <li><img style="object-fit:none;" src="../resource/icon4.png" alt="图片无法显示"></li>
                        <li style="margin-top: 20px;">需求沟通</li>
                    </span>
            </div>
            <div class="experience">
                <button type="button" class="layui-btn layui-btn-normal layui-btn-radius"
                        onclick="window.location.href='${pageContext.request.contextPath }/forwardToSole'"
                        style="width:188px;height:49px;font-size:20px;">立即体验</button>
            </div>
        </div>
    </div>
    <div class="footer">
    <a href="https://beian.miit.gov.cn/" style="color:#999fa2;">辽ICP备2022003012号-2</a>
</div>

</div>

<script src="../layui-v2.6.8/layui/layui.js" charset="utf-8"></script>
<script>
    layui.use(['carousel', 'form'], function () {
        var carousel = layui.carousel
            , form = layui.form;

        //常规轮播
        carousel.render({
            elem: '#test1'
            , width: '455px'
            , height: '455px'
            , arrow: 'always'
            , interval: 3000
        });
    });
</script>
</body>

</html>
