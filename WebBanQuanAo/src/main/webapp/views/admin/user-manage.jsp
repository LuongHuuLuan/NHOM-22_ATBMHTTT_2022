<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Danh sách tài khoản</title>
</head>
<jsp:useBean id="roles" scope="request" type="java.util.List<model.Role>"/>
<jsp:useBean id="statuses" scope="request" type="java.util.List<model.Status>"/>
<body>
<div class="main-content">
    <div style="height: 0px; display: flex; justify-content: flex-end;">
        <div class="message_box" style="position: fixed; z-index: 9999; padding: 20px;">
            <div class="alert alert-success" id="message_box" style="width: 25vw;">
                <button type="button" class="close" data-dismiss="alert">x</button>
                <strong id="msg_box">${requestScope.message}</strong>
            </div>
        </div>
    </div>
    <div class="main-content-inner">
        <div class="breadcrumbs" id="breadcrumbs">
            <script type="text/javascript">
                try {
                    ace.settings.check('breadcrumbs', 'fixed')
                } catch (e) {
                }
            </script>

            <div class="nav-search" id="nav-search">
                <form class="form-search">
								<span class="input-icon">
									<input type="text" placeholder="Search ..." class="nav-search-input"
                                           id="nav-search-input" autocomplete="off"/>
									<i class="ace-icon fa fa-search nav-search-icon"></i>
								</span>
                </form>
            </div><!-- /.nav-search -->
        </div>

        <div class="page-content">
            <div class="page-header clearfix">
                <h1 class="pull-left">
                    Tài khoản
                </h1>
                <button type="button" class="btn btn-primary pull-right" data-toggle="modal" data-target="#add">
                    Thêm tài khoản
                </button>
            </div><!-- /.page-header -->

            <div class="row">
                <div class="col-xs-12">

                    <table id="table-user"></table>

                    <script type="text/javascript">
                        var $path_base = "${requestScope.base}";//in Ace demo this will be used for editurl parameter
                    </script>
                    <!-- PAGE CONTENT ENDS -->
                </div><!-- /.col -->
            </div><!-- /.row -->
        </div><!-- /.page-content -->
    </div>
</div><!-- /.main-content -->

<%--popup xem user--%>
<div class="modal fade" id="detail" tabindex="-1" role="dialog" aria-labelledby="detailLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="title-model">Thông tin tài khoản</h5>
                <button style="margin-top: -25px !important;" type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label for="detail-id">Mã tài khoản</label>
                    <input type="text" class="form-control" id="detail-id" disabled>
                </div>
                <div class="form-group">
                    <label for="detail-lastname">Họ</label>
                    <input type="text" class="form-control" id="detail-lastname" disabled>
                </div>
                <div class="form-group">
                    <label for="detail-firstname">Tên</label>
                    <input type="text" class="form-control" id="detail-firstname" disabled>
                </div>
                <div class="form-group">
                    <label for="detail-phone">Số điện thoại</label>
                    <input type="text" class="form-control" id="detail-phone" disabled>
                </div>
                <div class="form-group">
                    <label for="detail-email">Email</label>
                    <input type="text" class="form-control" id="detail-email" disabled>
                </div>
                <div class="form-group">
                    <label for="detail-address">Địa chỉ</label>
                    <input type="text" class="form-control" id="detail-address" disabled>
                </div>
                <div class="form-group">
                    <label for="detail-username">Tên người dùng</label>
                    <input type="text" class="form-control" id="detail-username" disabled>
                </div>
                <div class="form-group">
                    <label for="detail-role">Vai trò</label>
                    <input type="text" class="form-control" id="detail-role" disabled>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
            </div>
        </div>
    </div>
</div>

<%--delete account modal--%>
<div class="modal fade" id="confirm-delete-user" tabindex="-1" role="dialog"
     aria-labelledby="confirmDeleteLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Bạn chắc chắn muốn xóa?</h5>
                <button type="button" style="margin-top: -25px !important;" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                Chọn Ok để xóa tài khoản
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                <button type="button" class="btn btn-primary" onclick="remove()">OK</button>
            </div>
        </div>
    </div>
</div>

