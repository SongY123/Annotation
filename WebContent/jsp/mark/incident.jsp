<%@ page language="java" import="java.util.*,  java.sql.*" pageEncoding="UTF-8"%>  
<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
String title = (String)session.getAttribute("title");
String context = (String)session.getAttribute("context");
String incident = (String)session.getAttribute("incident");
String sponsor = (String)session.getAttribute("sponsor");
String triggerWord = (String)session.getAttribute("triggerWord");
String bearer = (String)session.getAttribute("bearer");
String time = (String)session.getAttribute("time");
String location = (String)session.getAttribute("location");
%>  
<!DOCTYPE html>
<html lang="zh-CN">

    <head>
		
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>事件抽取</title>

        <!-- CSS -->
       	<link href="<%=basePath%>form-1/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
       	<link href="<%=basePath%>form-1/assets/css/context.standalone.css" rel="stylesheet" type="text/css" />
       			
       	<!-- SCRIPT -->
		<script src="<%=basePath%>form-1/assets/js/jquery-2.1.4.min.js"></script>
		<script src="<%=basePath%>form-1/assets/js/get.js"></script>
  		<script src="<%=basePath%>form-1/assets/js/jquery.query.js"></script>
		<script src="<%=basePath%>form-1/assets/js/incident-add-drop.js"></script>
  		<script src="<%=basePath%>form-1/assets/bootstrap/js/bootstrap.js"></script>
        <script src="<%=basePath%>form-1/assets/js/bootstrap-suggest.js"></script>
		<script type="text/javascript" src="<%=basePath%>form-1/assets/js/context.js"></script>
        
        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

        <!-- Favicon and touch icons -->
        <link rel="shortcut icon" href="<%=basePath%>form-1/assets/ico/favicon.png">

		<style>
		.incident {
  			color: #fff;
  			background-color: #5cb85c;
  			border-color: #4cae4c;
		}
		.sponsor{
  			color: #fff;
  			background-color: #c07abb;
 			border-color: #c07abb;
		}
		.triggerWord{
			color: #fff;
  			background-color: #ffad86;
 			border-color: #ffad86;
		}
		.bearer{
			color: #fff;
  			background-color: #a6a6d2;
 			border-color: #a6a6d2;
		}
		.time{
			color:#fff;
			background-color: #F5D735;
			boder-color: #EBCD2B;
		}
		.location{
			color:#fff;
			background-color: #F88158;
			border-color: #F88158;
		}
		</style>
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
    			
		<!-- Editiable page on the right -->
		<div class="col-xs-8">
		<div>
 	 	<ul class="pagination pagination-lg">
    		<li><a href = "javascript:void(0)" id ="segmentation">分词</a></li>
    		<li><a href="javascript:void(0);" id ="nominal">词性标注</a></li>
    		<li><a href="javascript:void(0);" id="entity">命名实体识别</a></li>
   			<li class="active"><a href="javascript:void(0);">事件抽取</a></li>
  		</ul>
  		<ul class="pagination pagination-lg">
  			<li><a href="javascript:void(0);" id ="nextnews">下一条</a></li>
  		</ul>
  		</div>
  		
  		<div>
  		<table class="table table-condensed " style="TABLE-LAYOUT:fixed;WORD-BREAK:break-all">
  			<!-- 事件类型  -->
  			<tr class="row">
  				<td class="col-xs-12">
        			<div class="input-group">
                        <div class="input-group-addon incident">事件类型</div>
                        <input type="text" id="incidenttype" class="form-control suggest" value="<%if(!(incident==null||(incident!=null&&incident.equals("null"))))out.print(incident);%>">
                        <div class="input-group-btn">
                            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                                <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu dropdown-menu-right" role="menu">
                            </ul>
						</div>
					</div>
				</td>
				<td class="col-xs-8">	
                 </td>
			</tr>
			
			<!-- 发起者  -->
			<tr class="row" >
				<td class="col-xs-12" style="border-top:0px">
					<div class="input-group">
					<span class="input-group-addon sponsor">发起者</span>
                    <input type="text" class="form-control" value="<%if(!(sponsor==null||(sponsor!=null&&sponsor.equals("null"))))out.print(sponsor);%>">
					</div>
				</td>
				
				<td class="col-xs-8"  style="border-top:0px"></td>
			</tr>
			
			
			<!-- 触发词 -->
			<tr class="row">
				<td class="col-xs-12"  style="border-top:0px">	
					<div class="input-group">
						<div class="input-group-addon triggerWord">触发词</div>
                        <input type="text" class="form-control" value="<%if(!(triggerWord==null||(triggerWord!=null&&triggerWord.equals("null"))))out.print(triggerWord);%>">
					
					</div>
            	</td>
            	<td class="col-xs-8" style="border-top:0px"></td>
            </tr>
            
            
			<!-- 承受者  -->
			<tr class="row">
				<td class="col-xs-12" style="border-top:0px">
					<div class="input-group">
					<span class="input-group-addon bearer">承受者</span>
                    <input type="text" class="form-control" value="<%if(!(bearer==null||(bearer!=null&&bearer.equals("null"))))out.print(bearer);%>">
					</div>
				</td>
				
				<td class="col-xs-8" style="border-top:0px">
					<div class="input-group">
                 		<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                             	 动作<span class="caret"></span>
                 		</button>
                			<ul class="dropdown-menu">
                    			<li><a href = "javascript:void(0)" onclick="dropincident(this)">删除</a></li>
                        		<li><a href = "javascript:void(0)" onclick="addincident(this)">增加</a></li>
                    		</ul>
                	</div>
				</td>
			</tr>
			
			
			<!-- 时间  -->
			<tr class="row">
				<td class="col-xs-12">
					<div class="input-group">
					<div class="input-group-addon time">时间  </div>
                    <input type="text" class="form-control" value="<%if(!(time==null||(time!=null&&time.equals("null"))))out.print(time);%>">
					</div>
				</td>
				
				<td class="col-xs-8">
					<div class="input-group">
                 		<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                             	 动作<span class="caret"></span>
                 		</button>
                			<ul class="dropdown-menu">
                    			<li><a href = "javascript:void(0)" onclick="dropline(this)">删除时间</a></li>
                        		<li><a href = "javascript:void(0)" onclick="addline(this)">增加时间</a></li>
                    		</ul>
                	</div>
				</td>
			</tr>
			
			<!-- 地点  -->
			<tr class="row">
				<td class="col-xs-12">
					<div class="input-group">
					<div class="input-group-addon location">地点  </div>
                    <input type="text" class="form-control" value="<%if(!(location==null||(location!=null&&location.equals("null"))))out.print(location);%>">
					</div>
				</td>
				
				<td class="col-xs-8">
					<div class="input-group">
                 		<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                             	 动作<span class="caret"></span>
                 		</button>
                 		<ul class="dropdown-menu">
                    			<li><a href = "javascript:void(0)" onclick="dropline(this)"><i class="icon-trash"></i>删除地点</a></li>
                        		<li><a href = "javascript:void(0)" onclick="addline(this)"><i class="icon-trash"></i>增加地点</a></li>
                    		</ul>
                	</div>
				</td>
			</tr>

			<tr class="row">
				<td class="col-xs-12">
				<button class="btn btn-default"><a href ="#">回到顶部 >></a></button>
				</td>
				
				<td class="col-xs-8">
				<button type="button" id="change" class="btn btn-primary" onclick="Change()">提交修改</button>&nbsp;&nbsp;&nbsp;&nbsp;
				<button type="button" id="confirm" class="btn btn-primary" data-toggle="modal" data-target="#myModal">确认修改</button>
				</td>
			</tr>


        </table>
        
  		</div>
  		
        </div>
	</div>
	
	<div class="modal fade" id="myModal">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">是否确定提交</h4>
          </div>
          <div class="modal-body">
            <p>请确认后提交&hellip;</p>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            <button type="button" class="btn btn-primary" onclick="Confirm()">确定</button>
          </div>
        </div><!-- /.modal-content -->
      </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
	
	<script>
	function Change(){
		/*
		document.write('<form name="myForm"><input type="hidden" name="labelID"\><input type="hidden" name="newsSource"\><input type="hidden" name="newsID"\><input type="hidden" name="newsTitle"\><input type="hidden" name="eventType"\><input type="hidden" name="sourceActor"\><input type="hidden" name="targetActor"\><input type="hidden" name="triggerWord"\><input type="hidden" name="eventLocation"\><input type="hidden" name="username"\></form>');  
		var myForm=document.forms['myForm'];  
		myForm.action='addLabel';  
		myForm.method='POST';  
		myForm.labelID.value='1';
		myForm.newsSource.value='1';
		myForm.newsID.value='1';
		myForm.newsTitle.value='1';
		myForm.eventType.value='1';
		myForm.sourceActor.value='1';
		myForm.targetActor.value='1';
		myForm.triggerWord.value='1';
		myForm.eventLocation.value='1';
		myForm.username.value='<%out.print(username);%>';
		*/
		if(document.getElementById("incidenttype").value.length==0)alert("请确认事件类型后再提交");
		else{
			$.ajax({
				url:'addLabel',
				type:'post',
				data:{labelID:"1", newsSource:"1", newsID:"1", newsTitle:"1", eventType:"1", sourceActor:"1", targetActor:"1", triggerWord:"1", eventLocation:"1", username:"SongYang"}
				//success:function(data){alert(data);}
			});
			document.getElementById("change").setAttribute("disabled", "true");
		}
		/*
		myForm.submit();
		alert("成功提交");
		*/
	}
	
	function Confirm(){
		/*
		document.write('<form name="myForm"><input type="hidden" name="labelID"\><input type="hidden" name="newsSource"\><input type="hidden" name="newsID"\><input type="hidden" name="newsTitle"\><input type="hidden" name="eventType"\><input type="hidden" name="sourceActor"\><input type="hidden" name="targetActor"\><input type="hidden" name="triggerWord"\><input type="hidden" name="eventLocation"\><input type="hidden" name="username"\></form>');  
		var myForm=document.forms['myForm'];  
		myForm.action='addLabel';  
		myForm.method='POST';  
		myForm.labelID.value='1';
		myForm.newsSource.value='1';
		myForm.newsID.value='1';
		myForm.newsTitle.value='1';
		myForm.eventType.value='1';
		myForm.sourceActor.value='1';
		myForm.targetActor.value='1';
		myForm.triggerWord.value='1';
		myForm.eventLocation.value='1';
		myForm.username.value='<%out.print(username);%>';
		*/
		if(document.getElementById("incidenttype").value.length==0)alert("请确认事件类型后再提交");
		else{
			$.ajax({
				url:'addLabel',
				type:'post',
				data:{labelID:"1", newsSource:"1", newsID:"1", newsTitle:"1", eventType:"1", sourceActor:"1", targetActor:"1", triggerWord:"1", eventLocation:"1", username:"SongYang"}
				//success:function(){alert("SUCCESS");}
			});
			$('#myModal').modal('hide');
			document.getElementById("confirm").setAttribute("disabled", "true");		
		}
		/*
		myForm.submit();
		alert("成功提交");
		*/
	}
	</script>
	
	<script type="text/javascript">
	$(".suggest").bsSuggest({
         //url: "/rest/sys/getuserlist?keyword=",
        url: "jsp/mark/datajson/incidentdata.json",
        //showBtn: false,
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
	
	<script type="text/javascript">
	$(".suggest").bsSuggest({
         //url: "/rest/sys/getuserlist?keyword=",
        url: "datajson/incidentdata.json",
        //showBtn: false,
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