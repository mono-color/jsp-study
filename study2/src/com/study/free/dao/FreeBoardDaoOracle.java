package com.study.free.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.*;
import java.util.ArrayList;
import java.util.*;

import com.study.exception.DaoException;
import com.study.free.vo.FreeBoardVO;

public class FreeBoardDaoOracle implements IFreeBoardDao {

	@Override
	public List<FreeBoardVO> getBoardList() {
		// 밑에 있는는 코드는 나중에 dao로 이동

		// DB 조회해서 화면에 뿌려
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			conn = DriverManager.getConnection("jdbc:apache:commons:dbcp:study");

			StringBuffer sb = new StringBuffer();
			sb.append(" SELECT																");
			sb.append("      bo_no,        bo_title,     bo_category  					");
			sb.append("    , bo_writer, 	bo_pass,      bo_content    				");
			sb.append("    , bo_hit															");
			sb.append("    , to_char(bo_reg_date,'YYYY-MM-dd') AS bo_reg_date			");
			sb.append("    , to_char(bo_mod_date,'YYYY-MM-dd') AS bo_mod_date			");
			sb.append("    , bo_del_yn														");
			sb.append(" FROM																	");
			sb.append("    free_board														");

			ps = conn.prepareStatement(sb.toString());

			rs = ps.executeQuery();

			// rs 1줄 -> where절

			List<FreeBoardVO> freeBoardList = new ArrayList<>();
			while (rs.next()) {
				FreeBoardVO freeBoard = new FreeBoardVO();
				freeBoard.setBoNo(rs.getInt("bo_no"));
				freeBoard.setBoTitle(rs.getString("bo_title"));
				freeBoard.setBoCategory(rs.getString("bo_category"));
				freeBoard.setBoWriter(rs.getString("bo_writer"));
				freeBoard.setBoPass(rs.getString("bo_pass"));
				freeBoard.setBoContent(rs.getString("bo_content"));
				freeBoard.setBoHit(rs.getInt("bo_hit"));
				freeBoard.setBoRegDate(rs.getString("bo_reg_date"));
				freeBoard.setBoModDate(rs.getString("bo_mod_date"));
				freeBoard.setBoDelYn(rs.getString("bo_del_yn"));
				freeBoardList.add(freeBoard);
			}
			return freeBoardList;

		} catch (Exception e) {
			// 1번. 아무것도 안함 -> 상사한테 불려감
			// 2번. //e.printStackTrace(); 콘솔에 찍히긴 하는데, 코드는 정상 실행?
			// SQLException났는데 정상 실행되면 안되지 않나?.. 원래는 파란색화면^~^
			// 3번. 예외 전환 -> 파란화면 까짓거 띄우면 되징
			// SQLException을 DaoException으로 바꿔서 던지자
			// throw를 해도 메소드가 끝남 (=return)
			throw new DaoException("getBoardList : " + e.getMessage());
		} finally {
			// 4. 연결 종료
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

	@Override
	public FreeBoardVO getBoard(int boNo) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			conn = DriverManager.getConnection("jdbc:apache:commons:dbcp:study");

			StringBuffer sb = new StringBuffer();
			sb.append(" SELECT																	");
			sb.append("     * 			                   								 	");
			sb.append("  FROM 					                 								");
			sb.append("   free_board				                 								");
			sb.append("  WHERE bo_no = ?														");

			ps = conn.prepareStatement(sb.toString());
			ps.setInt(1, boNo);

			rs = ps.executeQuery();
			// rs 1줄 -> where절

			if (rs.next()) {
				FreeBoardVO freeBoard = new FreeBoardVO();
				// set
				freeBoard.setBoNo(rs.getInt("bo_no"));
				freeBoard.setBoTitle(rs.getString("bo_title"));
				freeBoard.setBoCategory(rs.getString("bo_category"));
				freeBoard.setBoWriter(rs.getString("bo_writer"));
				freeBoard.setBoPass(rs.getString("bo_pass"));
				freeBoard.setBoContent(rs.getString("bo_content"));
				freeBoard.setBoHit(rs.getInt("bo_hit"));
				freeBoard.setBoRegDate(rs.getString("bo_reg_date"));
				freeBoard.setBoModDate(rs.getString("bo_mod_date"));
				freeBoard.setBoDelYn(rs.getString("bo_del_yn"));

				return freeBoard;
			}

		} catch (Exception e) {
			throw new DaoException("getBoard : " + e.getMessage());
		} finally {
			// 4. 연결 종료
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
		return null;
	}

	@Override
	public int increaseHit(int boNo) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DriverManager.getConnection("jdbc:apache:commons:dbcp:study");
			StringBuffer sb = new StringBuffer();
			sb.append(" UPDATE free_board SET	");
			sb.append(" bo_hit = bo_hit+1		");
			sb.append(" WHERE bo_no = ?			");

			ps = conn.prepareStatement(sb.toString());
			ps.setInt(1, boNo);
			int cnt = ps.executeUpdate();
			return cnt;

		} catch (SQLException e) {
			throw new DaoException("increaseHit : " + e.getMessage());
		} finally {
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

	@Override
	public int updateBoard(FreeBoardVO freeBoard) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteBoard(FreeBoardVO freeBoard) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertBoard(FreeBoardVO freeBoard) {
		// TODO Auto-generated method stub
		return 0;
	}

}