<%--popup add user--%>
<div class="modal fade" id="add" tabindex="-1" role="dialog" aria-labelledby="addLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Thêm tài khoản</h5>
                <button style="margin-top: -25px !important;" type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="add-user" method="post">
                    <div class="form-group">
                        <label for="add-lastname">Họ</label>
                        <input type="text" class="form-control" name="last-name" id="add-lastname"
                               placeholder="Nhập họ">
                        <p class="form-text text-danger text-muted form-error"></p>
                    </div>

                    <div class="form-group">
                        <label for="add-firstname">Tên</label>
                        <input type="text" class="form-control" name="first-name" id="add-firstname"
                               placeholder="Nhập tên">
                        <p class="form-text text-danger text-muted form-error"></p>
                    </div>

                    <div class="form-group">
                        <label for="add-phone">Số điện thoại</label>
                        <input type="text" class="form-control" name="phone" id="add-phone"
                               placeholder="Nhập số điện thoại">
                        <p class="form-text text-danger text-muted form-error"></p>
                    </div>

                    <div class="form-group">
                        <label for="add-address">Địa chỉ</label>
                        <input type="text" class="form-control" name="phone" id="add-address"
                               placeholder="Nhập địa chỉ">
                        <p class="form-text text-danger text-muted form-error"></p>
                    </div>

                    <div class="form-group">
                        <label for="add-email">Địa chỉ email</label>
                        <input type="email" class="form-control" name="email" id="add-email"
                               aria-describedby="emailHelp"
                               placeholder="Nhập email">
                        <p class="form-text text-danger text-muted form-error"></p>
                    </div>

                    <div class="form-group">
                        <label for="add-username">Tên tài khoản</label>
                        <input type="text" class="form-control" name="username" id="add-username"
                               placeholder="Nhập tên tài khoản">
                        <p class="form-text text-danger text-muted form-error"></p>
                    </div>

                    <div class="form-group">
                        <label for="add-password">Mật khẩu</label>
                        <input type="password" class="form-control" name="password" id="add-password"
                               placeholder="Nhập mật khẩu">
                        <p class="form-text text-danger text-muted form-error"></p>
                    </div>

                    <div class="form-group">
                        <label for="add-role">Vai trò</label>
                        <select id="add-role">
                            <c:forEach var="role" items="${roles}">
                                <option value="${role.id}" ${role.id == 2?'selected':null}>${role.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                <button type="submit" id="submit-form" class="btn btn-primary" form="add-user">
                    Thêm
                </button>
            </div>
        </div>
    </div>
</div>

<%--popup edit user--%>
<div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-labelledby="editLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editLabel">Sửa thông tin tài khoản</h5>
                <button style="margin-top: -25px !important;" type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="edit-user" method="post">
                    <div class="form-group">
                        <label for="detail-id">Mã tài khoản</label>
                        <input type="text" class="form-control" id="edit-id" name="id" disabled>
                        <p class="form-text text-danger text-muted form-error"></p>
                    </div>
                    <div class="form-group">
                        <label for="edit-lastname">Họ</label>
                        <input type="text" class="form-control" name="last-name" id="edit-lastname"
                               placeholder="Nhập họ">
                        <p class="form-text text-danger text-muted form-error"></p>
                    </div>

                    <div class="form-group">
                        <label for="edit-firstname">Tên</label>
                        <input type="text" class="form-control" name="first-name" id="edit-firstname"
                               placeholder="Nhập tên">
                        <p class="form-text text-danger text-muted form-error"></p>
                    </div>

                    <div class="form-group">
                        <label for="edit-phone">Số điện thoại</label>
                        <input type="text" class="form-control" name="phone" id="edit-phone"
                               placeholder="Nhập số điện thoại">
                        <p class="form-text text-danger text-muted form-error"></p>
                    </div>

                    <div class="form-group">
                        <label for="edit-address">Địa chỉ</label>
                        <input type="text" class="form-control" name="address" id="edit-address"
                               placeholder="Nhập địa chỉ">
                        <p class="form-text text-danger text-muted form-error"></p>
                    </div>

                    <div class="form-group">
                        <label for="edit-email">Địa chỉ email</label>
                        <input type="email" class="form-control" name="email" id="edit-email"
                               aria-describedby="emailHelp"
                               placeholder="Nhập email" disabled>
                        <p class="form-text text-danger text-muted form-error"></p>
                    </div>

                    <div class="form-group">
                        <label for="edit-username">Tên tài khoản</label>
                        <input type="text" class="form-control" name="username" id="edit-username"
                               placeholder="Nhập tên tài khoản" disabled>
                        <p class="form-text text-danger text-muted form-error"></p>
                    </div>

                    <div class="form-group">
                        <label for="edit-role">Vai trò</label>
                        <select id="edit-role">
                            <c:forEach var="role" items="${roles}">
                                <option value="${role.name}">${role.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                </form>

                <div class="form-group">
                    <label for="edit-status">Trạng thái</label>
                    <select id="edit-status">
                        <c:forEach var="status" items="${statuses}">
                            <option value="${status.name}">${status.name}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                <button type="submit" class="btn btn-primary" form="edit-user">
                    Sửa
                </button>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.js"></script>
<%--<script src='<c:url value="/admin/js/myAdmin/user-manage-script.js"/>'></script>--%>
<script src='<c:url value="/assets/js/validation.js"/>'></script>
<script>
    Validator({
        form: "#add-user",
        errorSelector: ".form-error",
        formGroupSelector: ".form-group",
        rules: [
            Validator.isRequire("#add-lastname", "Vui lòng nhập họ"),
            Validator.isRequire("#add-firstname", "Vui lòng nhập tên"),
            Validator.isRequire('#add-email', "Vui lòng nhập email"),
            Validator.isRequire('#add-phone', "Vui lòng nhập số điện thoại"),
            Validator.isRequire('#add-username', "Vui lòng nhập tên tài khoản"),
            Validator.isRequire('#add-password', "Vui lòng nhập mật khẩu"),
            Validator.isEmail("#add-email", "Email không hợp lệ"),
            Validator.isPhone("#add-phone", "Số điện thoại không hợp lệ"),
            Validator.isUsername("#add-username", "Tài khoản phải từ 4-20 ký tự và không chứa ký tự đặc biệt"),
            Validator.isPassword("#add-password", "Mật khẩu ít nhất là 4 ký tự và không chứa ký tự đặc biệt"),
        ],
        onSubmit: (formValues) => {
            const user = {
                action: "addUser",
                lastName: formValues["last-name"],
                firstName: formValues["first-name"],
                phone: $("#add-phone").val(),
                email: formValues["email"],
                address: $("#add-address").val(),
                username: formValues["username"],
                password: formValues["password"],
                roleId: $("#add-role").val()
            }
            $.post("admin-user-manage", user,
                function (data, status) {
                    let message = "";
                    if (data != false) {
                        $("#add").modal('hide');
                        message = "Thêm thành công";

                        $(':input', '#add-user')
                            .not(':button, :submit, :reset, :hidden')
                            .val('')
                            .prop('checked', false);
                        $("#add-role").val(2);

                        $('#table-user').DataTable().row.add([data.id, data.userName, data.email, data.role, data.status, data.id, data.id, data.id,]).draw();
                    } else {
                        message = "Tài khoản hoặc email đã tồn tại";
                    }
                    $("#msg_box").text(message);
                    $("#message_box").fadeTo(2000, 500).slideUp(500, function () {
                        $("#message_box").slideUp(500);
                    })
                })
        }
    });

    Validator({
        form: "#edit-user",
        errorSelector: ".form-error",
        formGroupSelector: ".form-group",
        rules: [
            Validator.isRequire("#edit-id", "id"),
            Validator.isRequire("#edit-lastname", "Vui lòng nhập họ"),
            Validator.isRequire("#edit-firstname", "Vui lòng nhập tên"),
            Validator.isRequire('#edit-email', "Vui lòng nhập email"),
            Validator.isRequire('#edit-phone', "Vui lòng nhập số điện thoại"),
            Validator.isRequire('#edit-username', "Vui lòng nhập tên tài khoản"),
            Validator.isEmail("#edit-email", "email"),
            Validator.isPhone("#edit-phone", "Số điện thoại không hợp lệ"),
            Validator.isUsername("#edit-username", "Tài khoản phải từ 4-20 ký tự và không chứa ký tự đặc biệt"),
        ],
        onSubmit: () => {
            const user = {
                action: "updateUser",
                id: $("#edit-id").val(),
                lastName: $("#edit-lastname").val(),
                firstName: $("#edit-firstname").val(),
                phone: $("#edit-phone").val(),
                email: $("#edit-email").val(),
                address: $("#edit-address").val(),
                username: $("#edit-username").val(),
                roleName: $("#edit-role").val(),
                statusName: $("#edit-status").val()
            }
            $.post("admin-user-manage", user,
                function (data, status) {
                    let message = "";
                    if (data != false) {
                        $("#edit").modal('hide');
                        const row = $('#table-user').DataTable().row($(editElement).parents('tr'));
                        const newData = row.data();
                        newData[3] = user.roleName;
                        newData[4] = user.statusName;
                        row.data(newData).draw();
                        message = "Sửa thành công";
                    } else {
                        message = "Sửa thất bại";
                    }
                    $("#msg_box").text(message);
                    $("#message_box").fadeTo(2000, 500).slideUp(500, function () {
                        $("#message_box").slideUp(500);
                    })
                })
        }
    });

    $(document).ready(function () {
        let message = "${requestScope.message}";
        if (message === "") {
            $("#message_box").hide();
        } else {
            $("#message_box").fadeTo(2000, 500).slideUp(500, function () {
                $("#message_box").slideUp(500);
            });
        }
        load();
    })

    function load() {
        $.post('admin-user-manage', {action: "getAllUser"},
            function (data, status) {
                const users = data.map((user, index) => ([
                    user.id,
                    user.userName,
                    user.email,
                    user.role,
                    user.status,
                    user.id,
                    user.id,
                    user.id,
                ]));
                $('#table-user').DataTable({
                    data: users,
                    columns: [
                        {title: "Mã TK"},
                        {title: "Tên TK"},
                        {title: "email"},
                        {title: "Loại TK"},
                        {title: "Trạng thái"},
                        {
                            title: '',
                            render: (id) => ("<button class='btn-detail' onclick='detail(this)' data-toggle='modal' data-target='#detail' value=" + id + "><i class='fa fa-eye' aria-hidden='true'></i></button>")
                        },
                        {
                            title: '',
                            render: (id) => ("<button class='btn-edit' onclick='update(this)' value=" + id + "><i class='fa fa-pencil' aria-hidden='true'></i></button>")
                        },
                        {
                            title: '',
                            render: (id) => ("<button class='btn-delete' onclick='confirmRemove(this)' data-toggle='modal' data-target='#confirm-delete-user' value=" + id + "><i class='fa fa-times' aria-hidden='true'></i></button>")
                        }
                    ],
                    'pageLength': 5
                })
            });
    }

    function detail(element) {
        const accountId = $(element).attr("value");
        $.post("admin-user-manage", {action: "getUser", id: accountId},
            function (data, status) {
                $("#detail-id").val(data.id)
                $("#detail-lastname").val(data.lastName)
                $("#detail-firstname").val(data.firstName)
                $("#detail-phone").val(data.phone)
                $("#detail-email").val(data.email)
                $("#detail-address").val(data.address)
                $("#detail-username").val(data.userName)
                $("#detail-role").val(data.role)
                $("#detail-status").val(data.status)
            })
    }

    let editElement = null;

    function update(element) {
        const accountId = $(element).attr("value");
        $.post("admin-user-manage", {action: "getUser", id: accountId},
            function (data, status) {
                $("#edit-id").val(data.id)
                $("#edit-lastname").val(data.lastName)
                $("#edit-firstname").val(data.firstName)
                $("#edit-phone").val(data.phone)
                $("#edit-email").val(data.email)
                $("#edit-address").val(data.address)
                $("#edit-username").val(data.userName)
                $("#edit-role").val(data.role)
                $("#edit-status").val(data.status)
            })
        editElement = element;
        $("#edit").modal("show");
    }

    let deleteId = 0;
    let deleteElement = null;

    function confirmRemove(element) {
        const accountId = $(element).attr("value");
        deleteElement = element;
        deleteId = accountId;
    }

    function remove() {
        const accountId = deleteId;
        $.post("admin-user-manage", {action: "deleteUser", id: accountId},
            function (data, status) {
                $("#confirm-delete-user").modal("hide");
                let message = "";
                if (data) {
                    message = "Xóa thành công";
                    $('#table-user').DataTable().row($(deleteElement).parents('tr')).remove().draw();
                } else {
                    message = "Xóa thất bại";
                }
                $("#msg_box").text(message);
                $("#message_box").fadeTo(2000, 500).slideUp(500, function () {
                    $("#message_box").slideUp(500);
                })
            })
    }
</script>
</body>
</html>
