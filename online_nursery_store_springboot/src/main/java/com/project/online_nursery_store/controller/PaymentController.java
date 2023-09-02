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
import com.project.online_nursery_store.model.Country;
import com.project.online_nursery_store.model.Payment;
import com.project.online_nursery_store.model.Status;
import com.project.online_nursery_store.model.User;
import com.project.online_nursery_store.repository.PaymentRepository;

@CrossOrigin(origins = "*")
@RestController
@RequestMapping("/api/v1")
public class PaymentController {

	@Autowired
	private PaymentRepository paymentRepository;
	
	@PersistenceContext
    private EntityManager entityManager;

	@GetMapping("/payments")
	public List<Payment> getAllPayments() {
		return paymentRepository.findAll();
	}

	@GetMapping("/payments/search/{name}")
	public List<Payment> getPaymentByName(@PathVariable(value = "name") String paymentName) {
			return paymentRepository.serchUserByName(paymentName);
	}

	
	@GetMapping("/payments/{id}")
	public ResponseEntity<Payment> getPaymentById(@PathVariable(value = "id") Long paymentId)
			throws ResourceNotFoundException {
		Payment payment = paymentRepository.findById(paymentId)
				.orElseThrow(() -> new ResourceNotFoundException("Payment not found for this id :: " + paymentId));
		return ResponseEntity.ok().body(payment);
	}

	@PostMapping("/payments")
	public Payment createPayment(@Valid @RequestBody Payment payment) {
		return paymentRepository.save(payment);
	}

	@PutMapping("/payments/{id}")
	public ResponseEntity<Payment> updatePayment(@PathVariable(value = "id") Long paymentId,
			@Valid @RequestBody Payment paymentDetails) throws ResourceNotFoundException {
		final Payment updatedPayment = paymentRepository.save(paymentDetails);
		return ResponseEntity.ok(updatedPayment);
	}
	
	@GetMapping("/payments/all-payment/{id}")
	public ArrayList getAllPayment(@PathVariable(value = "id") String user_id) {
		
		String SQL = "SELECT payment, cust from payment payment, user cust WHERE user_id = payment_user_id";
		 Query q = entityManager.createQuery(SQL);
		 if(!user_id.equals("0")) {
			 System.out.print("User Id : "+user_id);

			 SQL = "SELECT payment, cust from payment payment, user cust WHERE user_id = payment_user_id AND user_id = :user_id";
			 q = entityManager.createQuery(SQL);
			 q.setParameter("user_id", user_id);
		 } 
		 List<Object[]> payment = q.getResultList();
		 ArrayList<HashMap<String, String>> resultArray = new ArrayList();
		 
		 for ( Object[] row : payment ) {
			  Payment payment_details = (Payment)row[ 0 ];
			  User user_details = (User)row[ 1 ];
			
			    HashMap<String, String> results = new HashMap();
			   
				results.put("user_name",user_details.getUser_first_name()+" "+user_details.getUser_last_name());
				results.put("payment_id",String.valueOf(payment_details.getPayment_id()));
				results.put("payment_amount",payment_details.getPayment_amount());
				results.put("payment_user_id",String.valueOf(payment_details.getPayment_user_id()));
				results.put("payment_date",payment_details.getPayment_date());
				
			    resultArray.add(results);
			 
		 }	 

        return resultArray;
	}

	@DeleteMapping("/payments/{id}")
	public Map<String, Boolean> deletePayment(@PathVariable(value = "id") Long paymentId)
			throws ResourceNotFoundException {
		Payment payment = paymentRepository.findById(paymentId)
				.orElseThrow(() -> new ResourceNotFoundException("Payment not found for this id :: " + paymentId));
		
		paymentRepository.delete(payment);
		
		
		Map<String, Boolean> response = new HashMap<>();
		response.put("deleted", Boolean.TRUE);
		return response;
	}
}
