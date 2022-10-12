package com.csd430.mod8;

public class BaseballTeam {
    private long teamID;
    private String team;
    private String city;
    private String yearT;
    private String loserTeam;
    private String loserCity;

    public BaseballTeam(long teamID, String team, String city, String yearT, String loserTeam, String loserCity) {
        this.teamID = teamID;
        this.team = team;
        this.city = city;
        this.yearT = yearT;
        this.loserTeam = loserTeam;
        this.loserCity = loserCity;
    }

    public BaseballTeam(String team, String city, String yearT, String loserTeam, String loserCity) {
        this.teamID = -1L;
        this.team = team;
        this.city = city;
        this.yearT = yearT;
        this.loserTeam = loserTeam;
        this.loserCity = loserCity;
    }

    public long getTeamID() {
        return teamID;
    }

    public void setTeamID(long teamID) {
        this.teamID = teamID;
    }

    public String getTeam() {
        return team;
    }

    public void setTeam(String team) {
        this.team = team;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getYearT() {
        return yearT;
    }

    public void setYearT(String yearT) {
        this.yearT = yearT;
    }

    public String getLoserTeam() {
        return loserTeam;
    }

    public void setLoserTeam(String loserTeam) {
        this.loserTeam = loserTeam;
    }

    public String getLoserCity() {
        return loserCity;
    }

    public void setLoserCity(String loserCity) {
        this.loserCity = loserCity;
    }

    @Override
    public String toString() {
        return "BaseballTeam{" +
                "teamID=" + teamID +
                ", team='" + team + '\'' +
                ", city='" + city + '\'' +
                ", yearT='" + yearT + '\'' +
                ", loserTeam='" + loserTeam + '\'' +
                ", loserCity='" + loserCity + '\'' +
                '}';
    }
}
