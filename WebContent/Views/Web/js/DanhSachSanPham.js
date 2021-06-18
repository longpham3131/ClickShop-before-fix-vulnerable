/**
 * chứa danh sách tập hợp nhiều sản phẩm
 *
 */
class DanhSachSanPham {
    mangSP = [];

    themSP(sp) {
        this.mangSP.push(sp);
    }
    timViTri(ma, size) {
        let viTri = -1;
        this.mangSP.map(function (item, index) {

            if (item.maSP === ma && item.sizeSP === size) {
                viTri = index;
            }
        });
        return viTri;
    }
    xoaSP(ma, size) {
        var viTri = this.timViTri(ma, size);
        //Nếu tìm thấy SV
        if (viTri > -1) {
            // splice(viTri, số phần tử cần cắt)
            this.mangSP.splice(viTri, 1);
        }
        else {
            console.log("không tìm thấy Sản phẩm");
        }
    }
    xoaTatCaSP() {
        this.mangSP.splice(0);
    }
    capNhat(sp) {
        var viTri = this.timViTri(sp.maSP, sp.sizeSP);
        if (viTri > -1) {
            dssp.mangSP[viTri] = sp;
        }
    }

}
