package showmessage;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import allmessage.allmessage;
import conndb.conndb;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class showmessage
 */
@WebServlet("/showmessage")
public class showmessage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public showmessage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/json; charset=utf-8,pageEncoding=UTF-8");
		PrintWriter out=response.getWriter();
		conndb conn=new conndb();
		JSONArray jsonarray =new JSONArray();
		JSONObject jsonObject=new JSONObject();
		ArrayList<allmessage> allnews=new ArrayList();
		allnews=conn.getnews();
		for(allmessage temp:allnews)
		{	
			jsonObject.put("name", temp.getName());
			String tsStr = "";
			DateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
			try {
				//方法一
				tsStr = sdf.format(temp.getTimestamp());
//				System.out.println(tsStr);
//				//方法二
//				tsStr = ts.toString();
//				System.out.println(tsStr);
			} catch (Exception e) {
				e.printStackTrace();
			}
			jsonObject.put("times", tsStr);
			jsonObject.put("messages", temp.getMessages());
			jsonarray.add(jsonObject);
		}
		out.print(jsonarray);
		out.flush();
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
