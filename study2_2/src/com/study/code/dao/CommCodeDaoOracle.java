package com.study.code.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.study.code.vo.CodeVO;
import com.study.exception.DaoException;

public class CommCodeDaoOracle implements ICommCodeDao {

	@Override
	public List<CodeVO> getCodeListByParent(String parentCode) {
		// DB접근해서 쿼리쓰기 return으로는 List<CodeVO>
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			conn = DriverManager.getConnection("jdbc:apache:commons:dbcp:study");
			StringBuffer sb = new StringBuffer();

			sb.append(" SELECT						");
			sb.append("     comm_cd					");
			sb.append("     , comm_nm				");
			sb.append("     , comm_parent			");
			sb.append("     , comm_ord				");
			sb.append(" FROM							");
			sb.append("     comm_code				");
			sb.append("  WHERE comm_parent=?		");

			ps = conn.prepareStatement(sb.toString());
			ps.setString(1, parentCode);
			rs = ps.executeQuery();

			List<CodeVO> codeList = new ArrayList<>();
			while (rs.next()) {
				CodeVO code = new CodeVO();
				code.setCommCd(rs.getString("comm_cd"));
				code.setCommNm(rs.getString("comm_nm"));
				code.setCommParent(rs.getString("comm_parent"));
				code.setCommOrd(rs.getInt("comm_ord"));

				codeList.add(code);
			}
			return codeList;
		} catch (SQLException e) {
			throw new DaoException("getCodeListByParent : " + e.getMessage());
		} finally {
			// 종료
			if (rs != null) {
				try {
					rs.close();
				} catch (Exception e) {
				}
			}
			if (ps != null) {
				try {
					ps.close();
				} catch (Exception e) {
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (Exception e) {
				}
			}
		}

	}

}
