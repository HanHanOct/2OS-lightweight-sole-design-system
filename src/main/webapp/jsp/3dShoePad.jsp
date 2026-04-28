<%--
  Created by IntelliJ IDEA.
  User: WZL
  Date: 2023/2/1
  Time: 13:37
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
    <title>3D定制模型-3d鞋垫</title>

    <script src="${pageContext.request.contextPath }/layui-v2.6.8/layui/layui.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/layui-v2.6.8/layui/css/layui.css"
          tppabs="${pageContext.request.contextPath }/layui-v2.6.8/layui/css/layui.css" media="all">
    <script type="text/javascript">
    </script>
    <!-- 引入样式 -->
<%--    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">--%>
    <!-- 引入组件库 -->
    <script src="https://unpkg.com/element-ui/lib/index.js"></script>
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
            height: 900px;
            line-height: 20px;
            background-color: rgba(230, 230, 230);
            background: rgb(242, 246, 251);
        }

        .box1 {
            overflow: hidden;
            margin: auto;
            width: 1539px;
            height: 850px;
            line-height: 20px;
            background-color: #ffffff;
            text-align: center;
        }

        .box2 {
            width: 100%;
            height: 102px;
            background: rgb(242, 246, 251);
        }

        .logo {
            width: 183px;
            background: url("${pageContext.request.contextPath }/resource/webLogo.png") no-repeat 0;
            background-size: contain;
        }

        .headPportrait {
            margin: auto;
            height: 160px;
            width: 1453px;
            border-bottom: 2px solid #C3C3C3;
        }

        .con4 {
            width: 131px;
            height: auto;
            overflow: hidden;
            color: #FFFFFF;
        }

        .con5 img {
            float: left;
            margin-top: 40px;
            margin-left: 10px;
            width: 100px;
            height: 100px;
            border-radius: 50%;
        }

        .con5 span {
            float: left;
            margin-left: 25px;
            margin-top: 110px;
            left: 275px;
            color: rgba(16, 16, 16);
            font-size: 20px;
            text-align: left;
            font-family: SourceHanSansSC-bold;
            font-weight: 600;
        }

        .con4 .btn {
            width: 100%;
            height: 40px;
            line-height: 40px;
            text-align: center;
            background: #3894FF 100%;
            display: block;
            font-size: 16px;
            border-radius: 5px;
        }

        .upload {
            float: left;
            position: relative;
            z-index: 0;
        }

        .upload_pic {
            display: block;
            width: 100%;
            height: 40px;
            position: absolute;
            left: 0;
            top: 0;
            opacity: 0;
            border-radius: 5px;
        }

        #cvs {
            margin: 35px 0 0px 0px;
            border-radius: 50%;
            background: url(${pageContext.request.contextPath }/resource/260.jpg) no-repeat 0px 0px;
            background-size: 131px 131px;
            background-position: center;
            background-color: #ccc;
        }

        .demoVideo {
            float: left;
            margin-left: 43px;
            height: 520px;
            width: 700px;
            background-color: #ccc;
        }

        .personalInformation {
            float: left;
            margin: auto;
            height: 520px;
            width: 700px;
        }

        .personal_header1 {
            margin-left: 50px;
            margin-top: 30px;
            height: 21px;
            width: 200px;
            line-height: 21px;
            border-left: 3px solid #03CED5;
        }

        .PI_span0 {
            margin-left: -55px;
            color: rgba(2, 2, 2, 1);
            font-size: 18px;
            text-align: left;
            font-family: AlibabaPuHui-regular;
        }

        .PI_span1 {
            margin-left: 22px;
            color: rgba(2, 2, 2, 1);
            font-size: 18px;
            text-align: left;
            font-family: AlibabaPuHui-regular;
        }

        .PI_span2 {
            color: rgba(7, 129, 236, 1);
            font-size: 14px;
            text-align: left;
            font-family: AlibabaPuHui-regular;
        }

        .personal_content {
            margin-top: 20px;
            height: 170px;
            width: 1000px;
            margin-left: 52px;
        }

        .shadow_css {
            display: none;
            position: absolute;
            top: 0%;
            left: 0%;
            width: 200vw;
            height: 200vh;
            background-color: black;
            z-index: 10000;
            /* 为mozilla firefox 设置透明度  */
            -moz-opacity: 0.8;
            /* 设置透明度 */
            opacity: .80;
            /* 为IE 设置透明度  */
            filter: alpha(opacity=80);
        }

        .window_css1 {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            margin-top: -185px;
            margin-left: -150px;
            width: 300px;
            height: 370px;
            border: 3px solid honeydew;
            /* border-radius: 5px; */
            background-color: #ffffff;
            /* background-color: #ffffff; */
            z-index: 10001;
        }

        .button {
            /* margin-top: -3px;
            margin-left: 3px; */
            width: 100%;
            height: 30px;
            text-align: right;
        }

        .closeButton1 {
            margin-right: 10px;
            border-radius: 0px;
            color: rgb(201, 205, 212);
            font-size: 30px;
            border: 0px solid honeydew;
            background-color: #ffffff;
            border-radius: 5px;
        }

        .closeButton2 {
            margin-left: 475px;
            font-size: 30px;
            color: rgb(201, 205, 212);
            border: 0px solid honeydew;
            background-color: #ffffff;
        }

        .qrCode {
            width: 203px;
            height: 203px;
            margin: auto;
            border-radius: 5px;
            border: 2px solid #e3e5e7;
        }

        .QRspan {
            width: 200px;
            height: 50px;
            margin: auto;
            margin-top: 10px;
            /* background-color: red; */
        }

        .QRspan ul li {
            font-family: FZLanTingHeiS-R-GB;
            font-size: 14px;
            font-weight: 400;
            /* line-height: 16px; */
            letter-spacing: 0px;
        }

        .window_css2 {
            display: none;
            position: fixed;
            top: 40%;
            left: 50%;
            margin-top: -218px;
            margin-left: -300px;
            width: 600px;
            height: 636px;
            border: 3px solid honeydew;
            /* border-radius: 15px; */
            background-color: #ffffff;
            /* background-color: #ffffff; */
            z-index: 10001;
        }

        .editPerInfo {
            width: 75%;
        }

        .layui-form-radio:hover *,
        .layui-form-radioed,
        .layui-form-radioed>i {
            color: rgba(56, 148, 255, 1);
        }

        #table1 {
            border-collapse: separate;
            border-spacing: 0px 0px;
        }

        #table2 {
            border-collapse: separate;
            border-spacing: 0px 34px;
        }

        #table3 {
            border-collapse: separate;
            border-spacing: 0px 0px;
        }

        #table4 {
            border-collapse: separate;
            border-spacing: 0px 0px;
        }

        .demandSelection {
            padding: 0;
            height: 30px;
            width: 600px;
            line-height: 30px;
            margin-top: 30px;
            margin-left: 80px;
            font-size: 20px;
        }

        .layui-form-radio:hover *,
        .layui-form-radioed,
        .layui-form-radioed>i {
            color: rgba(56, 148, 255, 1);
        }

        .picUpload {
            padding: 0;
            margin-left: 0px;
            display: inline-block;
            margin-top: 23px;
            width: 420px;
            height: 180px;
            /* background-color: red; */
        }

        .picture {
            margin-top: -2px;
            margin-left: -20px;
            display: inline-block;
            width: 290px;
            height: 180px;
            border: 2px solid #03CED5;
        }

        .leftfoot {
            float: left;
            width: 140px;
            height: 97%;
            border: 2px solid #ccc;
        }

        .rightfoot {
            float: right;
            width: 140px;
            height: 97%;
            border: 2px solid skyblue;
        }

        .uploadPic {
            margin-top: -25px;
            display: inline-block;
            height: 32px;
            margin-left: 20px;
            width: 86px;
            font-size: 12px;
            text-align: center;
            line-height: 32px;
        }

        .picDisplay {
            position: relative;
            width: 340px;
            height: 170px;
            margin-left: 67px;
            margin-top: 15px;
            /* background-color: red; */
        }

        .words {
            z-index: 502;
            margin-left: -2px;
            font-size: 15px;
            text-align-last: left;
            position: absolute;
            width: 340px;
            height: 190px;
            background-color: #ffffff;
        }

        .leftFoot {
            position:absolute;
            z-index:497;
            height: 150px;
            width: 170px;
            top: 20px;
            left: -10px;
            float: left;
            background: rgb(196, 196, 196);
        }

        .leftfootliner{
            z-index: 499;
            top: 10px;
            left: 0px;
            position:absolute;
            width:152px;
            height:172px;
        }

        .rightFoot {
            float: left;
            height: 150px;
            width: 150px;
            margin-left: 30px;
            background: rgb(196, 196, 196);
        }

        .photoAnnotate {
            display: inline-block;
            margin-left: -20px;
            width: 227px;
            height: 20px;
            line-height: 20;
            color: rgba(142, 140, 140, 1);
            font-size: 12px;
            text-align: left;
            font-family: SourceHanSansSC-regular;
        }

        .submit {
            margin: auto;
            margin-top: -25px;
            height: 40px;
            line-height: 40px;
            width: 1450px;
            text-align: right;
        }

        .submit span button {
            width: 93px;
            height: 36px;
            color: rgba(142, 140, 140, 100);
            font-size: 14px;
            font-family: SourceHanSansSC-regular;
            border-radius: 5px;
        }

        .black_overlay {
            display: none;
            /* 此元素不会被显示*/
            position: absolute;
            top: 0%;
            left: 0%;
            width: 155vw;
            height: 200vh;
            background-color: black;
            z-index: 1001;
            /* 为mozilla firefox 设置透明度  */
            -moz-opacity: 0.8;
            /* 设置透明度 */
            opacity: .80;
            /* 为IE 设置透明度  */
            filter: alpha(opacity=80);
        }

        .white_content {
            display: none;
            position: absolute;
            background-color: #ffffff;
            z-index: 1002;
            /*层级要比.black_overlay高，这样才能显示在它前面*/
            overflow: auto;
            border-radius: 2px;
        }

        #light {
            position: fixed;
            margin-top: -260px;
            margin-left: -475px;
            left: 50%;
            top: 50%;
            width: 950px;
            height: 520px;
            text-align: center;
            box-shadow: 0px 2px 6px 0px rgba(0, 0, 0, 0.4);
            border-radius: 2px;
        }

        .uploadContent {
            width: 613px;
            margin-top: 30px;
            margin-left: 41px;
            height: 256px;
        }

        .uploadContent h2 {
            width: 160px;
            height: 40px;
            line-height: 40px;
            color: rgba(16, 16, 16, 1);
            font-size: 30px;
            text-align: left;
            font-family: AlibabaPuHui-bold;
        }

        .uploadContent h3 {
            margin-top: 26px;
            width: 140px;
            height: 36px;
            color: rgba(16, 16, 16, 1);
            font-size: 22px;
            text-align: left;
            font-family: SourceHanSansSC-regular;
        }

        .uploadContent h4 {
            margin-left: 260px;
            margin-top: 30px;
            width: 280px;
            height: 20px;
            line-height: 20px;
            font-size: 18px;
            text-align: left;
            font-family: SourceHanSansSC-regular;
        }

        .uploadContent h5 {
            margin-top: 37px;
            width: 140px;
            height: 36px;
            color: rgba(16, 16, 16, 1);
            font-size: 22px;
            text-align: left;
            font-family: SourceHanSansSC-regular;
        }

        .uploadFile {
            width: 613px;
            margin-left: 41px;
            height: 126px;
            line-height: 126px;
            background-color: #ffffff;
            border: 1px dashed rgb(185, 185, 185);
            border-radius: 5px;
        }

        .layui-upload-drag .layui-icon {
            font-size: 35px;
            color: #0077FA;
        }

        .uploadButton {
            width: 613px;
            margin-left: 41px;
            margin-top: 15px;
            height: 40px;
            line-height: 40px;
        }

        #form_submit {
            text-align: center;
            margin-left: 10px;
            margin-top: 10px;
        }

        .content1 {
            width: 96%;
            height: 70px;
            line-height: 70px;
            padding-left: 30px;
            font-size: 24px;
            text-align: left;
            border-bottom: 1px solid rgb(229, 230, 235);
        }

        .closeButton3 {
            margin-left: 767px;
            border: none;
            background-color: #ffffff;
            color: rgb(201, 205, 212);
            font-size: 40px;
        }

        .content2 {
            margin: 0;
            padding: 0;
            width: 95%;
            height: 45px;
            padding-left: 33px;
            padding-top: 25px;
            text-align-last: left;
            /* background-color: red; */
            color: #101010;
        }

        .span1 {
            display: inline-block;
            line-height: 38px;
            width: 115px;
            height: 38px;
            color: rgba(16, 16, 16, 1);
            font-size: 18px;
            text-align: left;
            font-family: AlibabaPuHui-medium;
        }

        .graphicDisplay {
            width: 100%;
            height: 230px;
            text-align-last: left;

        }

        .display1 {
            display: inline-block;
            margin-left: 33px;
            width: 408px;
            height: 225px;
            text-align: center;
            border: 1px solid rgba(187, 187, 187, 1);
            border-radius: 10px;
            background: url("${pageContext.request.contextPath }/resource/shoemidsole.png") no-repeat center center;
            background-size: 100%
        }

        .display2 {
            display: inline-block;
            margin-left: 60px;
            width: 408px;
            height: 225px;
            text-align: center;
            border: 1px solid rgba(187, 187, 187, 1);
            border-radius: 10px;
            background: url("${pageContext.request.contextPath }/resource/shoemidsole.png") no-repeat center center;
            background-size: 100%;
            background-color: rgba(0, 0, 0, 0.5);
        }

        .toumingzi {
            position: absolute;
            margin-left: 507px;
            margin-top: -232px;
            color: #ffffff;
            background: rgba(0, 0, 0);
            /*透明度*/
            opacity: 0.5;
            /*字体居中*/
            text-align: center;
            /*div标签上移*/
            width: 410px;
            height: 227px;
            line-height: 227px;
            border-radius: 10px;
        }

        .tongneiwenzi1 {
            position: absolute;
            height: 60px;
            line-height: 60px;
            width: 200px;
            margin-left: -100px;
            margin-top: -30px;
            text-align: center;
            z-index: 100001;
            left: 50%;
            top: 50%;
            font-size: 14px;
            display: none;
        }

        .tongneiwenzi1 ul li {
            width: 200px;
            text-align: center;
            margin-left: 20px;
            font-size: 14px;
            height: 28px;
            line-height: 28px;
        }

        .tongneiwenzi {
            font-size: 14px;
            width: 260px;
            position: absolute;
            top: 50%;
            margin-top: -15px;
            margin-left: -130px;
            text-align: center;
            height: 30px;
            left: 50%;
            color: #ffffff;
            line-height: 30px;
        }

        .content3 {
            margin-top: 10px;
            height: 25px;
            width: 100%;
            text-align: left;
        }

        .span2 {
            margin-left: 33px;
            width: 231px;
            height: 25px;
            color: rgba(142, 140, 140, 1);
            font-size: 14px;
            text-align: left;
            font-family: AlibabaPuHui-regular;
        }

        .button1 {
            text-align: left;
            margin-top: 50px;
            padding-top: 0px;
            height: 60px;
            width: 100%;
            line-height: 60px;
            border-top: 1px solid rgb(229, 230, 235);
        }

        .button12 {
            margin-left: 730px;
            width: 88px;
            height: 33px;
            background: rgb(229, 229, 230);
            border-radius: 2px;
            color: rgb(29, 33, 41);
            font-size: 14px;
            line-height: 33px;
            box-shadow: 0px 9px 28px rgba(0, 0, 0, 0.05);
            border: none;
        }

        .button13 {
            margin-left: 8px;
            width: 88px;
            height: 33px;
            background: rgba(56, 148, 255);
            border-radius: 2px;
            color: rgb(255, 255, 255);
            font-size: 14px;
            line-height: 33px;
            box-shadow: 0px 9px 28px rgba(0, 0, 0, 0.05);
            border: none;
        }

        .button14 {
            position: absolute;
            left: 820px;
            top: 471px;
            width: 88px;
            height: 33px;
            background: rgba(56, 148, 255);
            border-radius: 2px;
            color: rgb(255, 255, 255);
            font-size: 14px;
            line-height: 33px;
            box-shadow: 0px 9px 28px rgba(0, 0, 0, 0.05);
            border: none;
            display: none;
        }

        #window2 .layui-input-block {
            width: 100%;
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
    <div class="box1">
        <div class="box2"></div>
        <div class="headPportrait">
            <input id="fileInp" type="file" hidden>
            <div class="con5 avator">
                <img id="avator" src="${pageContext.request.contextPath }/resource/260.jpg" alt="图片无法显示">
                <span>${UserCode}</span>
            </div>
        </div>
        <div class="demoVideo">
            <video data-v-6a864ecb width="100%" height="100%" autoplay="autoplay" loop="loop" muted="muted" controls="controls"
                   src="${pageContext.request.contextPath }/resource/34230427213706_1.mp4" style="object-fit: fill;"></video>
        </div>
        <div class="personalInformation">
            <div class="personal_header1" style="margin-top: 30px;">
                <span class="PI_span0" style="margin-left:-110px;">生成要求</span>
            </div>
            <div class="demandSelection" style="margin-top: 12px;">
                <form class="layui-form" action="" lay-filter="example" id="sVolume">
                    <div class="layui-form-item" style="margin-left: -375px;">
                        <div class="layui-input-block">
                            <input type="radio" name="sVolume" value=0.27 title="轻量化程度高" checked="">
                            <input type="radio" name="sVolume" value=0.33 title="二者平衡">
                            <input type="radio" name="sVolume" value=0.38 title="耐久度高">
                        </div>
                    </div>
                </form>
            </div>
            <!-- 个人信息 -->
            <div class="personal_header1">
                <span class="PI_span0" style="margin-left:-36px">足部信息 &nbsp</span>
                <a href="javascript:void(0)" onclick="displayWindow1()">
                        <span class="PI_span2">
                            扫描
                        </span>
                </a>
                <a href="javascript:void(0)" onclick="displayWindow2()">
                        <span class="PI_span2">
                            编辑
                        </span>
                </a>
            </div>
            <!-- 扫描窗口 -->
            <div id="window1" class="window_css1">
                <div class="button">
                    <button class="closeButton1" type="button" href="javascript:void(0)" onclick="hideWindow()">
                        &times
                    </button>
                </div>
                <div style="text-align:center;margin-left:50px;margin-top:10px;margin-bottom:20px;">
                    <span class="PI_span0">扫描二维码进行足底信息扫描</span>
                </div>
                <div class="qrCode">
                    <img style="width: 99%;height: 99%;" src="${pageContext.request.contextPath }/resource/TwoOS.png" alt="图片无法显示">
                </div>
                <div class="QRspan">
                    <ul>
                        <li>请使用
                            <span
                                    style="color: #10a7d9;font-family: FZLanTingHeiS-R-GB;font-size: 14px;font-weight: 400;">客户端</span>
                            扫码进行
                        </li>
                        <li>足底信息扫描或扫码下载APP</li>
                    </ul>
                </div>
            </div>

            <!--出现悬浮窗口后,背景变暗-->
            <div id="shadow1" class="shadow_css"></div>

            <!-- 编辑窗口 -->
            <!--悬浮窗口-->
            <div id="window2" class="window_css2">
                <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
                    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;margin-left: 30px;width: 90%;">
                        <legend style="text-align: left;">足部信息</legend>
                        <%--                    <span>--%>
                        <%--                        <button type="button" class="closeButton2" href="javascript:void(0)" onclick="hideWindow()">--%>
                        <%--                            &times--%>
                        <%--                        </button>--%>
                        <%--                    </span>--%>
                    </fieldset>
                    <ul class="layui-tab-title" style="text-align: left;">
                        <li class="layui-this">欧码</li>
                        <li>毫米</li>
                    </ul>
                    <div class="layui-tab-content" style="height: 100px;">
                        <div class="layui-tab-item layui-show">
                            <form class="layui-form editPerInfo" action="${pageContext.request.contextPath }/edit_es.do" method="post"  lay-filter="example">
                                <div class="layui-form-item" style="margin-top: 20px;">
                                    <label class="layui-form-label">尺码</label>
                                    <div class="layui-input-block">
                                        <input type="text" name="ShoeSize" lay-verify="title" autocomplete="off" placeholder="请输入尺码（欧码），eg:38"
                                               class="layui-input" style="border-radius:7px;">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">足跟</label>
                                    <div class="layui-input-block">
                                        <input type="text" name="Heel" lay-verify="title" autocomplete="off" placeholder="请输入足跟位置（建议输入0）"
                                               class="layui-input" style="border-radius:7px;">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">足弓</label>
                                    <div class="layui-input-block">
                                        <input type="text" name="Arch" lay-verify="title" autocomplete="off"
                                               placeholder="请输入足弓最高处与足跟最低处之间的高度差（单位：mm）" class="layui-input" style="border-radius:7px;">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">左前掌</label>
                                    <div class="layui-input-block">
                                        <input type="text" name="LeftForefoot" lay-verify="title" autocomplete="off" placeholder="请输入左前脚掌与足跟最低处之间的高度差（单位：mm）"
                                               class="layui-input" style="border-radius:7px;">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">右前掌</label>
                                    <div class="layui-input-block">
                                        <input type="text" name="RightForefoot" lay-verify="title" autocomplete="off"
                                               placeholder="请输入右前脚掌与足跟最低处之间的高度差（单位：mm）" class="layui-input" style="border-radius:7px;">
                                    </div>
                                </div>
                                <div class="layui-form-item" style="height: 155px">
                                    <label class="layui-form-label">足跟边</label>
                                    <div class="layui-input-block">
                                        <input type="text" name="HeelEdge" lay-verify="title" autocomplete="off"
                                               placeholder="请输入足弓对侧与足跟最低处之间的高度差（单位：mm）" class="layui-input" style="border-radius:7px;">
                                    </div>
                                </div>
                                <div class="layui-form-item"
                                     style="width:600px;border-top: 1px solid rgb(229, 230, 235);padding-top:10px;">
                                    <div style="text-align: right;padding-right: 20px;">
                                        <button type="button" class="layui-btn layui-btn-primary layui-border-blue"
                                                style="width: 88px;height: 33px;font-size: 14px;line-height:33px;"
                                                href="javascript:void(0)" onclick="hideWindow()">
                                            关闭
                                        </button>
                                        <button type="submit" class="layui-btn layui-btn-normal"
                                                style="width: 88px;height: 33px;font-size: 14px;line-height:33px;" lay-submit=""
                                                lay-filter="demo1">保存</button>
                                    </div>
                                </div>
                            </form>
                        </div>

                        <div class="layui-tab-item">
                            <form class="layui-form editPerInfo" action="${pageContext.request.contextPath }/edit_mm.do" method="post"  lay-filter="example">
                                <div class="layui-form-item" style="margin-top: 20px;">
                                    <label class="layui-form-label">脚长</label>
                                    <div class="layui-input-block">
                                        <input type="text" name="soleLength" lay-verify="title" autocomplete="off" placeholder="请输入脚长（mm），eg:240"
                                               class="layui-input" style="border-radius:7px;" required>
                                    </div>
                                </div>
                                <div class="layui-form-item" style="margin-top: 15px;">
                                    <label class="layui-form-label">脚宽</label>
                                    <div class="layui-input-block">
                                        <input type="text" name="soleWidth" lay-verify="title" autocomplete="off" placeholder="请输入脚宽（mm），eg:95"
                                               class="layui-input" style="border-radius:7px;" required>
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">足跟</label>
                                    <div class="layui-input-block">
                                        <input type="text" name="Heel" lay-verify="title" autocomplete="off" placeholder="请输入足跟位置（建议输入0）"
                                               class="layui-input" style="border-radius:7px;">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">足弓</label>
                                    <div class="layui-input-block">
                                        <input type="text" name="Arch" lay-verify="title" autocomplete="off"
                                               placeholder="请输入足弓最高处与足跟最低处之间的高度差（单位：mm）" class="layui-input" style="border-radius:7px;">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">左前掌</label>
                                    <div class="layui-input-block">
                                        <input type="text" name="LeftForefoot" lay-verify="title" autocomplete="off" placeholder="请输入左前脚掌与足跟最低处之间的高度差（单位：mm）"
                                               class="layui-input" style="border-radius:7px;">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">右前掌</label>
                                    <div class="layui-input-block">
                                        <input type="text" name="RightForefoot" lay-verify="title" autocomplete="off"
                                               placeholder="请输入右前脚掌与足跟最低处之间的高度差（单位：mm）" class="layui-input" style="border-radius:7px;">
                                    </div>
                                </div>
                                <div class="layui-form-item" style="height: 97px">
                                    <label class="layui-form-label">足跟边</label>
                                    <div class="layui-input-block">
                                        <input type="text" name="HeelEdge" lay-verify="title" autocomplete="off"
                                               placeholder="请输入足弓对侧与足跟最低处之间的高度差（单位：mm）" class="layui-input" style="border-radius:7px;">
                                    </div>
                                </div>
                                <div class="layui-form-item"
                                     style="width:600px;border-top: 1px solid rgb(229, 230, 235);padding-top:15px;">
                                    <div style="text-align: right;padding-right: 20px;">
                                        <button type="button" class="layui-btn layui-btn-primary layui-border-blue"
                                                style="width: 88px;height: 33px;font-size: 14px;line-height:33px;"
                                                href="javascript:void(0)" onclick="hideWindow()">
                                            关闭
                                        </button>
                                        <button type="submit" class="layui-btn layui-btn-normal"
                                                style="width: 88px;height: 33px;font-size: 14px;line-height:33px;" lay-submit=""
                                                lay-filter="demo1">保存</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <!--出现悬浮窗口后,背景变暗-->
            <div id="shadow2" class="shadow_css"></div>
            <div class="personal_content">
                <table border="0" style="font-size:14px;color:#020202;text-align: left;" id="table1">
                    <tr height="34">
                        <td width="152">&nbsp&nbsp&nbsp&nbsp尺码 (欧码)</td>
                        <td width="200" style="color:#8E8C8C;">${ShoeSize}</td>
                        <td width="150">体重 (kg)</td>
                        <td width="300" style="color:#8E8C8C;">${Weight}</td>
                    </tr>
                </table>
                <table border="0" style="font-size:14px;color:#020202;text-align: left;margin-top: -35px;"
                       id="table2">
                    <tr height="34" style="border-spacing:16px;">
                        <td width="152">&nbsp&nbsp&nbsp&nbsp足跟 (mm)</td>
                        <td width="200" style="color:#8E8C8C;">${Heel}</td>
                        <td width="150">足弓 (mm)</td>
                        <td width="300" style="color:#8E8C8C;">${Arch}</td>
                    </tr>
                </table>
                <!-- 红色标记代码 -->
                <!-- <span style="color:red;margin-right:4px;">*</span> -->
                <table border="0" style="font-size:14px;color:#020202;text-align: left;margin-top: -35px;"
                       id="table3" style="border-spacing:10px;">
                    <tr height="34">
                        <td width="152">&nbsp&nbsp&nbsp&nbsp左前掌 (mm)</td>
                        <td width="200" style="color:#8E8C8C;">${LeftForefoot}</td>
                        <td width="150">右前掌 (mm)</td>
                        <td width="300" style="color:#8E8C8C;">${RightForefoot}</td>
                    </tr>
                </table>
                <table border="0" style="font-size:14px;color:#020202;text-align: left;margin-top: 0px;"
                       id="table4">
                    <tr height="34">
                        <td width="152">&nbsp&nbsp&nbsp&nbsp足跟边 (mm)</td>
                        <td width="200" style="color:#8E8C8C;">${HeelEdge}</td>
                    </tr>
                </table>
            </div>
            <div class="personal_header1" style="margin-top: 0px;">
                <span class="PI_span0" style="margin-left:-125px;">足部图</span>
            </div>
            <div class="picDisplay">
                <div class="words" id="word">
                    暂无数据
                </div>
                <div class="leftFoot" style="transform:rotate(90deg);">
                    <img style="height:100%;width:100%;" id="leftFoot" src="${pageContext.request.contextPath }/userResource/${UserCode}/pressure.png" alt="">
                </div>
                <div class="leftfootliner">
                    <img style="height:100%;width:100%;" src="${pageContext.request.contextPath }/resource/hamper.png" alt="">
                </div>
                <div class="rightFoot" hidden="hidden" style="transform:rotate(90deg);">
                    <img style="height:100%;width:100%;" id="rightFoot" src="" alt="">
                </div>
            </div>
        </div>
        <div class="submit">
                <span>
                    <button class="layui-btn layui-btn-primary layui-border-blue">重置</button>
                </span>
            <span>
                    <button type="button" class="layui-btn layui-btn-normal" style="margin-left:10px;">
                        <a href="javascript:void(0)"
                           onclick="document.getElementById('light').style.display='block';document.getElementById('fade').style.display='block'"
                           style="color:#ffffff;">
                            生成模型
                        </a>
                    </button>
                </span>
        </div>
    </div>
    <!-- submit的弹框 -->
    <div id="light" class="white_content">
        <div class="content1">
            模型展示
            <button class="closeButton3"
                    onclick="document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'">
                &times
            </button>
        </div>
        <div class="content2">
            <span class="span1">模板模型</span>
            <span class="span1" style="margin-left: 355px;">我的定制</span>
        </div>
        <div class="graphicDisplay">
            <div class="display1" onclick="window.open('${pageContext.request.contextPath }/jsp/pre_model.jsp')">
            </div>
            <div class="display2" onclick="window.open('${pageContext.request.contextPath }/jsp/shoemidshoe_model.jsp')">
            </div>
            <div class="toumingzi" id="toumingbeijing">
                <div class="tongneiwenzi1" id="waitword1">
                    <ul>
                        <li>模型生成中，请耐心等待。</li>
                        <li style="margin-left: 85px;">
                            <i class="el-icon-loading" style="font-size: 20px; color: #ffffff;"></i>
                        </li>
                    </ul>
                </div>
                <div class="tongneiwenzi" id="waitword">
                    此过程大约耗时40分钟，是否确认等待？
                </div>
            </div>
        </div>
        <div class="content3">
            <span class="span2">此为展示模型，点击查看大图</span>
            <span class="span2" style="margin-left: 287px;">此为展示模型，点击查看大图</span>
        </div>
        <div class="button1">
                <span>
                    <button type="button" class="layui-btn button12" id="clean" onclick="clean11 ()">清空</button>
                </span>
            <span>
                    <button type="button" class="layui-btn button13" id="create" onclick="forbid ()">生成</button>
                    <button type="button" class="layui-btn button14" id="create1" onclick="forbid ()">重新生成</button>
                </span>
        </div>
    </div>
    <div id="fade" class="black_overlay"></div>

