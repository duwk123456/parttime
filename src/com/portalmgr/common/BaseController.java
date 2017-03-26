package com.portalmgr.common;

import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;


/**
 * 基础控制层
 * @author duwk
 * @date： 日期：2016-11-17 时间：下午4:19:55
 */
public abstract class BaseController  extends MultiActionController  {
	 


	protected void download(HttpServletResponse response, String fileUri) throws IOException {
		String fullFilePath = SysProUtil.getProperty("attach.path")  + File.separator + fileUri;
		File imageFile = new File(fullFilePath);
		if (!imageFile.exists()||imageFile.isDirectory()) {
			return;
		}
		response.reset();
		ServletOutputStream os = response.getOutputStream();
		response.setContentType("text/html;charset=utf-8");
		response.setHeader("Content-Disposition", "attachment; filename=" + URLEncoder.encode(fileUri.substring(fileUri.lastIndexOf(File.separator) + 1, fileUri.length()), "utf-8"));
		BufferedInputStream fis = null;
		try {
			fis = new BufferedInputStream(new FileInputStream(imageFile));
			byte[] b = new byte[2048];
			int i = -1;
			while ((i = fis.read(b)) != -1) {
				os.write(b, 0, i);
			}
		} catch (Exception e) {
			System.out.println("下载文件出错,fileFullPath:" + fileUri);
		} finally {
			try {
				fis.close();
				response.flushBuffer();
				os.flush();
				os.close();
			} catch (Exception e) {
				System.out.println("关闭流失败fileFullPath:" + fileUri);
			}
		}
	}
}
