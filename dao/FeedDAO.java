package dao;

import java.sql.*;
import java.util.ArrayList;

import javax.naming.NamingException;
import util.*;

public class FeedDAO {

    public boolean insert(String uid, String ucon, String uimages) throws NamingException, SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;
        try {
        	if (uimages == "") {
        		String sql = "INSERT INTO feed(id, content) VALUES(?, ?)";
                
                conn = ConnectionPool.get();
                stmt = conn.prepareStatement(sql);
                stmt.setString(1, uid);
                stmt.setString(2, ucon);
        	} 
        	
        	else {
        		String sql = "INSERT INTO feed(id, content, images) VALUES(?, ?, ?)";
                
                conn = ConnectionPool.get();
                stmt = conn.prepareStatement(sql);
                stmt.setString(1, uid);
                stmt.setString(2, ucon);
        		stmt.setString(3, uimages);
        	}

            
            int count = stmt.executeUpdate();
            return (count == 1) ? true : false;
            
        } finally {
            if (stmt != null) stmt.close(); 
            if (conn != null) conn.close();
        }
    }

    public ArrayList<FeedObj> getList() throws NamingException, SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT no, id, content, ts, images FROM feed ORDER BY ts DESC";
            
            conn = ConnectionPool.get();
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();
            
            ArrayList<FeedObj> feeds = new ArrayList<FeedObj>();
            while(rs.next()) {
                feeds.add(new FeedObj(rs.getString("no"), rs.getString("id"), rs.getString("content"), rs.getString("ts"), rs.getString("images")));
            }
            return feeds;
            
        } finally {
            if (rs != null) rs.close(); 
            if (stmt != null) stmt.close(); 
            if (conn != null) conn.close();
        }
    }
    
    public boolean delete(String uid) throws NamingException, SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            String sql = "DELETE FROM feed WHERE id = ?";
            
            conn = ConnectionPool.get();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, uid);
            
            int count = stmt.executeUpdate();
            return (count == 1) ? true : false;
            
        } finally {
            if (stmt != null) stmt.close(); 
            if (conn != null) conn.close();
        }
    }
    
    public boolean deleteNo(String uno) throws NamingException, SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            String sql = "DELETE FROM feed WHERE no = ?";
            
            conn = ConnectionPool.get();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, uno);
            
            int count = stmt.executeUpdate();
            return (count == 1) ? true : false;
            
        } finally {
            if (stmt != null) stmt.close(); 
            if (conn != null) conn.close();
        }
    }
}