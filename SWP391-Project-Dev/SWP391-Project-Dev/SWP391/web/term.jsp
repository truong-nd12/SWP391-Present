<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
<head>
    <meta charset="UTF-8">
    <title>Chính sách và điều khoản</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #f0f0f0; /* Màu nền xám nhạt */
            font-family: Arial, sans-serif; /* Đổi font chữ */
        }

        .container {
            text-align: left;
            background-color: #ffffff; /* Màu nền trắng cho phần nội dung */
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Đổ bóng */
            font-family: Arial, sans-serif; /* Đổi font chữ */
        }

        .btn-back {
            display: inline-block;
            padding: 10px 20px;
            background-color: #007bff; /* Màu nền xanh */
            color: #fff; /* Màu chữ trắng */
            text-decoration: none;
            border: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
            margin-top: 20px; /* Khoảng cách từ nút lên phần nội dung */
            font-family: Arial, sans-serif; /* Đổi font chữ */
        }

        .btn-back:hover {
            background-color: #0056b3; /* Màu nền xanh nhạt khi hover */
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Chính sách bảo mật</h2>
        <p>Chào mừng bạn đến với trang web của chúng tôi. Chính sách bảo mật này mô tả cách chúng tôi thu thập, sử dụng và bảo vệ thông tin mà bạn cung cấp khi sử dụng dịch vụ của chúng tôi.</p>

        <h3>Thông tin thu thập và sử dụng</h3>
        <p>Chúng tôi có thể thu thập các loại thông tin sau khi bạn đồng ý cung cấp:</p>
        <ul>
            <li>Thông tin cá nhân: Bao gồm tên, địa chỉ email, số điện thoại, địa chỉ.</li>
            <li>Dữ liệu sử dụng: Thông tin về cách bạn tương tác với trang web, bao gồm các hoạt động truy cập và các thao tác trên trang web.</li>
        </ul>

        <h3>Bảo vệ thông tin cá nhân</h3>
        <p>Chúng tôi cam kết bảo vệ thông tin cá nhân của bạn và sử dụng các biện pháp bảo mật thích hợp để ngăn chặn truy cập trái phép hoặc phát tán thông tin cá nhân của bạn.</p>

        <h3>Chia sẻ thông tin</h3>
        <p>Chúng tôi không chia sẻ thông tin cá nhân của bạn với bên thứ ba ngoài trừ những trường hợp cần thiết để cung cấp dịch vụ bạn yêu cầu, hoặc khi pháp luật yêu cầu.</p>

        <h3>Liên hệ</h3>
        <p>Nếu bạn có bất kỳ câu hỏi hoặc ý kiến nào về chính sách bảo mật của chúng tôi, xin vui lòng liên hệ với chúng tôi qua địa chỉ email: SmartTech@gmail.com.</p>

        <!-- Thêm nút Back về trang đăng ký với CSS -->
        <a class="btn-back" href="RegisterPage.jsp">Quay lại</a>
    </div>
</body>
</html>
