package test;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork2.ActionSupport;

import javafx.util.Pair;
import net.sf.json.JSONObject;

public class test{
public static void main(String[]args){
	String a = "��˾� �� �� ɳ�� 3 ����  �й� �ɽ� �� �� ��֤ DF 21 �� ��ĸ";
	String[]result = a.split("\\s+");
	String []result2 = a.split("\\s");
	for (int i = 0;i<result.length;i++)
		System.out.println(result[i]);
	for (int i = 0;i<result2.length;i++)
		System.out.println(result2[i]);
	System.out.println(result.length);
	System.out.println(result2.length);
}
}