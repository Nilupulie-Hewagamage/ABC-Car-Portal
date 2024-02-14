package com.abccarportal.repository;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.abccarportal.model.Car;
import com.abccarportal.model.CarBidding;
import com.abccarportal.model.User;

@Repository
public interface BidRepository extends JpaRepository<CarBidding, Long>{
	
	List<CarBidding> findByUserAndCar(User user, Car car);
	
	List<CarBidding> findByUser(User user);

}
