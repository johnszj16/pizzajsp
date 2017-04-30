<%-- 
    Document   : testjsp
    Created on : February 27
    Author     : Zachary Johns
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Zach's JSP Pizza Order</title>
    </head>
    <body>

        <h1>Order Results</h1>
        
        <p>Email = ${param.email}</p>
        <p>Size = ${param.size}</p>
        <p>Stye = ${param.style}</p>

        <%
            String toppings[] = request.getParameterValues("toppings");
            double cost = 0.0;

            if (toppings != null && toppings.length != 0) {
                out.println("<p>Toppings = ");
                for (String myTopping : toppings) {
                    out.println(myTopping + ", ");
                }
                out.println("</p>");
                cost = cost + toppings.length * .75;
            }

            if (request.getParameter("size").equals("small")) {
                cost = cost + 5.00;
            } else if (request.getParameter("size").equals("medium")) {
                cost = cost + 6.00;
            } else if (request.getParameter("size").equals("large")) {
                cost = cost + 7.00;
            }

            if (request.getParameter("style").equals("pan")) {
                cost = cost + 1.00;
            } else if (request.getParameter("style").equals("hand-tossed")) {
                cost = cost + .50;
            }

            out.println("<p>Cost: $" + cost + "</p>");
        %>

    </body>
</html>