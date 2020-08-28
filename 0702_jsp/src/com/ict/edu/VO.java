package com.ict.edu;

public class VO {
	// 파라미터이름과 변수이름이 같아야 한다.
	private String name, age, addr, gender, residence, cPage;
	private String[] hobby, animal;
	
	public VO() {
	}

	public VO(String name, String age, String addr, String gender, String residence, String cPage, String[] hobby,
			String[] animal) {
		super();
		this.name = name;
		this.age = age;
		this.addr = addr;
		this.gender = gender;
		this.residence = residence;
		this.cPage = cPage;
		this.hobby = hobby;
		this.animal = animal;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getResidence() {
		return residence;
	}

	public void setResidence(String residence) {
		this.residence = residence;
	}

	public String getcPage() {
		return cPage;
	}

	public void setcPage(String cPage) {
		this.cPage = cPage;
	}

	public String[] getHobby() {
		return hobby;
	}

	public void setHobby(String[] hobby) {
		this.hobby = hobby;
	}

	public String[] getAnimal() {
		return animal;
	}

	public void setAnimal(String[] animal) {
		this.animal = animal;
	}
	
	
}
