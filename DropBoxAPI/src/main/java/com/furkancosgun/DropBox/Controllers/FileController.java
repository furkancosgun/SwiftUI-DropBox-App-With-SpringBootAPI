package com.furkancosgun.DropBox.Controllers;

import com.furkancosgun.DropBox.Entites.File;
import com.furkancosgun.DropBox.Response.FileResponse;
import com.furkancosgun.DropBox.Services.FileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/api/files")
public class FileController {

    @Autowired
    private FileService fileService;

    /*
    @GetMapping()
    public ResponseEntity<?> getAllFiles(){
        return ResponseEntity.status(HttpStatus.OK).body(fileService.getAllFiles());
    }
*/
    @PostMapping(value = "/upload/{userId}")
    public ResponseEntity<?> uploadFile(@PathVariable("userId") long id,@RequestParam("file") MultipartFile file) throws IOException {
        System.out.println("LOG://"+file);

        FileResponse response = fileService.uploadFile(file,id);
        return ResponseEntity.status(HttpStatus.OK)
                .body(response);
    }
    /*

    @GetMapping("/info/{name}")
    public ResponseEntity<?>  getFileInfoByName(@PathVariable("name") String name){
        File file = fileService.getInfoByFileByName(name);

        return ResponseEntity.status(HttpStatus.OK)
                .body(file);
    }
*/
    /*
    @GetMapping("/show/{name}")
    public ResponseEntity<?>  getFileByName(@PathVariable("name") String name){
        byte[] file = fileService.getFile(name);
        File fileInfo = fileService.getInfoByFileByName(name);

        return ResponseEntity.status(HttpStatus.OK)
                .contentType(MediaType.valueOf(fileInfo.getType()))
                .body(file);
    }

     */


    @GetMapping("/{id}")
    public ResponseEntity<?>  getFileById(@PathVariable("id") long id){
        byte[] file = fileService.getFileById(id);
        File fileInfo = fileService.getInfoByFileId(id);
        return ResponseEntity.status(HttpStatus.OK)
                .contentType(MediaType.valueOf(fileInfo.getType()))
                .body(file);
    }

/*
    @GetMapping("/images/{name}")
    public ResponseEntity<?>  getFileByName(@PathVariable("name") String name){
        byte[] file = fileService.getFileByName(name);
        File fileInfo = fileService.getInfoByFileByName(name);
        return ResponseEntity.status(HttpStatus.OK)
                .contentType(MediaType.valueOf(fileInfo.getType()))
                .body(file);
    }


*/


    //?userId={}
    @PostMapping()
    public ResponseEntity<?>  getFilesByUserId(@RequestParam long userId){
        List<FileResponse> files = fileService.getFilesByUserId(userId);

        return ResponseEntity.status(HttpStatus.OK)
                .body(files);
    }

    /*
    @GetMapping("/download/{name}")
    public ResponseEntity<?>  downloadFileByName(@PathVariable("name") String name) {
        byte[] file = fileService.getFile(name);
        File fileInfo = fileService.getInfoByFileByName(name);

        return ResponseEntity.status(HttpStatus.OK)
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + fileInfo.getName())
                .contentType(MediaType.valueOf(fileInfo.getType()))
                .body(file);
    }



     */


}
