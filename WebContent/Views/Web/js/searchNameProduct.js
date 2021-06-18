var listTenSP = document.querySelectorAll(".nameProduct");
document.getElementById("searchPro").onkeyup = () => {
    let chuoiTK = document.getElementById("searchPro").value;

    for (let i = 0; i < listTenSP.length; i++) {
        listTenSP[i].parentElement.parentElement.parentElement.parentElement.style.cssText = "display: none;";
    }
    AnSanPham();
    if (chuoiTK != "") {
        for (let i = 0; i < listTenSP.length; i++) {
            if (listTenSP[i].innerHTML.toLowerCase().indexOf(chuoiTK.toLowerCase()) > -1){
                listTenSP[i].parentElement.parentElement.parentElement.parentElement.style.cssText = "display: block;";
                listTenSP[i].parentElement.parentElement.parentElement.parentElement.classList.add('animate__animated', 'animate__fadeIn');
            }
        }
    } else {
        AnSanPham();
    }
}
const AnSanPham = () => {
    for (let i = 0; i < listTenSP.length; i++) {
        listTenSP[i].parentElement.parentElement.parentElement.parentElement.style.cssText = "display: none;";
    }
}
