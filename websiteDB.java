// made for websiteDB
import java.sql.*;
import java.util.Scanner;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.text.DateFormat;
//usage
//java -classpath ".:sqlite-jdbc-3.30.1.jar" websiteDB
// import java.sql.Connection;
// import java.sql.DriverManager;
// import java.sql.ResultSet;
// import java.sql.SQLException;
// import java.sql.Statement;

public class websiteDB{
public static void main(String args[]) {



      System.out.println("Checking Connection...");

      Connection c = null;
      Statement stmt = null;
      try {
      Class.forName("org.sqlite.JDBC");
         c = DriverManager.getConnection("jdbc:sqlite:websiteCompanies.db");
      // c = DriverManager.getConnection("jdbc:sqlite:websiteCompanies.db");
          }
      catch ( Exception e )
      {
       System.err.println("Problem Encountered.");
          }
      System.out.println("Opened database successfully.\n\n");


      // create a scanner
    Scanner scanner = new Scanner(System.in);

    //  prompt for the user's name
    System.out.print("--WEBSITE COMPANIES DATABASE--");
    System.out.print("\n\n To list all companies and their URLs select A \n To list all companies and their multimedia select B \n To list publishing dates for each company select C \n To list the country where each company was founded select D \n To list all types of websites on the database select E \n To list all types and their websites select F \n To list all tools with their website select G \n To list all types of websites on the database select H \n To list all types of websites on the database select I \n To list websites by order of publication dates select J \n To list how many devs per company select K \n To list devs per company in ascending order select L\n\n");

    // get their input as a String
    String sel = scanner.next();

    switch(sel) {
      case "A":
      try
    {
      stmt = c.createStatement();
    }
    catch(SQLException e)
    {
        // do something appropriate with the exception, *at least*:
        e.printStackTrace();
    }

      try
    {

        ResultSet rs = stmt.executeQuery( "select website.url, company.registeredName from website inner join company where website.companyID=company.companyID;");
        System.out.printf("\n---\n");
        while ( rs.next() ) {
          //code to access rows goes here
          String  url = rs.getString("url");
          String  registeredName = rs.getString("registeredName");
          System.out.printf("%s, %s\n", registeredName, url);
        }
    }
    catch (SQLException e)
    {
        // do something appropriate with the exception, *at least*:
        e.printStackTrace();
    }
        break;


      case "B":
      try
    {
      stmt = c.createStatement();
    }
    catch(SQLException e)
    {
        // do something appropriate with the exception, *at least*:
        e.printStackTrace();
    }

      try
    {

        ResultSet rs = stmt.executeQuery( "select website.url, websiteMedia.type from website inner join websiteMedia where website.url=websiteMedia.url; ");
        System.out.printf("\n---\n");
        while ( rs.next() ) {
          //code to access rows goes here
          String  url = rs.getString("url");
          String  type = rs.getString("type");
          System.out.printf("%s, %s\n", url, type);
        }
    }
    catch (SQLException e)
    {
        // do something appropriate with the exception, *at least*:
        e.printStackTrace();
    }
        break;

        case "C":
        try
        {
        stmt = c.createStatement();
        }
        catch(SQLException e)
        {
          // do something appropriate with the exception, *at least*:
          e.printStackTrace();
        }

        try
        {

          ResultSet rs = stmt.executeQuery( "select url, pubDate from website; ");
          System.out.printf("\n---\n");
          while ( rs.next() ) {
            //code to access rows goes here
            String  url = rs.getString("url");
            java.sql.Date date = rs.getDate("pubDate");
            System.out.printf("%s, %s\n", url, date);
          }
        }
        catch (SQLException e)
        {
          // do something appropriate with the exception, *at least*:
          e.printStackTrace();
        }
          break;

          case "D":
          try
          {
          stmt = c.createStatement();
          }
          catch(SQLException e)
          {
            // do something appropriate with the exception, *at least*:
            e.printStackTrace();
          }

          try
          {

            ResultSet rs = stmt.executeQuery( "select countryOrigin, registeredName from company;");
            System.out.printf("\n---\n");
            while ( rs.next() ) {
              //code to access rows goes here
              String  registeredName = rs.getString("registeredName");
              String  countryOrigin = rs.getString("countryOrigin");
              System.out.printf("%s, %s\n", registeredName, countryOrigin);
            }
          }
          catch (SQLException e)
          {
            // do something appropriate with the exception, *at least*:
            e.printStackTrace();
          }
            break;

            case "E":
            try
            {
            stmt = c.createStatement();
            }
            catch(SQLException e)
            {
              // do something appropriate with the exception, *at least*:
              e.printStackTrace();
            }

            try
            {

              ResultSet rs = stmt.executeQuery( "select webType from websiteClassified;");
              System.out.printf("\n---\n");
              while ( rs.next() ) {
                //code to access rows goes here
                String  webType = rs.getString("webType");
                System.out.printf("%s\n", webType);
              }
            }
            catch (SQLException e)
            {
              // do something appropriate with the exception, *at least*:
              e.printStackTrace();
            }
              break;

              case "F":
              try
              {
              stmt = c.createStatement();
              }
              catch(SQLException e)
              {
                // do something appropriate with the exception, *at least*:
                e.printStackTrace();
              }

              try
              {

                ResultSet rs = stmt.executeQuery( "select webType, url from websiteClassified;");
                System.out.printf("\n---\n");
                while ( rs.next() ) {
                  //code to access rows goes here
                  String  webType = rs.getString("webType");
                  String  url = rs.getString("url");
                  System.out.printf("%s\t%s\n", url, webType);
                }
              }
              catch (SQLException e)
              {
                // do something appropriate with the exception, *at least*:
                e.printStackTrace();
              }
                break;

                case "G":
                try
                {
                stmt = c.createStatement();
                }
                catch(SQLException e)
                {
                  // do something appropriate with the exception, *at least*:
                  e.printStackTrace();
                }

                try
                {

                  ResultSet rs = stmt.executeQuery( "select toolName, url from websiteTools");
                  System.out.printf("\n---\n");
                  while ( rs.next() ) {
                    //code to access rows goes here
                    String  toolName = rs.getString("toolName");
                    String  url = rs.getString("url");
                    System.out.printf("%s\t%s\n", url, toolName);
                  }
                }
                catch (SQLException e)
                {
                  // do something appropriate with the exception, *at least*:
                  e.printStackTrace();
                }
                  break;

                  case "H":
                  try
                  {
                  stmt = c.createStatement();
                  }
                  catch(SQLException e)
                  {
                    // do something appropriate with the exception, *at least*:
                    e.printStackTrace();
                  }

                  try
                  {

                    ResultSet rs = stmt.executeQuery( "select language, url from tools inner join websiteTools where tools.toolName=websiteTools.toolName;");
                    System.out.printf("\n---\n");
                    while ( rs.next() ) {
                      //code to access rows goes here
                      String  url = rs.getString("url");
                      String  language = rs.getString("language");
                      System.out.printf("%s\t%s\n", url, language);
                    }
                  }
                  catch (SQLException e)
                  {
                    // do something appropriate with the exception, *at least*:
                    e.printStackTrace();
                  }
                    break;

                    case "I":
                    try
                    {
                    stmt = c.createStatement();
                    }
                    catch(SQLException e)
                    {
                      // do something appropriate with the exception, *at least*:
                      e.printStackTrace();
                    }

                    try
                    {

                      ResultSet rs = stmt.executeQuery( "select developer.firstName, developer.lastName, company.registeredName from developer inner join company where company.companyID=developer.companyID");
                      System.out.printf("\n---\n");
                      while ( rs.next() ) {
                        //code to access rows goes here
                        String  firstName = rs.getString("firstName");
                        String  lastName = rs.getString("lastName");
                        String  registeredName = rs.getString("registeredName");
                        System.out.printf("%s\t%s\t%s\n", registeredName, firstName, lastName);
                      }
                    }
                    catch (SQLException e)
                    {
                      // do something appropriate with the exception, *at least*:
                      e.printStackTrace();
                    }
                      break;

                      case "J":
                      try
                      {
                      stmt = c.createStatement();
                      }
                      catch(SQLException e)
                      {
                        // do something appropriate with the exception, *at least*:
                        e.printStackTrace();
                      }

                      try
                      {

                        ResultSet rs = stmt.executeQuery( "select url from website order by pubDate;");
                        System.out.printf("\n---\n");
                        while ( rs.next() ) {
                          //code to access rows goes here
                          String  url = rs.getString("url");
                          System.out.printf("%s\n", url);
                        }
                      }
                      catch (SQLException e)
                      {
                        // do something appropriate with the exception, *at least*:
                        e.printStackTrace();
                      }
                        break;

                        case "K":
                        try
                        {
                        stmt = c.createStatement();
                        }
                        catch(SQLException e)
                        {
                          // do something appropriate with the exception, *at least*:
                          e.printStackTrace();
                        }

                        try
                        {

                          ResultSet rs = stmt.executeQuery( "select registeredName, COUNT(*) AS C from developer inner join company where company.companyID=developer.companyID group by company.companyID; ");
                          System.out.printf("\n---\n");
                          while ( rs.next() ) {
                            //code to access rows goes here
                            String  registeredName = rs.getString("registeredName");
                            Integer  C = rs.getInt("C");
                            System.out.printf("%s\t%d\n", registeredName, C);
                          }
                        }
                        catch (SQLException e)
                        {
                          // do something appropriate with the exception, *at least*:
                          e.printStackTrace();
                        }
                          break;


                          case "L":
                          try
                          {
                          stmt = c.createStatement();
                          }
                          catch(SQLException e)
                          {
                            // do something appropriate with the exception, *at least*:
                            e.printStackTrace();
                          }

                          try
                          {

                            ResultSet rs = stmt.executeQuery( "select registeredName, COUNT(*) as count from developer inner join company where company.companyID=developer.companyID group by company.companyID order by count asc ");
                            System.out.printf("\n---\n");
                            while ( rs.next() ) {
                              //code to access rows goes here
                              String  registeredName = rs.getString("registeredName");
                              Integer  C = rs.getInt("count");
                              System.out.printf("%s\t%d\n", registeredName, C);
                            }
                          }
                          catch (SQLException e)
                          {
                            // do something appropriate with the exception, *at least*:
                            e.printStackTrace();
                          }
                            break;

      default:
        System.out.println("\nSELECTION NOT RECOGNISED");
    }







}


}
