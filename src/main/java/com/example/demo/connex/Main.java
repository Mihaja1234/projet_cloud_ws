package com.example.demo.connex;


import com.example.demo.dao.HistoriqueEnchereDao;
import com.example.demo.dao.HistoriqueOffreDao;
import com.example.demo.dao.TokenUserDao;
import com.example.demo.models.TokenUser;
import org.springframework.beans.factory.annotation.Autowired;

import java.sql.Connection;
import java.util.List;

public class Main {

    public static void main(String[] args) throws Exception{

      /*  ProduitDao pd = new ProduitDao();
        Connection con = objectBdd.ManipDb.pgConnect("postgres","cloudfinal","hardi");
        List<ProduitCategorie> list = pd.getListProduct(con);
        for (ProduitCategorie p : list){
            System.out.println(p.getTypeCategorie());
        }*/
    /*    TokenUserDao tud = new TokenUserDao();
        UtilisateurDao ud = new UtilisateurDao();
        Utilisateur u = ud.login("hardi@gmail.com","hardi");
       // String  token = tud.insertTokenUser(u);
       // System.out.println(token);
        String token = tud.createToken(u.getId());
        System.out.println(token);*

     */
        Connexion con = new Connexion();
        HistoriqueOffreDao hod = new HistoriqueOffreDao();
        System.out.println(hod.siUserVendeur(con,2,1));


        TokenUserDao tud = new TokenUserDao();
        TokenUser tu;
        tu = tud.getTokenUser("c7d27ce01251bc8acf355e29e3bc0c98bc66aec4");
       // System.out.println(tu.getIdUtilisateur());
    }
}
