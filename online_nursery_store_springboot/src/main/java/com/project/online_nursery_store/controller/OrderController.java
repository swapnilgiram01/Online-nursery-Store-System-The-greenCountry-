package com.project.online_nursery_store.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.project.online_nursery_store.exception.ResourceNotFoundException;
import com.project.online_nursery_store.model.Order;
import com.project.online_nursery_store.model.Product;
import com.project.online_nursery_store.model.Sell;
import com.project.online_nursery_store.model.Status;
import com.project.online_nursery_store.model.User;
import com.project.online_nursery_store.repository.OrderRepository;

@CrossOrigin(origins = "*")
@RestController
@RequestMapping("/api/v1")
public class OrderController {
	@Autowired
	private OrderRepository orderRepository;
	
	@PersistenceContext
    private EntityManager entityManager;

	@GetMapping("/orders")
	public List<Order> getAllOrders() {
		return orderRepository.findAll();
	}

	@GetMapping("/orders/search/{name}")
	public List<Order> getOrderByName(@PathVariable(value = "name") String orderName) {
			return orderRepository.serchUserByName(orderName);
	}
	
	@GetMapping("/orders/search-state/{state}")
	public List<Order> serchUserByState(@PathVariable(value = "state") String orderState) {
			return orderRepository.serchUserByState(orderState);
	}
	
	
	@GetMapping("/orders/{id}")
	public ResponseEntity<Order> getOrderById(@PathVariable(value = "id") Long orderId)
			throws ResourceNotFoundException {
		Order order = orderRepository.findById(orderId)
				.orElseThrow(() -> new ResourceNotFoundException("Order not found for this id :: " + orderId));
		return ResponseEntity.ok().body(order);
	}

	@PostMapping("/orders")
	public Order createOrder(@Valid @RequestBody Order order) {
		return orderRepository.save(order);
	}

	@PutMapping("/orders/{id}")
	public ResponseEntity<Order> updateOrder(@PathVariable(value = "id") Long orderId,
			@Valid @RequestBody Order orderDetails) throws ResourceNotFoundException {
		final Order updatedOrder = orderRepository.save(orderDetails);
		return ResponseEntity.ok(updatedOrder);
	}
	
	@GetMapping("/orders/all-orders")
	public ArrayList getAllEmployeeFields() {
		 Query q = entityManager.createQuery("SELECT cust, ord, status from orders ord, user cust, status status WHERE user_id = order_user_id and status_id = order_status");
		 List<Object[]> sell = q.getResultList();
		 ArrayList<HashMap<String, String>> resultArray = new ArrayList();
		 
		 for ( Object[] row : sell ) {
			  Order order_details = (Order)row[ 1 ];
			  Status status_details = (Status)row[ 2 ];
			  User user_details = (User)row[ 0 ];
			  
			  HashMap<String, String> results = new HashMap();
			    results.put("order_id",String.valueOf(order_details.getOrder_id()));
			    results.put("order_user_id",order_details.getOrder_user_id());
			    results.put("order_delivery_id",order_details.getOrder_delivery_id());
			    results.put("order_status",order_details.getOrder_status());
			    results.put("order_tracking_id",order_details.getOrder_tracking_id());
			    results.put("order_total",order_details.getOrder_total());
			    results.put("order_status",order_details.getOrder_status());
			    results.put("status_title",status_details.getStatus_name());
			    results.put("order_date",order_details.getOrder_date());
			    results.put("user_name",user_details.getUser_first_name()+" "+user_details.getUser_last_name());
			    results.put("user_mobile",String.valueOf(user_details.getUser_mobile()));
				
				resultArray.add(results);
			 
		 }	 

        return resultArray;
	}
	@GetMapping("/orders/user-orders/{id}")
	public ArrayList getAllUserOrders(@PathVariable(value = "id") Long orderId) {
		 Query q = entityManager.createQuery("SELECT cust, ord, status from orders ord, user cust, status status WHERE user_id = order_user_id and status_id = order_status AND order_user_id = ?1");
		 List<Object[]> sell = q.setParameter(1, orderId).getResultList();
		 ArrayList<HashMap<String, String>> resultArray = new ArrayList();
		 
		 for ( Object[] row : sell ) {
			  Order order_details = (Order)row[ 1 ];
			  Status status_details = (Status)row[ 2 ];
			  User user_details = (User)row[ 0 ];
			  
			  HashMap<String, String> results = new HashMap();
			  	results.put("order_id",String.valueOf(order_details.getOrder_id()));
			    results.put("order_status",order_details.getOrder_status());
			    results.put("status_title",status_details.getStatus_name());
			    results.put("order_user_id",order_details.getOrder_user_id());
			    results.put("order_delivery_id",order_details.getOrder_delivery_id());
			    results.put("order_status",order_details.getOrder_status());
			    results.put("order_tracking_id",order_details.getOrder_tracking_id());
			    results.put("order_total",order_details.getOrder_total());
			    results.put("order_status",order_details.getOrder_status());
			    results.put("order_date",order_details.getOrder_date());
			    results.put("user_name",user_details.getUser_first_name()+" "+user_details.getUser_last_name());
			    results.put("user_mobile",String.valueOf(user_details.getUser_mobile()));
				
				resultArray.add(results);
			 
		 }	 

        return resultArray;
	}
	
