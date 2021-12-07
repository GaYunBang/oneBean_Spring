package com.ezen.utils;

import java.io.File;
import java.util.Calendar;
import java.util.UUID;

import org.springframework.util.FileCopyUtils;

import net.coobird.thumbnailator.Thumbnails;

public class UploadFileUtils {
	//static final int THUMB_WIDTH = 300;
	//static final int THUMB_HEIGHT = 300;

	public static String productImageUpload(String uploadPath, String fileName, byte[] fileData, String yearPath)
			throws Exception {

		UUID uid = UUID.randomUUID();

		String newProductImageFileName = uid + fileName;
		String imgPath = uploadPath + yearPath + "/product";
		
		makeDir(uploadPath + yearPath , "/product");

		
		File target = new File(imgPath, newProductImageFileName);
		FileCopyUtils.copy(fileData, target);

		//File productImage = new File(imgPath + File.separator + "Product" + File.separator + newProductImageFileName);


		return newProductImageFileName;
	}
	
	public static String productDetailImageUpload(String uploadPath, String fileName, byte[] fileData, String yearPath)
			throws Exception {

		UUID uid = UUID.randomUUID();

		String newProductDetailImageFileName = uid + fileName;
		String imgPath = uploadPath + yearPath + "/detail";
		makeDir(uploadPath + yearPath , "/detail");  

		File target = new File(imgPath, newProductDetailImageFileName);
		FileCopyUtils.copy(fileData, target);

		/*
		File thumbImage = new File(imgPath + File.separator + "ProductDetail" + File.separator + newThumbFileName);

		if(!thumbImage.exists())
			thumbImage.mkdir();
		*/
		return newProductDetailImageFileName;
	}
	public static String eventImageUpload(String uploadPath, String fileName, byte[] fileData, String yearPath)
			throws Exception {
		String imgPath = uploadPath + yearPath + "/event";
		makeDir(uploadPath + yearPath , "/event");  

		File target = new File(imgPath, fileName);
		FileCopyUtils.copy(fileData, target);
		return fileName;
	}
	
	/*
	public static String fileUpload(String uploadPath, String fileName, byte[] fileData, String ymdPath)
			throws Exception {

		UUID uid = UUID.randomUUID();

		String newFileName = uid + "_" + fileName;
		String imgPath = uploadPath + ymdPath;

		File target = new File(imgPath, newFileName);
		FileCopyUtils.copy(fileData, target);

		//String thumbFileName = "s_" + newFileName;
		File image = new File(imgPath + File.separator + newFileName);

		File thumbnail = new File(imgPath + File.separator + "s" + File.separator + thumbFileName);

		if (image.exists()) {
			thumbnail.getParentFile().mkdirs();
			Thumbnails.of(image).size(THUMB_WIDTH, THUMB_HEIGHT).toFile(thumbnail);
		}
		return newFileName;
	}
*/
	
	/*
	public static String productCalcPath(String uploadPath) {
		Calendar cal = Calendar.getInstance();
		String yearPath = File.separator + cal.get(Calendar.YEAR);
		//String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		//String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));

		//makeDir(uploadPath, yearPath);
		makeDir(uploadPath, yearPath + "product");

		return yearPath;
	}
	*/
	public static String calcPath(String uploadPath) {
		Calendar cal = Calendar.getInstance();
		String yearPath = File.separator + cal.get(Calendar.YEAR);
		//String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		//String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));

		//makeDir(uploadPath, yearPath + "product");
		//makeDir(uploadPath, yearPath + "detail");
		
		makeDir(uploadPath, yearPath);

		return yearPath;
	}

	private static void makeDir(String uploadPath, String... paths) {

		if (new File(paths[paths.length - 1]).exists()) {
			return;
		}

		for (String path : paths) {
			File dirPath = new File(uploadPath + path);

			if (!dirPath.exists()) {
				dirPath.mkdir();
			}
		}
	}
}
