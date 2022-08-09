package kr.co.buck1.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public interface MemberDao {

	public int signup(MemberDto dto);
}
