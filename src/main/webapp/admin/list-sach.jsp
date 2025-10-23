<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Quản lý Sách - Thư viện</title>
        <%@ include file="layout/header.jsp" %>
       <!--<link rel="stylesheet" href="<%= request.getContextPath()%>/css/admin.css" />-->
    </head>
    <body>
        <%@ include file="layout/nav.jsp" %>

        <div class="container-fluid">
            <div class="row">
                <div class="col-2">
                    <%@ include file="layout/sidebar.jsp" %>
                </div>

                <div class="col-10 mt-3">
                    <div class="container mt-4">

                        <!-- Bảng danh sách sách -->
                        <div class="card shadow-sm">
                            <div class="card-header bg-white d-flex justify-content-between align-items-center">
                                <h5 class="mb-0"><i class="bi bi-book"></i> Quản lý sách</h5>
                                <button class="btn btn-success btn-sm" data-bs-toggle="modal" data-bs-target="#modalAddBook">
                                    <i class="bi bi-plus-circle"></i> Thêm sách
                                </button>
                            </div>

                            <div class="card-body">
                                <!-- Form tra cứu -->
                                <form class="row g-3 mb-3" action="sach" method="post">
                                    <input type="hidden" name="action" value="search" />
                                    <div class="col-md-6">
                                        <input type="text" name="tensach" value="${param.tensach}" class="form-control" placeholder="Nhập tên sách cần tra cứu...">
                                    </div>
                                    <div class="col-md-3">
                                        <button type="submit" class="btn btn-primary">
                                            <i class="bi bi-search"></i> Tra cứu
                                        </button>
                                    </div>
                                </form>

                                <!-- Bảng danh sách -->
                                <div class="table-responsive">
                                    <table class="table table-striped align-middle" id="tableSach">
                                        <thead class="table-primary">
                                            <tr>
                                                <th>Mã sách</th>
                                                <th>Tên sách</th>
                                                <th>Tác giả</th>
                                                <th>Năm XB</th>
                                                <th>Thể loại</th>
                                                <th>Số lượng</th>  
                                                <th>Ảnh Bìa</th>
                                                <th>Thao tác</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="sach" items="${dsSach}">
                                                <tr>
                                                    <td>${sach.maSach}</td>
                                                    <td>${sach.tenSach}</td>
                                                    <td>${sach.tenTacGia}</td>
                                                    <td>${sach.namXB}</td>
                                                    <td>${sach.theLoai}</td>
                                                    <td>${sach.soLuong}</td>
                                                    <td>
                                                        <div style="width:60px; height:80px; overflow:hidden; margin:auto;">
                                                            <img src="${pageContext.request.contextPath}/Image?maSach=${sach.maSach}"alt="Ảnh bìa" style="width:100%; height:100%; object-fit:cover;">
                                                        </div>
                                                    </td>

                                                    <td>
                                                        <button class="btn btn-warning btn-sm btnEdit" data-bs-toggle="modal" data-bs-target="#modalEditBook">
                                                            <i class="bi bi-pencil-square"></i>
                                                        </button>
                                                        <button class="btn btn-danger btn-sm" onclick="confirmDelete('sach?action=delete&id=${sach.maSach}')">
                                                            <i class="bi bi-trash"></i>
                                                        </button>
                                                    </td>
                                                </tr> 
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="">
                                <ul class="pagination justify-content-center">

                                    <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                                        <a class="page-link" href="/Nhom1/sach?page=${currentPage - 1}">Previous</a>
                                    </li>

                                    <c:forEach var="s" begin="1" end="${totalPages}">
                                        <li class="page-item ${s == currentPage ? 'active' : ''}">
                                            <a class="page-link" href="/Nhom1/sach?page=${s}">${s}</a>
                                        </li>
                                    </c:forEach>

                                    <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
                                        <a class="page-link" href="/Nhom1/sach?page=${currentPage + 1}">Next</a>
                                    </li>

                                </ul>
                            </div>
                        </div>


                        <!-- Modal: Thêm sách -->
                        <div class="modal fade" id="modalAddBook" tabindex="-1" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered">
                                <div class="modal-content">
                                    <form action="sach" method="post" enctype="multipart/form-data">
                                        <input type="hidden" name="action" value="add" />
                                        <div class="modal-header bg-primary text-white">
                                            <h5 class="modal-title"><i class="bi bi-plus-circle me-2"></i>Thêm sách mới</h5>
                                            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="mb-3">
                                                <label class="form-label">Tên sách</label>
                                                <input type="text" name="TenSach" class="form-control" required>
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Tác giả</label>
                                                <input type="text" name="TacGia" class="form-control">
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Năm xuất bản</label>
                                                <input type="number" name="NamXuatBan" class="form-control">
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Thể loại</label>
                                                <input type="text" name="TheLoai" class="form-control">
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Số lượng</label>
                                                <input type="number" name="SoLuong" class="form-control" min="1" value="1">
                                            </div>
                                            <div class="mb-3">
                                                <div class="mb-3">
                                                    <label class="form-label">Ảnh bìa</label>
                                                    <input type="file" name="AnhBia" id="fileAnhBia" class="form-control" accept="image/*" required>
                                                </div>
                                                <div class="mt-2 text-center">
                                                    <img id="previewAnhBia" class="preview" src="#" alt="Xem trước ảnh bìa" style="display:none;">
                                                </div>
                                            </div>


                                        </div>
                                        <div class="modal-footer">
                                            <button class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                                            <button type="submit" class="btn btn-primary">Lưu</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>

                        <!-- Modal: Sửa sách -->
                        <div class="modal fade" id="modalEditBook" tabindex="-1" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered">
                                <div class="modal-content">
                                    <form action="sach" method="post" enctype="multipart/form-data">
                                        <input type="hidden" name="action" value="update" />
                                        <div class="modal-header bg-warning text-dark">
                                            <h5 class="modal-title"><i class="bi bi-pencil-square me-2"></i>Sửa thông tin sách</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="mb-3">
                                                <label class="form-label">Mã sách</label>
                                                <input type="text" class="form-control" id="editMaSach" name="MaSach" readonly>
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Tên sách</label>
                                                <input type="text" class="form-control" id="editTenSach" name="TenSach" required>
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Tác giả</label>
                                                <input type="text" class="form-control" id="editTacGia" name="TacGia">
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Năm xuất bản</label>
                                                <input type="number" class="form-control" id="editNamXuatBan" name="NamXuatBan">
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Thể loại</label>
                                                <input type="text" class="form-control" id="editTheLoai" name="TheLpai">
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Số lượng</label>
                                                <input type="number" class="form-control" id="editSoLuong" min="1" name="SoLuong">
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Ảnh Bìa (Edit)</label>
                                                <input type="file" class="form-control" id="editfileAnhBia" name="AnhBia" accept="image/*">
                                            </div>
                                            <div class="mt-2 text-center">
                                                <img id="editPreviewAnhBia" class="preview" src="#" alt="Xem trước ảnh bìa" style="display:none;">
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                                            <button type="submit" class="btn btn-warning text-white" id="btnUpdateBook">Cập nhật</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>      
            </div>
        </div>
        <%@ include file="layout/footer.jsp" %>
        <%@include file="layout/ThongBao.jsp" %>
    </body>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="js/Sach.js" ></script>
</html>
