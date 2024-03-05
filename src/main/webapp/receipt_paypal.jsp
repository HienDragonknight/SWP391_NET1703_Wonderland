<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
<html>
    <head>
        <title>Payment Receipt</title>
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
            <h1>Payment Done. Thank you for purchasing our products</h1>
            <table >
                <tr>
                    <td>Merchant</td>
                    <td> ${requestScope.TRANSACTION.description} </td>
                </tr>
                <tr>
                    <td>Payer</td>
                    <td> ${requestScope.PAYER.firstName} ${requestScope.PAYER.lastName} </td>
                </tr>
                <tr>
                    <td>Description</td>
                    <td> ${requestScope.TRANSACTION.description} </td>
                </tr>
                <tr>
                    <td>Subtotal</td>
                    <td> ${requestScope.TRANSACTION.amount.details.subtotal} </td>
                </tr>

                <tr>
                    <td>Total</td>
                    <td> ${requestScope.TRANSACTION.amount.total} </td>
                </tr>

                <tr></tr><br>
                <tr></tr>


            </table>

        </form>
    </div>

    <script>

        // Check if localStorage is supported by the browser
        if (typeof (Storage) !== "undefined") {
            // Remove item with key "packageInfo"
            localStorage.removeItem("packageInfo");
            console.log("Item with key 'packageInfo' removed from localStorage.");
        } else {
            console.log("Sorry, your browser does not support web storage...");
        }

    </script>
</body>
</html>
