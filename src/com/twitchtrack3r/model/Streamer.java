package com.twitchtrack3r.model;

public class Streamer {
	private int id;
	private String name;
	private String online;
	private int subscribers;
	private int followers;
	private String category_id;
	
	

	public Streamer(int id, String name, String online, int subscribers, int followers, String category_id) {
		super();
		this.id = id;
		this.name = name;
		this.online = online;
		this.subscribers = subscribers;
		this.followers = followers;
		this.category_id = category_id;
	}
	
	

	public Streamer(String name, String online, int subscribers, int followers, String category_id) {
		super();
		this.name = name;
		this.online = online;
		this.subscribers = subscribers;
		this.followers = followers;
		this.category_id = category_id;
	}



	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getOnline() {
		return online;
	}

	public void setOnline(String online) {
		this.online = online;
	}

	public int getSubscribers() {
		return subscribers;
	}

	public void setSubscribers(int subscribers) {
		this.subscribers = subscribers;
	}

	public int getFollowers() {
		return followers;
	}

	public void setFollowers(int followers) {
		this.followers = followers;
	}

	public String getCategory_id() {
		return category_id;
	}

	public void setCategory_id(String category_id) {
		this.category_id = category_id;
	}

}
