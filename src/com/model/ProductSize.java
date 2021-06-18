package com.model;

import java.util.List;

public class ProductSize {
    private String SizeId;
    private String Size;
    private String Available;

    public ProductSize(String sizeid, String size, String available) {
        SizeId = sizeid;
        Size = size;
        Available = available;
    }

    public String getSizeId() {
        return SizeId;
    }

    public void setSizeId(String sizeid) {
        SizeId = sizeid;
    }

    public String getSize() {
        return Size;
    }

    public void setSize(String size) {
        Size = size;
    }

    public String getAvailable() {
        return Available;
    }

    public void setAvailable(String available) {
        Available = available;
    }


}
