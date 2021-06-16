package com.cognizant.ecommerce.service;

import java.util.ArrayList;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestTemplate;

import com.congnizant.ecommerce.model.CartRequestDto;
import com.congnizant.ecommerce.model.CartResponseDto;
import com.congnizant.ecommerce.model.CustomerWishListDTO;
import com.congnizant.ecommerce.model.CustomerWishListRequestDTO;
import com.congnizant.ecommerce.model.JwtRequest;
import com.congnizant.ecommerce.model.JwtResponse;
import com.congnizant.ecommerce.model.Product;
import com.congnizant.ecommerce.model.StatusDTO;

@Service
public class ECommerceService {

	@Autowired
	RestTemplate restTemplate;
	@Value("${api-server.uri}")
	private String uri;
	HttpHeaders headers = new HttpHeaders();

	HttpEntity<String> entity = new HttpEntity<>(headers);

	JwtResponse jwtResponse;

	private static final Logger log = LoggerFactory.getLogger(ECommerceService.class);

	public JwtResponse authticate(JwtRequest authenticationRequest, HttpServletResponse response)
			throws HttpClientErrorException {
		ResponseEntity<JwtResponse> responseEntity = restTemplate.postForEntity(uri + "/authenticate",
				authenticationRequest, JwtResponse.class);
		this.jwtResponse = responseEntity.getBody();
		this.jwtResponse.setJwttoken("Bearer " + jwtResponse.getJwttoken());
		response.setHeader("Authorization", jwtResponse.getJwttoken());
		response.addHeader("customerId", String.valueOf(jwtResponse.getCustomerId()));
		return this.jwtResponse;
	}

	public List<Product> getAllProducts() throws HttpClientErrorException {
		List<Product> list = new ArrayList<>();
		try {
			headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
			headers.set("Authorization", jwtResponse.getJwttoken());
			entity = new HttpEntity<>(headers);
			
			ResponseEntity<List<Product>> reponseEntity = restTemplate.exchange(uri + "/product/getAll", HttpMethod.GET,
					entity, new ParameterizedTypeReference<List<Product>>() {
					});
			list = reponseEntity.getBody();
			
		} catch (Exception e) {
			throw new HttpClientErrorException(HttpStatus.BAD_REQUEST, e.getMessage());
		}
		return list;
	}

	public List<Product> searchByName(String name) {
		String nameTemp = name.toLowerCase();
		nameTemp = nameTemp.substring(0, 1).toUpperCase() + nameTemp.substring(1);
		ResponseEntity<Product> responseEntity = restTemplate.exchange(uri + "/product/productByName/" + nameTemp,
				HttpMethod.GET, entity, new ParameterizedTypeReference<Product>() {
				});
		Product product = responseEntity.getBody();
		List<Product> list = new ArrayList<>();
		list.add(product);
		return list;
	}

	public StatusDTO addToCart(CartRequestDto request) {

		StatusDTO status = new StatusDTO();
		String s = "";
		try {
			request.setCustomerId(jwtResponse.getCustomerId());
			HttpEntity<CartRequestDto> entityTemp = new HttpEntity<>(request, headers);
			status = restTemplate.postForObject(uri + "/cart/addProductToCart", entityTemp, StatusDTO.class);

		} catch (Exception e) {
			throw new HttpClientErrorException(HttpStatus.BAD_REQUEST, e.getMessage());
		}
		if (status.getMessage().length() > 50) {
			s = status.getMessage();
			s = s.substring(7, s.length() - 1);
			status.setMessage(s);

		} else {
			s = "{\"message\":\"" + status.getMessage() + "\"}";
			status.setMessage(s);
		}

		return status;
	}

	public List<CartResponseDto> getCart() throws HttpClientErrorException {
		List<CartResponseDto> list = new ArrayList<>();
		try {
			headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
			headers.set("Authorization", jwtResponse.getJwttoken());
			entity = new HttpEntity<>(headers);
			ResponseEntity<List<CartResponseDto>> responseEntity = restTemplate.exchange(
					uri + "/cart/getCart/" + jwtResponse.getCustomerId(), HttpMethod.GET, entity,
					new ParameterizedTypeReference<List<CartResponseDto>>() {
					});
			list = responseEntity.getBody();
		} catch (Exception e) {
			throw new HttpClientErrorException(HttpStatus.BAD_REQUEST, e.getMessage());
		}
		return list;
	}

	public List<CustomerWishListDTO> getWishlist() {
		List<CustomerWishListDTO> list = new ArrayList<>();
		try {
			headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
			headers.set("Authorization", jwtResponse.getJwttoken());
			entity = new HttpEntity<>(headers);
			ResponseEntity<List<CustomerWishListDTO>> responseEntity = restTemplate.exchange(
					uri + "/cart/getWishlist/" + jwtResponse.getCustomerId(), HttpMethod.GET, entity,
					new ParameterizedTypeReference<List<CustomerWishListDTO>>() {
					});
			list = responseEntity.getBody();
		} catch (Exception e) {
			throw new HttpClientErrorException(HttpStatus.BAD_REQUEST, e.getMessage());
		}
		return list;
	}

	public StatusDTO addToCustomerWishList(CustomerWishListRequestDTO customerWishlist) {
		customerWishlist.setCustomerId(this.jwtResponse.getCustomerId());
		HttpEntity<CustomerWishListRequestDTO> entityTemp = new HttpEntity<>(customerWishlist, headers);
		return restTemplate.postForObject(uri + "/cart/addToCustomerWishlist", entityTemp, StatusDTO.class);
	}

	public Product setRating(int productId, int rating) {
		return restTemplate.postForObject(uri + "/product/addRating/" + productId + "/" + rating, entity,
				Product.class);
	}

	public void logout() {
		this.jwtResponse = null;

	}
}
