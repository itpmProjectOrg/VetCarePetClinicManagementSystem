package com.petprofile.modules;

public class PetOwner {

	private int id;
	private String name;
	private String addr;
	private String contactNo;
	
	public PetOwner(int id, String name, String addr, String contactNo) {
		this.id = id;
		this.name = name;
		this.addr = addr;
		this.contactNo = contactNo;
	}
	
	public int getId() {
		return id;
	}
	
	public String getName() {
		return name;
	}
	
	public String getAddr() {
		return addr;
	}
	
	public String getContactNo() {
		return contactNo;
	}
	
	
	
}
