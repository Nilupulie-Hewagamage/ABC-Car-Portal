package com.abccarportal.model;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;

import org.springframework.data.annotation.CreatedDate;

@Entity
public class Car {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(nullable = true, length = 64)
	private String photos;

	@Column(nullable = true, length = 64)
	private String photoImagePath;
	
	@OneToMany(mappedBy = "car")
	private Set<CarBidding> biddings = new HashSet<CarBidding>();
	
	private String name;

	private String make;

	private String model;

	private String registeration;

	private String price;
	
	private Long sellerId;
	
	private String sellStatus;
	
	@CreatedDate
	private String postDate;

	@PrePersist
	private void onCreate() {

		DateFormat dateOnly = new SimpleDateFormat("EEEEE dd MMMMM yyyy");

		postDate = dateOnly.format(new Date());

	}
	

	public Car() {

	}


	public Car(Long id, String photos, String photoImagePath, String name, String make, String model,
			String registeration, String price, Long sellerId) {
		super();
		this.id = id;
		this.photos = photos;
		this.photoImagePath = photoImagePath;
		this.name = name;
		this.make = make;
		this.model = model;
		this.registeration = registeration;
		this.price = price;
		this.sellerId = sellerId;
	}




	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getPhotos() {
		return photos;
	}

	public void setPhotos(String photos) {
		this.photos = photos;
	}

	public String getPhotoImagePath() {
		return photoImagePath;
	}

	public void setPhotoImagePath(String photoImagePath) {
		this.photoImagePath = photoImagePath;
	}

	public String getMake() {
		return make;
	}

	public void setMake(String make) {
		this.make = make;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getRegisteration() {
		return registeration;
	}

	public void setRegisteration(String registeration) {
		this.registeration = registeration;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public Long getSellerId() {
		return sellerId;
	}

	public void setSellerId(Long sellerId) {
		this.sellerId = sellerId;
	}
	

	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}


	public String getPostDate() {
		return postDate;
	}


	public void setPostDate(String postDate) {
		this.postDate = postDate;
	}


	public Set<CarBidding> getBiddings() {
		return biddings;
	}


	public void setBiddings(Set<CarBidding> biddings) {
		this.biddings = biddings;
	}

	public String getSellStatus() {
		return sellStatus;
	}


	public void setSellStatus(String sellStatus) {
		this.sellStatus = sellStatus;
	}


	@Override
	public String toString() {
		return "Car [id=" + id + ", photos=" + photos + ", photoImagePath=" + photoImagePath + ", name=" + name
				+ ", make=" + make + ", model=" + model + ", registeration=" + registeration + ", price=" + price
				+ ", sellerId=" + sellerId + ", postDate=" + postDate + "]";
	}


	


}
