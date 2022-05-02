package com.petprofile.modules;

public class Pet {
	
	private int petID;
    private int ownerID;
	private String name;
	private String petType;
	private String breed;
	private String sex;
	private String dob;
	private String date;
	
	public Pet(int petID,int ownerID, String name, String petType, String breed, String sex, String dob, String date) {
		this.petID = petID;
		this.ownerID = ownerID;
		this.name = name;
		this.petType = petType;
		this.breed = breed;
		this.sex = sex;
		this.dob = dob;
		this.date = date;
	}

	public int getOwnerID() {
		return ownerID;
	}

	

	public int getPetID() {
		return petID;
	}

	

	public String getName() {
		return name;
	}

	

	public String getPetType() {
		return petType;
	}

	
	public String getBreed() {
		return breed;
	}

	
	public String getSex() {
		return sex;
	}

	

	public String getDob() {
		return dob;
	}

	

	public String getDate() {
		return date;
	}

	
	
	
}
