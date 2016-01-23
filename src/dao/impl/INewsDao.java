package dao.impl;
import java.util.List;

import model.News;
public interface INewsDao  {  
	public News findNewsById(String id,String database); 
    public News findNewsBytitle(String title,String database);
    public News findNews(String database);
    public List<News> getNewsList(String database,int beginid);
} 