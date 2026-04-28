<%--
  Created by IntelliJ IDEA.
  User: WZL
  Date: 2023/1/31
  Time: 14:15
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
  <title>个人中心</title>
  <script type="text/javascript" src=""></script>
  <script src="${pageContext.request.contextPath }/layui-v2.6.8/layui/layui.js"></script>
  <link rel="stylesheet" href="${pageContext.request.contextPath }/layui-v2.6.8/layui/css/layui.css"
        tppabs="${pageContext.request.contextPath }/layui-v2.6.8/layui/css/layui.css" media="all">
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
      height: 750px;
      line-height: 20px;
      background-color: rgba(230, 230, 230);
      background: rgb(242, 246, 251);
    }

    .box1 {
      margin: auto;
      width: 1539px;
      height: 670px;
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

    .personalInformation {
      margin: auto;
      height: 520px;
      width: 1453px;
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
      margin-left: 22px;
      color: rgba(2, 2, 2, 1);
      font-size: 18px;
      text-align: left;
      font-family: AlibabaPuHui-regular;
    }

    .PI_span1 {
      margin-left: -55px;
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
      margin-top: -160px;
      margin-left: -350px;
      width: 700px;
      height: 320px;
      border: 3px solid honeydew;
      background-color: #ffffff;
      /* background-color: #ffffff; */
      z-index: 10001;
    }

    .closeButton {
      margin-left: 570px;
      font-size: 30px;
      color: rgb(201, 205, 212);
      border: 0px solid honeydew;
      background-color: #ffffff;
    }

    .window_css2 {
      display: none;
      position: fixed;
      top: 50%;
      left: 50%;
      margin-top: -190px;
      margin-left: -350px;
      width: 700px;
      height: 380px;
      border: 3px solid honeydew;
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
      border-spacing: 0px 34px;
    }

    #table5 {
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
      background-color: red;
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
      width: 330px;
      height: 170px;
      margin-left: 67px;
      /* background-color: red; */
    }

    .leftFoot {
      float: left;
      height: 100%;
      width: 150px;
      background: rgb(196, 196, 196);
    }

    .rightFoot {
      float: left;
      height: 100%;
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
      width: 100%;
      height: 1260px;
      background-color: #595959;
      z-index: 1001;
      /* z-index 属性设置元素的堆叠顺序。*/
      opacity: 0.9;
      /* opacity 属性设置元素的不透明级别。*/
    }

    .white_content {
      display: none;
      position: absolute;
      background-color: #ffffff;
      z-index: 1002;
      /*层级要比.black_overlay高，这样才能显示在它前面*/
      overflow: auto;
      border-radius: 15px;
    }

    #light {
      position: fixed;
      margin-top: -270px;
      margin-left: -525px;
      left: 50%;
      top: 50%;
      width: 1050px;
      height: 580px;
      text-align: center;
      box-shadow: 0px 2px 6px 0px rgba(0, 0, 0, 0.4);
      /* margin-top: -125px; */
      border-radius: 20px;
    }

    #light1 {
      position: fixed;
      margin-top: -240px;
      margin-left: -345px;
      left: 50%;
      top: 50%;
      width: 689px;
      height: 481px;
      line-height: 20px;
      text-align: center;
      box-shadow: 0px 2px 6px 0px rgba(0, 0, 0, 0.4);
    ;
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
      margin: 0;
      padding: 0;
      padding-top: 48px;
      width: 100%;
      height: 235px;
      color: #101010;
    }

    .content1 h2 {
      line-height: 52px;
      padding: 0;
      margin-left: 51px;
      width: 160px;
      height: 52px;
      color: rgba(16, 16, 16);
      font-size: 30px;
      text-align: left;
      font-family: AlibabaPuHui-bold;
    }

    .span1 {
      display: inline-block;
      line-height: 38px;
      margin-left: -226px;
      margin-top: 30px;
      width: 115px;
      height: 38px;
      color: rgba(16, 16, 16, 1);
      font-size: 24px;
      text-align: left;
      font-family: AlibabaPuHui-medium;
    }

    .graphicDisplay {
      margin-top: -110px;
      width: 100%;
      height: 227px;

    }

    .display1 {
      display: inline-block;
      margin-left: 70px;
      width: 412px;
      height: 225px;
      background-color: rgba(255, 255, 255, 1);
      color: rgba(16, 16, 16, 1);
      font-size: 14px;
      text-align: center;
      font-family: Roboto;
      border: 1px solid rgba(187, 187, 187, 1);
      border-radius: 10px;
    }

    .display2 {
      display: inline-block;
      margin-left: 70px;
      width: 412px;
      height: 225px;
      line-height: 20px;
      color: rgba(16, 16, 16, 1);
      font-size: 14px;
      font-family: Roboto;
      background-color: rgba(240, 240, 240, .75);
      text-align: center;
      border: 1px solid rgba(187, 187, 187, 1);
      border-radius: 10px;
    }

    .content2 {
      margin-top: 10px;
      height: 25px;
      width: 100%;
    }

    .span2 {
      margin-left: -160px;
      width: 231px;
      height: 25px;
      color: rgba(142, 140, 140, 1);
      font-size: 14px;
      text-align: left;
      font-family: AlibabaPuHui-regular;
    }

    .button1 {
      margin-top: 87px;
      height: 40px;
      width: 100%;
      line-height: 40px;
    }

    .layui-input-block {
      width: 100%;
    }

    .footer {
      position: fixed;
      /*left: 50%;*/
      /*margin-top: -46px;*/
      /*margin-left: -720px;*/
      height: 50px;
      width: 100%;
      background-color: #333333;
      color: #ffffff;
      text-align: center;
      line-height: 50px;
      bottom:0;
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
    <div class="personalInformation">
      <!-- 账户信息 -->
      <div class="personal_header1">
        <span class="PI_span1">账户信息 &nbsp</span>
        <a href="javascript:void(0)" onclick="displayWindow1()">
                        <span class="PI_span2">
                            编辑
                        </span>
        </a>
      </div>
      <!--悬浮窗口-->
      <div id="window1" class="window_css1">
        <div
                style="text-align:left;height: 46px;line-height: 46px;border-bottom: 1px solid rgb(229, 230, 235);">
          <span class=" PI_span0">账户信息&nbsp</span>
          <span>
                            <button type="button" class="closeButton" href="javascript:void(0)" onclick="hideWindow()">
                                &times
                            </button>
                        </span>
        </div>
        <form class="layui-form editPerInfo" action="${pageContext.request.contextPath }/EditUserInfo" lay-filter="example">
          <div class="layui-form-block" style="margin-top:10px;height:45px;line-height:45px">
            <label class="layui-form-label">邮箱</label>
            <div class="layui-form-label" style="margin-left:-10px;">
              ${UserCode}
            </div>
          </div>
          <div class="layui-form-item">
            <label class="layui-form-label">联系方式</label>
            <div class="layui-input-block">
              <input type="text" name="phone" lay-verify="title" autocomplete="off"
                     placeholder="请输入联系方式, eg:13840958551" class="layui-input"
                     style="border-radius:7px;">
            </div>
          </div>
          <div class="layui-form-item">
            <label class="layui-form-label">新密码</label>
            <div class="layui-input-block">
              <input type="text" name="password" lay-verify="title" autocomplete="off"
                     placeholder="请输入新密码" class="layui-input" style="border-radius:7px;">
            </div>
          </div>
          <div class="layui-form-item" style="margin-bottom:20px;">
            <label class="layui-form-label">重复密码</label>
            <div class="layui-input-block">
              <input type="text" lay-verify="title" autocomplete="off"
                     placeholder="请重复输入密码" class="layui-input" style="border-radius:7px;">
            </div>
          </div>
          <div class="layui-form-item"
               style="width: 700px;border-top: 1px solid rgb(229, 230, 235);padding-top:15px;">
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

      <!--出现悬浮窗口后,背景变暗-->
      <div id="shadow1" class="shadow_css"></div>
      <div class="personal_content">
        <table border="0" style="font-size:14px;color:#020202;text-align: left;" id="table1">
          <tr height="34">
            <td width="152">&nbsp&nbsp&nbsp&nbsp邮箱</td>
            <td width="200" style="color:#8E8C8C;">${UserCode}</td>
            <td width="150">&nbsp&nbsp&nbsp联系方式</td>
            <td width="300" style="color:#8E8C8C;">${Phone}</td>
          </tr>
        </table>
        <table border="0" style="font-size:14px;color:#020202;text-align: left;margin-top: -35px;" id="table2">
          <tr height="34" style="border-spacing:16px;">
            <td width="152">&nbsp&nbsp&nbsp&nbsp密码</td>
            <td width="200" style="color:#8E8C8C;">******</td>
          </tr>
        </table>
        <!-- 红色标记代码 -->
        <!-- <span style="color:red;margin-right:4px;">*</span> -->
      </div>

      <!-- 个人信息 -->
      <div class="personal_header1" style="margin-top: -50px;">
        <span class="PI_span1">个人信息 &nbsp</span>
        <a href="javascript:void(0)" onclick="displayWindow2()">
                        <span class="PI_span2">
                            编辑
                        </span>
        </a>
      </div>
      <!--悬浮窗口-->
      <div id="window2" class="window_css2">
        <div
                style="text-align:left;height: 46px;line-height: 46px;border-bottom: 1px solid rgb(229, 230, 235);">
          <span class="PI_span0">个人信息&nbsp</span>
          <span>
                            <button type="button" class="closeButton" href="javascript:void(0)" onclick="hideWindow()">
                                &times
                            </button>
                        </span>
        </div>
          <form class="layui-form editPerInfo" action="${pageContext.request.contextPath }/EditPersonalInfo" lay-filter="example">
            <div class="layui-form-item" style="text-align: left;margin-top: 10px;">
              <label class="layui-form-label">性别</label>
              <div class="layui-input-block">
                <input type="radio" name="sex" value="男" title="男" checked="">
                <input type="radio" name="sex" value="女" title="女">
              </div>
            </div>
            <div class="layui-form-item">
              <label class="layui-form-label">年龄</label>
              <div class="layui-input-block">
                <input type="text" name="age" lay-verify="title" autocomplete="off"
                       placeholder="请输入年龄, eg:34" class="layui-input" style="border-radius:7px;">
              </div>
            </div>
            <div class="layui-form-item">
              <label class="layui-form-label">身高</label>
              <div class="layui-input-block">
                <input type="text" name="height" lay-verify="title" autocomplete="off"
                       placeholder="请输入身高(cm), eg:188" class="layui-input" style="border-radius:7px;">
              </div>
            </div>
            <div class="layui-form-item">
              <label class="layui-form-label">尺码</label>
              <div class="layui-input-block">
                <input type="text" name="soleSize" lay-verify="title" autocomplete="off"
                       placeholder="请输入鞋子尺码(欧码), eg:43" class="layui-input" style="border-radius:7px;">
              </div>
            </div>
            <div class="layui-form-item">
              <label class="layui-form-label">体重</label>
              <div class="layui-input-block">
                <input type="text" name="weight" lay-verify="title" autocomplete="off"
                       placeholder="请输入体重(kg), eg:80kg" class="layui-input" style="border-radius:7px;">
              </div>
            </div>
            <div class="layui-form-item"
                 style="width: 700px;border-top: 1px solid rgb(229, 230, 235);padding-top:15px;">
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

      <!--出现悬浮窗口后,背景变暗-->
      <div id="shadow2" class="shadow_css"></div>
      <div class="personal_content">
        <table border="0" style="font-size:14px;color:#020202;text-align: left;" id="table3">
          <tr height="34">
            <td width="152">&nbsp&nbsp&nbsp&nbsp性别</td>
            <td width="200" style="color:#8E8C8C;">${Gender}</td>
            <td width="150">&nbsp&nbsp&nbsp年龄</td>
            <td width="300" style="color:#8E8C8C;">${Age}</td>
          </tr>
        </table>
        <table border="0" style="font-size:14px;color:#020202;text-align: left;margin-top: -35px;"
               id="table4">
          <tr height="34" style="border-spacing:16px;">
            <td width="152">&nbsp&nbsp&nbsp&nbsp身高</td>
            <td width="200" style="color:#8E8C8C;">${Height}</td>
            <td width="150"><span style="color:red;margin-right:5px;">*</span>体重</td>
            <td width="300" style="color:#8E8C8C;">${Weight}</td>
          </tr>
        </table>
        <!-- 红色标记代码 -->
        <!-- <span style="color:red;margin-right:5px;">*</span> -->
        <table border="0" style="font-size:14px;color:#020202;text-align: left;margin-top: -35px;"
               id="table5" style="border-spacing:10px;">
          <tr height="34">
            <td width="152">&nbsp<span style="color:red;margin-right:4px;">*</span>尺码</td>
            <td width="200" style="color:#8E8C8C;">${SoleSize}</td>
          </tr>
        </table>
      </div>
    </div>
  </div>
  <div id="fade" class="black_overlay"></div>
</div>
<div class="footer">
  <a href="https://beian.miit.gov.cn/" style="color:#999fa2;">辽ICP备2022003012号-2</a>
</div>

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
</script>

<!-- 上传头像 -->
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
</body>

</html>
