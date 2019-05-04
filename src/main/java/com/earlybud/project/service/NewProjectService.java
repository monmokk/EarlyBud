package com.earlybud.project.service;

import java.util.List;

import com.earlybud.model.Encore;
import com.earlybud.model.Item;
import com.earlybud.model.Seller;
import com.earlybud.model.Type;

public interface NewProjectService {
	public List<Item> sellerItem(String email);
	public Seller seller_select(String email);
	public Item item_select(long item_code);
	public Item item_select2(long item_code);
	public List<Type> selectType(long item_code);
	public int save(Item item);
	public int save2(Type type);
	public int modifyType(long item_code);
	public int update(Item item);
	public int update2(Seller seller);
	public int modifyItem(Item item);
	public int modifySeller(Seller seller);
	public List<Item> sellerEndItem(String email);
	public List<Item> sellerEncoreItem(String email);
	public List<Item> sellerEditItem(String email);
	public void applyItem(long item_code);
	public void insertEncoreItem(Item item);
	public void insertEncoreItem2(Item item);
	public void updateEncore(Encore encore);
}
