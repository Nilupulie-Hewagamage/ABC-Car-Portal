package com.abccarportal.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.abccarportal.model.Car;
import com.abccarportal.model.CarBidding;
import com.abccarportal.model.User;
import com.abccarportal.repository.CarRepository;
import com.abccarportal.service.CarService;
import com.abccarportal.service.UserService;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.security.Principal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;
import java.util.Timer;
import java.util.TimerTask;
import java.util.concurrent.TimeUnit;
import java.util.function.Predicate;
import java.util.stream.Collectors;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpSession;

@Controller
public class CarController {

	@Autowired
	CarService carService;

	@Autowired
	UserService userService;

	@GetMapping("/")
	public String handleRootRequest(Model model) {
		return "redirect:cars";
	}

	@GetMapping("cars")
	public ModelAndView viewCars(@ModelAttribute("car") Car car) {

		List<Car> cars = carService.getAllCars();
		System.out.println(cars);

		return new ModelAndView("viewCars", "cars", cars);
	}

	@GetMapping("car_detail")
	public String viewCarDetail(@RequestParam long cid, Model model) {

		Optional<Car> car_info = carService.getCarInfo(cid);
		System.out.println(car_info);

		Car cardata = car_info.get();

		List<Car> car = new ArrayList<Car>();

		car.add(cardata);

		model.addAttribute("car", car);

		// show bidding data
		Predicate<CarBidding> byCar = ucar -> ucar.getCar().equals(cardata);

		List<CarBidding> bdata = carService.getAllBids().stream().filter(byCar).collect(Collectors.toList());

		model.addAttribute("bid", bdata);

		if (bdata.size() > 0) {
			double highest = bdata.get(0).getBidderPrice();
			System.out.println(highest);
			model.addAttribute("highest", highest);
		}

		return "carDetail";
	}

	@PostMapping("car_post")
	public String saveCar(@ModelAttribute("car") Car car, RedirectAttributes ra,
			@RequestParam("fileImage") MultipartFile multipartFile, Principal principal) throws IOException {

		String fileName = StringUtils.cleanPath(multipartFile.getOriginalFilename());

		car.setPhotos(fileName);

		Car savedCar = carService.save(car);

		String uploadDir = "./src/main/resources/static/images/car-photo/" + savedCar.getId();

		Path uploadPath = Paths.get(uploadDir);

		if (!Files.exists(uploadPath)) {
			Files.createDirectories(uploadPath);
		}

		try (InputStream inputStream = multipartFile.getInputStream()) {
			Path filePath = uploadPath.resolve(fileName);
			System.out.println(filePath.toFile().getAbsolutePath());
			Files.copy(inputStream, filePath, StandardCopyOption.REPLACE_EXISTING);
		} catch (IOException e) {
			throw new IOException("Could not save uploaded file: " + fileName);

		}

		car.setPhotoImagePath("/images/car-photo/" + savedCar.getId() + "/" + savedCar.getPhotos());

		// Get User name
		String uname = principal.getName();

		User user = userService.findLoginUser(uname);

		car.setSellerId(user.getId());

		carService.save(car);

		ra.addFlashAttribute("success_post", "Post has been saved successfully");

		return "redirect:cars";
	}

	@PostMapping("bid")
	public String carBidding(@ModelAttribute("bidding") CarBidding bid,
			@RequestParam(value = "cid", required = false) long id, Principal principal, Model model,
			@RequestParam("bidderPrice") double price) {

		// Get User name
		String uname = principal.getName();

		User user = userService.findLoginUser(uname);

		// get Car
		Optional<Car> car_info = carService.getCarInfo(id);
		System.out.println(car_info);

		Car cardata = car_info.get();

		bid.setBidderName(user.getName());
		bid.setUser(user);
		bid.setCar(cardata);

		// before saving, check if user has placed a bid before
		List<CarBidding> userBid = carService.findUserBid(user, cardata);
		System.out.println(userBid);

		if (userBid.size() > 0) {

			long bidId = userBid.stream().findAny().get().getId();
			Optional<CarBidding> bid_info = carService.getBidInfo(bidId);
			System.out.println(bid_info);

			CarBidding bidData = bid_info.get();

			bidData.setBidderPrice(price);

			carService.saveBid(bidData);
			
			
		} else {
			carService.saveBid(bid);
			
		}

		// show car data

		List<Car> car = new ArrayList<Car>();

		car.add(cardata);

		model.addAttribute("car", car);

		// show bidding data
		Predicate<CarBidding> byCar = ucar -> ucar.getCar().equals(cardata);

		List<CarBidding> bdata = carService.getAllBids().stream().filter(byCar).collect(Collectors.toList());
		System.out.println(bdata);

		model.addAttribute("bid", bdata);

		if (bdata.size() > 0) {
			double highest = bdata.get(0).getBidderPrice();
			System.out.println(highest);
			model.addAttribute("highest", highest);
		}
		
		Set<CarBidding> highBid = new HashSet<CarBidding>();
		highBid.add(bdata.get(0));
		
		//cardata.getBiddings().clear();
		cardata.setBiddings(highBid);
		carService.save(cardata);
		System.out.println(cardata.getBiddings());

		return "carDetail";
	}

