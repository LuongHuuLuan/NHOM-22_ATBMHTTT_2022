<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>${requestScope.pageName}</title>
</head>
<body>
<!-- pages-title-start -->
<%@include file="/components/location.jsp" %>
<jsp:useBean id="cart" scope="session"
             type="model.Cart"/>
<!-- pages-title-end -->
<!-- shopping-cart content section start -->
<div class="shopping-cart-area s-cart-area">
    <div class="container">
        <div class="row">
            <div class="col-md-12 col-xs-12">
                <div class="s-cart-all">
                    <div class="cart-form table-responsive">
                        <table id="shopping-cart-table" class="data-table cart-table">
                            <tbody>
                            <tr>
                                <th>Hình ảnh</th>
                                <th>Kích thước</th>
                                <th>Màu sắc</th>
                                <th>Số lượng</th>
                                <th class="low2">Tên sản phẩm</th>
                                <th>Giá</th>
                                <th class="low1">Xóa</th>
                            </tr>
                            <c:forEach var="cartItem" items="${cart.cartItems}">
                                <tr class="my-cart-item">
                                    <td class="sop-cart">
                                        <a href='<c:url value="single-product?productId=${cartItem.product.code}"/>'>
                                            <img
                                                    class="primary-image"
                                                    alt=""
                                                    src='<c:url value="${cartItem.product.thumbnail}"/>'/>
                                        </a>
                                    </td>
                                    <td class="sop-cart">
                                        <span><c:out value="${cartItem.size.code}"/></span>
                                    </td>
                                    <td class="sop-cart">
                                        <span><c:out value="${cartItem.color.name}"/></span>
                                    </td>
                                    <td class="sop-cart">
                                        <div class="quantity ray">
                                            <input class="input-text qty text my-item-quantity"
                                                   value="${cartItem.amount}"
                                                   product-price="${cartItem.product.price}"
                                                   type="number"
                                                   min="1"
                                                   step="1">
                                        </div>
                                    </td>
                                    <td class="sop-cart">
                                        <div class="tb-beg">
                                            <a href="single-product?productId=${cartItem.product.code}"><c:out
                                                    value="${cartItem.product.name}"/></a>
                                        </div>
                                    </td>
                                    <td class="sop-cart">
                                        <div class="tb-product-price font-noraure-3">
                                            <span class="amount price"></span>
                                        </div>
                                    </td>
                                    <td class="sop-icon1">
                                        <a class="deleteCard"
                                           idCard="${cart.id}"
                                           idProduct="${cartItem.product.code}"
                                           size="${cartItem.size.code}"
                                           color="${cartItem.color.code}"
                                           amount="${cartItem.amount}">
                                            <i class="fa fa-times"></i>
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
<%--                    <div class="last-check1">--%>
<%--                        <div class="yith-wcwl-share yit">--%>
<%--                            <p class="checkout-coupon an-cop">--%>
<%--                                <input id="my-update-cart" type="submit" value="Update Cart"/>--%>
<%--                            </p>--%>
<%--                        </div>--%>
<%--                    </div>--%>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="second-all-class">
                <div class="col-md-5 col-sm-12 col-xs-12">
                    <div class="sub-total">
                        <table>
                            <tbody>
                            <%--                            <tr class="cart-subtotal">--%>
                            <%--                                <th>Tổng phụ :</th>--%>
                            <%--                                <td>--%>
                            <%--                                    <span class="amount total-price">297.00 VNĐ</span>--%>
                            <%--                                </td>--%>
                            <%--                            </tr>--%>
                            <tr class="order-total">
                                <th>Tổng tất cả:</th>
                                <td>
                                    <strong>
                                        <span class="amount total-price" id="total-cart"></span>
                                    </strong>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="wc-proceed-to-checkout">
                        <p class="return-to-shop">
                            <a class="button wc-backward"
                               href="<c:url value='shop?type=all&brand=all&color=all&numOfProducts=9&page=1&sort=default'/>">Tiếp
                                tục mua sắm</a>
                        </p>
                        <p class="wc-proceed-to-checkout">
                            <a class="wc-forward" href="<c:url value='/checkout'/>">Xác nhận thanh toán</a>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- shopping-cart content section end -->
<script>
    $(document).ready(function () {
        const deleteCards = Array.from($(".deleteCard"));
        deleteCards.forEach(function (deleteItem) {
            const item = {
                type: 'delete',
                cartId: $(deleteItem).attr("idCard"),
                productId: $(deleteItem).attr("idProduct"),
                size: $(deleteItem).attr("size"),
                color: $(deleteItem).attr("color"),
                amount: $(deleteItem).attr("amount")
            }
            $(deleteItem).click(function (e) {
                e.preventDefault();
                $.post("shopping-cart",
                    item,
                    function (data, status) {
                        if (data) {
                            $(deleteItem).closest('tr').remove();
                            decreaseItem();
                            updatePrice();
                        }
                    }
                )
            })
        })

        const quantities = Array.from($('.my-item-quantity'));
        quantities.forEach(function (quantity) {
            $(quantity).focusin(function () {
                $(this).data("init-value", $(this).val());
            })
            $(quantity).focusout(function () {
                const item = {
                    type: 'update',
                    cartId: $(quantity).closest('tr').find(".deleteCard").attr("idCard"),
                    productId: $(quantity).closest('tr').find(".deleteCard").attr("idProduct"),
                    size: $(quantity).closest('tr').find(".deleteCard").attr("size"),
                    color: $(quantity).closest('tr').find(".deleteCard").attr("color"),
                    amount: $(this).val()
                }
                $.post("shopping-cart",
                    item,
                    function (data, status) {
                        if (!data) {
                            $(this).val($(this).data("init-value"));
                            console.log($(quantity).val($(quantity).data("init-value")))
                            alert("Số lượng không đủ");
                        }
                    }
                )
            })
            $(quantity).change(function () {
                if ($(this).val() < 1 || $(this).val() == null) {
                    $(this).val(1)
                }
                updatePrice();
            })
        })

        function updatePrice() {
            const quantities = Array.from($('.my-item-quantity'));
            let totalPrice = 0;
            quantities.forEach(function (quantity) {
                const priceElement = $(quantity).closest('tr').find('.price');
                const productPrice = $(quantity).attr('product-price');
                const amount = $(quantity).val();
                const price = parseInt(productPrice) * parseInt(amount);
                priceElement.text(price.toLocaleString('it-IT', {style: 'currency', currency: 'VND'}));
                totalPrice += price;
            })
            $('#total-cart').text(totalPrice.toLocaleString('it-IT', {style: 'currency', currency: 'VND'}));
        }

        updatePrice();
    })
</script>
</body>
</html>