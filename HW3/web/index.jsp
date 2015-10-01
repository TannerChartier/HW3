<%-- 
    Document   : index
    Created on : Sep 28, 2015, 6:38:18 PM
    Author     : Tanner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tanner's HW3</title>
        <link rel="stylesheet" type="text/css" href="css/main.css" />
    </head>
    <body>
        <div class="main">
            <h1>Simple Salary Calculation</h1>
            <hr>
            <div class="center">
                <form name="salaryForm" action="results.jsp" method="post" >
                    <table border="1">
                        <tbody>
                            <tr>
                                <td><label>Hours Worked:</label></td>
                                <td><input type="text" name="hoursWorked" value="" size="10"></td>
                            </tr>

                            <tr>
                                <td><label>Hourly Pay:</label></td>
                                <td><input type="text" name="hourlyPay" value="" size="10"></td>
                            </tr>

                            <tr>
                                <td><label>Pre-tax Deduct:</label></td>
                                <td><input type="text" name="preTax" value="" size="10"></td>
                            </tr>

                            <tr>
                                <td><label>Post-tax Deduct:</label></td>
                                <td><input type="text" name="postTax" value="" size="10"></td>
                            </tr>

                        </tbody>
                    </table>
                    <input type="reset" value="Clear Form Contents" id="clear">
                    <input type="submit" value="Submit Form Contents" id="submit">
                </form>
            </div>
        </div>
    </body>
</body>
</html>
