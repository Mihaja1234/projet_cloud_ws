package com.example.demo.models;

import com.example.demo.objectBdd.Mere;

public class ResultatEnchere extends Mere {


        private int idenchere;
        private int idutilisateur;
        private float prix_gagnant;
        private String dateheuregagnat;

    public ResultatEnchere() {
    }

    public ResultatEnchere(int idenchere, int idutilisateur, float prix_gagnant, String dateheuregagnat) {
        this.idenchere = idenchere;
        this.idutilisateur = idutilisateur;
        this.prix_gagnant = prix_gagnant;
        this.dateheuregagnat = dateheuregagnat;
    }

    public int getIdenchere() {
             return idenchere;
        }

        public void setIdenchere(int idenchere) {
          this.idenchere = idenchere;
    }

    public int getIdutilisateur() {
        return idutilisateur;
    }

    public void setIdutilisateur(int idutilisateur) {
        this.idutilisateur = idutilisateur;
    }

    public float getPrix_gagnant() {
        return prix_gagnant;
    }

    public void setPrix_gagnant(float prix_gagnant) {
        this.prix_gagnant = prix_gagnant;
    }

    public String getDateheuregagnat() {
        return dateheuregagnat;
    }

    public void setDateheuregagnat(String dateheuregagnat) {
        this.dateheuregagnat = dateheuregagnat;
    }
}
