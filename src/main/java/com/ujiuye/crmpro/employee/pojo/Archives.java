package com.ujiuye.crmpro.employee.pojo;

import java.util.Date;

public class Archives {
    private String no;

    private String telephone;

    private String school;

    private String major;

    private String contact;

    private Date graduate;

    private String politics;

    private String nation;

    private String education;

    private String email;

    private Integer empFk;

    private String remark;

    private Date hiredate;

    private Employee employee;

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public Archives() {
    }

    public Archives(String no, String telephone, String school, String major, String contact, Date graduate, String politics, String nation, String education, String email, Integer empFk, String remark, Date hiredate) {
        this.no = no;
        this.telephone = telephone;
        this.school = school;
        this.major = major;
        this.contact = contact;
        this.graduate = graduate;
        this.politics = politics;
        this.nation = nation;
        this.education = education;
        this.email = email;
        this.empFk = empFk;
        this.remark = remark;
        this.hiredate = hiredate;
    }

    public String getNo() {
        return no;
    }

    public void setNo(String no) {
        this.no = no == null ? null : no.trim();
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone == null ? null : telephone.trim();
    }

    public String getSchool() {
        return school;
    }

    public void setSchool(String school) {
        this.school = school == null ? null : school.trim();
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major == null ? null : major.trim();
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact == null ? null : contact.trim();
    }

    public Date getGraduate() {
        return graduate;
    }

    public void setGraduate(Date graduate) {
        this.graduate = graduate;
    }

    public String getPolitics() {
        return politics;
    }

    public void setPolitics(String politics) {
        this.politics = politics == null ? null : politics.trim();
    }

    public String getNation() {
        return nation;
    }

    public void setNation(String nation) {
        this.nation = nation == null ? null : nation.trim();
    }

    public String getEducation() {
        return education;
    }

    public void setEducation(String education) {
        this.education = education == null ? null : education.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public Integer getEmpFk() {
        return empFk;
    }

    public void setEmpFk(Integer empFk) {
        this.empFk = empFk;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public Date getHiredate() {
        return hiredate;
    }

    public void setHiredate(Date hiredate) {
        this.hiredate = hiredate;
    }
}