var validation = new Validation();

function getELE(ele){
    return document. getElementById(ele);
}

getELE("inpFname").onblur = fNameValidate;
getELE("inpLname").onblur = lNameValidate;
getELE("inpPhone").onblur = phoneValidate;
getELE("inpAddress").onblur = addressValidate;

function fNameValidate(){
    var ho = getELE("inpFname").value;
    if(validation.checkEmpty(ho, getELE("tbHo"), "Họ không được trống !!!")
        && validation.checkLetters(ho, getELE("tbHo"), "Họ phải là chữ")){
        return true;
    }
    return  false;
}
function lNameValidate(){
    var ten = getELE("inpLname").value;
    if(validation.checkEmpty(ten, getELE("tbTen"), "Tên không được trống !!!")
        && validation.checkLetters(ten, getELE("tbTen"), "Tên phải là chữ")){
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

document.getElementById("btnUpdateUser").addEventListener("click",function (event) {


    var isValid = true;


    isValid &= fNameValidate();
    isValid &= lNameValidate();

    isValid &= phoneValidate();

    isValid &= addressValidate();


    if (isValid) {
        getELE("formUpdateUser").submit();
    }
})