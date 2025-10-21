<%-- 
    Document   : ThongBao
    Created on : Oct 14, 2025, 9:42:16?PM
    Author     : PC
--%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script>
function confirmDelete(maDocGia) {
    Swal.fire({
        title: 'Xác nhận xóa',
        text: 'Bạn có chắc muốn xóa độc giả này không?',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Có',
        cancelButtonText: 'Không'
    }).then((result) => {
        if (result.isConfirmed) {
            window.location.href = "docgia?action=delete&id=" + maDocGia;
        }
    });
}
</script>
<%
Boolean success = (Boolean) request.getAttribute("success");
String message = (String) request.getAttribute("message");
if (message != null) {
%>
<script>
Swal.fire({
    title: 'Thông báo',
    text: '<%= message %>',
    icon: '<%= (success != null && success) ? "success" : "error" %>',
    confirmButtonText: "OK"
}).then(() => {
    window.location.href = "docgia?action=list";
});
</script>
<% } %>

