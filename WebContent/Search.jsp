<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<head>
<link rel="shortcut icon" href="../favicon.ico">
		
		<link rel="stylesheet" type="text/css" href="css/style.css" />
		<link rel="stylesheet" type="text/css" href="css/products1.css" />
  		<script src="js/modernizr.custom.js"></script>
  		<script type="text/javascript" src="http://code.jquery.com/jquery-1.6.4.min.js"></script>

<script type="text/javascript">
var _gaq = _gaq || [];
_gaq.push(['_setAccount', 'UA-7243260-2']);
_gaq.push(['_trackPageview']);
(function() {
var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
})();
</script>
<link rel="stylesheet" href="style.css">
<title>Course Details of Computer Educational Institution</title>
<script>
function openModal() {
    document.getElementById('modal').style.display = 'block';
    document.getElementById('fade').style.display = 'block';
}

function closeModal() {
document.getElementById('modal').style.display = 'none';
document.getElementById('fade').style.display = 'none';
}

var input = document.getElementById('myInput');

input.onkeydown = function() {
    var key = event.keyCode || event.charCode;

    if( key == 8 || key == 46 )
        return false;
};

function showuser1()
{ 
		var str=document.getElementById("submitbox").value;
		var xreq;
		if(str=="")
			{
				document.getElementById("showtext1").innerHTML="";
				return;
			}
		 	
	if(window.XMLHttpRequest)
	{   
		openModal();

		xreq=new XMLHttpRequest();
	}
	else
	{
		xreq=new ActiveXObject("Microsoft.XMLHTTP");
	}
		xreq.onreadystatechange=function ()
	{
	if((xreq.readyState==4) && (xreq.status==200))
	{
	closeModal();
	document.getElementById("showtext1").innerHTML =xreq.responseText;
	document.getElementById("showtext").innerHTML ="";
	}
   };
xreq.open("post","SearchResults.jsp?q="+str+"&ctr=0","true");

xreq.send(str);
}
</script>
</head>
<link rel="stylesheet" href="css/searchbutton.css" />
<style type="text/css">

</style>


<script>

$(document).ready(function(){
  $("#button3").click(function(){
    $("#searchresults123").slideDown("slow");
  
  });
  $("#button2").click(function(){
    $("#searchresults123").slideUp("slow");
  });
});


</script>

<body>




</body>
		<!-- <input type="text"  name="query" id="submitbox" size="15">  -->
		<input type="text" id="submitbox" size="15"/>
		<button    id="button3" onclick="showuser1()">Search</button>
		
		<div id="searchresults123"   style="display: none;">
			<input type=button id="button2" value="Close" >
			<br>
			<center><h3 style="font-size: 20px;color: blue">Search Results</h3></center><p id="showtext1" ></p>
					
		<div id="fade"></div>
       </div>
		       <div id="modal" >
            <img id="loader" src="images/loading.gif" />
               </div>	
    
		



</html>
