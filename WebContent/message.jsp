<%@page import="java.io.PrintWriter"%>
<%@page import="allmessage.allmessage"%>
<%@page import="java.util.ArrayList"%>
<%@page import="conndb.conndb"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>message</title>
<style>
  #up {
    height:100%;
    width:100%;
    overflow:auto; 
  }
</style>
<script type="text/javascript">
function initajax()
{
	var xmlhttp;
	if(window.XMLHttpRequest)
	{
		xmlhttp=new XMLHttpRequest();
	}
	else
		{
		xmlhttp=new ActiveObject("Microsoft.XMLHTTP")
		}
	return xmlhttp;
	
}
function showmessage()
{
	 //alert('test');
	var http_request=initajax();
	http_request.open("get","showmessage");
	http_request.onreadystatechange=function()
	{
		if(http_request.readyState==4)
			{
			if(http_request.status==200)
				{
				var s="";
					//alert(http_request.responseText);
					var xmldoc=http_request.responseText;
					var data=JSON.parse(xmldoc);
					var showmes = document.getElementById("up");
					//showmess.innerHTML="";
					for(var d in data)
					{
						s+="<p>";
						s+=data[d].name+"在"+data[d].times+"说："+"<br/>";
						s+=data[d].messages;
						s+="</p>";
						//alert(data[d].name);
						//alert("name:"+data[d].name+" time:"+data[d].times+" messages:"+data[d].messages);
					}
					
				      showmes.innerHTML = s;
				      showmes.scrollTop = showmes.scrollHeight-showmes.style.height;
				}
			
			
			}
	}
	http_request.send(null);
}

function scrollwindow()
{
	/* scroll(0,100000);
	setTimeout('scrollwindow()' , 200); */
	showmessage();
	setInterval(scrollwindow(),1000);
}
window.onload=scrollwindow();
</script>

</head>
<body>
<h3>消息列表</h3>
<div id="up"></div>
<%-- <table>
<%
conndb conn=new conndb();
ArrayList<allmessage> allnews=new ArrayList();
allnews=conn.getnews();
for(allmessage temp:allnews)
{	
%>
<tr><td><%out.println(temp.getName());out.println("  在");out.println(temp.getTimestamp());out.println("说：");%></td></tr>
<tr><td><%out.println(temp.getMessages());%></td></tr>
<%
}
%>
</table> --%>
</body>
</html>