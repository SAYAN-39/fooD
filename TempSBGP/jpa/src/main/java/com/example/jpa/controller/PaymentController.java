package com.example.jpa.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.ui.Model;
import com.example.jpa.model.Order;
import com.example.jpa.model.User;
import com.example.jpa.dao.OrderDao;

@Controller
public class PaymentController {

    @Value("${razorpay.key.id}")
    private String razorpaykeyid;

    @Autowired
    private OrderDao orderRepository;

    @PostMapping("/createOrder")
    public String createOrder(
            @RequestParam double amount,
            @RequestParam String name,
            @RequestParam String email,
            @RequestParam String contact,
            Model model) {

        int razorpayAmount = (int) Math.round(amount);
        model.addAttribute("key", razorpaykeyid);
        model.addAttribute("amount", razorpayAmount);
        model.addAttribute("custName", name);
        model.addAttribute("custEmail", email);
        model.addAttribute("custContact", contact);

        return "checkout";
    }

    @GetMapping("/orderSuccess")
    public String oderSuccess(
            @RequestParam String payment_id,
            @RequestParam(required = false) String name,
            @RequestParam(required = false) String email,
            @RequestParam(required = false) String contact,
            @RequestParam(required = false) Double amount,
            Model model) {

        try {
            // Check if this payment_id already exists in database
            if (orderRepository.existsByOrderID(payment_id)) {
                model.addAttribute("error", "This payment has already been processed");
                return "orderFailure";
            }

            // Save order to database if all required data is present
            if (name != null && email != null && contact != null && amount != null) {
                Order order = new Order();
                order.setName(name);
                order.setEmail(email);
                order.setPhone_Number(contact);
                order.setOrderID(payment_id);
                order.setPrice(amount);

                orderRepository.save(order);
            } else {
                model.addAttribute("error", "Missing order information");
                return "orderFailure";
            }

        } catch (Exception e) {
            System.err.println("Error saving order to database: " + e.getMessage());
            model.addAttribute("error", "Error processing order");
            return "orderFailure";
        }

        model.addAttribute("paymentId", payment_id);
        return "orderSuccess";
    }

    @GetMapping("/failure")
    public String orderFailure(
            @RequestParam(value = "error_code", required = false) String errorCode,
            @RequestParam(value = "error_description", required = false) String errorDescription,
            @RequestParam(value = "error_source", required = false) String errorSource,
            @RequestParam(value = "error_step", required = false) String errorStep,
            @RequestParam(value = "error_reason", required = false) String errorReason,
            @RequestParam(value = "reason", required = false) String reason,
            Model model) {

        model.addAttribute("errorCode", errorCode);
        model.addAttribute("errorDescription", errorDescription);
        model.addAttribute("errorSource", errorSource);
        model.addAttribute("errorStep", errorStep);
        model.addAttribute("errorReason", errorReason);
        model.addAttribute("reason", reason);

        return "orderFailure";
    }
    @GetMapping("/orderDash")
    public String index(Model model)
    {
    	List<Order>prod=orderRepository.findAll();
    	model.addAttribute("data",prod);
    	return "orderDash";
    }
}