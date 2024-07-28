
<jsp:useBean id="helper" class="helper.helper"/>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Trang quản lý-Smart Tech</title>
        <link rel="shortcut icon" type="image/png" href="assets/images/logo_2.png"/>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <jsp:include page="component/manager/head.jsp"></jsp:include>
        </head>
    <jsp:include page="component/manager/header.jsp"></jsp:include>
        <body>
            <div class="container-fluid position-relative bg-white d-flex p-0">
            <jsp:include page="component/manager/slidebar.jsp"></jsp:include>
                <!-- Content Start -->
                <div class="content">
                    <div class="container-xxl">
                    <nav class="navbar navbar-expand bg-light navbar-light sticky-top px-4 py-0">
                            <a href="index.html" class="navbar-brand d-flex d-lg-none me-4">
                                <h2 class="text-primary mb-0"><i class="fa fa-hashtag"></i></h2>
                            </a>
                            <a href="#" class="sidebar-toggler flex-shrink-0">
                                <i class="fa fa-bars"></i>
                            </a>
                            <div class="navbar-nav align-items-center ms-auto">
                                <div class="nav-item dropdown  ml-3">
                                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                                        <img class="rounded-circle me-lg-2" src="img/user.jpg" alt="" style="width: 40px; height: 40px;">
                                        <span class="d-none d-lg-inline-flex">${sessionScope.acc.getAcc_name()}</span>
                                </a>
                                <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                                    <c:if test="${sessionScope.acc.getRole_id()==1}">
                                        <a href="AdminPage" class="dropdown-item">Quay lại</a>
                                    </c:if>
                                    <a href="LogOut" class="dropdown-item">Đăng xuất</a>
                                </div>
                            </div>
                        </div>
                    </nav>

                        <div class="card mt-10">
                            <div class="card-body text-black">
                                <h1>Cập nhập sản phẩm</h1>
                                <form id="UpdateProductFrm" method="post" action="updateproduct">
                                <c:forEach items="${listP}" var="p">
                                    <input name="id" value="${p.product_id}" hidden />
                                    <div class="form-group">
                                        <label class="form-label text-black" for="formControlLg">Tên sản phẩm</label>
                                        <input required name="name" value="${p.product_name}" type="text" id="formControlLg" class="form-control" />
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label text-black" for="formControlLg">Giá</label>
                                        <input id="numberInput" type="text" class="form-control" value="${helper.convertToVietnameseDong(p.price)}" name="price" oninput="formatNumber(this)">
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label text-black" for="formControlLg">Số lượng</label>
                                        <input readonly name="quantity" type="number" value="${p.quantity}" id="formControlLg" class="form-control" />
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label text-black" for="formControlLg">Giảm giá</label>
                                        <input required name="sale" type="number" value="${p.sale}" id="formControlLg" class="form-control" />
                                    </div>
                                    <div class="md-form mt-3 mb-3">
                                        <label for="form7" class="text-black">Mô tả</label>
                                        <textarea required id="editor" name="description" id="form7" class="md-textarea form-control" rows="3">${p.description}</textarea>
                                    </div>
                                    <label class="form-label select-label text-black">Thương hiệu</label>
                                    <select required name="brand" class="form-select">
                                        <c:forEach items="${listB}" var="b">
                                            <option value="${b.brand_id}" ${p.brand==b.brand_id?"selected":""}>${b.brand_name}</option> 
                                        </c:forEach>
                                    </select>
                                    <br>
                                    <label class="form-label select-label text-black">Kiểu</label>
                                    <select required name="type" class="form-select">
                                        <c:forEach items="${listT}" var="t">
                                            <option value="${t.type_id}" ${p.type==b.type_id?"selected":""}>${t.type_name}</option> 
                                        </c:forEach>
                                    </select>
                                    <div class="form-group mb-3">
                                        <label class="form-label text-black" for="formControlLg">Thời gian bảo hành</label>
                                        <input required name="guarantee" value="${p.guarantee_time}" type="number" id="formControlLg" class="form-control" />
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <button type="submit" class="btn btn-primary">Lưu thay đổi</button>
                                        </div>
                                        <div class="col-sm-6 text-end">
                                            <a href="UpdateProductImg?id=${p.product_id}" class="btn btn-secondary">Cập nhập ảnh</a>
                                        </div>
                                    </div>
                                </c:forEach>
                            </form>

                        </div>
                    </div>
                </div>
                <!-- Footer Start -->
                <jsp:include page="component/manager/footer.jsp"></jsp:include>
                <!-- Footer End -->
            </div>
        </div>
    </body>
    <script src="https://cdn.ckeditor.com/ckeditor5/38.0.1/super-build/ckeditor.js"></script>
    <script src="https://cdn.ckeditor.com/ckeditor5/38.0.1/classic/translations/vi.js"></script>
    <script src="https://cdn.ckeditor.com/ckeditor5/38.0.1/media-embed/media-embed.js"></script>
    <script>
                                            CKEDITOR.ClassicEditor.create(document.getElementById("editor"), {
                                                // https://ckeditor.com/docs/ckeditor5/latest/features/toolbar/toolbar.html#extended-toolbar-configuration-format

                                                toolbar: {
                                                    items: [
                                                        'exportPDF', 'exportWord', '|',
                                                        'findAndReplace', 'selectAll', '|',
                                                        'heading', '|',
                                                        'bold', 'italic', 'strikethrough', 'underline', 'code', 'subscript', 'superscript', 'removeFormat', '|',
                                                        'bulletedList', 'numberedList', 'todoList', '|',
                                                        'outdent', 'indent', '|',
                                                        'undo', 'redo',
                                                        '-',
                                                        'fontSize', 'fontFamily', 'fontColor', 'fontBackgroundColor', 'highlight', '|',
                                                        'alignment', '|',
                                                        'link', 'insertImage', 'blockQuote', 'insertTable', 'mediaEmbed', 'codeBlock', 'htmlEmbed', '|',
                                                        'specialCharacters', 'horizontalLine', 'pageBreak', '|',
                                                        'textPartLanguage', '|',
                                                        'sourceEditing'
                                                    ],
                                                    shouldNotGroupWhenFull: true
                                                },
                                                // Changing the language of the interface requires loading the language file using the <script> tag.
                                                // language: 'es',
                                                list: {
                                                    properties: {
                                                        styles: true,
                                                        startIndex: true,
                                                        reversed: true
                                                    }
                                                },
                                                // https://ckeditor.com/docs/ckeditor5/latest/features/headings.html#configuration
                                                heading: {
                                                    options: [
                                                        {model: 'paragraph', title: 'Paragraph', class: 'ck-heading_paragraph'},
                                                        {model: 'heading1', view: 'h1', title: 'Heading 1', class: 'ck-heading_heading1'},
                                                        {model: 'heading2', view: 'h2', title: 'Heading 2', class: 'ck-heading_heading2'},
                                                        {model: 'heading3', view: 'h3', title: 'Heading 3', class: 'ck-heading_heading3'},
                                                        {model: 'heading4', view: 'h4', title: 'Heading 4', class: 'ck-heading_heading4'},
                                                        {model: 'heading5', view: 'h5', title: 'Heading 5', class: 'ck-heading_heading5'},
                                                        {model: 'heading6', view: 'h6', title: 'Heading 6', class: 'ck-heading_heading6'}
                                                    ]
                                                },
                                                // https://ckeditor.com/docs/ckeditor5/latest/features/editor-placeholder.html#using-the-editor-configuration
                                                placeholder: 'Welcome to CKEditor 5!',
                                                // https://ckeditor.com/docs/ckeditor5/latest/features/font.html#configuring-the-font-family-feature
                                                fontFamily: {
                                                    options: [
                                                        'default',
                                                        'Arial, Helvetica, sans-serif',
                                                        'Courier New, Courier, monospace',
                                                        'Georgia, serif',
                                                        'Lucida Sans Unicode, Lucida Grande, sans-serif',
                                                        'Tahoma, Geneva, sans-serif',
                                                        'Times New Roman, Times, serif',
                                                        'Trebuchet MS, Helvetica, sans-serif',
                                                        'Verdana, Geneva, sans-serif'
                                                    ],
                                                    supportAllValues: true
                                                },
                                                // https://ckeditor.com/docs/ckeditor5/latest/features/font.html#configuring-the-font-size-feature
                                                fontSize: {
                                                    options: [10, 12, 14, 'default', 18, 20, 22],
                                                    supportAllValues: true
                                                },
                                                // Be careful with the setting below. It instructs CKEditor to accept ALL HTML markup.
                                                // https://ckeditor.com/docs/ckeditor5/latest/features/general-html-support.html#enabling-all-html-features
                                                htmlSupport: {
                                                    allow: [
                                                        {
                                                            name: /.*/,
                                                            attributes: true,
                                                            classes: true,
                                                            styles: true
                                                        }
                                                    ]
                                                },
                                                // Be careful with enabling previews
                                                // https://ckeditor.com/docs/ckeditor5/latest/features/html-embed.html#content-previews
                                                htmlEmbed: {
                                                    showPreviews: true
                                                },
                                                // https://ckeditor.com/docs/ckeditor5/latest/features/link.html#custom-link-attributes-decorators
                                                link: {
                                                    decorators: {
                                                        addTargetToExternalLinks: true,
                                                        defaultProtocol: 'https://',
                                                        toggleDownloadable: {
                                                            mode: 'manual',
                                                            label: 'Downloadable',
                                                            attributes: {
                                                                download: 'file'
                                                            }
                                                        }
                                                    }
                                                },
                                                // https://ckeditor.com/docs/ckeditor5/latest/features/mentions.html#configuration
                                                mention: {
                                                    feeds: [
                                                        {
                                                            marker: '@',
                                                            feed: [
                                                                '@apple', '@bears', '@brownie', '@cake', '@cake', '@candy', '@canes', '@chocolate', '@cookie', '@cotton', '@cream',
                                                                '@cupcake', '@danish', '@donut', '@drag?e', '@fruitcake', '@gingerbread', '@gummi', '@ice', '@jelly-o',
                                                                '@liquorice', '@macaroon', '@marzipan', '@oat', '@pie', '@plum', '@pudding', '@sesame', '@snaps', '@souffl?',
                                                                '@sugar', '@sweet', '@topping', '@wafer'
                                                            ],
                                                            minimumCharacters: 1
                                                        }
                                                    ]
                                                },
                                                // The "super-build" contains more premium features that require additional configuration, disable them below.
                                                // Do not turn them on unless you read the documentation and know how to configure them and setup the editor.
                                                removePlugins: [
                                                    // These two are commercial, but you can try them out without registering to a trial.
                                                    // 'ExportPdf',
                                                    // 'ExportWord',
                                                    'CKBox',
                                                    'CKFinder',
                                                    'EasyImage',
                                                    // This sample uses the Base64UploadAdapter to handle image uploads as it requires no configuration.
                                                    // https://ckeditor.com/docs/ckeditor5/latest/features/images/image-upload/base64-upload-adapter.html
                                                    // Storing images as Base64 is usually a very bad idea.
                                                    // Replace it on production website with other solutions:
                                                    // https://ckeditor.com/docs/ckeditor5/latest/features/images/image-upload/image-upload.html
                                                    // 'Base64UploadAdapter',
                                                    'RealTimeCollaborativeComments',
                                                    'RealTimeCollaborativeTrackChanges',
                                                    'RealTimeCollaborativeRevisionHistory',
                                                    'PresenceList',
                                                    'Comments',
                                                    'TrackChanges',
                                                    'TrackChangesData',
                                                    'RevisionHistory',
                                                    'Pagination',
                                                    'WProofreader',
                                                    // Careful, with the Mathtype plugin CKEditor will not load when loading this sample
                                                    // from a local file system (file://) - load this site via HTTP server if you enable MathType.
                                                    'MathType',
                                                    // The following features are part of the Productivity Pack and require additional license.
                                                    'SlashCommand',
                                                    'Template',
                                                    'DocumentOutline',
                                                    'FormatPainter',
                                                    'TableOfContents'
                                                ]
                                            });

                                            function formatNumber(input) {
                                                // Remove existing dots and non-numeric characters from the input value
                                                var value = input.value.replace(/\D/g, '');

                                                // Add dots as thousands separators
                                                var formattedValue = value.replace(/\B(?=(\d{3})+(?!\d))/g, '.');

                                                // Update the input value with the formatted value
                                                input.value = formattedValue;
                                            }
    </script>
</html>