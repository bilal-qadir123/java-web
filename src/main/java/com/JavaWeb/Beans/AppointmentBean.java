

package com.JavaWeb.Beans;

public class AppointmentBean {
    private int id;
    private String name;
    private long contact;
    private String gender;
    private int age;
    private String date;
    private String reason;
    private String doctor;

    public AppointmentBean() {
        super();
    }

    public AppointmentBean(int id, String name, long contact, String gender, int age, String date, String reason, String doctor) {
        super();
        this.id = id;
        this.name = name;
        this.contact = contact;
        this.gender = gender;
        this.age = age;
        this.date = date;
        this.reason = reason;
        this.doctor = doctor;
    }

    public String getName() {
        return name;
    }

    public long getContact() {
        return contact;
    }

    public String getGender() {
        return gender;
    }

    public int getAge() {
        return age;
    }

    public String getDate() {
        return date;
    }

    public int getId() {return id; }

    public String getReason() {
        return reason;
    }
    public String getDoctor() {
        return doctor;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setContact(long contact) {
        this.contact = contact;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }
    public void setDoctor(String doctor) {
        this.doctor = doctor;
    }
    public void setId(int id) {this.id = id; }
}
