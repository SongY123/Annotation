<%@ page language="java" import="java.util.*,  java.sql.*" pageEncoding="UTF-8"%>  
<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
String title = (String)session.getAttribute("title");
String context = (String)session.getAttribute("context");
String titles = (String)session.getAttribute("titles");
String contexts = (String)session.getAttribute("contexts");
String titletags = (String)session.getAttribute("titletags");
String contexttags = (String)session.getAttribute("contexttags");
%>
<!DOCTYPE html>
<html lang="zh-CN">

    <head>
	
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>词性标注</title>

        <!-- CSS -->
       	<link href="<%=basePath%>form-1/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
       	<link href="<%=basePath%>form-1/assets/css/context.standalone.css" rel="stylesheet" type="text/css" />
       			
       	<!-- SCRIPT -->
		<script src="<%=basePath%>form-1/assets/js/jquery-2.1.4.min.js"></script>
  		<script src="<%=basePath%>form-1/assets/js/get.js"></script>
  		<script src="<%=basePath%>form-1/assets/js/jquery.query.js"></script>
  		<script src="<%=basePath%>form-1/assets/bootstrap/js/bootstrap.js"></script>
        <script src="<%=basePath%>form-1/assets/js/bootstrap-suggest.js"></script>
		<script type="text/javascript" src="<%=basePath%>form-1/assets/js/context.js"></script>
		<script type="text/javascript" src="<%=basePath%>form-1/assets/js/post.js"></script>
        
        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

        <!-- Favicon and touch icons -->
        <link rel="shortcut icon" href="<%=basePath%>form-1/assets/ico/favicon.png">

		<script type="text/javascript" language="javascript">   
		function iFrameHeight() {   
			var ifm= document.getElementById("iframepage");   
			var subWeb = document.frames ? document.frames["iframepage"].document : ifm.contentDocument;   
			if(ifm != null && subWeb != null) {
   				ifm.height = subWeb.body.scrollHeight;
   				ifm.width = subWeb.body.scrollWidth;
			}   
		}   
		</script>
	</head>

    <body>
    <%
		String username = (String)session.getAttribute("username");
    %>
	<nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#"><img src="<%=basePath%>form-1/assets/ico/favicon.png"></img></a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li><a href="choosenews">新闻列表<span class="sr-only">(current)</span></a></li>
        <li><a href="statistics">统计</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">Action</a></li>
            <li><a href="#">Another action</a></li>
            <li><a href="#">Something else here</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">Separated link</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">One more separated link</a></li>
          </ul>
        </li>
      </ul>
      <form class="navbar-form navbar-left" role="search">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Search">
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
      </form>
      <ul class="nav navbar-nav navbar-right">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><%out.print(username); %> <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">任务</a></li>
            <li><a href="#">权限</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="logout">登出</a></li>
          </ul>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>

	<div>
		<!-- Title on the left -->
		<div class="col-xs-4">
			<%out.print("<h4>"+title+"</h4>");%>
		</div>
		<%
			//out.print("<iframe class = \"col-xs-3\" src=\""+basePath+"jsp/mark/news.jsp?title="+title+"&body="+context +'\"'+"  id=\"iframepage\" scrolling=\"no\" marginheight=\"0\" marginwidth=\"0\" onLoad=\"iFrameHeight()\"></iframe>");
    	%>
    	
		<!-- Editiable page on t	he right -->
		<div class="col-xs-8">
		<div>
 	 	<ul class="pagination pagination-lg">
    		<li><a href = "javascript:void(0)" id ="segmentation">分词</a></li>
    		<li class="active"><a href="javascript:void(0);">词性标注</a></li>
    		<li><a href="javascript:void(0);" id ="entity">命名实体识别</a></li>
   			<li><a href="javascript:void(0);" id ="incident">事件抽取</a></li>
  		</ul>
  		<ul class="pagination pagination-lg">
  		<li><a href="javascript:void(0);" id ="nextnews">下一条</a></li>
  		</ul>
  		</div>
  		<div id="contenttext">
  		<table class = "table" style="TABLE-LAYOUT:fixed;WORD-BREAK:break-all">
		<%
		//System.out.println(titles);
		//System.out.println(titletags);
		String suggest1 = "<div class=\"input-group\"><input type=\"text\" class=\"form-control\" value=\"";
		String suggest2 = "\"><div class=\"input-group-btn\"><button type=\"button\" class=\"btn dropdown-toggle\" data-toggle=\"dropdown\"><span class=\"caret\"></span></button><ul class=\"dropdown-menu dropdown-menu-right\" role=\"menu\"></ul></div></div>";
		String []titlesplits = titles.split(",\\s");
		String []titletagssplits = titletags.split("\\s+");
		System.out.println(titles);
		System.out.println(titletags);
		System.out.println(titlesplits.length);
		System.out.println(titletagssplits.length);
		for(int i = 0;i<titlesplits.length;i++){
			//System.out.println("i"+i);
			if(i%8==0)out.print("<tr>");
				out.print("<td>"+titlesplits[i]+"<br/>"+suggest1+titletagssplits[i]+suggest2+"</td>");
				if((i-7)%8==0)out.print("</tr>");
		}
		%>
		<%
		if(context==null){
			out.print("</table>");
		}
		else{
			out.print("<table class = \"table\" style=\"TABLE-LAYOUT:fixed;WORD-BREAK:break-all\">");
			String[] contextsplits = context.split("\\s+");
			String[] contexttagssplit = contexttags.split("\\s+");
			for(int i = 0;i<contextsplits.length;++i){
				if(i%8==0)out.print("<tr>");
				out.print("<td>"+contextsplits[i]+"<br/>"+suggest1+contexttagssplit[i]+suggest2+"</td>");
				if((i-7)%8==0)out.print("</tr>");
			}
			out.print("</table>");
		}
		%>
		&nbsp;
		<button class="btn btn-default"><a href ="#">回到顶部 >></a></button>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<button type="button" class="btn btn-primary">提交修改</button>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<button type="button" class="btn btn-primary">确认修改</button>
		</div>
        </div>
	</div>
	<script type="text/javascript">
	
	var testBsSuggest = $(".form-control").bsSuggest({
        //url: "/rest/sys/getuserlist?keyword=",
        url: "jsp/mark/datajson/nominaldata.json",
        /*effectiveFields: ["userName", "shortAccount"],
        searchFields: [ "shortAccount"],
        effectiveFieldsAlias:{userName: "姓名"},*/
        showBtn: false,
        indexKey: 1,
        idField: "attribute2",
  		keyField:"attribute2"
    }).on('onDataRequestSuccess', function (e, result) {
        console.log('onDataRequestSuccess: ', result);
    }).on('onSetSelectValue', function (e, keyword) {
        console.log('onSetSelectValue: ', keyword);
    }).on('onUnsetSelectValue', function (e) {
        console.log("onUnsetSelectValue");
    });
	</script>
	</body>
</html>