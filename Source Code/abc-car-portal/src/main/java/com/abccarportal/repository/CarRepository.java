package com.abccarportal.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.abccarportal.model.Car;

@Repository
public interface CarRepository extends JpaRepository<Car, Long>{

	List<Car> findBySellerId(Long uid);
	
	@Query(value = "SELECT c FROM Car c WHERE c.make LIKE '%' || :keyword || '%'"
			+ " OR c.model LIKE '%' || :keyword || '%'"
			+ " OR c.price LIKE '%' || :keyword || '%'"
			+ " OR c.registeration LIKE '%' || :keyword || '%'")
	public List<Car> search(@Param("keyword") String keyword);
}