</div>
<div class="footer">
    <a href="https://beian.miit.gov.cn/" style="color:#999fa2;">辽ICP备2022003012号-2</a>
</div>

<script>

    function x() {
        console.log("hahaha");
    }
    // function soleSizeType() {
    //     var typeElement = document.getElementById("soleSizeType");
    //     var index = typeElement.selectedIndex;
    //     var value = typeElement.options[index].value;
    //     console.log(value);
    //     changeType(value);
    // }
    //
    // function changeType(type) {
    //     document.getElementById("s1").hidden = type;
    //     document.getElementById("s2").hidden = !type;
    //     document.getElementById("s3").hidden = !type;
    // }
    function readFile() {
        var file = this.files[0]; //获取上传文件列表中第一个文件
        if (!/image\/\w+/.test(file.type)) {
            //图片文件的type值为image/png或image/jpg
            alert("文件必须为图片！");
            console.log("文件必须为图片！");
            return false;
        }
        // console.log(file);
        var reader = new FileReader(); //实例一个文件对象
        reader.readAsDataURL(file); //把上传的文件转换成url
        //当文件读取成功便可以调取上传的接口
        reader.onload = function (e) {

            var image = new Image();
            // 设置src属性
            image.src = e.target.result;
            var max = 200;
            // 绑定load事件处理器，加载完成后执行，避免同步问题
            image.onload = function () {
                // 获取 canvas DOM 对象
                var canvas = document.getElementById("cvs");
                // 获取 canvas的 2d 环境对象,
                var ctx = canvas.getContext("2d");
                // canvas清屏
                ctx.clearRect(0, 0, canvas.width, canvas.height);

                ctx.drawImage(image, 0, 0, 131, 131);

            };
        }
    };

    layui.use(['carousel', 'form', 'jquery'], function () {
        var carousel = layui.carousel,
            $ = layui.jquery,
            form = layui.form;
        //建造实例
        carousel.render({
            elem: '#test1'//设置容器宽度
            , width: 455
            , height: 455
            , arrow: 'always' //始终显示箭头
            , interval: 2000
            //,anim: 'updown' //切换动画方式
        });

        form.on('select(soleSizeType)', function(data){
            if(data.value == 1){
                $("#s1").attr("hidden","true");
                $("#s2").attr("hidden","false");
                $("#s3").attr("hidden","false");
                form.render('select');
            }else{
                $("#s1").attr("hidden","false");
                $("#s2").attr("hidden","true");
                $("#s3").attr("hidden","true");
                form.render('select');//select是固定写法 不是选择器
            }
        });
    });

