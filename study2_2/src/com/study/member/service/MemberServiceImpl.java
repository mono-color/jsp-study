package com.study.member.service;

import java.util.List;

import com.study.exception.BizDuplicateKeyException;
import com.study.exception.BizNotEffectedException;
import com.study.exception.BizNotFoundException;
import com.study.member.dao.IMemberDao;
import com.study.member.dao.MemberDaoOracle;
import com.study.member.vo.MemberSearchVO;
import com.study.member.vo.MemberVO;

public class MemberServiceImpl implements IMemberService {
	IMemberDao memberDao = new MemberDaoOracle();

	@Override
	public List<MemberVO> getMemberList(MemberSearchVO searchVO) {
		// TODO Auto-generated method stub
		int totalRowCount = memberDao.getTotalRowCount(searchVO);
		searchVO.setTotalRowCount(totalRowCount);
		searchVO.pageSetting();
		return memberDao.getMemberList(searchVO);
	}

	@Override
	public MemberVO getMember(String memId) throws BizNotFoundException {
		MemberVO member = memberDao.getMember(memId);
		if (member == null) {
			throw new BizNotFoundException();
		}
		return member;
	}

	@Override
	public void modifyMember(MemberVO member) throws BizNotEffectedException, BizNotFoundException {
		MemberVO vo = memberDao.getMember(member.getMemId());
		if (vo == null) {
			throw new BizNotFoundException();
		}
		int cnt = memberDao.updateMember(member);
		if (cnt < 1)
			throw new BizNotEffectedException();
	}

	@Override
	public void removeMember(MemberVO member) throws BizNotEffectedException, BizNotFoundException {
		MemberVO vo = memberDao.getMember(member.getMemId());
		if (vo == null) {
			throw new BizNotFoundException();
		}
		int cnt = memberDao.deleteMember(member);
		if (cnt < 1)
			throw new BizNotEffectedException();
	}

	@Override
	public void registMember(MemberVO member) throws BizNotEffectedException, BizDuplicateKeyException {
		MemberVO vo = memberDao.getMember(member.getMemId());
		
		int cnt = memberDao.insertMember(member);
		if (cnt < 1) throw new BizNotEffectedException();
		if (member.getMemId().equals(vo.getMemId())) {
			throw new BizDuplicateKeyException();
		}
	}

}
