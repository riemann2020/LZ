<%@ page import="java.io.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.GregorianCalendar" %>
<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTF-8"%>
<%--
  Created by VSCode+JDK1.8+Tomcat9.0+Maven:
  User: allen
  Date: 2020/2/23
  Time: 15:48
--%>
<%!public String getIpAddr(HttpServletRequest request) { 
    String ip = request.getHeader("x-forwarded-for");    
    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {    
        ip = request.getHeader("Proxy-Client-IP");    
    }    
    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {    
        ip = request.getHeader("WL-Proxy-Client-IP");    
    }    
    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {    
        ip = request.getRemoteAddr();    
    }
    return ip;    
}%>
<%-- String ip=getIpAddr(request);
    out.println(time);
--%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>Web开发技术</title>
    <style>
        li {
            text-align: left;
            color:blue;
        }
    </style>
</head>

<body>
    <div id="header" style="background-color:red;height:60px;">
        <h1 style="color:yellow;text-align:center;">中国，加油！武汉，加油！</h1>
    </div>    
    <p>
        登录时间：
        <%
        java.text.SimpleDateFormat simpleDateFormat = new java.text.SimpleDateFormat(  
        "yyyy-MM-dd HH:mm:ss");  
        java.util.Date currentTime = new java.util.Date();  
        String time = simpleDateFormat.format(currentTime).toString();
        out.println(time);
        %>
        您的访问来自:<span id="visitorIP"></span>
    </p>
    <%
        Integer hitsCount = (Integer)application.getAttribute("hitCounter");
        if( hitsCount ==null || hitsCount == 0 ){
            hitsCount = 1;
        }else{
            hitsCount += 1;
        }
        application.setAttribute("hitCounter", hitsCount); 
    %>
    <p style="color:green;font-size: 20px;">
        欢迎访问Web开发技术！本JSP网页用VSCode+JDK1.8+Tomcat9.0开发。页面当前访问量为: 
        <span id="visitorcount"><b>-</b></span>
    </p>
    
    <h2 style="color:blue;text-align:center">Web开发技术（JavaEE实用教程）</h2>
    <p style="text-align: left;font-size: 24px;">在线课程：
        <a href="http://www.xueyinonline.com/detail/206842782">点此转入 学银在线课程《Web编程技术》</a> 
    </p>
    <p style="text-align: left;font-size: 24px;">课件:
        <span><a href="https://pan.baidu.com/s/1UiltIUvapAhQ6ZhWFymVIA" style="color:blue">百度网盘链接</a></span>
        <span>（提取码：uxa2）</span>
    </p>
    <table border="1">
        <tr style="color:red;text-align:center;font-size: 24px;">
            <th>讲次</th>
            <th>内容</th>
            <th>参考资料</th>
        </tr>
        
        <tr><!-- 第1讲 --> 
            <td><b>第1讲（2学时） JavaEE基础知识</b></td>
            <td>
                <ul>
                    <li>什么是JavaEE，与JavaSE\JavaME的关系</li>
                    <li>JavaEE框架结构：Web层、业务逻辑层（Serice）、持久层（DAO）</li>
                    <li>工作流程：JSP-Servlet + JavaBean + JDBC</li>
                    <li>重量级开发与轻量级开发</li>
                    <li>SSH与SSM</li>
                    <li>Web开发的设计模式：MVC</li>
                    <li>JSP\Servlet\JavaBean\Struts2\Spring\Hilbernate</li>  
                </ul>
            </td>
            <td>
            </td>        
        </tr>
        <tr><!-- 第2讲 --> 
            <td><b>第2讲（2学时） Web开发环境配置</b></td>
            <td>
                <ul>
                    <li>JDK</li>
                    <li>Tomcat</li>
                    <li>IDE:MyEclipse（Eclipse,IDEA）</li>
                </ul>
            </td>
            <td>
                <ol>
                    <li>
                        <a href="https://doc.weiyun.com/55934ec060b453f3f5f11455c8039b85">
                            <span>开发环境中JDK版本的匹配问题</span></a><br>
                        <a href="https://share.weiyun.com/5PDQRys">    
                            附下载：MyEclipse2015+Tomcat7+JDK</a>
                    </li>
                    <li>
                        <a href="https://jingyan.baidu.com/article/90808022337702fd90c80f78.html">
                            <span>Tomcat安装配置</span>
                        </a>
                    </li>
                    <li>
                        <a href="https://blog.csdn.net/weixin_41948075/article/details/89422795?depth_1-utm_source=distribute.pc_relevant.none-task&utm_source=distribute.pc_relevant.none-task">
                            <span>Tomcat卸载和重装</span>
                        </a>
                    </li>
                    <li>
                        <a href="https://blog.csdn.net/write6/article/details/79137961">
                            <span>Eclipse 添加 Tomcat Server 配置</span>
                        </a>
                    </li>
                    <li>
                        <a href="https://blog.csdn.net/weixin_38481963/article/details/82875720?depth_1-utm_source=distribute.pc_relevant.none-task&utm_source=distribute.pc_relevant.none-task">
                            <span>用Eclipse开始第1个Web项目</span>
                        </a>
                    </li>
                    <li>
                        <a href="https://www.myeclipsecn.com/learningcenter/web-development/myeclipse-web-project-tutorial/">
                            <span>用MyEclipse开始第1个Web项目</span>
                        </a>
                    </li>
                    <li>
                        <a href="https://blog.csdn.net/cshichao/article/details/9664969?depth_1-utm_source=distribute.pc_relevant.none-task&utm_source=distribute.pc_relevant.none-task">
                            <span>Tomcat端口号冲突：Eclipse修改Tomcat端口号</span>
                        </a>
                    </li>
                    <li>
                        <a href="https://blog.csdn.net/gongxifacai_believe/article/details/60479058">
                            <span>eclipse中tomcat启动成功，但localhost:8080无法访问解决方案</span>
                        </a>
                    </li>
                    <li>
                        <a href="https://blog.csdn.net/xiongyouqiang/article/details/79141047">
                            <span>使用eclipse将web项目打包为war包部署到tomcat</span>
                        </a>
                    </li>
                    <li>
                        <a href="https://www.cnblogs.com/wenwei1/p/7199968.html">
                            <span>Tomcat应用通过Nat123允许外网访问（Tomcat+Nat123）</span>
                        </a>
                    </li>
                </ol>
            </td>
        </tr>
        <tr><!-- 第1章作业 --> 
            <td style="color:green;text-align:center;"><b>第1章作业</b></td>
            <td>
                <ul>
                    <li>
                        <a href="https://doc.weiyun.com/898ce31a77d6b0afc5970bea59cb79d8">点此打开：第1章作业</a>
                    </li>
                </ul>
            </td>
        </tr>
        <tr><!-- 第3-4讲 ---> 
            <td><b>第3-4讲（4学时） HTML5和CSS</b></td>
            <td>
                <ul>
                    <li>html5基础</li>
                    <li>html5常用标签</li>
                    <li>html5表单元素</li>
                    <li>CSS语法</li>
                    <li>CSS文本样式</li>
                    <li>CSS页面布局</li>
                </ul>
            </td>
            <td>
                <ol>
                    <li>
                        <a href="https://www.runoob.com/html/html-tutorial.html">HTML 教程- (HTML5 标准)</a>
                    </li>
                    <li>
                        <a href="https://www.runoob.com/css/css-tutorial.html">CSS 教程</a>
                    </li>
                </ol>
            </td>
        </tr>
        <tr><!-- 第5讲Preview --> 
            <td style="color:green;text-align:center;"><b>第5讲Preview：JSP和Servlet的关系</b></td>
            <td>
                <ul>
                    <li>
                        <a href="https://doc.weiyun.com/0e9bc5ab7e68e1c35556c3386479a803">点此学习：什么是JSP和Servlet</a>
                    </li>
                </ul>
            </td>
            <td>
                <ol>
                    <li>
                        <a href="https://doc.weiyun.com/55934ec060b453f3f5f11455c8039b85">
                        开发环境中JDK版本的匹配问题</a><br>
                        <a href="https://share.weiyun.com/5PDQRys">    
                            附下载：MyEclipse2015+Tomcat7+JDK</a>
                    </li>
                </ol>     
            </td>
        </tr>
        <tr><!-- 第5-6讲 --> 
            <td><b>第5-6讲（4学时） Servlet基础</b></td>
            <td>
                <ul>
                    <li>Servlet概述</li>
                    <li>Servlet生命周期</li>
                    <li>Servlet请求与响应</li>
                    <li>Servlet表单数据</li>
                    <li>Tomcat与Servlet</li>
                </ul>
            </td>
            <td>
                <ol>
                    <li><a href="http://mooc1.xueyinonline.com/nodedetailcontroller/visitnodedetail?courseId=206842782&knowledgeId=208772164">学银在线：Servlet教程</a></li>
                    <li><a href="https://www.runoob.com/servlet/servlet-tutorial.html">菜鸟教程：Servlet教程</a></li>
                    <li><a href="https://www.imooc.com/learn/269">慕课网：Servlet篇</a></li>
                </ol>
            </td>
        </tr>
        <tr><!-- 第7讲 --> 
            <td><b>第7讲（2学时-实践） Servlet练习</b></td>
            <td>
                <ul>
                    <li>Servlet处理用户登录</li>
                </ul>
            </td>
            <td>
                <ol>
                    <li><a href="https://www.imooc.com/video/5555">慕课网：Servlet练习-用户登录</a></li>
                    <li><a href="http://2992f329v4.wicp.vip/ServletEx2/login.html">网页示例：Servlet处理用户登录</a></li>
                </ol>
            </td>
        </tr>

        <tr><!-- 第8-9讲 --> 
            <td><b>第8讲-第9讲（4学时） JSP-Java Server Page</b></td>
            <td>
                <ul>
                    <li>JSP概述</li>
                    <li>JSP页面元素</li>
                    <li>JSP内置对象</li>
                    <li>JSP语法</li>
                    <li>JSP指令</li>
                    <li>JSP请求与响应</li>
                    <li>JSP表单</li>
                </ul>
            </td>
            <td>
                <ol>
                    <li><a href="http://mooc1.xueyinonline.com/nodedetailcontroller/visitnodedetail?courseId=206842782&knowledgeId=208772117">学银在线：JSP教程</a></li>
                    <li><a href="https://www.runoob.com/jsp/jsp-tutorial.html">菜鸟教程：JSP教程</a></li>
                    <li><a href="https://www.imooc.com/learn/166">慕课网：JSP教程</a></li>
                </ol>
            </td>
        </tr>
        <tr><!-- 第10讲 --> 
            <td><b>第10讲（2学时-实践） JSP-Java Server Page练习</b></td>
            <td>
                <ul>
                    <li>页面显示乘法表</li>
                    <li>实现用户登录页面</li>
                </ul>
            </td>
            <td>
                <ol>
                    <li><a href="https://www.imooc.com/video/2954">慕课网：页面显示乘法表</a></li>
                    <li><a href="https://www.imooc.com/video/3604">慕课网：JSP实现用户登录页面</a></li>
                    <li><a href="http://2992f329v4.wicp.vip/ServletDemo/index.jsp">网页示例：Servlet与JSP之间数据传输（使用了MySQL数据库）</a></li>
                </ol>
            </td>
        </tr>
        <tr><!-- 第11讲 --> 
            <td><b>第11讲（2学时） Servlet高级应用</b></td>
            <td>
                <ul>
                    <li>过滤器的原理与实现</li>
                    <li>MVC模型：JSP-Servlet</li>
                </ul>
            </td>
            <td>
                <ol>
                    <li><a href="https://www.runoob.com/servlet/servlet-writing-filters.html">菜鸟教程：Servlet过滤器</a></li>
                    <li><a href="https://www.imooc.com/video/5984">慕课网：Servlet高级-购物车</a></li>
                </ol>
            </td>
        </tr>
    </table>
    <footer style="color:green;font-size: 30px;text-align: right;">
        北京时间
        <span id="mytime"></span>
    </footer>
