<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<#-- 新闻标题 -->
<h1>${title}</h1>
<p>
    新闻来源：${source} &nbsp; 发布时间：${pubTime?string("yyyy-MM-dd HH:mm")}
</p>
<#-- 新闻内容 -->
<p>
    ${content}
</p>