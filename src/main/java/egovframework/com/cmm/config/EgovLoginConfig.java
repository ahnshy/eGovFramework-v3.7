package egovframework.com.cmm.config;

/**
 * EgovLoginConfig 클래스
 * <Notice>
 * 	    사용자 인증 실패에 제한 클래스 
 * <Disclaimer>
 *		N/A
 *
 */


public class EgovLoginConfig {
	//로그인 인증 제한 여부
	boolean lock = false;
	//로그인 인증 제한 횟수
	int lockCount = 0;

	public boolean isLock() {
		return lock;
	}

	public void setLock(boolean lock) {
		this.lock = lock;
	}

	public int getLockCount() {
		return lockCount;
	}

	public void setLockCount(int lockCount) {
		this.lockCount = lockCount;
	}
}
