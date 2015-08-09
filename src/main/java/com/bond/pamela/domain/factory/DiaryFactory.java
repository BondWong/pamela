package com.bond.pamela.domain.factory;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.imageio.ImageIO;

import org.apache.commons.codec.binary.Base64;

import net.coobird.thumbnailator.Thumbnails;

import com.bond.pamela.domain.Diary;
import com.bond.pamela.domain.valueObject.Image;
import com.bond.pamela.utils.RootPathUtil;

public class DiaryFactory implements DomainFactory {
	private DiaryFactory() {

	}

	public static DiaryFactory getInstance() {
		return new DiaryFactory();
	}

	@Override
	public Object create(Map<String, Object> parameters) {
		// TODO Auto-generated method stub
		String title = (String) parameters.get("title");
		String weather = (String) parameters.get("weather");
		String mood = (String) parameters.get("mood");
		String htmlContent = (String) parameters.get("htmlContent");
		List<Image> images = new ArrayList<>();

		Date date = new Date();
		String dateStr = new SimpleDateFormat("yyyy-MM-dd").format(date);

		// find images
		Pattern pattern = Pattern.compile("src=\"([A-Za-z0-9:/;,=\\+]*)\"");
		Matcher m = pattern.matcher(htmlContent);
		int count = 1;
		while (m.find()) {
			try {
				File dir = new File(RootPathUtil.instance.getRoot()
						+ "/images/uploadedFile");
				if (!dir.exists()) {
					dir.mkdir();
				}

				String encoddedData = m.group(1);
				String mine = encoddedData.substring(
						encoddedData.indexOf("data:image/")
								+ "data:image/".length(),
						encoddedData.indexOf(";base64"));
				byte data[] = Base64.decodeBase64(encoddedData.substring(encoddedData
						.indexOf("base64,") + "base64,".length()));
				BufferedImage bufferedImage = ImageIO
						.read(new ByteArrayInputStream(data));
				String imageName = title + "-" + dateStr + "-" + mood + "-"
						+ count + "." + mine;
				imageName = imageName.replaceAll(" ", "_");
				File imageFile = new File(RootPathUtil.instance.getRoot()
						+ "/images/uploadedFile/" + imageName);
				ImageIO.write(bufferedImage, mine, imageFile);

				Image image = new Image(bufferedImage.getWidth(),
						bufferedImage.getHeight(), imageName, imageName);

				BufferedImage thumbnail = null;
				if (bufferedImage.getHeight() > 450
						&& bufferedImage.getWidth() > 600) {
					if (bufferedImage.getWidth() * 1.0
							/ bufferedImage.getHeight() > 600.0 / 450) {
						int newWidth = Math
								.round(bufferedImage.getWidth() * (float) 1.0
										/ bufferedImage.getHeight() * 450);
						thumbnail = Thumbnails.of(bufferedImage)
								.size(newWidth, 450).asBufferedImage()
								.getSubimage((newWidth - 600) / 2, 0, 600, 450);
					} else if (bufferedImage.getWidth() * 1.0
							/ bufferedImage.getHeight() < 600.0 / 450) {
						int newHeight = Math.round(bufferedImage.getHeight()
								* (float) 1.0 / bufferedImage.getWidth() * 600);
						thumbnail = Thumbnails
								.of(bufferedImage)
								.size(600, newHeight)
								.asBufferedImage()
								.getSubimage(0, (newHeight - 450) / 2, 600, 450);
					}
				} else if (bufferedImage.getHeight() >= 450
						&& bufferedImage.getWidth() < 600) {
					int newWidth = Math.round(bufferedImage.getWidth()
							* (float) 1.0 / bufferedImage.getHeight() * 450);
					thumbnail = Thumbnails.of(bufferedImage)
							.size(newWidth, 450).asBufferedImage();
				} else if (bufferedImage.getHeight() < 450
						&& bufferedImage.getWidth() >= 600) {
					int newHeight = Math.round(bufferedImage.getHeight()
							* (float) 1.0 / bufferedImage.getWidth() * 600);
					thumbnail = Thumbnails.of(bufferedImage)
							.size(600, newHeight).asBufferedImage();
				} else {
					thumbnail = bufferedImage;
				}

				File imageThumbnailFile = new File(
						RootPathUtil.instance.getRoot()
								+ "/images/uploadedFile/" + "thumbnail-"
								+ imageName);
				ImageIO.write(thumbnail, mine, imageThumbnailFile);

				Image thumbnailImage = new Image(thumbnail.getWidth(),
						thumbnail.getHeight(), "thumbnail-" + imageName,
						imageName);

				images.add(image);
				images.add(thumbnailImage);
				count++;

			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		Diary diary = new Diary();

		diary.setDate(new Date());
		diary.setTitle(title);
		diary.setWeather(weather);
		diary.setMood(mood);
		diary.setHtmlContent(htmlContent);
		diary.setImages(images);

		return diary;
	}
}
