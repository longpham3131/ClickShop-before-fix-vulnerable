function getMyID(id){
    return document.getElementById(id);
}
displayNoneAll();

function displayNoneAll() {
    document.getElementById("viewTableShipper").style.display = "none";
    document.getElementById("viewTableNoShipper").style.display = "none";
    document.getElementById("viewTablePickup").style.display = "none";
    document.getElementById("viewTableShipping").style.display = "none";
}

function chonTableHienThi(maTable) {
    var view =  getMyID("viewTable")
    switch (maTable) {
        case 1:{
            displayNoneAll();
            document.getElementById("viewTableShipper").style.display ="block";
            break;}
        case 2:{
            displayNoneAll();
            document.getElementById("viewTableNoShipper").style.display ="block";
            break;}
        case 3: {
            displayNoneAll();
            document.getElementById("viewTablePickup").style.display ="block";
            break;}
        case 4:  {
            displayNoneAll();
            document.getElementById("viewTableShipping").style.display ="block";
            break;}
    }
}

