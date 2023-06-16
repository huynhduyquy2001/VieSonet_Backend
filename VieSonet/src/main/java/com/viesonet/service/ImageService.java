package com.viesonet.service;

import net.coobird.thumbnailator.Thumbnails;

import java.io.File;
import java.io.IOException;

public class ImageService {
    public static void compressImage(String inputPath, String outputPath, double quality) {
        try {
            // Load ảnh gốc từ đường dẫn đầu vào
            File inputFile = new File(inputPath);

            // Giảm dung lượng ảnh và lưu vào đường dẫn đầu ra
            Thumbnails.of(inputFile)
                    .scale(1.0)
                    .outputQuality(quality)
                    .toFile(outputPath);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