</script>

<script>
    /*当点击调用此方法后,将悬浮窗口显示出来,背景变暗*/
    function displayWindow1() {
        /*悬浮窗口的显示,需要将display变成block*/
        document.getElementById("window1").style.display = "block";
        /*将背景变暗*/
        document.getElementById("shadow1").style.display = "block";
    }

    function displayWindow2() {
        /*悬浮窗口的显示,需要将display变成block*/
        document.getElementById("window2").style.display = "block";
        /*将背景变暗*/
        document.getElementById("shadow2").style.display = "block";
    }

    /*当点击调用此方法,将悬浮窗口和背景全部隐藏*/
    function hideWindow() {
        document.getElementById("window1").style.display = "none";
        document.getElementById("window2").style.display = "none";
        document.getElementById("shadow1").style.display = "none";
        document.getElementById("shadow2").style.display = "none";
    }

    /*当点击调用此方法,将足部图显露*/
    function hideWindow1() {
        document.getElementById("word").style.display = "none";
    }
</script>


<script>
    const fileInp = document.getElementById('fileInp')
    const file = fileInp.files[0];
    const avator = document.getElementById("avator")
    avator.onclick = function () {
        fileInp.click();
        const re = new FileReader();
        re.readAsDataURL(file);
        re.onload = function (re) {
            document.getElementById('avator').src = re.target.result;
        }
    }
