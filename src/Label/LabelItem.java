package Label;
/*
Created on 2015��10��19�� ����10:40:20

@author: GreatShang
*/

public class LabelItem 
{
	/*
	 * ��ע����
	 * */
	public String labelID;			//���ݿ��и�����ע��ID
	
	public String newsSource;		//������Դ
	public String newsID;			//����ID
	public String newsTitle;		//���ű���
	public String newsContent;		//��������
	
	public boolean ifEvent = false;	//�Ƿ��¼����
	public int eventType = -1;		//�¼����ͣ�1-20��
	
	public String sourceActor;		//�¼�������
	public String targetActor;		//�¼�������
	public String triggerWord;		//�¼�������
	
	public String eventTime;		//�¼�����ʱ��
	public String eventLocation;	//�¼������ص�
	
	public LabelItem(String labelID,String newsSource,String newsID,String newsTitle)
	{
		//���¼��޹����ű����ע���캯��
		this.newsSource = newsSource;
		this.labelID = labelID;
		this.ifEvent = false;
		this.newsID = newsID;
		this.newsTitle = newsTitle;
	}
	
	public LabelItem(String labelID,String newsSource,String newsID,String newsTitle,
			int eventType,String sourceActor,String targetActor,String triggerWord,
			String eventTime,String eventLocation)
	{
		//�¼��й����ű����ע���캯��
		this.newsSource = newsSource;
		this.labelID = labelID;
		this.ifEvent = true;
		this.newsID = newsID;
		this.newsTitle = newsTitle;
		
		this.eventType = eventType;
		this.sourceActor = sourceActor;
		this.targetActor = targetActor;
		this.triggerWord = triggerWord;
		this.eventTime = eventTime;
		this.eventLocation = eventLocation;
	}
	public String toString()
	{
		return this.labelID+this.newsSource+" "+this.newsID+" " +this.newsTitle;
	}
	
}
