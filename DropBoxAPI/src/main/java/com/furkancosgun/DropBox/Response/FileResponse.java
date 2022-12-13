package com.furkancosgun.DropBox.Response;

import jakarta.persistence.Lob;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class FileResponse {
    long id;
    String name;
    String type;
    String fileUrl;
}
