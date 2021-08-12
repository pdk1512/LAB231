/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

/**
 *
 * @author khanh
 */
public class Contact {
    private String address;
    private String city;
    private String country;
    private String telephone;
    private String email;
    private String map;

    public Contact() {
    }

    public Contact(String address, String city, String country, String telephone, String email, String map) {
        this.address = address;
        this.city = city;
        this.country = country;
        this.telephone = telephone;
        this.email = email;
        this.map = map;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMap() {
        return map;
    }

    public void setMap(String map) {
        this.map = map;
    }

    @Override
    public String toString() {
        return address+" | "+city+" | "+country+" | "+telephone+" | "+email+" | "+map; //To change body of generated methods, choose Tools | Templates.
    }
    
    
}