</body>
<script type="text/javascript">
    // 显示时间
    function showTime() {
        nowtime = new Date();
        year = nowtime.getFullYear();
        month = nowtime.getMonth() + 1;
        date = nowtime.getDate();
        document.getElementById("mytime").innerText = year + "年" + month + "月" + date + "日 " + nowtime.toLocaleTimeString('chinese', { hour12: false });
    }
    showTime();
    setInterval("showTime()", 1000);
</script>
<script src="http://pv.sohu.com/cityjson?ie=utf-8"></script>
<script type="text/javascript">
    //显示IP
    function getBrowserInfo() {
        var agent = navigator.userAgent.toLowerCase();
        var regStr_ie = /msie [\d.]+;/gi;
        var regStr_ff = /firefox\/[\d.]+/gi
        var regStr_chrome = /chrome\/[\d.]+/gi;
        var regStr_saf = /safari\/[\d.]+/gi;
        //IE
        if (agent.indexOf("msie") > 0) {
            return agent.match(regStr_ie);
        }
        //firefox
        if (agent.indexOf("firefox") > 0) {
            return agent.match(regStr_ff);
        }
        //Chrome
        if (agent.indexOf("chrome") > 0) {
            return agent.match(regStr_chrome);
        }
        //Safari
        if (agent.indexOf("safari") > 0 && agent.indexOf("chrome") < 0) {
            return agent.match(regStr_saf);
        }
    }
    document.getElementById("visitorIP").innerText = "IP地址:" + returnCitySN["cip"] + ", CID:" + returnCitySN["cid"] + ", 地区:" + returnCitySN["cname"] + ",浏览器版本:" + getBrowserInfo();  
</script>
<script language="javascript">
    function loadXMLDoc(url)
    {
        var xmlhttp;
        if (window.XMLHttpRequest)
        {// code for IE7+, Firefox, Chrome, Opera, Safari
            xmlhttp=new XMLHttpRequest();
        }
        else
        {// code for IE6, IE5
            xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlhttp.onreadystatechange=function()
        {
            if (xmlhttp.readyState==4 && xmlhttp.status==200)
            {
                var count = xmlhttp.responseXML.getElementsByTagName("count")[0].firstChild.nodeValue;
                document.getElementById("visitorcount").innerHTML = count;
            }
        }
        xmlhttp.open("GET",url,true);
        xmlhttp.send(null);           
    }
    loadXMLDoc('ajax.jsp');
    setInterval("loadXMLDoc('ajax.jsp')", 1000); 
</script>

</html>