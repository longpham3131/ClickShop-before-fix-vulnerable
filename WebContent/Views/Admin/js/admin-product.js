$(document).ready(function () {
    $(document).on("click", ".deletesize", function () {
        datasizedelete = []
        var tr = $(this).closest('tr'); // table row ID 
        idsize = tr.find("td:eq(0) input[type='hidden']").val();

        size = tr.find("td:eq(0) input[type='text']").val();
        available = tr.find("td:eq(1) input[type='text']").val();

        datasizedelete.push({ Idsize: idsize, Size: size, Available: available })
        tr.remove();
        fetch('/ClickShop_war_exploded/api-admin-data', {
            method: 'DELETE', // or 'PUT'
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(datasizedelete),
        }).then(response => response.json())
            .then(data => {
                console.log('Success:', data);
                alert("Saved Changes");
            }).catch((error) => {
                console.error('Error:', error);
                alert("Can't save changes");
            });
    });
    $(document).on("change", ".check", function () {
        var tr = $(this).closest('tr'); // table row ID 
        idsize = tr.find("td:eq(0) input[type='hidden']").val();
        size = tr.find("td:eq(0) input[type='text']").val();
        available = tr.find("td:eq(1) input[type='text']").val();

        listdata.push({ Idsize: idsize, Size: size, Available: available })
    });

    $('.opentable').on('click', function (e) {

        listdata = []
    });
});








listdata = []
$(".addsize").on('click', function (e) {
    id = this.id;
    var rsdata;
    api_put = []
    api_put.push({ Idsize: id, Size: '0', Available: '0' })

    fetch('/ClickShop_war_exploded/api-admin-data', {
        method: 'PUT', // or 'PUT'
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify(api_put),
    }).then(response => response.json())
        .then(data => {
            rsdata = data;
            idtable = '#table' + id
            var $row = $('<tr>' +
                '<td>' + '<input maxlength="4" size="4" type="hidden" class="form-control check" name="fname" value="' + rsdata + '" />' + '<input maxlength="4" size="4" type="text" class="form-control check" name="fname" value="' + 0 + '" />' + '</td>' +
                '<td>' + '<input maxlength="4" size="4" type="text" class="form-control check" name="fname" value="' + 0 + '" />' + '</td>' +
                '<td>' + '<button type="button"class="btn btn-danger deletesize"><i class="fas fa-trash delete"></i></button>' + '</td>' +
                '</tr>');
            query = '#Mytable' + id + ' > tbody:last-child'
            $(query).append($row);
        }).catch((error) => {
            console.error('Error:', error);
            alert("Can't save changes");
        });

})




// $('input.check').on('change', function (e) {



//     var bid = this.id; // button ID 
//     var tr = $(this).closest('tr'); // table row ID 
//     idsize = tr.find("td:eq(0) input[type='hidden']").val();
//     size = tr.find("td:eq(0) input[type='text']").val();
//     available = tr.find("td:eq(1) input[type='text']").val();

//     listdata.push({ Idsize: idsize, Size: size, Available: available })
// });

$(".saveandsubmit").on('click', function (e) {

    fetch('/ClickShop_war_exploded/api-admin-data', {
        method: 'POST', // or 'PUT'
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify(listdata),
    }).then(response => response.json())
        .then(data => {

            console.log('Success:', data);
            alert("Saved Changes");
        })
        .catch((error) => {
            console.error('Error:', error);
            alert("Can't save changes");
        });
});






