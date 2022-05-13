package com;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ConnectionRequest;
	
	/**
	 * Servlet implementation class ConnectionRequestAPI
	 */
	@WebServlet("/ConnectionRequestAPI")
	public class ConnectionRequestAPI extends HttpServlet {
		private static final long serialVersionUID = 1L;
		
		
		ConnectionRequest connectionRequestObj = new ConnectionRequest();
		
	    /**
	     * @see HttpServlet#HttpServlet()
	     * 
	     */
	    public ConnectionRequestAPI() {
	        super();
	        // TODO Auto-generated constructor stub
	    }

		/**
		 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
		 */
	    private static Map getParasMap(HttpServletRequest request) {
			Map<String, String> map = new HashMap<String, String>();
			try {
				Scanner scanner = new Scanner(request.getInputStream(), "UTF-8");
				String queryString = scanner.hasNext() ? scanner.useDelimiter("\\A").next() : "";
				scanner.close();
				String[] params = queryString.split("&");
				for (String param : params) {
					String[] p = param.split("=");
					map.put(p[0], p[1]);
				}
			} catch (Exception e) {
			}
			return map;
		}
	    
	    
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			// TODO Auto-generated method stub
			response.getWriter().append("Served at: ").append(request.getContextPath());
		}

		/**
		 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
		 */
		protected void doPost(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			// TODO Auto-generated method stub
			String output = connectionRequestObj.insertConnRequest(
					request.getParameter("nicNo"),
					request.getParameter("firstName"),
					request.getParameter("lastName"),
					request.getParameter("address"), 
					request.getParameter("tpNo"));
			       		        
			response.getWriter().write(output);
		}

		
		
		

		/**
		 * @see HttpServlet#doPut(HttpServletRequest, HttpServletResponse)
		 */
		protected void doPut(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			// TODO Auto-generated method stub
			Map paras = getParasMap(request);
			String output = connectionRequestObj.updateConnRequest(
					paras.get("hidConnReqIdSave").toString(),
					paras.get("nicNo").toString(),
					paras.get("firstName").toString(),
					paras.get("lastName").toString(),
					paras.get("address").toString(),
					paras.get("tpNo").toString());
			        
			response.getWriter().write(output);
		}
		
		/**
		 * @see HttpServlet#doDelete(HttpServletRequest, HttpServletResponse)
		 */
		protected void doDelete(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			// TODO Auto-generated method stub
			Map paras = getParasMap(request);
			String output = connectionRequestObj.deleteConnRequest(paras.get("connReqId").toString());
			response.getWriter().write(output);
		}

}
