package com.earlybud.controller;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.concurrent.TimeUnit;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.earlybud.model.Encore;
import com.earlybud.model.Item;
import com.earlybud.model.Seller;
import com.earlybud.model.Type;
import com.earlybud.project.service.NewProjectService;
import com.earlybud.security.CustomUserDetailsService;

@Controller
@RequestMapping("/newproject/*")
public class NewProjectController {
	
	@Autowired
	CustomUserDetailsService service;
	@Autowired
	NewProjectService projectS;
	
	String projectPath="C:\\Users\\hb6009\\git\\Earlybud\\Earlybud\\src\\main\\webapp\\resources\\uploads\\reward";
	
	DateFormat date_format = new SimpleDateFormat("yyyy-MM-dd");
	@RequestMapping("newproject")
	public String newProject(Model model) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String email = authentication.getName();
		System.out.println("새로운 프로젝트 접속자: "+service.userDetail(email));
		model.addAttribute("user", service.userDetail(email));
		return "newProject/newproject";
	}
	@RequestMapping("newprojectDetail1")
	public String newProjectDetail1(Seller seller) throws IOException{
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String email = authentication.getName();
		if(projectS.seller_select(email) != null) {
			System.out.println("갑니다 숑숑: "+ projectS.seller_select(email));
			return "newProject/newprojectDetail2";
			}
		System.out.println("1st page email: "+email);
		return "newProject/newprojectDetail1";
	}
	@RequestMapping("newprojectDetail2")
	public String newprojectDetail2(@RequestParam("image") MultipartFile image, @RequestParam("info") String info,
			@RequestParam("seller_loc") String seller_loc, @RequestParam("seller_account") String seller_account) throws IOException{
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String email = authentication.getName();
		System.out.println("1st page email: "+email);
		Seller seller = new Seller();
		String originFullName= image.getOriginalFilename();
		String saveName = originFullName;
		if(originFullName != "") {
			originFullName = originFullName.trim();
			if(originFullName.length() != 0) {
				if(new File(profilePath,originFullName).exists()) {
					int idx = originFullName.lastIndexOf(".");
					String fName = originFullName.substring(0,idx);
					String fExt = originFullName.substring(idx+1);
					
					saveName = fName+"_"+System.currentTimeMillis()+"."+fExt;
				}
			}
			System.out.println("save file name:"+saveName);
			try {
				image.transferTo(new File(profilePath,saveName));
			}catch(Exception e) {
				
			}
			seller.setImage(saveName);
		}else {
		}
		System.out.println("프로젝트 생성 p1: " + info + ", " + seller_loc + ", " + seller_account);
		
		seller.setEmail(email);
		seller.setInfo(info);
		seller.setSeller_loc(seller_loc);
		seller.setSeller_account(seller_account);
		projectS.update2(seller);
		
		return "newProject/newprojectDetail2";
	}
	@RequestMapping("newprojectDetail3")
	public String newProjectDetail3(Model model, @RequestParam("cat_code") long cat_code, @RequestParam("opendate") String opendate, 
			@RequestParam("closingdate") String closingdate, @RequestParam("title") String title, 
			@RequestParam("main_image") MultipartFile main_image) throws ParseException, IOException{
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String email = authentication.getName();
		System.out.println("3rd page email: "+email);
		String originFullName= main_image.getOriginalFilename();
		Item item = new Item();
		String saveName = originFullName;
		if(originFullName != "") {
			originFullName = originFullName.trim();
			if(originFullName.length() != 0) {
				if(new File(projectPath,originFullName).exists()) {
					int idx = originFullName.lastIndexOf(".");
					String fName = originFullName.substring(0,idx);
					String fExt = originFullName.substring(idx+1);
					
					saveName = fName+"_"+System.currentTimeMillis()+"."+fExt;
				}
			}
			System.out.println("save file name:"+saveName);
			try {
				main_image.transferTo(new File(projectPath,saveName));
			}catch(Exception e) {
			}
			item.setMain_image(saveName);
		}else {
		}
		Date startDate = new  SimpleDateFormat("yyyy-MM-dd").parse(opendate);
		Date endDate = new  SimpleDateFormat("yyyy-MM-dd").parse(closingdate);
		java.sql.Date openDate = new java.sql.Date(startDate.getTime());
		java.sql.Date closingDate = new java.sql.Date(endDate.getTime() + TimeUnit.DAYS.toMillis( 1 ));
		item.setEmail(email);
		item.setCat_code(cat_code);
		item.setTitle(title);
		item.setOpendate(openDate);
		item.setClosingdate(closingDate);
		System.out.println("프로젝트 생성 p2: "+item);
		projectS.save(item);
		long item_code = item.getItem_code();
		model.addAttribute("seller", projectS.item_select2(item_code));
		
		return "newProject/newprojectDetail3";
	}
	@RequestMapping("newprojectCheck")
	public String newProjectCheck(@RequestParam long item_code, @RequestParam("target_sum") long target_sum, @RequestParam String summary,
			@RequestParam long[] type_code, @RequestParam String[] name, @RequestParam String[] info,@RequestParam String content){
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String email = authentication.getName();
		Item item = new Item();
		item.setItem_code(item_code);
		item.setEmail(email);
		item.setItem_code(item_code);
		item.setTarget_sum(target_sum);
		item.setSummary(summary);
		item.setContent(content);
		projectS.update(item);
		Type type = new Type();
		type.setItem_code(item_code);
		for(int i=0; i<type_code.length; i++) {
			System.out.println(type_code[i]+", " +name[i]+", "+info[i]);
			type.setPrice(type_code[i]);
			type.setName(name[i]);
			type.setInfo(info[i]);
			projectS.save2(type);
		}
		System.out.println("저장완료");
		return "redirect:../mypage/sellerPage";
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////////// 프로젝트 수정
	@RequestMapping("newprojectModify1")
	public String newProjectModify1(Model model	) throws IOException{
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String email = authentication.getName();
		model.addAttribute("seller", projectS.seller_select(email));
		System.out.println(projectS.seller_select(email));
		return "newProject/newprojectM1";
	}
	
	String profilePath = "C:\\Users\\hb6009\\git\\Earlybud\\Earlybud\\src\\main\\webapp\\resources\\uploads\\member\\profile";
	
	@RequestMapping("sellerModify")
	public String sellerModify(Model model, @RequestParam("image") MultipartFile image, @RequestParam("info") String info,
			@RequestParam("seller_loc") String seller_loc, @RequestParam("seller_account") String seller_account, @RequestParam("image_name") String image_name) throws IOException{
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

		String email = authentication.getName();
		Seller seller = new Seller();
		String originFullName= image.getOriginalFilename();
		String saveName = originFullName;
		if(originFullName != "") {
			originFullName = originFullName.trim();
			if(originFullName.length() != 0) {
				if(new File(profilePath,originFullName).exists()) {
					int idx = originFullName.lastIndexOf(".");
					String fName = originFullName.substring(0,idx);
					String fExt = originFullName.substring(idx+1);
					
					saveName = fName+"_"+System.currentTimeMillis()+"."+fExt;
				}
			}
			System.out.println("save file name:"+saveName);
			try {
				image.transferTo(new File(profilePath,saveName));
			}catch(Exception e) {
			}
			seller.setImage(saveName);
		}else {
			seller.setImage(image_name);
		}
		//long size = image.getSize();
		//String contentType = image.getContentType();
		//byte[] fileContents = image.getBytes();		

		seller.setEmail(email);
		seller.setInfo(info);
		seller.setSeller_loc(seller_loc);
		seller.setSeller_account(seller_account);
		System.out.println("셀러 info: " +seller.getInfo());
		System.out.println("셀러 수정: " +seller);
		projectS.modifySeller(seller);
		//model.addAttribute("seller", projectS.seller_select(email));
		return "redirect:../mypage/sellerPage";
	}
	@RequestMapping(value="newprojectModify2/{item_code}")
	public String newprojectModify2(@PathVariable long item_code, Model model) throws IOException{
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String email = authentication.getName();
		System.out.println("1st page email: "+email);
		model.addAttribute("seller", projectS.item_select(item_code));
		return "newProject/newprojectM2";
	}
	@RequestMapping("newprojectModify3")
	public String newProjectModify3(@RequestParam long item_code, Model model, @RequestParam String image_name, @RequestParam long cat_code, @RequestParam String title, @RequestParam MultipartFile main_image,
			@RequestParam String opendate, @RequestParam String closingdate, Type type) throws ParseException, IOException{
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String email = authentication.getName();
		System.out.println("3rd page email: "+email);
		String originFullName= main_image.getOriginalFilename();
		Item item = new Item();
		String saveName = originFullName;
		if(originFullName != "") {
			originFullName = originFullName.trim();
			if(originFullName.length() != 0) {
				if(new File(projectPath,originFullName).exists()) {
					int idx = originFullName.lastIndexOf(".");
					String fName = originFullName.substring(0,idx);
					String fExt = originFullName.substring(idx+1);
					
					saveName = fName+"_"+System.currentTimeMillis()+"."+fExt;
				}
			}
			System.out.println("save file name:"+saveName);
			try {
				main_image.transferTo(new File(projectPath,saveName));
			}catch(Exception e) {
			}
			item.setMain_image(saveName);
		}else {
			item.setMain_image(image_name);
		}
		Date startDate = new  SimpleDateFormat("yyyy-MM-dd").parse(opendate);
		Date endDate = new  SimpleDateFormat("yyyy-MM-dd").parse(closingdate);
		java.sql.Date openDate = new java.sql.Date(startDate.getTime());
		java.sql.Date closingDate = new java.sql.Date(endDate.getTime() + TimeUnit.DAYS.toMillis( 1 ));
		
		item.setItem_code(item_code);
		item.setCat_code(cat_code);
		item.setTitle(title);
		item.setOpendate(openDate);
		item.setClosingdate(closingDate);
		System.out.println("프로젝트 생성 p2: "+item);
		projectS.modifyItem(item);
		System.out.println(projectS.item_select2(item.getItem_code()));
		long itemcode = item.getItem_code();
		model.addAttribute("seller", projectS.item_select2(itemcode));
		System.out.println(projectS.selectType(itemcode));
		model.addAttribute("type", projectS.selectType(itemcode));
		
		return "newProject/newprojectM3";
	}
	@RequestMapping("newprojectModifyCheck")
	public String newProjectModifyCheck(@RequestParam long item_code, @RequestParam long target_sum, @RequestParam String summary,
			@RequestParam long[] type_code, @RequestParam String[] name, @RequestParam String[] info, @RequestParam String content){
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String email = authentication.getName();
		Item item = new Item();
		item.setItem_code(item_code);
		item.setEmail(email);
		item.setTarget_sum(target_sum);
		item.setSummary(summary);
		item.setContent(content);
		projectS.update(item);
		Type type = new Type();
		projectS.modifyType(item_code);
		System.out.println(type_code.length);
		type.setItem_code(item_code);
		for(int i=0; i<type_code.length; i++) {
			System.out.println(type_code[i]+name[i]+info[i]);
			type.setPrice(type_code[i]);
			type.setName(name[i]);
			type.setInfo(info[i]);
			projectS.save2(type);
		}
		System.out.println("아이템코드? " + item.getItem_code());
		System.out.println("저장완료");
		return "redirect:../mypage/sellerPage";
	}
	@RequestMapping("applyItem/{item_code}")
	public String applyItem(@PathVariable long item_code) {
		projectS.applyItem(item_code);
		System.out.println("apply item to admin completed. admincall : 0");
		return "redirect:../../mypage/sellerPage";
	}
	@RequestMapping(value="encoreprojectModify2/{item_code}")
	public String encoreprojectModify2(@PathVariable long item_code, Model model) throws IOException{
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String email = authentication.getName();
		System.out.println("1st page email: "+email);
		model.addAttribute("seller", projectS.item_select(item_code));
		return "newProject/encoreprojectM2";
	}
	@RequestMapping("encoreprojectModify3")
	public String encoreProjectModify3(@RequestParam long item_code, Model model, @RequestParam String image_name, @RequestParam long cat_code, @RequestParam String title, @RequestParam MultipartFile main_image,
			@RequestParam String opendate, @RequestParam String closingdate, Type type) throws ParseException, IOException{
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String email = authentication.getName();
		System.out.println("3rd page email: "+email);
		String originFullName= main_image.getOriginalFilename();
		Item item = new Item();
		String saveName = originFullName;
		if(originFullName != "") {
			originFullName = originFullName.trim();
			if(originFullName.length() != 0) {
				if(new File(projectPath,originFullName).exists()) {
					int idx = originFullName.lastIndexOf(".");
					String fName = originFullName.substring(0,idx);
					String fExt = originFullName.substring(idx+1);
					
					saveName = fName+"_"+System.currentTimeMillis()+"."+fExt;
				}
			}
			System.out.println("save file name:"+saveName);
			try {
				main_image.transferTo(new File(projectPath,saveName));
			}catch(Exception e) {
			}
			item.setMain_image(saveName);
		}else {
			item.setMain_image(image_name);
		}
		Date startDate = new  SimpleDateFormat("yyyy-MM-dd").parse(opendate);
		Date endDate = new  SimpleDateFormat("yyyy-MM-dd").parse(closingdate);
		java.sql.Date openDate = new java.sql.Date(startDate.getTime());
		java.sql.Date closingDate = new java.sql.Date(endDate.getTime() + TimeUnit.DAYS.toMillis( 1 ));
		
		item.setEmail(email);
		item.setCat_code(cat_code);
		item.setTitle("앵콜! "+title);
		item.setOpendate(openDate);
		item.setClosingdate(closingDate);
		System.out.println("프로젝트 생성 p2: "+item);
		projectS.insertEncoreItem(item);//-------------------------------------------------
		//System.out.println(projectS.item_select2(item.getItem_code()));
		//long itemcode = item.getItem_code();
		System.out.println("new item code: "+item.getItem_code());
		model.addAttribute("seller", projectS.item_select2(item_code));
		//System.out.println(projectS.selectType(item_code));
		model.addAttribute("new_item_code",item.getItem_code());
		model.addAttribute("type", projectS.selectType(item_code));
		
		return "newProject/encoreprojectM3";
	}
	@RequestMapping("encoreprojectModifyCheck")
	public String encoreProjectModifyCheck(@RequestParam long item_code, @RequestParam long target_sum, 
			@RequestParam String summary, @RequestParam String[] type_code, @RequestParam String[] name, 
			@RequestParam String[] info, @RequestParam String content, @RequestParam long new_item_code){
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String email = authentication.getName();
		System.out.println("encore project modify IN");
		Item item = new Item();
		item.setItem_code(new_item_code);
		item.setEmail(email);
		item.setTarget_sum(target_sum);
		item.setSummary(summary);
		item.setContent(content);
		projectS.update(item);
		Type type = new Type();
		//projectS.modifyType(item_code);
		//System.out.println(type_code.length);
		type.setItem_code(new_item_code);
		for(int i=0; i<type_code.length; i++) {
			System.out.println(type_code[i]+name[i]+info[i]);
			type.setPrice(Integer.parseInt(type_code[i]));
			type.setName(name[i]);
			type.setInfo(info[i]);
			projectS.save2(type);
		}
		System.out.println("아이템코드? " + item.getItem_code());
		System.out.println("저장완료");
		
		Encore encore = new Encore();
		encore.setItem_code(item_code);
		encore.setNewitem_code(new_item_code);
		
		projectS.updateEncore(encore);
		return "redirect:../mypage/sellerPage";
	}
}
