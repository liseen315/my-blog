# my-blog

基于hugo 的个人blog

# 使用

```bash
cd themes
git clone git@github.com:liseen315/bilberry-hugo-theme.git
```

# 预览

```bash
hugo server -D
```

# 编辑脚本

```bash
bash new.sh name contentType

contentType: [article,audio,code,gallery,link,page,quote,video] // 默认是article
```

# 发布

```bash
hugo // 生成静态页
bash deploy.sh 推送到githubpage
```
