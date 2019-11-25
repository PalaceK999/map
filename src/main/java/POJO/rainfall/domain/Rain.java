package POJO.rainfall.domain;

import java.io.Serializable;


public class Rain implements Serializable {
    private int id;
    private String place;
    private int rainfall;

    public Rain() {
    }

    public Rain(int id, String place, int rainfall) {
        this.id = id;
        this.place = place;
        this.rainfall = rainfall;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPlace() {
        return place;
    }

    public void setPlace(String place) {
        this.place = place;
    }

    public int getRainfall() {
        return rainfall;
    }

    public void setRainfall(int rainfall) {
        this.rainfall = rainfall;
    }

    @Override
    public String toString() {
        return "Rain{" +
                "id=" + id +
                ", place='" + place + '\'' +
                ", rainfall=" + rainfall +
                '}';
    }
}
