package com.example.demo.connex;
import java.sql.*;

public class Connexion
{
    Connection con;
    public Statement stat;
    ResultSet res;
    PreparedStatement prepstat;

    public Connexion(String req)
    {
        this();
        try
        {
            this.stat= this.con.createStatement();
            this.res=stat.executeQuery(req);
        }
        catch(SQLException sqle)
        {
            sqle.printStackTrace();
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }

    }
    public Connexion()
    {
        try {
//            Class.forName("org.postgresql.Driver");
            this.con = DriverManager.getConnection("jdbc:postgresql://containers-us-west-176.railway.app:6766/railway", "postgres", "AjX5u0RqyKOAbDLxpYml");
        } catch (Exception e) {
        } finally {
        }
    }



    public PreparedStatement prepareStatement(String query) throws SQLException{
        prepstat=this.con.prepareStatement(query);
        return prepstat;
    }
    public ResultSet getResultset()
    {
        return this.res;
    }
    public void getCommit() throws Exception
    {
        this.stat.executeQuery("commit");
    }
    public void getRollBack() throws Exception
    {
        this.stat.executeQuery("rollback");
    }
    public Statement getStat()
    {
        return this.stat;
    }

    public void close() {
        try{
        if (stat != null) {
            stat.close();
        }
        if (prepstat != null) {
            prepstat.close();
        }
        if (res != null) {
            res.close();
        }
        if (con != null) {

            con.close();

        }
    }
        catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

