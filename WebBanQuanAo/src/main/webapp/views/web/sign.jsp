<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!-- pages-title-start -->
<html>
<head>
    <title>${requestScope.pageName}</title>
</head>
<body>
<%@include file="/components/location.jsp" %>
<jsp:useBean id="cart" scope="session" type="model.Cart"/>
<jsp:useBean id="account" scope="session" type="model.Account"/>
<!-- pages-title-end -->
<!-- checkout content section start -->
<div class="checkout-area">
    <div class="container">

        <div style="height: 0px; display: flex; justify-content: flex-end;">
            <div class="message_box" style="position: fixed; z-index: 9999; padding: 20px;">
                <div class="alert alert-success" id="message_box" style="width: 25vw;">
                    <button type="button" class="close" data-dismiss="alert">x</button>
                    <strong id="msg_box">${requestScope.message}</strong>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-5 col-sm-12">
                <div class="form-group">
                    <label for="order-download">Tải hóa đơn</label>
                    <a href="${requestScope.orderUrl}" download="${requestScope.fileName}">
                        <button type="button" id="order-download" class="btn btn-primary">Tải
                            xuống
                        </button>
                    </a>
                </div>
                <form id="confirm-sign" enctype="multipart/form-data" action="sign" method="post">
                    <div class="form-group">
                        <label for="order-upload">Upload hóa đơn đã ký</label>
                        <input type="hidden" name="orderId" value="${requestScope.orderId}">
                        <input type="file" class="form-control" name="order-pdf"
                               id="order-upload">
                        <button type="submit" form="confirm-sign" class="btn btn-primary" style="margin-top: 10px">Xác
                            nhận
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- checkout content section end -->
<script src='<c:url value="/assets/js/validation.js"/>'></script>
<script>
    $(document).ready(function () {
        let message = "${requestScope.message}";
        if (message === "") {
            $("#message_box").hide();
        } else {
            $("#message_box").fadeTo(2000, 500).slideUp(500, function () {
                $("#message_box").slideUp(500);
            });
        }

        const amountElements = Array.from($('.amount'));
        amountElements.forEach((amount) => {
            $(amount).text(parseInt($(amount).text()).toLocaleString('it-IT', {style: 'currency', currency: 'VND'}));
        })
    })
</script>
</body>
</html>