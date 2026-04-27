package com.wddwzl.pojo;

import java.sql.Timestamp;
import java.util.Date;
//pojo实体类
public class User {
    private int id;//id
    private String userName;//用户名称
    private String userCode;//用户名称
    private String userPassword;//用户密码
    private String gender;//性别
    private String phone;//电话号
    private Integer createdBy;//创建者
    private Date creationDate;//创建时间
    private Integer modifyBy;//更新者
    private Date modifyDate;//更新时间
    private Integer height;//身高
    private Integer required;//需求类型 1 2 3
    private Integer heel;//足跟
    private Integer arch;//足弓
    private Integer leftForefoot;//左前掌
    private Integer rightForefoot;//右前掌
    private Integer heelEdge;//足弓边
    private Integer soleSize;//鞋码
    private Integer weight;//体重

    private Integer soleLength;//脚长

    private Integer soleWidth;//脚宽

    private Integer age;//年龄

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Integer getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(Integer createdBy) {
        this.createdBy = createdBy;
    }

    public Date getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
    }

    public Integer getModifyBy() {
        return modifyBy;
    }

    public void setModifyBy(Integer modifyBy) {
        this.modifyBy = modifyBy;
    }

    public Date getModifyDate() {
        return modifyDate;
    }

    public void setModifyDate(Date modifyDate) {
        this.modifyDate = modifyDate;
    }

    public Integer getHeight() {
        return height;
    }

    public void setHeight(Integer height) {
        this.height = height;
    }

    public Integer getRequired() {
        return required;
    }

    public void setRequired(Integer required) {
        this.required = required;
    }

    public Integer getHeel() {
        return heel;
    }

    public void setHeel(Integer heel) {
        this.heel = heel;
    }

    public Integer getArch() {
        return arch;
    }

    public void setArch(Integer arch) {
        this.arch = arch;
    }

    public Integer getLeftForefoot() {
        return leftForefoot;
    }

    public void setLeftForefoot(Integer leftForefoot) {
        this.leftForefoot = leftForefoot;
    }

    public Integer getRightForefoot() {
        return rightForefoot;
    }

    public void setRightForefoot(Integer rightForefoot) {
        this.rightForefoot = rightForefoot;
    }

    public Integer getHeelEdge() {
        return heelEdge;
    }

    public void setHeelEdge(Integer heelEdge) {
        this.heelEdge = heelEdge;
    }

    public String getUserCode() {
        return userCode;
    }

    public void setUserCode(String userCode) {
        this.userCode = userCode;
    }

    public Integer getSoleSize() {
        return soleSize;
    }

    public void setSoleSize(Integer soleSize) {
        this.soleSize = soleSize;
    }

    public Integer getWeight() {
        return weight;
    }

    public void setWeight(Integer weight) {
        this.weight = weight;
    }

    public Integer getAge() {
        return age;
    }

    public Integer getSoleLength() {
        return soleLength;
    }

    public void setSoleLength(Integer soleLength) {
        this.soleLength = soleLength;
    }

    public Integer getSoleWidth() {
        return soleWidth;
    }

    public void setSoleWidth(Integer soleWidth) {
        this.soleWidth = soleWidth;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public User() {
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", userName='" + userName + '\'' +
                ", userCode='" + userCode + '\'' +
                ", userPassword='" + userPassword + '\'' +
                ", gender='" + gender + '\'' +
                ", phone='" + phone + '\'' +
                ", createdBy=" + createdBy +
                ", creationDate=" + creationDate +
                ", modifyBy=" + modifyBy +
                ", modifyDate=" + modifyDate +
                ", height=" + height +
                ", required=" + required +
                ", heel=" + heel +
                ", arch=" + arch +
                ", leftForefoot=" + leftForefoot +
                ", rightForefoot=" + rightForefoot +
                ", heelEdge=" + heelEdge +
                ", soleSize=" + soleSize +
                ", weight=" + weight +
                ", soleLength=" + soleLength +
                ", soleWidth=" + soleWidth +
                ", age=" + age +
                '}';
    }
}
