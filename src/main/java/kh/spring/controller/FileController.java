package kh.spring.controller;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.spring.service.FilesService;



@Controller
@RequestMapping("/files/")
public class FileController {

	
	@Autowired
	
	public FilesService service;
	
	@Autowired
	private HttpSession session;
	
	@RequestMapping("downLoad")
	public void download(HttpServletResponse response, String oriName, String sysName) throws Exception {
		
		String realPath = session.getServletContext().getRealPath("upload"); 
		//file 위치 경로를 획득
		
		File target = new File(realPath+"/"+sysName);
		//sysName 과 결합하여 대상 파일 객체 생성.
		

		try(DataInputStream dis = new DataInputStream(new FileInputStream(target));
				// 대상 파일에 대한 inputStream 개방
				
				DataOutputStream dos= new DataOutputStream(response.getOutputStream());){
			
		
		byte[] fileContents = new byte[(int)target.length()];
		// 대상 파일 적재할 메모리 공간 확보
		
		dis.readFully(fileContents);
		//대상 파일 로딩
		oriName = new String(oriName.getBytes(),"ISO-8859-1");
		
		 response.reset();
         response.setHeader("Content-Disposition", "attachment;filename=" + oriName);

		
		
		dos.write(fileContents);
		dos.flush();
		
		}
		
		
		
	}

}
