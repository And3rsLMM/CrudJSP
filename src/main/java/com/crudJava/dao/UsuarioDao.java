package com.crudJava.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.crudJava.models.Usuario;

public class UsuarioDao {

	public static Connection getConnection() {
		Connection con = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/testejava","root","123456789");
		}catch(Exception err) {
			System.out.println(err);
		}
		return con;
	}
	
	public static int createUsuario(Usuario u) {
		int status = 0;
		
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("INSERT INTO usuario SET nome =?, password=?, email=?, sexo=?, nacionalidade=?");
			ps.setString(1, u.getNome());
			ps.setString(2, u.getPassword());
			ps.setString(3, u.getEmail());
			ps.setString(4, u.getSexo());
			ps.setString(5, u.getNacionalidade());
			status = ps.executeUpdate();
		}catch(Exception err) {
			System.out.println(err);
		}
		return status;
	}
	
	public static List<Usuario> getAllUsuarios(){
		List<Usuario> list = new ArrayList<Usuario>();
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM usuario");
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				Usuario usuario = new Usuario();
				usuario.setId(rs.getInt("id"));
				usuario.setNome(rs.getString("nome"));
				usuario.setPassword(rs.getString("password"));
				usuario.setSexo(rs.getString("sexo"));
				usuario.setNacionalidade(rs.getString("nacionalidade"));
				list.add(usuario);
			}
		}catch(Exception err){
			System.out.println(err);
		}
		
		return list;
	}
	
	public static Usuario getUsuarioById(int id) {
		Usuario usuario = null;
		
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM usuario WHERE id = ?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				usuario = new Usuario();
				usuario.setId(rs.getInt("id"));
				usuario.setNome(rs.getString("nome"));
				usuario.setPassword(rs.getString("password"));
				usuario.setSexo(rs.getString("sexo"));
				usuario.setNacionalidade(rs.getString("nacionalidade"));
			}
		}catch (Exception err){
			System.out.println(err);
		}
		return usuario;
	}
	
	public static int updateUsuario(Usuario u) {
		int status = 0;
		
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("UPDATE usuario SET nome =?, email=?, sexo=?, nacionalidade=? WHERE id=?");
			
			ps.setString(1, u.getNome());
			ps.setString(2, u.getEmail());
			ps.setString(3, u.getSexo());
			ps.setString(4, u.getNacionalidade());
			ps.setInt(6, u.getId());
			status = ps.executeUpdate();
		}catch(Exception err){
			System.out.println(err);
		}
		return status;
	}
	
	public static int deleteUsuario(Usuario u) {
		int status = 0;
		
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("DELETE FROM usuario WHERE id=?");
			ps.setInt(1, u.getId());
			status = ps.executeUpdate();
		} catch (Exception err) {
			System.out.println(err);
		}
		return status;
	}
	
}
