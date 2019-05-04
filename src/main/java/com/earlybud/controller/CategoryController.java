package com.earlybud.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Optional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.earlybud.category.service.CategoryService;
import com.earlybud.item.service.ItemService;
import com.earlybud.model.Category;
import com.earlybud.vo.CategoryVO;
import com.earlybud.vo.Criteria;
import com.earlybud.vo.PageVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class CategoryController {
	
	private CategoryService service;
	
	 @RequestMapping(value = {"category", "category/{catcode}"})
	public ModelAndView list(Model model, @PathVariable(value="catcode",required = false) String catcode) {	//리스트 가져오는 처리. 게시물 목록을 전달해야하므로 모델을 파라미터로 지정, 이를 통해 boardserviceimpl객체의 getList()결과를 담아 전달한다.(addAtrribute) 
		 
		PageVO paging = new PageVO();
		List<CategoryVO> itemList = null;
		paging.setCountPage(3);	//1+3개
		List<Category> cateList = service.cateListService();	//카테고리 코드+이름 리스트
		List<Long> categoryList = new ArrayList<Long>(); //카테고리번호만 담은 리스트. 조회범주.
		
		if(catcode == null || catcode.equals("0")) {	//카테고리코드가 0일때 ==전체조회	
			for(int i=0; i<cateList.size(); i++) {
				categoryList.add(cateList.get(i).getCAT_CODE());
			}
			catcode="0";
		}else {
			categoryList.add(Long.parseLong(catcode));
		}
		
		System.out.println("얼리버드-최초 catcode: "+catcode);
		System.out.println("얼리버드-최초 list_category: "+cateList);
		System.out.println("얼리버드-최초 first: "+(paging.getLast()+1));
		System.out.println("얼리버드-최초 order 인기순인 "+"CUR_SUM/TARGET_SUM desc");
		System.out.println("얼리버드-최초 end는 진행중 0");
		
//페이징
		HashMap<String, Object> catInfo = new HashMap<String, Object>();
		catInfo.put("categoryList", categoryList);	//게시물몇갠지 셀 범주
		int count = service.countItemService(catInfo); //전체몇갠지
		System.out.println("count: "+count);
		paging.cal(1, count);	//1~전체
		//한번에 로딩되는 아이템 갯수를 조정하고싶으면 paging.setCountPage(총 로딩시킬 갯수-1); 
		itemList = service.itemListService(paging);	
		
		
//리스팅	
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("categoryList", categoryList);
		map.put("first", paging.getFirst());
		map.put("last", paging.getLast());
		map.put("standard", "CUR_SUM/TARGET_SUM desc");//페이지 최초 로딩시 진행중/인기순으로 정렬		
		map.put("end_code", "0");	//success가 0 = 진행중	/ 1혹은2면 종료
		
		//map.put("standard", "OPENDATE desc");//얘는 최신순 정렬


		itemList = service.selectCategoryService(map); 
		System.out.println("얼리버드-최초 아이템리스트: "+itemList);

		ModelAndView mv = new ModelAndView("category/category", "list", itemList);
		mv.addObject("list_category", cateList); //전체 카테고리코드+이름담긴 리스트	
				
		mv.addObject("catcode", catcode);
		mv.addObject("first", paging.getLast()+1);//row번호
		mv.addObject("order", "CUR_SUM/TARGET_SUM desc");
		mv.addObject("end", "0");

		return mv;
		}
	
	 
	//  조건변경될때마다 실행되는것
	@RequestMapping(value = "category/update", method = RequestMethod.POST)
	@ResponseBody
	//public List<Product> listadd(@RequestBody PagingVo paging) {
		
	public List<CategoryVO> listupdate(@RequestBody Map<String, Object> params) {
			int first = (Integer) params.get("first");
			String catcode = (String) params.get("catcode");
			String order_code = (String) params.get("order_code");
			String end_code = (String)params.get("end_code");
			List<CategoryVO> itemList = null;
			int count = 0;
			
			System.out.println("얼리버드-업뎃 first는: "+first);
			System.out.println("얼리버드-업뎃  catcode는: "+catcode);
			System.out.println("얼리버드-업뎃  order_code는: "+order_code);
			System.out.println("얼리버드-업뎃  end_code는: "+end_code);
			
			List<Long> categoryList = new ArrayList<Long>();
			List<Category> cateList = service.cateListService();
			
			
			if(catcode==null || catcode.equals("0")){
				System.out.println("까");
				for(Category categoryOne:cateList) {//in 조건에 넣을 정보
					categoryList.add(categoryOne.getCAT_CODE());
				}
				System.out.println("꿍");
				catcode="0";
			}else {
				categoryList.add(Long.parseLong(catcode)); //in 조건에 넣을 정보
			}
							////////////////////
			HashMap<String, Object> map3 = new HashMap<String, Object>();
			map3.put("categoryList", categoryList);
			count = service.countItemService(map3);
			
			PageVO paging = new PageVO();
			paging.setFirst(first);
			paging.setTotalPage(count);
			paging.cal(1, count);
			System.out.println("---first"+paging.getFirst());
			System.out.println("---last"+paging.getLast());
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("catcode", catcode);
			map.put("first", paging.getFirst());
			map.put("last", paging.getLast());
			map.put("categoryList", categoryList);
			map.put("standard", order_code);
			map.put("end_code", end_code);
			itemList = service.selectCategoryService(map); 
			
			System.out.println("얼리버드-업뎃 반환될 first"+paging.getFirst());
			System.out.println("얼리버드-업뎃 반환될 last"+paging.getLast());			
			System.out.println("얼리버드-업뎃 아이템리스트는"+itemList);
			return itemList;	//기존코드의 date는 list.time임
		}
	 
	
//  ajax로 더보기 누를 때마다 목록 6개씩 추가하는 거
	@RequestMapping(value = "category/add", method = RequestMethod.POST)
	@ResponseBody
	public List<CategoryVO> listadd(@RequestBody Map<String, Object> params) {
		int first = (Integer) params.get("first");
		String catcode = (String) params.get("catcode");
		String order_code = (String)params.get("order_code");
		String end_code = (String)params.get("end_code");
		
		System.out.println("얼리버드-애드 first는: "+first);
		System.out.println("얼리버드-애드  catcode는: "+catcode);
		System.out.println("얼리버드-애드  order_code는: "+order_code);
		System.out.println("얼리버드-애드  end_code는: "+end_code);
		
			
		List<CategoryVO> itemList = null;
		List<Category> cateList = service.cateListService();
		List<Long> categoryList = new ArrayList<Long>();
		int count = 0;
		
		if(catcode==null || catcode.equals("0")) {
			for(Category categoryOne:cateList) {//in 조건에 넣을 정보
				categoryList.add(categoryOne.getCAT_CODE());
			}
			catcode="0";
		}else {
			categoryList.add(Long.parseLong(catcode)); //in 조건에 넣을 정보
		}
		
		HashMap<String, Object> map2 = new HashMap<String, Object>();
		map2.put("categoryList", categoryList);
		count = service.countItemService(map2);
		
		PageVO paging = new PageVO();
		paging.setFirst(first);
		paging.setTotalPage(count);
		paging.cal(paging.getFirst(), count);
		System.out.println("얼리버드-에드 first: "+paging.getFirst());
		System.out.println("얼리버드-에드 last: "+paging.getLast());
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("catcode", catcode);
		map.put("first", paging.getFirst());
		map.put("last", paging.getLast());
		map.put("PagingVO", paging);
		map.put("categoryList", categoryList);
		map.put("standard", order_code);
		map.put("end_code", end_code);
		itemList = service.selectCategoryService(map);			
		
		System.out.println("얼리버드-에드 아이템리스트는"+itemList);
		return itemList;
	}
	 
	
}