	@GetMapping("/orders/delivery-orders/{id}")
	public ArrayList getAllDeliveryOrders(@PathVariable(value = "id") Long orderId) {
		 Query q = entityManager.createQuery("SELECT cust, ord, status from orders ord, user cust, status status WHERE user_id = order_user_id and status_id = order_status AND order_delivery_id = ?1");
		 List<Object[]> sell = q.setParameter(1, orderId).getResultList();
		 ArrayList<HashMap<String, String>> resultArray = new ArrayList();
		 
		 for ( Object[] row : sell ) {
			  Order order_details = (Order)row[ 1 ];
			  Status status_details = (Status)row[ 2 ];
			  User user_details = (User)row[ 0 ];
			  
			  HashMap<String, String> results = new HashMap();
			  	results.put("order_id",String.valueOf(order_details.getOrder_id()));
			    results.put("order_status",order_details.getOrder_status());
			    results.put("status_title",status_details.getStatus_name());
			    results.put("order_user_id",order_details.getOrder_user_id());
			    results.put("order_delivery_id",order_details.getOrder_delivery_id());
			    results.put("order_status",order_details.getOrder_status());
			    results.put("order_tracking_id",order_details.getOrder_tracking_id());
			    results.put("order_total",order_details.getOrder_total());
			    results.put("order_status",order_details.getOrder_status());
			    results.put("order_date",order_details.getOrder_date());
			    results.put("user_name",user_details.getUser_first_name()+" "+user_details.getUser_last_name());
			    results.put("user_mobile",String.valueOf(user_details.getUser_mobile()));
				
				resultArray.add(results);
			 
		 }	 

        return resultArray;
	}
	
	@GetMapping("/orders/vendor-orders/{id}")
	public ArrayList getAllVendorOrders(@PathVariable(value = "id") Long orderId) {
		 Query q = entityManager.createQuery(""
		 		+ "SELECT cust, ord, status from orders ord, user cust, status status WHERE user_id = order_user_id and status_id = order_status AND order_id IN "
		 		+ "(SELECT distinct(ordr.order_id) FROM orders ordr, sell, product WHERE sell_order_id = order_id AND sell_product_id = product_id AND product_vendor_id = ?1)");
		 List<Object[]> sell = q.setParameter(1, orderId).getResultList();
		 ArrayList<HashMap<String, String>> resultArray = new ArrayList();
		 
		 for ( Object[] row : sell ) {
			  Order order_details = (Order)row[ 1 ];
			  Status status_details = (Status)row[ 2 ];
			  User user_details = (User)row[ 0 ];
			  
			  HashMap<String, String> results = new HashMap();
			  	results.put("order_id",String.valueOf(order_details.getOrder_id()));
			    results.put("order_status",order_details.getOrder_status());
			    results.put("status_title",status_details.getStatus_name());
			    results.put("order_user_id",order_details.getOrder_user_id());
			    results.put("order_delivery_id",order_details.getOrder_delivery_id());
			    results.put("order_status",order_details.getOrder_status());
			    results.put("order_tracking_id",order_details.getOrder_tracking_id());
			    results.put("order_total",order_details.getOrder_total());
			    results.put("order_status",order_details.getOrder_status());
			    results.put("order_date",order_details.getOrder_date());
			    results.put("user_name",user_details.getUser_first_name()+" "+user_details.getUser_last_name());
			    results.put("user_mobile",String.valueOf(user_details.getUser_mobile()));
				
				resultArray.add(results);
			 
		 }	 

        return resultArray;
	}

	
	@GetMapping("/orders/details/{id}")
	public ArrayList getOrderDetails(@PathVariable(value = "id") Long orderId) {
		 Query q = entityManager.createQuery("SELECT cust, ord, status from orders ord, user cust, status status WHERE order_status = status_id AND user_id = order_user_id AND order_id = ?1");
		 List<Object[]> sell = q.setParameter(1, orderId).getResultList();
		 ArrayList<HashMap<String, String>> resultArray = new ArrayList();
		 
		 for ( Object[] row : sell ) {
			  Order order_details = (Order)row[ 1 ];
			  User user_details = (User)row[ 0 ];
			  Status status_details = (Status)row[ 2 ];
			  
			  HashMap<String, String> results = new HashMap();
			  	results.put("order_id",String.valueOf(order_details.getOrder_id()));
			  	results.put("status_title",status_details.getStatus_name());
			    results.put("order_user_id",order_details.getOrder_user_id());
			    results.put("order_delivery_id",order_details.getOrder_delivery_id());
			    results.put("order_status",order_details.getOrder_status());
			    results.put("order_tracking_id",order_details.getOrder_tracking_id());
			    results.put("order_total",order_details.getOrder_total());
			    results.put("order_status",order_details.getOrder_status());
			    results.put("order_date",order_details.getOrder_date());
			    results.put("user_name",user_details.getUser_first_name()+" "+user_details.getUser_last_name());
			    results.put("user_mobile",String.valueOf(user_details.getUser_mobile()));
				
				resultArray.add(results);
			 
		 }	 

        return resultArray;
	}

	@DeleteMapping("/orders/{id}")
	public Map<String, Boolean> deleteOrder(@PathVariable(value = "id") Long orderId)
			throws ResourceNotFoundException {
		Order order = orderRepository.findById(orderId)
				.orElseThrow(() -> new ResourceNotFoundException("Order not found for this id :: " + orderId));

		orderRepository.delete(order);
		Map<String, Boolean> response = new HashMap<>();
		response.put("deleted", Boolean.TRUE);
		return response;
	}
}
