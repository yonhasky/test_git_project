package work.model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/**
 * Factory pattern --Ư���� ���� ����� �����ϴ� ����Ŭ����
 * 
 * FactoryDao pattern DAOŬ������ ������ : connection ����, �ڿ� ���� Singleton Pattern ����
 * ����
 * 
 * DAO ������ 0. jdbc driver �ε�: ������ 1. connection ���� 2. �ڿ�����
 *
 * @author hunho
 * 
 * 
 * 
 *         ##dbserver ���� property ���� �ܺ� �ڿ����� ��� --java.io.*
 *         --java.util.ResourceBundle : ��Ģ �ؼ�, ��� ��
 * 
 *         ##ResourceBundle ��� ��Ģ 1. �ܺ� �ڿ����� ��ġ : classpath (output dir) ���� ���
 *         ��� 2. ���� Ȯ���� : .properties 3. ���� property ��� : key=value 4. ���ǻ��� :
 *         key�� value =��ȣ ���̿� ���� �Ұ�
 *
 */
public class FactoryDao {
	// Connection Pool : javax.sql.DataSource
	// Conded name
	private String dsName = "java:comp/env/jdbc/Oracle";
	private DataSource ds;
	
	private static FactoryDao instance = new FactoryDao();

	// Singleton patter ������
	private FactoryDao() {
		try {
			ds = (DataSource)new InitialContext().lookup(dsName);
				
		} catch (NamingException e) {
			System.out.println("DataSource �̸� �˻� ���� �߻�");
		}
	}

	public static FactoryDao getInstance() {
		return instance;
	}

	// ���� ��� : connection ���� ��ȯ
	public Connection getConnection() {
		try {
			// Connection Pool (DataSource)���� ���ᰴü �ϳ� �����ͼ� ��ȯ
			return ds.getConnection();
			
		} catch (SQLException e) {
			System.out.println("DataSource ���ᰴü �������� ���� �߻�");
			e.printStackTrace();
		}
		return null;
	}

	// �ڿ�����
	public void close(Connection conn, Statement pstmt, ResultSet rs) {
		try {
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
			if (conn != null) {
				conn.close();
			}

		} catch (SQLException e) {
			System.out.println("�ڿ����� ����");
			e.printStackTrace();
		}
	}

	public void close(Connection conn, Statement pstmt) {
		close(conn, pstmt, null);
	}

}
