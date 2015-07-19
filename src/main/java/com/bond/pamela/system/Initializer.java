package com.bond.pamela.system;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

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
	}

	/**
	 * @see ServletContextListener#contextDestroyed(ServletContextEvent)
	 */
	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
	}

}
