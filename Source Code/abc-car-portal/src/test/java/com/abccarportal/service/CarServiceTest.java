package com.abccarportal.service;

import java.util.ArrayList;
import java.util.List;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;
import org.mockito.junit.MockitoJUnitRunner;

import com.abccarportal.model.Car;
import com.abccarportal.model.CarBidding;
import com.abccarportal.model.User;
import com.abccarportal.repository.BidRepository;
import com.abccarportal.repository.CarRepository;



@RunWith(MockitoJUnitRunner.class)
public class CarServiceTest {
	
	@InjectMocks
	CarService carService;
	
	@Mock
	CarRepository carRepository;
	
	@Mock
	BidRepository bidRepository;
	
	@Before
	public void setUp() {
		MockitoAnnotations.initMocks(this);
	}
	
	@Test
	public void testSaveCar() {
		Car car = new Car();
		car.setId((long) 1);
		car.setName("Perodua Myvi");
		car.setModel("Perodua");
		car.setPrice("33000");
		car.setMake("2021");
		car.setRegisteration("Jan 2021");
		Mockito.when(carRepository.save(car)).thenReturn(car);
		Car savedCar = carService.save(car);
		Assert.assertEquals(car, savedCar);
		
	}
	
	@Test
	public void testSearchCar() {
		Car car = new Car();
		String searchInput = "Perodua";
		car.setModel(searchInput);
		
		List<Car> searchCar = new ArrayList<Car>();
		searchCar.add(car);
		
		Mockito.when(carRepository.search(searchInput)).thenReturn(searchCar);
		List<Car> search = carService.search(searchInput);
		Assert.assertEquals(searchCar, search);
	}
	
	
	@Test
	public void testSaveCarBidding() {
		Car car = new Car();
		car.setName("Perodua Myvi");
		User user = new User();
		user.setName("Amelia Earhart");
		CarBidding bid = new CarBidding();
		bid.setCar(car);
		bid.setUser(user);
		bid.setBidderPrice(6000);
		
		Mockito.when(bidRepository.save(bid)).thenReturn(bid);
		CarBidding saveBid = carService.saveBid(bid);
		Assert.assertEquals(bid, saveBid);
		
	}
	
	
	
	

}
