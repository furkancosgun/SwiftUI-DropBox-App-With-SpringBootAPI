package com.furkancosgun.DropBox.Services;

import com.furkancosgun.DropBox.Entites.File;
import com.furkancosgun.DropBox.Repositories.FileRepository;
import com.furkancosgun.DropBox.Response.FileResponse;
import com.furkancosgun.DropBox.Utilties.FileUtil;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class FileService {
    private String filesPath = "http://localhost:8080/api/files/";
    @Autowired
    private FileRepository fileRepository;
    @Autowired
    private UserSevice userSevice;

    public FileResponse uploadFile(MultipartFile fileData,long userId) throws IOException {

        //File Entity
        File file = File.builder()
                .name(fileData.getOriginalFilename())
                .type(fileData.getContentType())
                .fileData(FileUtil.compressFile(fileData.getBytes()))
                .user(userSevice.getUserInfo(userId)).build();

        //File Saved To DB
        fileRepository.save(file);

        return FileResponse.builder()
                .fileUrl(filesPath+file.getId())
                .name(file.getName())
                .type(file.getType())
                .build();
    }

/*
    @Transactional
    public File getInfoByFileByName(String name) {
        Optional<File> dbFile = fileRepository.findByName(name);

        return File.builder()
                .id(dbFile.get().getId())
                .name(dbFile.get().getName())
                .type(dbFile.get().getType())
                .fileData(FileUtil.decompressFile(dbFile.get().getFileData())).build();
    }



    @Transactional
    public byte[] getFileByName(String name) {
        Optional<File> dbFile = fileRepository.findByName(name);
        return  FileUtil.decompressFile(dbFile.get().getFileData());
    }

    */

public File getInfoByFileId(Long id) {
    Optional<File> dbFile = fileRepository.findById(id);
    return File.builder()
            .id(dbFile.get().getId())
            .name(dbFile.get().getName())
            .type(dbFile.get().getType())
            .fileData(FileUtil.decompressFile(dbFile.get().getFileData())).build();
}
    @Transactional
    public byte[] getFileById(Long id) {
        Optional<File> dbFile = fileRepository.findById(id);
        return  FileUtil.decompressFile(dbFile.get().getFileData());
    }


    /*
    @Transactional
    public List<File> getAllFiles(){
        return  fileRepository.findAll();
    }

    @Transactional
    public FileResponse getFileInfoById(long id){
        File file =  fileRepository.findById(id).orElseThrow();
        return  FileResponse.builder().id(file.getId()).name(file.getName()).type(file.getType()).build();
    }
*/
    @Transactional
    public List<FileResponse> getFilesByUserId(long id) {

        return fileRepository
                .findByUserId(id)
                .stream()
                .map(file -> FileResponse.builder()
                        .id(file.getId())
                                .fileUrl(filesPath+file.getId())
                        .type(file.getType())
                        .name(file.getName()).build()
                        ).collect(Collectors.toList());
    }
}
