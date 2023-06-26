package com.library.common;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspWriter;

public class JSPFunction {

	public JSPFunction() {
		
	}

	/**
	 * 알림창으로 메세지 띄우고 url 페이지로 이동
	 * @param msg
	 * @param url
	 * @param out
	 */
	public static void alertLocation(String msg, String url, JspWriter out) {
		try {
				String script = "<script>"
						+ " alert('" + msg + "');"
						+ " location.href='"+ url + "';"
						+ "</script>";
				
			out.print(script);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 알림창으로 메세지 띄우고 이전 페이지로 이동
	 * @param msg
	 * @param out
	 */
	public static void alertBack(String msg, JspWriter out) {
		try {
			String script = "<script>"
					+ " alert('" + msg + "');"
					+ " history.go(-1);"
					+ "</script>";
			
			out.print(script);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	/**
	 * 알림창으로 메세지 띄우고 이전 페이지로 이동 - 서블릿에서 사용
	 * @param msg
	 * @param resp
	 */
	public static void alertBack(String msg, HttpServletResponse resp) {
		resp.setContentType("text/html;charset=utf-8");
		try {
			String script =  "<script>"
					+ " alert('" + msg + "');"
					+ " history.back();"
					+ "</script>";
			
			PrintWriter writer = resp.getWriter();			
			writer.print(script);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	/**
	 * 알림창으로 메세지 띄우고 url 페이지로 이동 - 서블릿에서 사용
	 * @param msg
	 * @param url
	 * @param resp
	 */
	public static void alertLocation(String msg, String url, HttpServletResponse resp) {
		resp.setContentType("text/html;charset=utf-8");
		try {
			String script =  "<script>"
					+ " alert('" + msg + "');"
					+ " location.href='"+ url + "';"
					+ "</script>";
			
			PrintWriter writer = resp.getWriter();
			writer.print(script);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
}
