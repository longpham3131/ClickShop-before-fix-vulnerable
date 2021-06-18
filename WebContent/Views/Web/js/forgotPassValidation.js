var validation = new Validation();

function getELE(ele){
    return document. getElementById(ele);
}

getELE("inpPass").onblur = passValidate;

function passValidate(){
    var matKhau = getELE("inpPass").value;
    if (validation.checkEmpty(matKhau, getELE("tbMatKhau"), "Mật khẩu không được trống !!!")
        && validation.checkLength(matKhau, getELE("tbMatKhau"), "Mật khẩu phải tối thiểu 6 kí tự !!!", 6, 1000)
        && validation.checkFormatPass(matKhau, getELE("tbMatKhau"), "Mật khẩu chứa ít nhất 1 ký tự số, 1 ký tự in hoa, 1 ký tự đặc biệt"))
    {
        return true
    }
    return  false;
}

document.getElementById("btnChangePass").addEventListener("click",function (event) {


    var isValid = true;
    isValid &= passValidate()



    if (isValid) {
        getELE("formChangePass").submit();
    }
})