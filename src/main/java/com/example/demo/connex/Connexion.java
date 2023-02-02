package com.example.demo.connex;
import java.sql.*;

public class Connexion
{
    Connection con;
    public Statement stat;
    ResultSet res;

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
            Class.forName("org.postgresql.Driver");
            this.con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/cloudfinal", "postgres", "root");
        } catch (Exception e) {
        } finally {
        }
    }



    public PreparedStatement prepareStatement(String query) throws SQLException{
        return this.con.prepareStatement(query);
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
}

