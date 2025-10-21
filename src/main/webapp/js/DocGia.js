
$(document).ready(function () {
    
    $('#tableDocGia .btnEdit').click(function () {
        const row = $(this).closest('tr');
        $('#editMaDocGia').val(row.find('td:eq(0)').text());
        $('#editHoTen').val(row.find('td:eq(1)').text());
        $('#editNgaySinh').val(row.find('td:eq(2)').text());
        $('#editDiaChi').val(row.find('td:eq(3)').text());
        $('#editSoDienThoai').val(row.find('td:eq(4)').text());
        $('#editEmail').val(row.find('td:eq(5)').text());
    });
    $('#btnUpdateReader').click(function () {
        const form = $('#modalEditReader form');

        $.ajax({
            url: 'docgia',
            type: 'POST',
            data: form.serialize(),
            success: function (res) {
                const container = $('<div>').html(res).appendTo('body');
                if (res.includes('success')) {
                    $('#modalEditReader').modal('hide');
                    const madocgia = $('#editMaDocGia').val();
                    const row = $('#tableDocGia td').filter(function () {
                        return $(this).text() === madocgia;
                    }).closest('tr');
                    row.find('td:eq(1)').text($('#editHoTen').val());
                    row.find('td:eq(2)').text($('#editNgaySinh').val());
                    row.find('td:eq(3)').text($('#editDiaChi').val());
                    row.find('td:eq(4)').text($('#editSoDienThoai').val());
                    row.find('td:eq(5)').text($('#editEmail').val());
                }
                setTimeout(() => container.remove(), 1000);
            },
            error: function (err) {
                console.error(err);
                alert("Cập nhật thất bại!");
            }
        });
    });
});


