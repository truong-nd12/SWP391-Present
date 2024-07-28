/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Filter.java to edit this template
 */
package Filter;

import Model.Admin;
import Model.Customer;
import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Dell
 */
@WebFilter(filterName = "NewFilter", urlPatterns = {"/*"})
public class NewFilter implements Filter {

    private static final boolean debug = true;

    // The filter configuration object we are associated with.  If
    // this value is null, this filter instance is not currently
    // configured. 
    private FilterConfig filterConfig = null;

    public NewFilter() {
    }

    private void doBeforeProcessing(ServletRequest request, ServletResponse response)
            throws IOException, ServletException {
        if (debug) {
            log("NewFilter:DoBeforeProcessing");
        }

        // Write code here to process the request and/or response before
        // the rest of the filter chain is invoked.
        // For example, a logging filter might log items on the request object,
        // such as the parameters.
        /*
	for (Enumeration en = request.getParameterNames(); en.hasMoreElements(); ) {
	    String name = (String)en.nextElement();
	    String values[] = request.getParameterValues(name);
	    int n = values.length;
	    StringBuffer buf = new StringBuffer();
	    buf.append(name);
	    buf.append("=");
	    for(int i=0; i < n; i++) {
	        buf.append(values[i]);
	        if (i < n-1)
	            buf.append(",");
	    }
	    log(buf.toString());
	}
         */
    }

    private void doAfterProcessing(ServletRequest request, ServletResponse response)
            throws IOException, ServletException {
        if (debug) {
            log("NewFilter:DoAfterProcessing");
        }

        // Write code here to process the request and/or response after
        // the rest of the filter chain is invoked.
        // For example, a logging filter might log the attributes on the
        // request object after the request has been processed. 
        /*
	for (Enumeration en = request.getAttributeNames(); en.hasMoreElements(); ) {
	    String name = (String)en.nextElement();
	    Object value = request.getAttribute(name);
	    log("attribute: " + name + "=" + value.toString());

	}
         */
        // For example, a filter might append something to the response.
        /*
	PrintWriter respOut = new PrintWriter(response.getWriter());
	respOut.println("<P><B>This has been appended by an intrusive filter.</B>");
         */
    }

    /**
     *
     * @param request The servlet request we are processing
     * @param response The servlet response we are creating
     * @param chain The filter chain we are processing
     *
     * @exception IOException if an input/output error occurs
     * @exception ServletException if a servlet error occurs
     */
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession ses = req.getSession();
        String url = req.getRequestURI();
        Customer cus = null;
        Admin ad = null;
        try {
            cus = (Customer) ses.getAttribute("acc");
        } catch (Exception e) {
        }
        try {
            ad = (Admin) ses.getAttribute("acc");
        } catch (Exception e) {
        }
        if (url.contains(".jpg") || url.contains(".png") || url.contains("js") || url.contains("fonts") || url.contains("css")) {
            chain.doFilter(request, response);
            return;
        }
        if (url.contains("HomePage") || url.contains("Product") || url.contains("ProductDetail") || url.contains("Blog") || url.contains("NewDetail") || url.contains("About") ||url.contains("image") || url.contains("Log") || url.contains("Servlet")) {
            chain.doFilter(request, response);
        } else {
            if (cus != null) {
                if (url.contains("/OrderPage") || url.contains("/OrderDetail") || url.contains("/CartPage") || url.contains("/CheckOut") || url.contains("/Profile") || url.contains("/SendGuarantee") || url.contains("/UploadImages") || url.contains("/Guarantee")|| url.contains("image") || url.contains("/DetailGuarranteeUser")|| url.contains("/sendFeedBack") || url.contains("ay")) {
                    chain.doFilter(request, response);
                } else {
                    ses.removeAttribute("acc");
                    res.sendRedirect(req.getContextPath() + "/LogOut");
                }
            } else {
                if (ad != null) {
                    if (ad.getRole_id() == 1) {
                        if (url.contains("/OrderPage") || url.contains("/OrderDetail") || url.contains("/CartPage") || url.contains("/CheckOut") || url.contains("/Profile") || url.contains("/SendGuarantee") || url.contains("/UploadImages") || url.contains("/Guarantee") || url.contains("/DetailGuarranteeUser")|| url.contains("/sendFeedBack")|| url.contains("image") || url.contains("ay")) {
                            ses.removeAttribute("acc");
                            res.sendRedirect(req.getContextPath() + "/LogOut");
                        } else {
                            chain.doFilter(request, response);
                        }
                    } else {
                        if (url.contains("/OrderPage") || url.contains("Account") || url.contains("AdminPage") || url.contains("/OrderDetail") || url.contains("/CartPage") || url.contains("/CheckOut") || url.contains("/Profile") || url.contains("/SendGuarantee") || url.contains("/sendFeedBack")|| url.contains("/UploadImages") || url.contains("/Guarantee") || url.contains("/DetailGuarranteeUser")|| url.contains("image") || url.contains("ay")) {
                            ses.removeAttribute("acc");
                            res.sendRedirect(req.getContextPath() + "/LogOut");
                        } else {
                            chain.doFilter(request, response);
                        }
                    }
                } else {
                    ses.removeAttribute("acc");
                    res.sendRedirect(req.getContextPath() + "/LogOut");
                }
            }
        }
    }

    /**
     * Return the filter configuration object for this filter.
     */
    public FilterConfig getFilterConfig() {
        return (this.filterConfig);
    }

    /**
     * Set the filter configuration object for this filter.
     *
     * @param filterConfig The filter configuration object
     */
    public void setFilterConfig(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
    }

    /**
     * Destroy method for this filter
     */
    public void destroy() {
    }

    /**
     * Init method for this filter
     */
    public void init(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
        if (filterConfig != null) {
            if (debug) {
                log("NewFilter:Initializing filter");
            }
        }
    }

    /**
     * Return a String representation of this object.
     */
    @Override
    public String toString() {
        if (filterConfig == null) {
            return ("NewFilter()");
        }
        StringBuffer sb = new StringBuffer("NewFilter(");
        sb.append(filterConfig);
        sb.append(")");
        return (sb.toString());
    }

    private void sendProcessingError(Throwable t, ServletResponse response) {
        String stackTrace = getStackTrace(t);

        if (stackTrace != null && !stackTrace.equals("")) {
            try {
                response.setContentType("text/html");
                PrintStream ps = new PrintStream(response.getOutputStream());
                PrintWriter pw = new PrintWriter(ps);
                pw.print("<html>\n<head>\n<title>Error</title>\n</head>\n<body>\n"); //NOI18N

                // PENDING! Localize this for next official release
                pw.print("<h1>The resource did not process correctly</h1>\n<pre>\n");
                pw.print(stackTrace);
                pw.print("</pre></body>\n</html>"); //NOI18N
                pw.close();
                ps.close();
                response.getOutputStream().close();
            } catch (Exception ex) {
            }
        } else {
            try {
                PrintStream ps = new PrintStream(response.getOutputStream());
                t.printStackTrace(ps);
                ps.close();
                response.getOutputStream().close();
            } catch (Exception ex) {
            }
        }
    }

    public static String getStackTrace(Throwable t) {
        String stackTrace = null;
        try {
            StringWriter sw = new StringWriter();
            PrintWriter pw = new PrintWriter(sw);
            t.printStackTrace(pw);
            pw.close();
            sw.close();
            stackTrace = sw.getBuffer().toString();
        } catch (Exception ex) {
        }
        return stackTrace;
    }

    public void log(String msg) {
        filterConfig.getServletContext().log(msg);
    }

}
