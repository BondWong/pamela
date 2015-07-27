package com.bond.pamela.system;

import java.io.IOException;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import com.bond.pamela.utils.AutoLoginHelper;
import com.bond.pamela.utils.RootPathUtil;

/**
 * Application Lifecycle Listener implementation class Initializer
 * 
 */
public class Initializer implements ServletContextListener {

	/**
	 * Default constructor.
	 */
	public Initializer() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see ServletContextListener#contextInitialized(ServletContextEvent)
	 */
	public void contextInitialized(ServletContextEvent servletContextEvent) {
		// TODO Auto-generated method stub
		RootPathUtil.init(servletContextEvent.getServletContext().getRealPath(
				"/"));
		try {
			AutoLoginHelper.initializeEnvironment();
			AutoLoginHelper.deserialize();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see ServletContextListener#contextDestroyed(ServletContextEvent)
	 */
	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
		try {
			AutoLoginHelper.serialize();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
