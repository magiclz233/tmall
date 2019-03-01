
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<main class="pay-page">
    <div class="pay-tip">扫一扫付款</div>
    <div class="pay-num">￥${order.sum}</div>
    <img src="img/alipay.png" class="alipay-img">
    <a href="payed?oid=${order.id}"><button class="confirm-pay">免费支付</button></a>
</main>
