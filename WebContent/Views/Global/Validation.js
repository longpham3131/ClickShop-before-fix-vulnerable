// Chức năng kiểm tra dữ liệu

// Chứa các phương thức giúp kiểm tra dữ liệu


function Validation(){
    this.checkEmpty = function(inputVal, spanELE, message){
        if(inputVal.trim() === ""){
            // Ô vị để trống
            //Dữ liệu không hợp lệ
            spanELE.innerHTML = message;
            // spanELE.style.display = "inline";
            spanELE.style.cssText = "display: inline; color: red; margin-left: 2px;"
            return false;
        }
        else{
            //dữ liệu đúng
            spanELE.style.cssText = "display: none;"
            return true;
        }
    }

    this.checkLetters = function(inputVal, spanELE, message){
        // RegExp: đối tượng tạo sẵn của JS giúp chuyển từ kiểu chuỗi (string) sang kiểu RegExp (/^ ... $/)
        var letters = new RegExp("^[a-zA-Z_ÀÁÂÃÈÉÊẾÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶ"
            + "ẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểếỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợ"
            + "ụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹý\\s]+$")

        //.test(): phương thức của RegExp giúp so sánh giá trị có trùng với biểu thức hay không
        if(letters.test(inputVal)){
            // hợp lệ
            spanELE.style.cssText = "display: none;"
            return true;
        }
        else{
            spanELE.innerHTML = message;
            spanELE.style.cssText = "display: inline; color: red; margin-left: 2px;"
            return false;
        }
    }
    this.checkEmail = function(inputVal, spanELE, message){
        //Biểu thức RegExp /^ ... $/
        var emailPattern = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
        // match: là hàm có sẵn cảu strung giúp so sánh strung và biểu thức
        if(inputVal.match(emailPattern)){
            spanELE.style.cssText = "display: none;"
            return true;
        }
        else{
            spanELE.innerHTML = message;
            spanELE.style.cssText = "display: inline; color: red; margin-left: 2px;"
            return false;
        }
    }
    this.checkLength = function(inputVal, spanELE, message, min, max){

        if(inputVal.length >= min && inputVal.length <= max){
            spanELE.style.cssText = "display: none;"
            return true;
        }
        else{
            spanELE.innerHTML = message;
            spanELE.style.cssText = "display: inline; color: red; margin-left: 2px;"
            return false;
        }
    }
    this.checkLimit = function(inputVal, spanELE, message, min, max){

        if(inputVal >= min && inputVal <= max){
            spanELE.style.cssText = "display: none;"
            return true;
        }
        else{
            spanELE.innerHTML = message;
            spanELE.style.cssText = "display: inline; color: red; margin-left: 2px;"
            return false;
        }
    }
    this.checkFormatPass = function(inputVal, spanELE, message){

        var passFormat = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9])(?!.*\s).{0,}$/;
        if(inputVal.match(passFormat)){
            spanELE.style.cssText = "display: none;"
            return true;
        }
        else{
            spanELE.innerHTML = message;
            spanELE.style.cssText = "display: inline; color: red; margin-left: 2px;"
            return false;
        }
    }
    this.checkDate = function(inputVal, spanELE, message){

        var datePattern =/^(19[5-9][0-9]|20[0-4][0-9]|2050)[-/](0?[1-9]|1[0-2])[-/](0?[1-9]|[12][0-9]|3[01])$/igm ;
        // /^(0[1-9]|1[0-2])\/(0[1-9]|1\d|2\d|3[01])\/(19|20)\d{2}$/
        if(inputVal.match(datePattern)){
            spanELE.style.cssText = "display: none;"
            return true;
        }
        else{
            spanELE.innerHTML = message;
            spanELE.style.cssText = "display: inline; color: red; margin-left: 2px;"
            return false;
        }
    }
    this.checkDropDown = function(selectELE, spanELE, message){
        //chọn những đáp án không phải option đầu tiên (chọn khóa học)
        if(selectELE.selectedIndex != 0 ){
            //hợp lệ
            spanELE.style.cssText = "display: none;"
            return true;
        }
        else{
            //không hợp lệ
            spanELE.innerHTML = message;
            spanELE.style.cssText = "display: inline; color: red; margin-left: 2px;"
            return false;
        }
    }
    this.checkPhoneNumber = function(inputVal, spanELE, message){
        var pattern = /^(09|01[2|6|8|9])+([0-9]{8})\b$/;
        if(inputVal.match(pattern)){
            spanELE.style.cssText = "display: none;"
            return true;
        }
        else{
            spanELE.innerHTML = message;
            spanELE.style.cssText = "display: inline; color: red; margin-left: 2px;"
            return false;
        }
    }
}