</script>

<!-- 判断是否有图片，如果没有显示暂无数据 -->
<script>
    var leftfoot = document.getElementById("leftFoot");
    var rightfoot = document.getElementById("rightFoot");
    var ImgObjl = new Image();
    var ImgObjr = new Image();
    ImgObjl.src = leftfoot.src;
    ImgObjr.src = rightfoot.src;
    console.log(ImgObjl.width);
    console.log(ImgObjl.height);
    console.log(ImgObjr.width);
    console.log(ImgObjr.height);
    if (ImgObjl.width > 0 || ImgObjr.width > 0) {
    // if (ImgObjl.width > 0) {
        document.getElementById("word").style.display = "none";
    }
    else {
        document.getElementById("word").style.display = "block";
    }

</script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<!-- 点击后按钮不可用 -->

<script>
    var create1 = document.getElementById("create1");
    var create = document.getElementById("create");
    var clean = document.getElementById("clean");
    var waitword = document.getElementById("waitword");
    var waitword1 = document.getElementById("waitword1");
    var toumingbeijing = document.getElementById("toumingbeijing");
    function forbid() {
        //开始执行代码禁用按钮
        create.disabled = true;
        clean.disabled = true;
        create.style.backgroundColor = "#a0cfff";
        clean.style.backgroundColor = "#f4f4f5";
        create.style.cursor = "not-allowed";
        clean.style.cursor = "not-allowed";
        waitword.style.display = "none";
        waitword1.style.display = "block";
        if (create1.style.display == "block") {
            create1.disabled = true;
            create1.style.backgroundColor = "#a0cfff";
            create1.style.cursor = "not-allowed";
            toumingbeijing.style.display = "block";
        }

        //处理相关逻辑
        // DoSomething();
        var url = "${pageContext.request.contextPath}/optimization_ShoeMidsole";
        var sVolume_ratio = document.getElementsByName("sVolume");
        let sVolume = '0.27';
        for (i=0; i<sVolume_ratio.length; i++) {
            if (sVolume_ratio[i].checked) {
                sVolume = sVolume_ratio[i].value;
            }
        }

        axios({
            method: 'post',
            url: url,
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            data:{
                sVolume: sVolume
            }
        })
            .then(function (response){
                console.log(response);
                recovery();
            })
        //执行完成后，把按钮重新变为可用
        function recovery() {
            create.disabled = false;
            clean.disabled = false;
            create.style.backgroundColor = "#3894ff";
            clean.style.backgroundColor = "#e5e5e6";
            create.style.cursor = "pointer";
            clean.style.cursor = "pointer";
            create1.style.display = "block";
            toumingbeijing.style.display = "none";
            if (create1.style.display == "block") {
                create1.disabled = false;
                create1.style.backgroundColor = "#3894ff";
                create1.style.cursor = "pointer";
            }
        }
        // setTimeout(recovery, 2000);//演示用，2s后恢复点击功能

    }

    function clean11() {
        toumingbeijing.style.display = "block";
        create1.style.display = "none";
        waitword.style.display = "block";
        waitword1.style.display = "none";
    }
</script>
</body>

</html>