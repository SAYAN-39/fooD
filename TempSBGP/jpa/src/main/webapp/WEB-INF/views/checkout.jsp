<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<title>Checkout</title>
<script src="https://checkout.razorpay.com/v1/checkout.js"></script>
</head>
<body>
<h2>Processing Payment</h2>
<script>
var options = {
"key": "${key}",
"amount": "${amount*100}",
"currency": "INR",
"name": "Test Company",
"description": "Demo Transaction",
"handler": function (response){
    // Success handler - payment completed successfully
    window.location.href = "/orderSuccess?payment_id=" + response.razorpay_payment_id +
                          "&name=" + encodeURIComponent("${custName}") +
                          "&email=" + encodeURIComponent("${custEmail}") +
                          "&contact=" + encodeURIComponent("${custContact}") +
                          "&amount=" + "${amount}";
},
"modal": {
"ondismiss": function(){
    // User closed the payment modal without completing payment
    window.location.href = "/failure?reason=cancelled";
}
},
"prefill": {
"name": "${custName}",
"email": "${custEmail}",
"contact": "${custContact}"
},
"theme": {
"color": "#3399cc"
}
};

var rzp1 = new Razorpay(options);

// Handle payment failure
rzp1.on('payment.failed', function (response){
// Payment failed - redirect to failure page with error details
var errorCode = response.error.code;
var errorDescription = response.error.description;
var errorSource = response.error.source;
var errorStep = response.error.step;
var errorReason = response.error.reason;

// Redirect to failure page with error information
window.location.href = "/failure?error_code=" + errorCode +
"&error_description=" + encodeURIComponent(errorDescription) +
"&error_source=" + errorSource +
"&error_step=" + errorStep +
"&error_reason=" + errorReason;
});

// Open the payment modal
rzp1.open();
</script>
</body>
</html>