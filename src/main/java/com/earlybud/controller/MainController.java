package com.earlybud.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.earlybud.category.service.CategoryService;
import com.earlybud.vo.MainVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class MainController {
	
	private CategoryService service;
		
	@RequestMapping(value = {"main", "/"})
	 public ModelAndView MainList(Model model) {	//리스트 가져오는 처리. 게시물 목록을 전달해야하므로 모델을 파라미터로 지정, 이를 통해 boardserviceimpl객체의 getList()결과를 담아 전달한다.(addAtrribute) 
		 
	/*탑텐*/	
	HashMap<String, Object> map1 = new HashMap<String, Object>();
	map1.put("end_code", "0");
	map1.put("date_info", "opendate<sysdate");
	map1.put("standard", "CUR_SUM/TARGET_SUM desc");		
	List<MainVO> topList = service.getMainList(map1);
	
	/*신규오픈*/	
	HashMap<String, Object> map2 = new HashMap<String, Object>();
	map2.put("end_code", "0");
	map2.put("date_info", "opendate<sysdate");
	map2.put("standard", "OPENDATE desc");	
	List<MainVO> newList = service.getMainList(map2);
	
	/*마감임박*/
	HashMap<String, Object> map3 = new HashMap<String, Object>();
	map3.put("end_code", "0");
	map3.put("date_info", "opendate<sysdate");
	map3.put("standard", "CLOSINGDATE");	
	List<MainVO> deadLineList = service.getMainList(map3);
	
	/*오픈예정*/
	HashMap<String, Object> map4 = new HashMap<String, Object>();
	map4.put("date_info", "opendate>sysdate");
	map4.put("standard", "OPENDATE");	
	List<MainVO> beOpenList = service.getMainOpenList(map4);
	
	/*종료*/
	HashMap<String, Object> map5 = new HashMap<String, Object>();
	map5.put("end_code", "1,2");
	map5.put("date_info", "opendate<sysdate");
	map5.put("standard", "CUR_SUM/TARGET_SUM desc");	
	List<MainVO> endList = service.getMainList(map5);
	
	/*랜덤배너*/
	List<MainVO> randomList = service.getRandomList();

	/*좋아요랭킹*/
	List<Long> ranList = new ArrayList<Long>();	
	List<MainVO> openRankingList = new ArrayList<MainVO>();
	List<MainVO> rankNumList = service.getOpenRankNumService();
	for(int i=0; i<rankNumList.size(); i++) {
		ranList.add(rankNumList.get(i).getITEM_CODE());
	}	
	System.out.println("좋아요랭킹리스트는 "+ranList);
	if(ranList.size() != 0) {
		HashMap<String, Object> rankInfo = new HashMap<String, Object>();
		rankInfo.put("ranList", ranList);
		openRankingList = service.getRankListService(rankInfo);
		System.out.println("openRankingList은 " + openRankingList);
	}
	/*리워드랭킹*/	
	List<Long> ranList2 = new ArrayList<Long>();	
	List<MainVO> rewardRankingList = new ArrayList<MainVO>();	
	List<MainVO> rankNumList2 = service.getRewardRankNumService();
	for(int i=0; i<rankNumList2.size(); i++) {
		ranList2.add(rankNumList2.get(i).getITEM_CODE());
	}		
	System.out.println("리워드랭킹리스트는 "+ranList2);
	if(ranList2.size() != 0) {
		HashMap<String, Object> rankInfo2 = new HashMap<String, Object>();
		rankInfo2.put("ranList", ranList2);	
		rewardRankingList = service.getRankListService(rankInfo2);
		System.out.println("rewardRankingList은 " + rewardRankingList);
	}
	////
		
	ModelAndView mv = new ModelAndView("earlybud", "topList", topList);
	mv.addObject("newList", newList); //전체 카테고리코드+이름담긴 리스트	
	mv.addObject("deadLineList", deadLineList);
	mv.addObject("beOpenList", beOpenList);
	mv.addObject("endList", endList);
	mv.addObject("randomList", randomList);
	mv.addObject("openRankingList", openRankingList);
	mv.addObject("rewardRankingList", rewardRankingList);
	
	System.out.println("topList는 "+topList);
	System.out.println("newList는 "+newList);
	System.out.println("deadList는 "+deadLineList);
	System.out.println("beOpenList는 "+beOpenList);
	System.out.println("endList는 "+endList);
	return mv;
	 }
	
	
	@RequestMapping(value = "about")
	 public String About(Model model) {
		
		return "aboutus/aboutus"; 
		
	}
}
