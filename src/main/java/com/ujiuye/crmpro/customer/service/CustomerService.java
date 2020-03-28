package com.ujiuye.crmpro.customer.service;

import com.ujiuye.crmpro.customer.pojo.Customer;

import java.util.List;

public interface CustomerService {

    List<Customer> list(int type, String keyword);

    Customer getById(int id);

    int save(Customer customer);

    int update(Customer customer);

    int remove(List<Integer> ids);
}
