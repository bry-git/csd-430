package tags;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import javax.servlet.jsp.tagext.*;
import javax.servlet.jsp.*;
import java.io.*;

public class TableTag extends SimpleTagSupport {
	public void doTag() throws JspException, IOException {
		JspWriter out = getJspContext().getOut();
		out.write("<table border='1'>");
    	out.write("<tr>");
        out.write("<th>Stadium</th>");
        out.write("<th>School</th>");
        out.write("<th>City</th>");
        out.write("<th>State</th>");
        out.write("<th>Year Stadium Opened</th>");
        out.write("<th>Seating Capacity</th>");
        out.write("<th>Largest Crowd Opponent</th>");
        out.write("<th>Largest Crowd Year</th>");
        out.write("<th>Largest Crowd Size</th>");
        out.write("</tr>");
	}
}