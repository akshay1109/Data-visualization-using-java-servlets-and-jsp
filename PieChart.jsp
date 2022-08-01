<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
<%@ page import="java.sql.*" %>
 
<%
Gson gsonObj = new Gson();
Map<Object,Object> map = null;
List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
String dataPoints = null;

try
{
	Cookie[] ck=request.getCookies();
	String Cookie1=ck[0].getValue();
	String col[]=new String[7];
	ResultSet rs2 = null;
	ResultSetMetaData r = null;
	String col1 = null, col2 = null , col3 = null,col4 = null , col5 = null,col6 = null,col7 = null;
	Integer marks[]= new Integer[7];
	
	Class.forName("com.mysql.jdbc.Driver");
	String Trimester = (String)request.getAttribute("Trimester");
	Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/Akshay","root","root");
	Statement st1=conn.createStatement();
	
	if(Trimester.equals("Trim 1"))
	{
		out.println("hello");
		rs2 = st1.executeQuery("select mcs101,mcs102,mcs103,mcs104,mcs105,mcs106,mcs107 from mcs_t1marks where prn='"+Cookie1+"'");
		r=rs2.getMetaData();
		
		for(int i=0;i<r.getColumnCount();i++)
		{
			col[i] = r.getColumnName(i+1);
		}    
        while(rs2.next())
     	{
        	for(int i= 0;i<r.getColumnCount();i++)
        	{	marks[i] =rs2.getInt(i+1);  }
      	} 

        for(int i=0;i<r.getColumnCount();i++)
        {
        	map =  new HashMap<Object,Object>(); map.put("label", col[i]); map.put("y", marks[i]); list.add(map);
        }
     	dataPoints = gsonObj.toJson(list);
	}
	else if(Trimester.equals("Trim 2"))
	{
		rs2 = st1.executeQuery("select mcs201,mcs202,mcs203,mcs204,mcs205,mcs206,mcs207 from mcs_t2marks where prn='"+Cookie1+"'");
		r=rs2.getMetaData();
		
		for(int i=0;i<r.getColumnCount();i++)
		{
			col[i] = r.getColumnName(i+1);
		}    
        while(rs2.next())
     	{
        	for(int i= 0;i<r.getColumnCount();i++)
        	{	marks[i] =rs2.getInt(i+1);  }
      	} 

        for(int i=0;i<r.getColumnCount();i++)
        {
        	map =  new HashMap<Object,Object>(); map.put("label", col[i]); map.put("y", marks[i]); list.add(map);
        }
     	dataPoints = gsonObj.toJson(list);
	}
	else if(Trimester.equals("Trim 3"))
	{
		rs2 = st1.executeQuery("select mcs301,mcs302,mcs303,mcs304,mcs305,mcs306 from mcs_t3marks where prn='"+Cookie1+"'");
		r=rs2.getMetaData();
		
		for(int i=0;i<r.getColumnCount();i++)
		{
			col[i] = r.getColumnName(i+1);
		}    
        while(rs2.next())
     	{
        	for(int i= 0;i<r.getColumnCount();i++)
        	{	marks[i] =rs2.getInt(i+1);  }
      	} 

        for(int i=0;i<r.getColumnCount();i++)
        {
        	map =  new HashMap<Object,Object>(); map.put("label", col[i]); map.put("y", marks[i]); list.add(map);
        }
     	dataPoints = gsonObj.toJson(list);
	}
	else if(Trimester.equals("Trim 4"))
	{
		rs2 = st1.executeQuery("select mcs401,mcs402,mcs403 from mcs_t4marks where prn='"+Cookie1+"'");
		r=rs2.getMetaData();
		
		for(int i=0;i<r.getColumnCount();i++)
		{
			col[i] = r.getColumnName(i+1);
			//out.println(col[i]);
		}    
        while(rs2.next())
     	{
        	for(int i= 0;i<r.getColumnCount();i++)
        	{	marks[i] =rs2.getInt(i+1);  }
      	} 

        for(int i=0;i<r.getColumnCount();i++)
        {
        	map =  new HashMap<Object,Object>(); map.put("label", col[i]); map.put("y", marks[i]); list.add(map);
        }
     	dataPoints = gsonObj.toJson(list);
	}
	else if(Trimester.equals("Trim 5"))
	{
		rs2 = st1.executeQuery("select mcs501,mcs502,mcs503 from mcs_t5marks where prn='"+Cookie1+"'");
		r=rs2.getMetaData();
		
		for(int i=0;i<r.getColumnCount();i++)
		{
			col[i] = r.getColumnName(i+1);
		}    
        while(rs2.next())
     	{
        	for(int i= 0;i<r.getColumnCount();i++)
        	{	marks[i] =rs2.getInt(i+1);  }
      	} 

        for(int i=0;i<r.getColumnCount();i++)
        {
        	map =  new HashMap<Object,Object>(); map.put("label", col[i]); map.put("y", marks[i]); list.add(map);
        }
     	dataPoints = gsonObj.toJson(list);
	}
	else if(Trimester.equals("Trim 6"))
	{
		rs2 = st1.executeQuery("select mcs601,mcs602,mcs603 from mcs_t6marks where prn='"+Cookie1+"'");
		r=rs2.getMetaData();
		
		for(int i=0;i<r.getColumnCount();i++)
		{
			col[i] = r.getColumnName(i+1);
		}    
        while(rs2.next())
     	{
        	for(int i= 0;i<r.getColumnCount();i++)
        	{	marks[i] =rs2.getInt(i+1);  }
      	} 

        for(int i=0;i<r.getColumnCount();i++)
        {
        	map =  new HashMap<Object,Object>(); map.put("label", col[i]); map.put("y", marks[i]); list.add(map);
        }
     	dataPoints = gsonObj.toJson(list);
	}
}
catch(Exception e){}
 
dataPoints = gsonObj.toJson(list);
		%>
 
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
window.onload = function() { 
 
var chart = new CanvasJS.Chart("chartContainer", {
	theme: "light2",
	animationEnabled: true,
	exportFileName: "New Year Resolutions",
	exportEnabled: true,
	title:{
		text: "MSc(COMPUTER SCIENCE) - TRIMESTER Result(in graph)"
	},
	data: [{
		type: "pie",
		showInLegend: true,
		legendText: "{label}",
		toolTipContent: "{label}: <strong>{y}%</strong>",
		indexLabel: "{label} {y}",
		dataPoints : <%out.print(dataPoints);%>
	}]
});
 
chart.render();
}
</script>
</head>
<body>
	<div id="chartContainer" style="height: 370px; width: 100%;"></div>
	<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
</body>
</html>      