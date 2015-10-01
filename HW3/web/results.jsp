<%-- 
    Document   : results
    Created on : Sep 28, 2015, 8:20:26 PM
    Author     : Tanner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="css/main.css" />
    </head>
    <%
        //Some calculation variables
        final double OTRATE = 1.5;
        final double WORKWEEK = 40;

        //Grabbing input from previous page
        String stHoursWorked = request.getParameter("hoursWorked");
        String stHourlyPay = request.getParameter("hourlyPay");
        String stPreTax = request.getParameter("preTax");
        String stPostTax = request.getParameter("postTax");

        //converting to type double
        double hoursWorked = Double.valueOf(stHoursWorked);  //parse double
        double hourlyWage = Double.valueOf(stHourlyPay);
        double preTax = Double.valueOf(stPreTax);
        double postTax = Double.valueOf(stPostTax);

        double otHours = 0;
        double otPayRate = 0;

        double taxablePay;

        double taxRate;
        double taxAmount;
        double postTaxPay;
        double netPay;

        //double otPay = 0;
        double grossPay;

        if (hoursWorked > 40) {
            otHours = hoursWorked - WORKWEEK;
            otPayRate = OTRATE * hourlyWage;
            hoursWorked = 40;
        }

        grossPay = (hoursWorked * hourlyWage) + (otHours * otPayRate);
        taxablePay = grossPay - preTax;

        if (grossPay < 500) {
            taxRate = .18;
        } else {
            taxRate = .22;
        }

        taxAmount = taxablePay * taxRate;
        postTaxPay = taxablePay - taxAmount;
        netPay = postTaxPay - postTax;
        double totalHours = hoursWorked + otHours;

        //request.setAttribute("totalHours", totalHours);
%>
    <body>
        <div class="main">
            <div class="center"> 
                <h1>Salary Info</h1>
                <hr>
                <table class="output" border="1">
                    <tbody>
                        <tr>
                            <td><label>Total Hours Worked:</label></td>
                            <td><fmt:formatNumber pattern="0.#" value="<%=totalHours%>" /></td> <%-- Think about using ID or maybe class to format numbers in CSS --%>
                        </tr>

                        <tr>
                            <td><label>Hourly Rate:</label></td>
                            <td><fmt:formatNumber type="currency" value="<%=hourlyWage%>" /></td>
                        </tr>

                        <tr>
                            <td><label># Hours Overtime:</label></td>
                            <td><fmt:formatNumber pattern="0.#" value="<%=otHours%>" /></td>
                        </tr>

                        <tr>
                            <td><label>Overtime Hourly Rate:</label></td>
                            <td><fmt:formatNumber type="currency" value="<%=otPayRate%>" /></td>
                        </tr>

                        <tr>
                            <td><label>Gross Pay:</label></td>
                            <td><fmt:formatNumber type="currency" value="<%=grossPay%>" /></td>
                        </tr>

                        <tr>
                            <td><label>Pre-tax Deduct:</label></td>
                            <td><fmt:formatNumber type="currency" value="<%=preTax%>" /></td>
                        </tr>

                        <tr>
                            <td><label>Pre-tax pay:</label></td>
                            <td><fmt:formatNumber type="currency" value="<%=taxablePay%>" /></td>
                        </tr>

                        <tr>
                            <td><label>Tax Amount:</label></td>
                            <td><fmt:formatNumber type="currency" value="<%=taxAmount%>" /></td>
                        </tr>

                        <tr>
                            <td><label>Post-tax Pay:</label></td>
                            <td><fmt:formatNumber type="currency" value="<%=postTaxPay%>" /></td>
                        </tr>

                        <tr>
                            <td><label>Post-tax Deduct:</label></td>
                            <td><fmt:formatNumber type="currency" value="<%=postTax%>" /></td>
                        </tr>
                        <tr>
                            <td><label>Net Pay:</label></td>
                            <td><fmt:formatNumber type="currency" value="<%=netPay%>" /></td>
                        </tr>
                    </tbody>
                            
                </table>
                        
            </div> 
                        <div class="links">
                            <a href="http://msci3300-f1503.cloudapp.net:8080/HW3/">Back to Data Entry
                        </div>
        </div> 
    </body>
</html>
