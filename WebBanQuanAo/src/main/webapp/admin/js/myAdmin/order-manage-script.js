$(document).ready(function () {
    $.ajax({
        url: `http://localhost:8080${$path_base}/api/order`,
        type: 'GET',
        dataType: 'json',
        success(values) {
            const orders = values.map(order => {
                return [
                    order.orderID,
                    order.account.userName,
                    order.address,
                    order.phone,
                    order.receiver,
                    order.date,
                    order.price,
                    order.status,
                    order.orderItems
                ]
            })
            $('#table-order').DataTable({
                data: orders,
                columns: [
                    {title: 'Mã HD'},
                    {title: 'TK đặt hàng'},
                    {title: 'Địa chỉ GH'},
                    {title: 'Số điện thoại'},
                    {title: 'Người nhận'},
                    {title: 'Ngày đặt'},
                    {title: 'Thành tiền'},
                    {
                        title: 'Trạng thái',
                        render: function (status) {
                            return `<select onchange='updateStatus(this)'>
                                <option value='CHOGIAOHANG' ${status === 'CHOGIAOHANG' ? "selected" : ""}>Chờ giao hàng</option>
                                <option value='HOANTHANH' ${status === 'HOANTHANH' ? "selected" : ""}>Hoàn thành</option>
                                <option value='HUY' ${status === 'HUY' ? "selected" : ""}>Hủy</option>
                                </select>`;
                        }
                    },
                    {
                        title: '',
                        render: function () {
                            return "<button onclick='more(this)' name='more'  data-toggle='modal' data-target='#orders'>more</button>";
                        }
                    },
                    {
                        title: '',
                        render: function () {
                            return '<button type="button" class="my-btn" data-toggle="modal" onclick="setDeleteElement(this)" data-target="#confirm-delete-order">delete</button>'
                        }
                    },
                ],
                'pageLength': 5
            });
        },
    })

});

function more(element) {
    let table = $('#table-order').DataTable();
    const data = table.row($(element).parents('tr')).data();
    const orderItems = data[8];
    let modal = $('#orders .modal-body');
    const renderItem = orderItems.map(item => {
        return `<div class="order-item">
            <div class="order-image">
                <p>Mã: ${item.product.id}</p>
                <img src="${$path_base + item.product.thumbnail}">
            </div>
            <div class="order-product-name">
                <p>${item.product.name}</p>
            </div>
            <div class="order-details">
                <p>SIZE: ${item.size}</p>
                <p>Màu: ${item.color}</p>
                <p>Số Lượng: x${item.amount}</p>
            </div>
        </div>`;
    });
    modal.html(renderItem.join("\n"));

}

let deleteElement = null;

function setDeleteElement(thisElement) {
    deleteElement = thisElement;
}

function deleteOrder() {
    let table = $('#table-order').DataTable();
    const data = table.row($(deleteElement).parents('tr')).data();
    const idOrder = data[0];
    $.ajax({
        type: 'POST',
        url: `${$path_base}/api/order`,
        dataType: 'json',
        data: {
            'type': 'delete',
            'orderID': idOrder
        },
        success: function (data) {
            $("#message_box").fadeTo(2000, 500).slideUp(500, function () {
                $("#message_box").slideUp(500);
            });
            if (data === true) {
                $("#msg_box").html("Xóa hóa đơn thành công");
                let myTable = $('#table-order').DataTable();
                myTable.row($(deleteElement).parents('tr')).remove().draw();
            } else {
                $("#msg_box").html("Xóa hóa đơn thất bại");
            }
        }
    });
    $("#confirm-delete-order").modal("hide");
}

function updateStatus(element) {
    let table = $('#table-order').DataTable();
    const data = table.row($(element).parents('tr')).data();
    const idOrder = data[0];
    const status = data[7];
    $.ajax({
        type: 'POST',
        url: `${$path_base}/api/order`,
        dataType: 'json',
        data: {
            'type': 'updateStatus',
            'orderID': idOrder,
            'status': $(element).val()
        }
    });
}

