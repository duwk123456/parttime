
package com.portalmgr.common;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Random;






public class IdentityServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;


	private Color getRandColor(int fc, int bc) {// 缁欏畾鑼冨洿鑾峰緱闅忔満棰滆壊
		Random random = new Random();
		if (fc > 255)
			fc = 255;
		if (bc > 255)
			bc = 255;
		int r = fc + random.nextInt(bc - fc);
		int g = fc + random.nextInt(bc - fc);
		int b = fc + random.nextInt(bc - fc);
		return new Color(r, g, b);
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);  
		
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 楂樺害鍙傛暟 榛樿20
		String h = request.getParameter("height");
		int height = 20;
		if (h != null && h.trim().length() > 0) {
			height = Integer.parseInt(h);
		}
		// 瀹藉甫鍙傛暟 榛樿60
		String w = request.getParameter("width");
		int width = 60;
		if (w != null && w.trim().length() > 0) {
			width = Integer.parseInt(w);
		}
		// 闀垮害鍙傛暟 榛樿4
		String l = request.getParameter("length");
		int length = 4;
		if (l != null && l.trim().length() > 0) {
			length = Integer.parseInt(l);
		}
		
		// 璁剧疆椤甸潰涓嶇紦瀛�
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
		
		BufferedImage image = new BufferedImage(width, height,
				BufferedImage.TYPE_INT_RGB);

		Graphics g = image.getGraphics();
		Random random = new Random();

		g.setColor(getRandColor(200, 250));
		g.fillRect(0, 0, width, height);

		g.setFont(new Font("Times New Roman", Font.PLAIN, 18));

		g.setColor(getRandColor(160, 200));
		for (int i = 0; i < 155; i++) {
			int x = random.nextInt(width);
			int y = random.nextInt(height);
			int xl = random.nextInt(10);
			int yl = random.nextInt(10);
			g.drawLine(x, y, x + xl, y + yl);
		}

		char c[] = new char[62];

		for (int i = 97, j = 0; i < 123; i++, j++) {
			c[j] = (char) i;
		}
		for (int o = 65, p = 26; o < 91; o++, p++) {
			c[p] = (char) o;
		}
		for (int m = 48, n = 52; m < 58; m++, n++) {
			c[n] = (char) m;
		}
		String sRand = "";
		for (int i = 0; i < 4; i++) {
			int x = random.nextInt(62);
			String rand = String.valueOf(c[x]);
			sRand += rand;

			g.setColor(new Color(20 + random.nextInt(110), 20 + random
			.nextInt(110), 20 + random.nextInt(110)));
			g.drawString(rand, 13 * i + 6, 16);
		}
		
		// 灏嗚璇佺爜瀛樺叆SESSION
		request.getSession().setAttribute(ClientConstantPool.VALID_CODE_SESSION_KEY, sRand);
		g.dispose();
		ImageIO.setUseCache(true);
		OutputStream out =  response.getOutputStream();
		ImageIO.write(image, "JPEG", out);
	
	}



}
