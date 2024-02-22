<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
<html>
    <head>
        <title>Review Details</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style type="text/css">
            table
            {
                border: 0;
            }

            table td{
                padding: 10px;
            }
        </style>
    </head>
    <body>


        <div align="center">
            <h1>Review Details Before Paying</h1>
            <form action="execute_payment_paypal" method="post">
                <table >
                    <tr>
                        <td >Transaction Details</td>
                        <td>
                            <input type="hidden" name="paymentId" value="${param.paymentId}" >
                            <input type="hidden" name="PayerID" value="${param.PayerID}" >
                        </td>
                    </tr>
                    <tr>
                        <td>Description</td>
                        <td> ${requestScope.TRANSACTION.description} </td>
                    </tr>
                    <tr>
                        <td>Subtotal</td>
                        <td> ${requestScope.TRANSACTION.amount.details.subtotal}$ </td>
                    </tr>
                    <tr>
                        <td>Bonus Service</td>
                        <td> ${requestScope.TRANSACTION.amount.details.shipping}$ </td>
                    </tr>
                    <tr>
                        <td>Tax</td>
                        <td> ${requestScope.TRANSACTION.amount.details.tax}$ </td>
                    </tr>
                    <tr>
                        <td>Total</td>
                        <td> ${requestScope.TRANSACTION.amount.total}$ </td>
                    </tr>

                    <tr></tr><br>
                    <tr></tr>

                    <tr>
                        <td colspan="2">Payer Information</td>
                        <td></td>
                    </tr>

                    <tr>
                        <td>First Name</td>
                        <td> ${requestScope.PAYER.firstName} </td>
                    </tr>
                    <tr>
                        <td>Last Name</td>
                        <td> ${requestScope.PAYER.lastName} </td>
                    </tr><tr>
                        <td>Email</td>
                        <td> ${requestScope.PAYER.email} </td>
                    </tr>


                    <tr></tr><br>
                    <tr></tr>


                    <td colspan="2" align="center">
                        <input type="submit" value="Pay Now" />
                    </td>
                    </tr>

                </table>

            </form>
        </div>
    </body>
</html>
