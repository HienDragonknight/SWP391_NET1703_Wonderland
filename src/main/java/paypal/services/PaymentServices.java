/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package paypal.services;

import com.paypal.api.payments.Amount;
import com.paypal.api.payments.Details;
import com.paypal.api.payments.Item;
import com.paypal.api.payments.ItemList;
import com.paypal.api.payments.Links;
import com.paypal.api.payments.Payer;
import com.paypal.api.payments.PayerInfo;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.RedirectUrls;
import com.paypal.api.payments.Transaction;
import com.paypal.base.rest.APIContext;
import com.paypal.base.rest.PayPalRESTException;
import java.sql.Array;
import java.util.ArrayList;
import java.util.List;

public class PaymentServices {

    private static final String CLIENT_ID = "AftudlEyEA0-OvtUKbmINdQniVHtIW2dSJW2gvN_23GQdeQMcyrZIw0f6JQFjaJhe8EUazQgCZNW6ycL";
    private static final String SECRET = "EIUFsN0ZoeIbdv2_94I9LNSoe58NNofWpSZXCKKuq4nPTd4IrUrL6IehHXGFUw_GJQ71G8J9ivVkcIuq";
    private static final String MODE = "sandbox";

    // this method using for send payment details for Payer for verification
    public String authorizedPayment(OrderDetailPayPal orderDetailPayPal) throws PayPalRESTException {

        Payer payer = getPayerInfomation();
        RedirectUrls redirectUrls = getRedirectURLs();
        List<Transaction> listTransaction = getTransactionInformation(orderDetailPayPal);

        Payment requestPayment = new Payment();          // create a paypal Payment Object to encapsulate the payment detailsk
        requestPayment.setTransactions(listTransaction)
                .setRedirectUrls(redirectUrls)
                .setPayer(payer)
                .setIntent("authorize");

        APIContext apiContext = new APIContext(CLIENT_ID, SECRET, MODE);    // create APIContext object to connect PayPal Server
        Payment approvedPayment = requestPayment.create(apiContext);

        System.out.println(approvedPayment);

        return getApprovalLink(approvedPayment);
    }

    private Payer getPayerInfomation() {
        Payer payer = new Payer();
        payer.setPaymentMethod("paypal");

        PayerInfo payerInfo = new PayerInfo();
        payerInfo.setFirstName("Tran")
                .setLastName("Bao")
                .setEmail("bao@gmail.com");

        payer.setPayerInfo(payerInfo);

        return payer;
    }

    private RedirectUrls getRedirectURLs() {
        RedirectUrls redirectUrls = new RedirectUrls();

        // create 2 redirect URL
        redirectUrls.setCancelUrl("http://localhost:6969/SWP391_NET1703_Wonderland/cancel.html");            // this url is used when user cancels the payment
        redirectUrls.setReturnUrl("http://localhost:6969/SWP391_NET1703_Wonderland/review_payment.html");    // this url is used when user accepts to continue the payment

        return redirectUrls;
    }

    private List<Transaction> getTransactionInformation(OrderDetailPayPal orderDetailPayPal) {

        // get orderDetail info that you see from checkout_paypal.html to set into Detail class  
        Details details = new Details();
        details.setShipping(orderDetailPayPal.getShipping())
                .setSubtotal(orderDetailPayPal.getSubTotal())
                .setTax(orderDetailPayPal.getTax());

        Amount amount = new Amount(); //  this class is set currency
        amount.setCurrency("USD")
                .setTotal(orderDetailPayPal.getTotal())
                .setDetails(details);

        Transaction transaction = new Transaction();    // this is PayPal Transaction object
        transaction.setAmount(amount)
                .setDescription(orderDetailPayPal.getProductName());

        ItemList itemList = new ItemList();
        List<Item> items = new ArrayList<Item>();

        Item item = new Item();
        item.setCurrency("USD")
                .setName(orderDetailPayPal.getProductName())
                .setPrice(orderDetailPayPal.getSubTotal())
                .setTax(orderDetailPayPal.getTax())
                .setQuantity("1");

        items.add(item);
        itemList.setItems(items);
        transaction.setItemList(itemList);

        List<Transaction> listTransaction = new ArrayList<Transaction>();
        listTransaction.add(transaction);

        return listTransaction;
    }

    private String getApprovalLink(Payment approvalPayment) {
        List<Links> links = approvalPayment.getLinks();
        String approvalLink = null;
        for (Links link : links) {
            if (link.getRel().equalsIgnoreCase("approval_url")) {
                approvalLink = link.getHref();
            }
        }
        return approvalLink;
    }
}
