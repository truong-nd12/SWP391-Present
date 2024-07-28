
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trang quản lý -SMART TECH</title>
        <link rel="shortcut icon" type="image/png" href="assets/images/logo_2.png"/>
        <%@include file="component/header.jsp" %>
    </head>
    <body>
        <%@include file="component/navbar.jsp" %>
        <div id="" class="container">
            <div class="card">
                <div class="card-body" style="color: #177bb6">
                    <c:if test="${requestScope.news.getNews_id()!=null&&requestScope.news.getNews_id()!=0}">
                        <h3>Cập nhật tin tức </h3>
                    </c:if>
                    <c:if test="${requestScope.news.getNews_id()==null||requestScope.news.getNews_id()==0}">
                        <h3>Thêm tin tức </h3>
                    </c:if>
                    <div class="row">
                        <c:if test="${requestScope.ERROR != null}">
                            <p class="text-danger">${requestScope.ERROR}</p>
                        </c:if>
                    </div>
                    <c:if test="${requestScope.news.getNews_id()!=null &&requestScope.news.getNews_id()!=0}">
                        <form method="post" action="AddNews?id=${requestScope.news.getNews_id()}" enctype="multipart/form-data">
                    </c:if>
                    <c:if test="${requestScope.news.getNews_id()==null ||requestScope.news.getNews_id()==0}">
                        <form method="post" action="AddNews" enctype="multipart/form-data">
                    </c:if>
                        <div class="form-group">
                            <label class="form-label"  style="color: #177bb6">Tiêu đề</label>
                            <input hidden value="${requestScope.news.getNews_id()}" name="id">
                            <input required="" type="text" value="${requestScope.news.getTitle()}" name="title" class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="form7" style="color: #177bb6">Nội dung</label>
                            <textarea name="content" id="editor">${requestScope.news.content}</textarea>
                        </div>
                        <br>
                        <div class="form-group">
                            <label class="form-label select-label" style="color: #177bb6">Thương hiệu</label>
                            <select required name="brand" class="form-select" style="color: #177bb6">
                                <option value="0">Không có</option>
                                <c:forEach items="${sessionScope.brands}" var="b">
                                    <option value="${b.getBrand_id()}" ${requestScope.news.getBrand()==b.getBrand_id()?"selected":""}>${b.getBrand_name()}</option> 
                                </c:forEach>
                            </select>
                        </div>
                        <br>
                        <div class="form-group" >
                            <label class="form-label select-label" style="color: #177bb6">Kiểu</label>
                            <select required name="news_type" class="form-select" style="color: #177bb6">
                                <c:forEach items="${sessionScope.news_type}" var="b">
                                    <option value="${b.getNews_type_id()}" ${requestScope.news.getNews_type()==b.getNews_type_id()?"selected":""}>${b.getType_name()}</option> 
                                </c:forEach>
                            </select>
                        </div>
                        <br>
                        <div class="form-group">
                            <label  class="form-label" style="color: #177bb6">Ảnh</label>
                            <input name="photo" accept=".png, .jpg" class="form-control" type="file" ${(requestScope.news.getNews_id()==null||requestScope.news.getNews_id()==0)? "required":""} />
                            <p style="color: red">${err}</p>
                            <p style="color: green">${suc}</p>
                        </div>
                        <div class="form-group mt-3">
                            <button type="submit" class="btn btn-primary"><a href="ManagerNew" style="color: white" >Quay lại</a></button>
                            <c:if test="${requestScope.news.getNews_id()!=null&&requestScope.news.getNews_id()!=0}">
                                <button type="submit" class="btn btn-primary">Cập nhật</button>
                            </c:if>
                            <c:if test="${requestScope.news.getNews_id()==null||requestScope.news.getNews_id()==0}">
                                <button type="submit" class="btn btn-primary">Thêm</button>
                            </c:if>
                        </div>
                    </form>
                </div>
            </div>
        </div>
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

            ClassicEditor
                    .create(document.querySelector('#content'))
                    .catch(error => {
                        console.error(error);
                    });



        </script>

    </body>
</html>

