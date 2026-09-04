package com.jun.controller;

import freemarker.template.*;
import freemarker.template.Template;
import freemarker.template.TemplateException;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class FM02 {
    public static void main(String[] args) throws IOException, TemplateException {
        // 实例化模板配置对象
        Configuration configuration = new Configuration();
        // 设置加载模板的上下文 以及 设置加载模板路径（模板存放的路径）
        configuration.setDirectoryForTemplateLoading(new File("F:\\myProject\\JavaEE\\FMDemo01\\src\\main\\resources"));
        // 设置模板的编码格式
        configuration.setDefaultEncoding("UTF-8");
        // 加载模板文件，获取模板对象
        Template template = configuration.getTemplate("fm.ftl");

        // 设置模型数据 ：此处就是模拟数据库中的数据，实际开发中这个数据应该从数据库中查询
        Map<String,Object> map = new HashMap<>();
        map.put("title", "特别就业季：稳就业情况如何? 哪些问题待解?");
        map.put("source", "人民日报");
        map.put("pubTime", new Date());
        map.put("content", "中共中央政治局常务委员会近日召开会议强调，" +
                "要有针对性地开展援企、稳岗、扩就业工作，" +
                "做好高校毕业生、农民工等重点群体就业工作，" +
                "积极帮助个体工商户纾困。疫情期间，稳就业情况如何？还有哪些问题待解？" +
                "记者采访了不同群体，记录这个特别的就业季。");


        // 设置页面存放的目录
        File htmlFile = new File("F:/myProject/JavaEE/FMDemo01/src/main/resources/");

        // 获取文件名（随机生成不重复的文件名）
        String fileName = System.currentTimeMillis() + ".html";
        // 创建html文件
        File file = new File(htmlFile, fileName);
        // 获取文件输出流
        FileWriter writer = new FileWriter(file);

        // 输出html  将模型数据填充到模板中
        template.process(map, writer);
        // 输出成功
        System.out.println("新闻创建成功！");
    }
}
