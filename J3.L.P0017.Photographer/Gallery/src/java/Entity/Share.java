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
public class Share {
    private String facebookUrl;
    private String twitterUrl;
    private String googleUrl;

    public Share() {
    }

    public Share(String facebookUrl, String twitterUrl, String googleUrl) {
        this.facebookUrl = facebookUrl;
        this.twitterUrl = twitterUrl;
        this.googleUrl = googleUrl;
    }

    public String getFacebookUrl() {
        return facebookUrl;
    }

    public void setFacebookUrl(String facebookUrl) {
        this.facebookUrl = facebookUrl;
    }

    public String getTwitterUrl() {
        return twitterUrl;
    }

    public void setTwitterUrl(String twitterUrl) {
        this.twitterUrl = twitterUrl;
    }

    public String getGoogleUrl() {
        return googleUrl;
    }

    public void setGoogleUrl(String googleUrl) {
        this.googleUrl = googleUrl;
    }

    @Override
    public String toString() {
        return facebookUrl + " | " + twitterUrl + " | " + googleUrl; //To change body of generated methods, choose Tools | Templates.
    }
    
    
}
