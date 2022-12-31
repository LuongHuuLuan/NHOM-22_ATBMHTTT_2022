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
                <div class="ro-checkout-summary">
                    <div class="ro-title">
                        <h3 class="checkbox9">Tổng thanh toán</h3>
                    </div>
                    <div class="ro-body">
                        <c:forEach var="item" items="${cart.cartItems}">
                            <div class="ro-item">
                                <div class="ro-image">
                                    <a href='<c:url value="/single-product?productId=${item.product.code}"/>'>
                                        <img src='<c:url value="${item.product.thumbnail}"/>' alt="">
                                    </a>
                                </div>
                                <div>
                                    <div class="tb-beg">
                                        <a href='<c:url value="/single-product?productId=${item.product.code}"/>'>${item.product.name}</a>
                                    </div>
                                </div>
                                <div>
                                    <div class="ro-price">
                                        <span class="amount">${item.product.price}</span>
                                    </div>
                                    <div class="ro-quantity">
                                        <strong class="product-quantity">× ${item.amount}</strong>
                                    </div>
                                    <div class="product-total">
                                        Tổng: <span class="amount">${item.amount * item.product.price}</span>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="modal fade" id="confirmPayment" tabindex="-1" role="dialog"
                         aria-labelledby="confirmPaymentModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Xác nhậm thanh toán</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <h3>Bạn có muốn xác nhận thanh toán</h3>
                                </div>
                                <div class="modal-footer" style="text-align: center;">
                                    <button type="submit" class="btn btn-primary" form="form-checkout">Xác nhận
                                    </button>
                                    <button type="button" class="btn btn-danger" data-dismiss="modal">Hủy thanh toán
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="ro-footer">
                        <div>
                            <p>
                                Tổng tiền sản phẩm
                                <span class="amount">${requestScope.totalCart}</span>
                            </p>
                            <div class="ro-divide"></div>
                        </div>
                        <div>
                            <p>
                                Tổng tiền giảm
                                <span class="amount">0</span>
                            </p>
                            <div class="ro-divide"></div>
                        </div>
                        <div class="shipping">
                            <p>Phí giao hàng</p>
                            <div class="ro-shipping-method">
                                <p>
                                    Khu vực quanh shop (Free)
                                </p>
                            </div>
                            <div class="clearfix"></div>
                            <div class="ro-divide"></div>
                        </div>
                        <div class="order-total">
                            <p>
                                Tổng
                                <span>
                                    <strong>
                                        <span class="amount">${requestScope.totalCart}</span>
                                    </strong>
                                </span>
                            </p>
                        </div>
                        <div>
                            <p>
                                Tổng giá trị thanh toán
                                <strong>
                                    <span class="amount">${requestScope.totalCart}</span>
                                </strong>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-7 col-sm-12">
                <div class="text">
                    <div class="row">
                        <form id="form-checkout" action="/WebBanQuanAo/checkout" method="post">
                            <div class="checkbox-form">
                                <div class="col-md-12">
                                    <h3 class="checkbox9">Thông tin hóa đơn</h3>
                                </div>
                                <div class="col-md-12 form-group">
                                    <div class="di-na bs">
                                        <label class="l-contact">
                                            Họ tên người nhận hàng
                                            <em>*</em>
                                        </label>
                                        <input class="form-control" id="fullname" type="text" name="fullname"
                                               value="${account.lastName} ${account.firstName}"
                                        >
                                        <p class="form-error" style="color: red"></p>
                                    </div>
                                </div>
                                <div class="col-md-12 form-group">
                                    <div class="di-na bs">
                                        <label class="l-contact">
                                            SDT người nhận hàng
                                            <em>*</em>
                                        </label>
                                        <input class="form-control" id="phone-number" type="tel" required="" name="sdt"
                                               placeholder="Nhập số điện thoại nhận hàng"
                                               value="${account.phone}">
                                        <p class="form-error" style="color: red"></p>
                                    </div>
                                </div>
                                <div class="col-md-12 form-group">
                                    <div class="di-na bs">
                                        <label class="l-contact">
                                            Địa chỉ nhận hàng
                                            <em>*</em>
                                        </label>
                                        <div class="di-na bs">
                                            <input class="form-control" id="address-customer" type="text" required=""
                                                   name="address"
                                                   placeholder="Nhập địa chỉ nhận hàng"
                                                   value="${account.address}"
                                            >
                                        </div>
                                        <p class="form-error" style="color: red"></p>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div style="text-align: center">
                    <button type="button" class="btn btn-primary" data-toggle="modal"
                            data-target="#confirmPayment">
                        Thanh toán
                    </button>
                </div>
            </div>
        </div>
        <%--Model xác nhận thanh toán--%>
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
    Validator({
        form: "#form-checkout",
        errorSelector: ".form-error",
        formGroupSelector: ".form-group",
        rules: [
            Validator.isRequire('#fullname', "Vui lòng tên người nhận hàng"),
            Validator.isRequire('#phone-number', "Vui lòng nhập số điện thoại người nhận"),
            Validator.isRequire('#address-customer', "Vui lòng nhập địa chỉ nhận hàng"),
        ],
    });
</script>
</body>
</html>