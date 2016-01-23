package service;
import java.util.List;

import dao.NewsDao;
import model.News;

public class NewsListService {
	private NewsDao newsDao;

	public NewsDao getNewsDao() {
		return newsDao;
	}

	public void setNewsDao(NewsDao newsDao) {
		this.newsDao = newsDao;
	}
	
	public List<News> getNewsList(String database, int beginid){
		return newsDao.getNewsList(database,beginid);
	}
	
	public int getPage(String database, int beginid, int sizeeachpage){
		int count = newsDao.getCountLessThanThisID(database, beginid);
		if(count%sizeeachpage!=0)return count/sizeeachpage+1;
		else return count/sizeeachpage;
	}
}
