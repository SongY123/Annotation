package action.mark;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.Map;

import javax.websocket.Session;

import org.apache.commons.dbcp.BasicDataSource;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import Label.ConnectLabelDB;
import Label.LabelItem;
import model.News;
import net.sf.json.JSONObject;
import service.FindNewsService;


public class IncidentAction extends ActionSupport implements Action{
	private ConnectLabelDB connectLabelDB;
	private FindNewsService findNewsService;
	private String dbname;
	private String newsid;
	private JSONObject jo;

	public ConnectLabelDB getConnectLabelDB() {
		return connectLabelDB;
	}

	public void setConnectLabelDB(ConnectLabelDB connectLabelDB) {
		this.connectLabelDB = connectLabelDB;
	}

	public FindNewsService getFindNewsService() {
		return findNewsService;
	}

	public void setFindNewsService(FindNewsService findNewsService) {
		this.findNewsService = findNewsService;
	}

	public String getDbname() {
		return dbname;
	}

	public void setDbname(String dbname) {
		this.dbname = dbname;
	}

	public String getNewsid() {
		return newsid;
	}

	public void setNewsid(String newsid) {
		this.newsid = newsid;
	}

	public JSONObject getJo() {
		return jo;
	}

	public void setJo(JSONObject jo) {
		this.jo = jo;
	}
	
	public void initJSONObject(){
		String rootPath;
		try {
			rootPath = this.getClass().getResource("").toURI().getPath();
			File f = new File(rootPath+"incidentdata.json");
		    InputStreamReader fis = new InputStreamReader(new FileInputStream(f),"UTF-8");
		    BufferedReader br = new BufferedReader(fis);
		    String result = "";
		    String line = null;
		    while((line=br.readLine())!=null){
		    	result+=line;
		    }
		    jo = JSONObject.fromObject(result);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public String execute() throws Exception {
		News news = findNewsService.findNewsById(dbname, newsid);
		ActionContext actionContext = ActionContext.getContext();
	    Map session = actionContext.getSession();
	    String title = news.getTitle();
	    String context = Byte.toString(news.getContent()[0]);
	    session.put("title",title);
	    session.put("context",null);
		LabelItem label = connectLabelDB.GetLabelByNewsID(news.getId(), dbname);
	    //System.out.println(label.eventType);
	    //System.out.println(label.sourceActor);
	    //System.out.println(label.triggerWord);
	    //System.out.println(label.targetActor);
	    //System.out.println(label.eventTime);
	    //System.out.println(label.eventLocation);
	    //System.out.println(jo.get(Integer.toString(label.eventType)));
	    if(label!=null){
	    	if(label.ifEvent==false)
	    		session.put("incident", jo.get("21"));
	    	else
	    		session.put("incident", jo.get(Integer.toString(label.eventType)));
	    	session.put("sponsor",label.sourceActor);
	    	session.put("triggerWord",label.triggerWord);
	    	session.put("bearer",label.targetActor);
	    	session.put("time",label.eventTime);
	    	session.put("location",label.eventLocation);
	    }
	    else{
	    	session.put("incident", null);
	    	session.put("sponsor",null);
	    	session.put("triggerWord",null);
	    	session.put("bearer",null);
	    	session.put("time",null);
	    	session.put("location",null);
	    }
		return this.SUCCESS;
	}
}
