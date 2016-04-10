package com.my.bk.entities;

public class User extends BaseEntity{
	private static final long serialVersionUID = 1L;

	private Integer uId;

    private String uName;

    private String uPassword;

    private String uEmail;
    
    private String uSalt;
    
    private Role role;
    
    public String getuSalt() {
		return uSalt;
	}

	public void setuSalt(String uSalt) {
		this.uSalt = uSalt;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public Integer getuId() {
        return uId;
    }

    public void setuId(Integer uId) {
        this.uId = uId;
    }

    public String getuName() {
        return uName;
    }

    public void setuName(String uName) {
        this.uName = uName == null ? null : uName.trim();
    }

    public String getuPassword() {
        return uPassword;
    }

    public void setuPassword(String uPassword) {
        this.uPassword = uPassword == null ? null : uPassword.trim();
    }

    public String getuEmail() {
        return uEmail;
    }

    public void setuEmail(String uEmail) {
        this.uEmail = uEmail == null ? null : uEmail.trim();
    }

}