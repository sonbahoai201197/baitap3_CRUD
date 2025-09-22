package vn.baitap3.models;

public class Category {
    private int cateId;
    private String cateName;
    private String icons;

    public Category() {}

    public Category(int cateId, String cateName, String icons) {
        this.cateId = cateId;
        this.cateName = cateName;
        this.icons = icons;
    }

    public Category(String cateName, String icons) {
        this.cateName = cateName;
        this.icons = icons;
    }

    public int getCateId() { return cateId; }
    public void setCateId(int cateId) { this.cateId = cateId; }
    public String getCateName() { return cateName; }
    public void setCateName(String cateName) { this.cateName = cateName; }
    public String getIcons() { return icons; }
    public void setIcons(String icons) { this.icons = icons; }
}
