<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Danh sách sản phẩm</title>
</head>
<body>
<jsp:useBean id="brands" scope="request" type="java.util.List<model.Brand>"/>
<jsp:useBean id="categories" scope="request" type="java.util.List<model.Category>"/>
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
                    Sản phẩm
                </h1>
                <button type="button" class="btn btn-primary pull-right" data-toggle="modal" data-target="#add">
                    Thêm sản phẩm
                </button>
            </div><!-- /.page-header -->

            <div class="row">
                <div class="col-xs-12">

                    <table id="table-product"></table>
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
                <h5 class="modal-title" id="title-model">Thông tin sản phẩm</h5>
                <button style="margin-top: -25px !important;" type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label for="detail-id">Mã sản phẩm</label>
                    <input type="text" class="form-control" id="detail-id" disabled>
                </div>
                <div class="form-group">
                    <label for="detail-name">Tên sản phẩm</label>
                    <input type="text" class="form-control" id="detail-name" disabled>
                </div>
                <div class="form-group">
                    <label for="detail-img">Ảnh đại diện</label>
                    <div style='height: 100px'>
                        <img id="detail-img" style="width: 100px; height: 100px"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="detail-images">Hình ảnh chi tiết</label>
                    <div style="height: 120px;display: flex;overflow: auto;" id="detail-images">

                    </div>
                </div>
                <div class="form-group">
                    <label for="detail-brand">Nhãn hiệu</label>
                    <input type="text" class="form-control" id="detail-brand" disabled>
                </div>
                <div class="form-group">
                    <label for="detail-category">Loại sản phẩm</label>
                    <input type="text" class="form-control" id="detail-category" disabled>
                </div>
                <div class="form-group">
                    <label for="detail-price">Giá</label>
                    <input type="text" class="form-control" id="detail-price" disabled>
                </div>
                <div class="form-group">
                    <label for="detail-discount">Giảm giá</label>
                    <input type="text" class="form-control" id="detail-discount" disabled>
                </div>
                <div class="form-group">
                    <label for="detail-description">Mô tả sản phẩm</label>
                    <textarea class="form-control" id="detail-description" disabled rows="10" cols="50"></textarea>
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
                <h5 class="modal-title" id="exampleModalLabel">Thêm sản thêm</h5>
                <button style="margin-top: -25px !important;" type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="add-product" enctype="multipart/form-data" action="admin-add-product" method="post">
                    <div class="form-group">
                        <label for="add-productCode">Mã sản phẩm</label>
                        <input type="text" class="form-control" name="code" id="add-productCode"
                               placeholder="Nhập mã sản phẩm">
                        <p style="height: 19.5px" class="form-text text-danger text-muted form-error"
                           id="err-check-code"></p>
                        <div>
                            <button type="button" onclick="checkProductCode()" class="btn btn-primary pull-right"
                                    style="margin-top: -25px;">Kiểm tra mã
                            </button>
                            <button type="button" onclick="createProductCode()" class="btn btn-primary pull-right"
                                    style="margin-right: 8px;margin-top: -25px;">Tự sinh mã
                            </button>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="add-name">Tên sản phẩm</label>
                        <input type="text" class="form-control" name="name" id="add-name"
                               placeholder="Nhập tên sản phẩm">
                        <p class="form-text text-danger text-muted form-error"></p>
                    </div>

                    <div class="form-group">
                        <label for="add-thumbnail">Chọn ảnh đại diện (Chọn một)</label>
                        <div id="add-thumbnail-show"></div>
                        <input type="file" class="form-control" onchange="reviewThumbnail(this)" name="thumbnail"
                               id="add-thumbnail" accept="image/png, image/jpeg">
                        <p class="form-text text-danger text-muted form-error add-thumbnail-err"></p>
                    </div>

                    <div class="form-group">
                        <style>
                            #add-thumbnail-show, #add-images-show {
                                display: flex;
                                overflow: auto;
                            }

                            .add-images-div {
                                width: 100px;
                                height: 100px;
                                margin: 0 4px;
                                position: relative;
                            }

                            .add-images-div i {
                                position: absolute;
                                padding: 4px 5px;
                                border-radius: 16px;
                                background-color: red;
                                color: white;
                                width: 20px;
                                height: 20px;
                                text-align: center;
                                right: 0;
                                line-height: 12px;
                            }

                            .add-images-div i:hover {
                                opacity: 0.8;
                            }

                            .add-images-div img {
                                width: 100px;
                                height: 100px;
                            }
                        </style>
                        <label for="add-images">Chọn ảnh chi tiết (Chọn một hoặc nhiều)</label>
                        <div id="add-images-show"></div>
                        <input type="file" onchange="reviewImages(this)" class="form-control" name="images"
                               id="add-images" multiple accept="image/png, image/jpeg">
                        <p class="form-text text-danger text-muted form-error"></p>
                    </div>

                    <div class="form-group">
                        <label for="add-brand">Chọn nhãn hiệu</label>
                        <select id="add-brand">
                            <c:forEach var="brand" items="${brands}">
                                <option value="${brand.name}">${brand.name}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="add-category">Chọn loại sản phẩm</label>
                        <select id="add-category">
                            <c:forEach var="category" items="${categories}">
                                <option value="${category.name}">${category.name}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="add-price">Giá</label>
                        <input type="text" class="form-control" name="price" id="add-price"
                               placeholder="Nhập giá sản phẩm">
                        <p class="form-text text-danger text-muted form-error"></p>
                    </div>
                    <div class="form-group">
                        <label for="add-description">Mô tả sản phẩm</label>
                        <textarea class="form-control" id="add-description" name="description" rows="10"
                                  cols="50"></textarea>
                        <p class="form-text text-danger text-muted form-error"></p>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                <button type="submit" id="submit-form" class="btn btn-primary" form="add-product">
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
                        <label for="edit-id">Mã tài khoản</label>
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
        $.post('admin-product-manage', {action: "getAllProduct"},
            function (data, status) {
                const products = data.map((product, index) => ([
                    (index + 1),
                    product.code,
                    product.name,
                    product.thumbnail,
                    product.brand,
                    product.category,
                    product.price,
                    product.discount + "%",
                    product.id,
                    product.id,
                    product.id

                ]));
                $('#table-product').DataTable({
                    data: products,
                    columns: [
                        {title: "STT"},
                        {title: "Mã SP"},
                        {title: "Tên SP"},
                        {
                            title: "Ảnh đại diện",
                            render: (thumbnail) => ("<img style='width: 80px; height: 80px' src='${requestScope.base}" + thumbnail + "'  alt=''>")
                        },
                        {title: "Nhãn hiệu"},
                        {title: "Loại sản phẩm"},
                        {title: "Giá"},
                        {title: "Giảm giá"},
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
                    'pageLength': 10
                })
            });
    }

    Validator({
        form: "#add-product",
        errorSelector: ".form-error",
        formGroupSelector: ".form-group",
        rules: [
            Validator.isRequire("#add-productCode", "Vui lòng nhập mã sản phẩm"),
            Validator.isRequire("#add-name", "Vui lòng nhập tên"),
            Validator.isRequire('#add-thumbnail', "Vui lòng chọn ảnh đại diện"),
            Validator.isRequire('#add-images', "Vui lòng chọn ảnh chi tiết"),
            Validator.isRequire('#add-price', "Vui lòng nhập giá sản phẩm"),
        ]
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
                        const row = $('#table-product').DataTable().row($(editElement).parents('tr'));
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

    function checkProductCode() {
        const data = {
            action: "checkProductCode",
            code: $("#add-productCode").val()
        }
        if (data.code.trim().length != 0) {
            $.post("admin-product-manage", data,
                function (data, status) {
                    if (data) {
                        $("#err-check-code").text("Mã hợp lệ")
                    } else {
                        $("#err-check-code").text("Mã đã được sử dụng")
                    }
                })
        } else {
            $("#err-check-code").text("Mã không được để trống")
        }
    }

    function createProductCode() {
        $.post("admin-product-manage", {action: "createProductCode"},
            function (data, status) {
                $("#add-productCode").val(data);
            })
    }

    let thumbnailData = {};

    function reviewThumbnail(element) {
        const [file] = element.files;
        if (file) {
            if (file.size < 3 * 1024 * 1024) {
                const reader = new FileReader();
                reader.readAsDataURL(file);
                reader.onload = function () {
                    thumbnailData.size = file.size;
                    thumbnailData.name = file.name;
                    thumbnailData.type = file.type;
                    thumbnailData.data = this.result.substring(this.result.indexOf(",") + 1);
                    console.log(thumbnailData);
                }
                const img = '<div class="add-images-div"> ' +
                    '<img src="' + URL.createObjectURL(file) + '"> ' +
                    '<i class="fa fa-times" onclick="removeThumbnail()" aria-hidden="true"></i>' +
                    '</div>';
                $("#add-thumbnail-show").css("height", "120px");
                $("#add-thumbnail-show").html(img);
            } else {
                $(".add-thumbnail-err").text("file phải nhỏ hơn 3MB");
            }

        } else {
            $("#add-thumbnail-show").css("height", "0");
            $('#add-thumbnail').val('');
            $("#add-thumbnail-show .add-images-div").remove();
        }
    }

    let imagesData = [];

    function reviewImages(element) {
        let files = element.files;
        if (files.length != 0) {
            let images = [];
            imagesData = loadImagesFiles(files);
            for (let i = 0; i < files.length; i++) {
                images.push('<div class="add-images-div"> ' +
                    '<img src="' + URL.createObjectURL(files[i]) + '"> ' +
                    '<i class="fa fa-times" onclick="removeImages(' + i + ')" aria-hidden="true"></i>' +
                    '</div>');
            }
            $("#add-images-show").css("height", "120px");
            $("#add-images-show").html(images.join(""));
        } else {
            imagesData = [];
            $('#add-images').val('');
            $("#add-images-show").css("height", "0");
            $("#add-images-show").html("");
        }
    }

    function loadImagesFiles(files) {
        let result = [];
        for (let i = 0; i < files.length; i++) {
            const reader = new FileReader();
            reader.readAsDataURL(files[i]);
            reader.onload = function () {
                const image = {
                    name: files[i].name,
                    size: files[i].size,
                    type: files[i].type,
                    data: this.result.substring(this.result.indexOf(",") + 1)
                }
                result.push(image);
            }
        }
        return result;
    }

    function removeThumbnail() {
        $("#add-thumbnail-show").css("height", "0");
        $('#add-thumbnail').val('');
        $("#add-thumbnail-show .add-images-div").remove();
    }

    function removeImages(index) {
        let files = $("#add-images")[0].files;
        let fileBuffer = new DataTransfer();
        for (let i = 0; i < files.length; i++) {
            if (index != i) {
                fileBuffer.items.add(files[i]);
            }
        }
        $("#add-images")[0].files = fileBuffer.files;
        reviewImages($("#add-images")[0]);
    }


    function detail(element) {
        const productId = $(element).attr("value");
        $.post("admin-product-manage", {action: "getProduct", id: productId},
            function (data, status) {
                $("#detail-id").val(data.code)
                $("#detail-name").val(data.name)
                $("#detail-img").attr("src", "${requestScope.base}" + data.thumbnail)
                const renderImages = data.images.map(image => ('<img style="width: 100px;height: 100px; margin: 0 4px" src=${requestScope.base}' + image + '>'))
                $("#detail-images").html(renderImages.join(''));
                $("#detail-brand").val(data.brand)
                $("#detail-category").val(data.category)
                $("#detail-price").val(data.price)
                $("#detail-discount").val(data.discount)
                $("#detail-description").val(data.description)
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
                    $('#table-product').DataTable().row($(deleteElement).parents('tr')).remove().draw();
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
