# 三星堆青铜神树 - 3D交互展示

本地预览版本，需要启动服务器运行。

## 快速启动

### 方法1：双击启动（推荐）
双击 `start.bat` 文件，会自动启动服务器并在浏览器中打开。

### 方法2：命令行启动
```bash
cd D:\qingshitree-3d
node server.js
```
然后在浏览器中打开：`http://localhost:8080`

## 文件说明
- `index.html` - 主页面（3D展示界面）
- `server.js` - 本地服务器脚本
- `start.bat` - Windows一键启动脚本
- `MODEL_URL` - 需要设置为你的模型CDN链接

## 注意事项
1. 模型文件 `qingshitree.glb` 需要通过CDN加载
2. 修改 `index.html` 中的 `MODEL_URL` 变量为实际模型地址
3. 或使用本地服务器时，将模型文件放在同一目录下

## 给老师演示
如果想要老师直接打开链接查看，需要：
1. 将模型上传到CDN（如GitHub Release、阿里云OSS等）
2. 修改 `index.html` 中的 `MODEL_URL`
3. 将整个文件夹推送到GitHub，开启GitHub Pages

## 技术支持
- Three.js 0.160.0
- 兼容现代浏览器（Chrome、Firefox、Edge、Safari）
