package com.ts.util;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.Inet4Address;
import java.net.UnknownHostException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


public class CommonUtills {

	private final static Logger log = LoggerFactory.getLogger(CommonUtills.class);

	public static boolean uploadDocuments(byte[] getData, String filename, String folderPath) {
		boolean status=false;
		OutputStream os = null;
      //  String extension=".pdf";
      //  System.out.println("getData=="+getData);
		File relativePath = null;
		File absolutePath = null;
		if (folderPath != null) {
			relativePath = new File(getDrivePath() + folderPath);
			if (!relativePath.exists())
				relativePath.mkdirs();

     if (filename != null)
		absolutePath = new File(relativePath, filename);
		}
		try {
			if (absolutePath != null) {
				os = new FileOutputStream(absolutePath);

				if (getData.length > 0) {
					os.write(getData);
					os.flush();
					os.close();
					status=true;
				}
			}

		} catch (IOException e) {
			e.printStackTrace();
		}
		return status;
	}

	public static String getDrivePath() {
		String drivepath = null;
//		UAT
//		String eDrive = "E://UAT// ";
//		LIVE
		String eDrive = "E://";
		String dDrive = "D://";
		String cDrive = "C://";
		try {
			File efolder = new File(eDrive);
			File dfolder = new File(dDrive);
			
			if (efolder.exists()) {
				drivepath = eDrive;
			} else if (dfolder.exists()) {
				drivepath = dDrive;
			}else {
				drivepath = cDrive;
			}
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return drivepath;
	}
		
	public static String getSystemIp() throws UnknownHostException{
		return Inet4Address.getLocalHost().getHostAddress();
	}
}
