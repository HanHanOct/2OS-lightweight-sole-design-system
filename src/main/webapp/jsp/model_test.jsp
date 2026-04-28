<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>DRACO-GLTF模型加载测试</title>
    <style type="text/css">
        html, body {
            margin: 0;
            height: 100%;
        }

        canvas {
            display: block;
        }

    </style>
</head>
<body onload="draw();">

</body>
<script src="../js/three.js"></script>
<script src="../js/GLTFLoader.js"></script>
<script src="../js/draco/DRACOLoader.js"></script>
<script src="../js/draco_wasm_wrapper.js"></script>
<script src="../js/draco_decoder.js"></script>
<script src="../js/OrbitControls.js"></script>
<script src="../js/stats.min.js"></script>
<script src="../js/dat.gui.min.js"></script>
<script>
    var renderer, camera, scene, gui, stats, ambientLight, directionalLight, control;

    function initRender() {
        renderer = new THREE.WebGLRenderer({antialias: true});
        renderer.setSize(window.innerWidth, window.innerHeight);
        //告诉渲染器需要阴影效果
        renderer.setClearColor(0xffffff);
        document.body.appendChild(renderer.domElement);
    }

    function initCamera() {
        camera = new THREE.PerspectiveCamera(45, window.innerWidth / window.innerHeight, 0.1, 1000);
        camera.position.set(0, 40, 50);
        camera.lookAt(new THREE.Vector3(0, 0, 0));
    }

    function initScene() {
        scene = new THREE.Scene();
    }

    function initGui() {
        //声明一个保存需求修改的相关数据的对象
        gui = {
        };
        var datGui = new dat.GUI();
        datGui.add(pageForward, 'forward').name('返回主页');
        //datGui.add(pageForward, '返回主页');
        //将设置属性添加到gui当中，gui.add(对象，属性，最小值，最大值）
    }


    function initLight() {
        scene.add(new THREE.AmbientLight(0x444444));

        light = new THREE.PointLight(0xffffff);
        light.position.set(0,50,50);

        //告诉平行光需要开启阴影投射
        light.castShadow = true;

        scene.add(light);
    }

    function initModel() {
        var helper = new THREE.AxesHelper(50);
        scene.add(helper);
        //创建gltf加载器
        var loader = new THREE.GLTFLoader();
        THREE.DRACOLoader.setDecoderPath('${pageContext.request.contextPath }/js/');
        var dracoloader = new THREE.DRACOLoader();

        loader.setDRACOLoader(dracoloader);
        loader.load('${pageContext.request.contextPath }/js/model-draco.gltf', function (gltf) {
            gltf.scene.scale.set(.2,.2,.2);
            gltf.scene.rotation.x = -0.5 * Math.PI;
            scene.add(gltf.scene);
        },function( xhr ) {
            // called while loading is progressing
            console.log( ( xhr.loaded / xhr.total * 100 )+'% loaded' );
        },function(){
            // called when loading has errors
            console.error( 'An error happened', error );
        },
        );

    }

    function initStats() {
        stats = new Stats();
        document.body.appendChild(stats.dom);
    }

    function initControl() {
        controls = new THREE.OrbitControls( camera, renderer.domElement );

        // 如果使用animate方法时，将此函数删除
        //controls.addEventListener( 'change', render );
        // 使动画循环使用时阻尼或自转 意思是否有惯性
        controls.enableDamping = true;
        //动态阻尼系数 就是鼠标拖拽旋转灵敏度
        //controls.dampingFactor = 0.25;
        //是否可以缩放
        controls.enableZoom = true;
        //是否自动旋转
        controls.autoRotate = true;
        controls.autoRotateSpeed = 0.5;
        //设置相机距离原点的最远距离
        controls.minDistance  = 1;
        //设置相机距离原点的最远距离
        controls.maxDistance  = 200;
        //是否开启右键拖拽
        controls.enablePan = true;
    }

    var pageForward = new function () {
        this.forward = function () {
            location.replace("${pageContext.request.contextPath }/frame.jsp");
        }
    };

    function render() {

        renderer.render(scene, camera);
    }

    function onWindowResize() {

        camera.aspect = window.innerWidth / window.innerHeight;
        camera.updateProjectionMatrix();
        render();
        renderer.setSize(window.innerWidth, window.innerHeight);

    }

    function animate() {
        //更新控制器
        render();

        //更新性能插件
        stats.update();
        controls.update();
        requestAnimationFrame(animate);
    }

    function draw() {
        initGui();
        initRender();
        initScene();
        initCamera();
        initLight();
        initModel();
        initStats();

        initControl();

        animate();
        window.onresize = onWindowResize;
    }
</script>
</html>