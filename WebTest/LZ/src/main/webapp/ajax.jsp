<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTF-8"%>
<%  
    //设置输出信息的格式及字符集  
    response.setContentType("text/xml; charset=UTF-8");  
    response.setHeader("Cache-Control","no-cache");

    Integer hitsCount = (Integer)application.getAttribute("hitCounter");
    //if( hitsCount ==null || hitsCount == 0 ){
    //    hitsCount = 1;
    //}else{
    //    hitsCount += 1;
    //}
    //application.setAttribute("hitCounter", hitsCount);
    out.println("<response>");        
    out.println("<count>" +hitsCount+ "</count>"); 
    out.println("</response>");  
    out.close();  
%>