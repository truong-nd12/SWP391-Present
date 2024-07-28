/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Dell
 */
public class Admin {
    private int account_id;
    private String acc_name;
    private String password;
    private int role_id;
    private boolean activate;
    private String email;
    private String phone;
    private String avatar;

    public Admin() {
    }

    public Admin(int account_id, String acc_name, String password, int role_id, boolean activate, String email, String phone, String avatar) {
        this.account_id = account_id;
        this.acc_name = acc_name;
        this.password = password;
        this.role_id = role_id;
        this.activate = activate;
        this.email = email;
        this.phone = phone;
        this.avatar = avatar;
    }

    public Admin(int account_id, String acc_name, String password, int role_id, boolean activate) {
        this.account_id = account_id;
        this.acc_name = acc_name;
        this.password = password;
        this.role_id = role_id;
        this.activate = activate;
    }

    

    

    public int getAccount_id() {
        return account_id;
    }

    public void setAccount_id(int account_id) {
        this.account_id = account_id;
    }

    public String getAcc_name() {
        return acc_name;
    }

    public void setAcc_name(String acc_name) {
        this.acc_name = acc_name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getRole_id() {
        return role_id;
    }

    public void setRole_id(int role_id) {
        this.role_id = role_id;
    }

    public boolean isActivate() {
        return activate;
    }

    public void setActivate(boolean activate) {
        this.activate = activate;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }
    
}
