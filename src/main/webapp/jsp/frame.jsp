<%--
  Created by IntelliJ IDEA.
  User: WZL
  Date: 2023/1/31
  Time: 13:27
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
  <title>首页</title>
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

    img {
      width: 100%;
      height: 100%;
      object-fit: cover;
    }

    /*导航栏通栏背景*/
    .bg {
      position: relative;
      border-bottom: 1px solid #383E48;
      background-color: rgba(56, 62, 72);
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
      height: 100px;
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

    .logo {
      width: 183px;
      background: url("${pageContext.request.contextPath }/resource/webLogo.png") no-repeat 0;
      background-size: contain;
    }

    .totalbox {
      width: 1440px;
      height: 1260px;
      margin: auto;
      /* background-color: #fff; */
    }

    .box1 {
      margin-top: 89px;
      width: 100%;
      height: 537px;
      background-color: #E6E6E6;
    }

    .box2 {
      width: 100%;
      height: 676px;
      background-color: #ffffff;
      /* background-color: red; */
    }

    .divleft1 {
      width: 420px;
      height: 310px;
      float: left;
      margin-left: 124px;
      margin-top: 103px;
      /* background-color: red; */
    }

    .divleft1 h2 {
      font-weight: normal;
      margin-bottom: -15px;
      width: 284px;
      height: 45px;
      color: rgba(16, 16, 16, 100);
      font-size: 24px;
      text-align: left;
      font-family: AlibabaPuHui-regular;
    }

    .border1 {
      margin-top: 0;
      padding: 0;
      width: 160px;
      height: 0px;
      border-bottom: 5px solid #03CED5;
    }

    .divleft1 h4 {
      font-weight: normal;
      margin-top: 40px;
      width: 418px;
      height: 297px;
      color: rgba(121, 119, 119, 100);
      font-size: 15px;
      text-align: left;
      font-family: SourceHanSansSC-regular;
    }

    .divright1 {
      width: 590px;
      height: 450px;
      float: left;
      margin-left: 253px;
      margin-top: 80px;
      /* background-color: skyblue; */
    }

    .divright1 img {
      width: 100%;
      height: 100%;
    }

    .divleft2 {
      width: 455px;
      height: 530px;
      float: left;
      margin-left: 102px;
      margin-top: 39px;
      /* background-color: red; */
    }

    .update {
      width: 100%;
      height: 75px;
      /* background-color: skyblue; */
    }

    .divleft2 h2 {
      font-weight: normal;
      padding-left: 10px;
      width: 126px;
      height: 35px;
      line-height: 35px;
      color: rgba(16, 16, 16, 100);
      font-size: 24px;
      text-align: left;
      font-family: AlibabaPuHui-regular;
      border-left: 5px solid #03CED5;
    }

    .shoes {
      width: 100%;
      height: 100%;
    }

    .divright2 {
      float: left;
      height: 420px;
      width: 660px;
      margin-left: 130px;
      margin-top: 150px;
      overflow-y: auto;
      /* background-color: skyblue; */
    }

    .divright2::-webkit-scrollbar {
      width: 5px;
    }

    /* 设置滚动条的样式 */
    .divright2::-webkit-scrollbar {
      width: 5px;
      border-radius: 8px;
    }

    /* 滚动槽 */
    .divright2::-webkit-scrollbar-track {
      /* -webkit-box-shadow: inset006pxrgba(0, 0, 0, 0.5); */
      background-color: rgb(154, 154, 154);
    }

    /* 滚动条滑块 */
    .divright2::-webkit-scrollbar-thumb {
      border-radius: 8px;
      background: rgb(28, 28, 28);
      /* -webkit-box-shadow: inset006pxrgba(0, 0, 0, 0.5); */
    }

    .footer {
      position: absolute;
      /*left: 50%;*/
      margin-top: 451px;
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
          <div class="sub-nav drop" style="margin-left:-853px;">
            <ul class="sub-nav-inner" style="padding-left:985px;">
              <li class="down-nav">
                <a href="${pageContext.request.contextPath }/forwardToPersonalCenterServlet" target="_self">个人中心</a>
                <a href="${pageContext.request.contextPath }/login.jsp" target="_self">退出登录</a>
              </li>
            </ul>
          </div>
        </li>
        <li class="navLogo1" style="float:right;margin-right:-155px;"><a href="${pageContext.request.contextPath }/forwardToPersonalCenterServlet"
                                                        style="margin-top: 10px;height: 48px;line-height: 48px;">
          <img style="object-fit:none;" src="${pageContext.request.contextPath }/resource/user.png" alt="图片无法显示"></a></li>
        <li class="navLogo1" style="float:right;margin-right: -195px;"><a href="${pageContext.request.contextPath }/login.jsp"
                                                         style="margin-top: 10px;height: 48px;line-height: 48px;">
          <img style="object-fit:none;" src="${pageContext.request.contextPath }/resource/close.png" alt="图片无法显示"></a></li>
      </ul>
    </div>
  </div>
  <div class="totalbox">
    <div class="box1">
      <div class="divleft1">
        <h2>可定制鞋业解决方案</h2>
        <li class="border1"></li>
        <h4 style="line-height:1.8em;">近些年，随着公民健身意识不断增强，跑步健身逐渐成为公众关注的热点，这也使就得运动鞋的需求不断增长。也随着3D打印技术的出现和发展，使得具有复杂结构，符合人体脚部曲线，具有良好回弹性能的鞋底结构能够快速制造出来。
          我们将符合使用者脚部受力情况的多孔结构填充运动鞋中底，为使用者提供最合理的力学反馈，来支持其技术动作的完成，设计的目标就是要优化鞋中底的填充结构来实现鞋中底的轻量化，并且结合打印技术，来实现打造一款真正具有个性化定制效果的运动鞋。
        </h4>
      </div>
      <div class="divright1">
        <img src="../resource/shoes1.png" alt="图片无法显示">
      </div>
    </div>
    <div class="box2">
      <div class="divleft2">
        <div class="update">
          <h2>版本更新</h2>
        </div>
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
            <div class="shoes">
              <img src="../resource/snapshot001.png" alt="图片无法显示">
            </div>
            <div class="shoes">
              <img src="../resource/snapshot002.png" alt="图片无法显示">
            </div>
            <div class="shoes">
              <img src="../resource/snapshot003.png" alt="图片无法显示">
            </div>
            <div class="shoes">
              <img src="../resource/snapshot004.png" alt="图片无法显示">
            </div>
            <div class="shoes">
              <img src="../resource/snapshot005.png" alt="图片无法显示">
            </div>
          </div>
        </div>
      </div>
      <div class="divright2">
        <ul class="layui-timeline">
          <li class="layui-timeline-item">
            <i class="layui-icon layui-timeline-axis"></i>
            <div class="layui-timeline-content layui-text">
              <div class="layui-timeline-title">2022-04-26</div>
              <div class="layui-timeline-title">
                <span style="color:#0052D9">【更新1.1】</span>
                <span style="color:#A10000; font-size:12px;">NEW</span>
              </div>
              <div class="layui-timeline-title">1.新增3D定制矫正鞋垫解决方案;</div>
            </div>
          </li>
          <li class="layui-timeline-item">
            <i class="layui-icon layui-timeline-axis"></i>
            <div class="layui-timeline-content layui-text">
              <div class="layui-timeline-title">2022-04-26</div>
              <div class="layui-timeline-title">
                <span style="color:#101010">【更新1.0】</span>
              </div>
              <div class="layui-timeline-title">1.新增3D定制轻量化鞋中底解决方案;</div>
              <div class="layui-timeline-title">2.网站上线;</div>
            </div>
          </li>
          <li class="layui-timeline-item">
            <i class="layui-icon layui-anim layui-anim-rotate layui-anim-loop layui-timeline-axis"></i>
            <div class="layui-timeline-content layui-text">
              <div class="layui-timeline-title">更久前，轮子时代，研发更加出色的多孔轻量化结构算法。</div>
            </div>
          </li>
        </ul>
      </div>
    </div>
  </div>
</div>
</div>
<div class="footer">
  <a href="https://beian.miit.gov.cn/" style="color:#999fa2;">辽ICP备2022003012号-2</a>
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