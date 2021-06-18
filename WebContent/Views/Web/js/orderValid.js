
var validation = new Validation();

function getELE(ele){
    return document. getElementById(ele);
}


getELE("inpFname").onblur = fNameValidate;
getELE("inpPhone").onblur = phoneValidate;
getELE("inpAddress").onblur = addressValidate;


function fNameValidate(){
    var ho = getELE("inpFname").value;
    if(validation.checkEmpty(ho, getELE("tbHo"), "Họ tên không được trống !!!")
        && validation.checkLetters(ho, getELE("tbHo"), "Họ tên phải là chữ")){
        return true;
    }
    return  false;
}
function addressValidate(){
    var diaChi = getELE("inpAddress").value;
    if(validation.checkEmpty(diaChi, getELE("tbDiaChi"), "Địa chỉ không được trống !!!")){
        return true;
    }
    return  false;
}
function phoneValidate(){
    var soDienThoai = getELE("inpPhone").value;
    if(validation.checkEmpty(soDienThoai, getELE("tbSDT"), "Số điện thoại không được trống !!!")
        && validation.checkLength(soDienThoai, getELE("tbSDT"), "Độ dài số điện thoại không hợp lệ !!!", 10, 11)
        && validation.checkPhoneNumber(soDienThoai, getELE("tbSDT"), "Số điện thoại không hợp lệ")){
        return true;
    }
    return  false;
}
getELE("btnOrderSubmit").addEventListener("click", function () {

    var isValid = true;

    console.log("vào rồi");
    isValid &= fNameValidate();
    isValid &= phoneValidate();
    isValid &= addressValidate();


    if (isValid) {
        console.log("hop le roi");
        $('#myOrder').modal('show')
        getELE("orderForm").submit();
    }

})


