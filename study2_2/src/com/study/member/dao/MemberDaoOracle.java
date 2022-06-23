package com.study.member.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.study.exception.DaoException;
import com.study.member.vo.MemberVO;

public class MemberDaoOracle implements IMemberDao {

	@Override
	public List<MemberVO> getMemberList() {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			// 연결
			conn = DriverManager.getConnection("jdbc:apache:commons:dbcp:study");
			// 쿼리문 만들기 Stringbuffer
			StringBuffer sb = new StringBuffer();
			sb.append(" SELECT															");
			sb.append(" 	mem_id    , mem_pass    , mem_name							");
			sb.append(" 	    , TO_CHAR(mem_bir, 'YYYY-MM-DD') as mem_bir			");
			sb.append(" 	    , mem_zip    , mem_add1									");
			sb.append(" 	    , mem_add2    , mem_hp    , mem_mail					");
			sb.append(" 	    , mem_job    , mem_hobby    , mem_mileage				");
			sb.append(" 	    , mem_del_yn												");
			sb.append(" 	    , b.comm_nm AS mem_job_nm								");
			sb.append(" 	    , c.comm_nm AS mem_hobby_nm								");
			sb.append(" FROM																");
			sb.append(" member a, comm_code b, comm_code c							");
			sb.append(" WHERE a.mem_job = b.comm_cd									");
			sb.append(" AND a.mem_hobby = c.comm_cd									");

			ps = conn.prepareStatement(sb.toString());

			rs = ps.executeQuery();

			// rs 가지고 있는 객체 만들어서 req.setAttr
			List<MemberVO> memberList = new ArrayList<>();

			while (rs.next()) {
				MemberVO member = new MemberVO();

				member.setMemId(rs.getString("mem_id"));
				member.setMemPass(rs.getString("mem_pass"));
				member.setMemName(rs.getString("mem_name"));
				member.setMemBir(rs.getString("mem_bir"));
				member.setMemZip(rs.getString("mem_zip"));
				member.setMemAdd1(rs.getString("mem_add1"));
				member.setMemAdd2(rs.getString("mem_add2"));
				member.setMemHp(rs.getString("mem_hp"));
				member.setMemMail(rs.getString("mem_mail"));
				member.setMemJob(rs.getString("mem_job"));
				member.setMemHobby(rs.getString("mem_hobby"));
				member.setMemMileage(rs.getInt("mem_mileage"));
				member.setMemDelYn(rs.getString("mem_del_yn"));
				member.setMemJobNm(rs.getString("mem_job_nm"));
				member.setMemHobbyNm(rs.getString("mem_hobby_nm"));

				memberList.add(member);

			}
			return memberList;
		} catch (SQLException e) {
			throw new DaoException("getMemberList : " + e.getMessage());
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

	@Override
	public MemberVO getMember(String memId) {

		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			// 연결
			conn = DriverManager.getConnection("jdbc:apache:commons:dbcp:study");
			// 쿼리문 만들기 Stringbuffer
			StringBuffer sb = new StringBuffer();
			sb.append(" SELECT																");
			sb.append("	 mem_id			  												");
			sb.append("	 ,mem_pass 		     											");
			sb.append("	 ,mem_name 		      											");
			sb.append("	 ,TO_CHAR(mem_bir, 'YYYY-MM-DD') as mem_bir					");
			sb.append("	 ,mem_zip 		         											");
			sb.append("	 ,mem_add1 		         										");
			sb.append("	 ,mem_add2 		         										");
			sb.append("	 ,mem_hp 		         											");
			sb.append("	 ,mem_mail 		         										");
			sb.append(" 	 , mem_job    , mem_hobby    , mem_mileage					");
			sb.append("	 ,mem_del_yn 	         											");
			sb.append(" 	    , b.comm_nm AS mem_job_nm									");
			sb.append(" 	    , c.comm_nm AS mem_hobby_nm									");
			sb.append(" FROM																	");
			sb.append(" member a, comm_code b, comm_code c								");
			sb.append(" WHERE mem_id = ?													");
			sb.append(" AND a.mem_hobby = c.comm_cd										");
			sb.append(" AND a.mem_job = b.comm_cd											");

			ps = conn.prepareStatement(sb.toString());

			ps.setString(1, memId);

			rs = ps.executeQuery();

			while (rs.next()) {
				MemberVO member = new MemberVO();

				member.setMemId(rs.getString("mem_id"));
				member.setMemPass(rs.getString("mem_pass"));
				member.setMemName(rs.getString("mem_name"));
				member.setMemBir(rs.getString("mem_bir"));
				member.setMemZip(rs.getString("mem_zip"));
				member.setMemAdd1(rs.getString("mem_add1"));
				member.setMemAdd2(rs.getString("mem_add2"));
				member.setMemHp(rs.getString("mem_hp"));
				member.setMemMail(rs.getString("mem_mail"));
				member.setMemJob(rs.getString("mem_job"));
				member.setMemHobby(rs.getString("mem_hobby"));
				member.setMemMileage(rs.getInt("mem_mileage"));
				member.setMemDelYn(rs.getString("mem_del_yn"));
				member.setMemJobNm(rs.getString("mem_job_nm"));
				member.setMemHobbyNm(rs.getString("mem_hobby_nm"));
				return member;
			}
		} catch (SQLException e) {
			throw new DaoException("getMember : " + e.getMessage());
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
		return null;
	}

	@Override
	public int updateMember(MemberVO member) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			conn = DriverManager.getConnection("jdbc:apache:commons:dbcp:study");
			StringBuffer sb = new StringBuffer();
			sb.append("	UPDATE member SET      													");
			//sb.append("	 mem_id			= ?      												");
			sb.append("	 mem_pass 		= ?         											");
			sb.append("	 ,mem_name 		= ?          											");
			sb.append("	 ,mem_bir 			= ?         											");
			sb.append("	 ,mem_zip 			= ?         											");
			sb.append("	 ,mem_add1 		= ?             										");
			sb.append("	 ,mem_add2 		= ?             										");
			sb.append("	 ,mem_hp 			= ?         											");
			sb.append("	 ,mem_mail 		= ?             										");
			sb.append("	 ,mem_job 			= ?         											");
			sb.append("	 ,mem_hobby 		= ?             										");
			sb.append("	 ,mem_mileage 	= ?         											");
			sb.append("	 ,mem_del_yn 		= ?         											");
			sb.append("		WHERE mem_id 	= ?         											");

			ps = conn.prepareStatement(sb.toString());

			int i = 1;
			//ps.setString(i++, (member.getMemId()));
			ps.setString(i++, (member.getMemPass()));
			ps.setString(i++, (member.getMemName()));
			ps.setString(i++, (member.getMemBir()));
			ps.setString(i++, (member.getMemZip()));
			ps.setString(i++, (member.getMemAdd1()));
			ps.setString(i++, (member.getMemAdd2()));
			ps.setString(i++, (member.getMemHp()));
			ps.setString(i++, (member.getMemMail()));
			ps.setString(i++, (member.getMemJob()));
			ps.setString(i++, (member.getMemHobby()));
			ps.setInt(i++, (member.getMemMileage()));
			ps.setString(i++, (member.getMemDelYn()));
			ps.setString(i++, (member.getMemId()));

			int cnt = ps.executeUpdate();
			return cnt;
		} catch (SQLException e) {
			throw new DaoException("updateMember : "+ e.getMessage());
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
	public int deleteMember(MemberVO member) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			conn = DriverManager.getConnection("jdbc:apache:commons:dbcp:study");
			StringBuffer sb = new StringBuffer();
			sb.append("	UPDATE member SET       													");
			sb.append("	 mem_del_yn 		= 'Y'         										");
			sb.append("		WHERE mem_id 	= ?         											");

			ps = conn.prepareStatement(sb.toString());
			ps.setString(1, (member.getMemId()));

			int cnt = ps.executeUpdate();
			return cnt;
		} catch (SQLException e) {
			throw new DaoException("deleteMember : "+ e.getMessage());
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
	public int insertMember(MemberVO member) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try{
			// 연결
			conn = DriverManager.getConnection("jdbc:apache:commons:dbcp:study");
			// 쿼리문
			StringBuffer sb = new StringBuffer();
			
			sb.append(" 		INSERT INTO member (											");
			sb.append(" 		    mem_id    , mem_pass    , mem_name						");
			sb.append(" 		    , mem_bir    , mem_zip    , mem_add1					");
			sb.append(" 		    , mem_add2    , mem_hp    , mem_mail					");
			sb.append(" 		    , mem_job    , mem_hobby    , mem_mileage				");
			sb.append(" 		    , mem_del_yn												");
			sb.append(" 		) VALUES (														");
			sb.append(" 		?   ,   ?   ,   ?												");
			sb.append(" 		,?  ,   ?   ,   ?												");
			sb.append(" 		,?  ,   ?   ,   ?												");
			sb.append(" 		,?			");  
			sb.append(" 		,?			");
			sb.append(" 		,0																");
			sb.append(" 		,'N')																");
			
			
			
			ps = conn.prepareStatement(sb.toString());
			// ? 세팅, 쿼리실행
			int i = 1;
			ps.setString(i++,(member.getMemId()));    
			ps.setString(i++,(member.getMemPass()));
			ps.setString(i++,(member.getMemName()));
			ps.setString(i++,(member.getMemBir()));
			ps.setString(i++,(member.getMemZip()));
			ps.setString(i++,(member.getMemAdd1()));
			ps.setString(i++,(member.getMemAdd2()));
			ps.setString(i++,(member.getMemHp()));
			ps.setString(i++,(member.getMemMail()));
			ps.setString(i++,(member.getMemJob()));
			ps.setString(i++,(member.getMemHobby()));
			
			int cnt = ps.executeUpdate();
			
			return cnt;
		}catch(SQLException e){
			throw new DaoException("insertMember : " + e.getMessage());
		}finally{
			if (rs != null) {	try {rs.close();} catch (Exception e) {}}
			if (ps != null) {try {ps.close();} catch (Exception e) {} }
			if (conn != null) {try {	conn.close();	} catch (Exception e) {} }
		}
	}

}