	@PostMapping("book")
	public String carBooking(@ModelAttribute("booking") CarBidding book,
			@RequestParam(value = "cid", required = false) long id, Principal principal, 
			Model model, @RequestParam("bookDate") String date) {

		// Get User name
		String uname = principal.getName();

		User user = userService.findLoginUser(uname);

		// get Car
		Optional<Car> car_info = carService.getCarInfo(id);
		System.out.println(car_info);

		Car cardata = car_info.get();

		book.setUser(user);
		book.setCar(cardata);
		book.setBidderName(user.getName());

		// before saving, check if user has placed a bidding before to add booking date
		List<CarBidding> userBooking = carService.findUserBid(user, cardata);
		System.out.println(userBooking);

		if (userBooking.size() > 0) {

			long bookId = userBooking.stream().findAny().get().getId();
			Optional<CarBidding> book_info = carService.getBidInfo(bookId);
			System.out.println(book_info);

			CarBidding bookdata = book_info.get();
			
			bookdata.setBookDate(date);

			carService.saveBid(bookdata);
		} else {
			
			carService.saveBid(book);
		}

		// show car data

		List<Car> car = new ArrayList<Car>();

		car.add(cardata);

		model.addAttribute("car", car);

		// show bidding data
		Predicate<CarBidding> byCar = ucar -> ucar.getCar().equals(cardata);

		List<CarBidding> bdata = carService.getAllBids().stream().filter(byCar).collect(Collectors.toList());
		System.out.println(bdata);

		model.addAttribute("bid", bdata);

		if (bdata.size() > 0) {
			double highest = bdata.get(0).getBidderPrice();
			System.out.println(highest);
			model.addAttribute("highest", highest);
		}
		
		Set<CarBidding> highBid = new HashSet<CarBidding>();
		highBid.add(bdata.get(0));
		
		//cardata.getBiddings().clear();
		cardata.setBiddings(highBid);
		carService.save(cardata);
		System.out.println(cardata.getBiddings());
		

		return "carDetail";
	}
	
	@GetMapping("deletecar")
	public String deleteCar(@RequestParam long cid) {
		
		carService.deleteCar(cid);
		
		return "redirect:cars";
		
	}
	
	@GetMapping("all_cars")
	public ModelAndView showAllCar(@ModelAttribute("car") Car car) {
		
		List<Car> cars = carService.getAllCars();
		System.out.println(cars);
		
		return new ModelAndView ("allCar", "cars", cars);
	}
	
	@PostMapping("edit_car")
	public String editCar(@ModelAttribute("car") Car car, 
			@RequestParam long cid) {
		
		Optional<Car> car_info = carService.getCarInfo(cid);
    	System.out.println(car_info);
    	
    	Car edit_car = car_info.get();
		
    	edit_car.setMake(car.getMake());
    	edit_car.setModel(car.getModel());
    	edit_car.setName(car.getName());
    	edit_car.setPrice(car.getPrice());
    	edit_car.setRegisteration(car.getRegisteration());
    	edit_car.setSellerId(car.getSellerId());
    	edit_car.setPhotos(car.getPhotos());
    	edit_car.setPhotoImagePath(car.getPhotoImagePath());
    	
    	carService.save(edit_car);
		
		return "redirect:all_cars";
	}
	
	@GetMapping("delete_car")
	public String deletePostCar(@RequestParam long cid) {
		
		carService.deleteCar(cid);
		
		return "redirect:all_cars";
		
	}
	
	@PostMapping("booking_status")
	public String setCarBookingStatus(@RequestParam long bid,
			@ModelAttribute("book") CarBidding book) {
		
		Optional<CarBidding> car_info = carService.getBidInfo(bid);
		CarBidding car_booking = car_info.get();
		System.out.println(car_booking);
		
		car_booking.setBookStatus(book.getBookStatus());
		
		carService.saveBid(car_booking);
		
		return "redirect:all_cars";
	}
	
	@PostMapping("sale_status")
	public String setCarSaleStatus(@RequestParam long cid,
			@ModelAttribute("car") Car car) {
		
		Optional<Car> car_info = carService.getCarInfo(cid);
		Car car_sale = car_info.get();
		System.out.println(car_sale);
		
		car_sale.setSellStatus(car.getSellStatus());
		
		carService.save(car_sale);
		
		return "redirect:all_cars";
	}
	
	@GetMapping("search")
	public ModelAndView searchCars(@RequestParam String keyword, Model model) {
		
		List<Car> searchCar = carService.search(keyword);
		System.out.println(searchCar);
		
		model.addAttribute("keyword", keyword);
		
		return new ModelAndView ("searchResults", "searchCar", searchCar);
	}

}
