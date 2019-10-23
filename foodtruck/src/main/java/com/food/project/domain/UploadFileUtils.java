package com.food.project.domain;

import java.awt.image.BufferedImage;
import java.io.File;
import java.util.ArrayList;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.springframework.util.FileCopyUtils;

import com.food.project.service.SellerService;

import lombok.AllArgsConstructor;

@AllArgsConstructor
public class UploadFileUtils {
	
	
	public static String uploadFile(String uploadPath, String originalName, byte[] fileData,FoodTruckVO vo) throws Exception {

    	// UUID 발급
        UUID uuid = UUID.randomUUID();
        // 저장할 파일명 = UUID + 원본이름
        String savedName = uuid.toString() + "_" + originalName;
        // 업로드할 디렉토리 폴더(이메일) 생성
        String savedPath = vo.getEmail();  //calcPath(uploadPath,email);
        makeDir(uploadPath, savedPath);
        
        // 파일 경로(기존의 업로드경로+이메일), 파일명을 받아 파일 객체 생성
        File target = new File(uploadPath + savedPath, savedName);
        // 임시 디렉토리에 업로드된 파일을 지정된 디렉토리로 복사
        FileCopyUtils.copy(fileData, target); //
        // 썸네일을 생성하기 위한 파일의 확장자 검사
        // 파일명이 aaa.bbb.ccc.jpg일 경우 마지막 마침표를 찾기 위해
        String formatName = originalName.substring(originalName.lastIndexOf(".")+1);
        String uploadedFileName = null;
        // 이미지 파일은 썸네일 사용
        if (MediaUtils.getMediaType(formatName) != null) { //이미지가 널이아닐때 즉 파일이아니고 이미지일때 썸네일 생성
            // 썸네일 생성
            uploadedFileName = makeThumbnail(uploadPath, savedPath, savedName);
            System.out.println("썸네일");
            
        // 나머지는 아이콘
        } else {
            // 아이콘 생성
            uploadedFileName = makeIcon(uploadPath, savedPath, savedName);
            System.out.println("아이콘");
        }
        
        return uploadedFileName;
    }


    // 디렉토리 생성
    private static void makeDir(String uploadPath, String datePath) {
        // 디렉토리가 존재하면
    	File dir = new File(uploadPath+datePath);
    	if (dir.isDirectory()){
            return;
        }
    	else {
                dir.mkdir(); //디렉토리 생성
            }
        
    }    

    // 썸네일 생성
    private static String makeThumbnail(String uploadPath, String path, String fileName) throws Exception {
        // 이미지를 읽기 위한 버퍼
        BufferedImage sourceImg = ImageIO.read(new File(uploadPath + path, fileName));
        // 100픽셀 단위의 썸네일 생성
        BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 100);
        // 썸네일의 이름을 생성(원본파일명에 's_'를 붙임)
        String thumbnailName = uploadPath + path + File.separator + "s_" + fileName;
        File newFile = new File(thumbnailName);
        String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
        // 썸네일 생성
        ImageIO.write(destImg, formatName.toUpperCase(), newFile);
        // 썸네일의 이름을 리턴함
       // .substring(uploadPath.length()).replace(File.separatorChar, '/')
        return thumbnailName.substring(uploadPath.length());
    }

    // 아이콘 생성
    private static String makeIcon(String uploadPath, String path, String fileName) throws Exception {
        // 아이콘의 이름
        String iconName = uploadPath + path + File.separator + fileName;
        // 아이콘 이름을 리턴
        // File.separatorChar : 디렉토리 구분자
        // 윈도우 \ , 유닉스(리눅스) /         
        return iconName.substring(uploadPath.length()).replace(File.separatorChar, '/');
    }
    
}