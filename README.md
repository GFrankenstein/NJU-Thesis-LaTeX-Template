NJU-Thesis-LaTeX-Template
=========================
A LaTeX template for Nanjing University

一个南京大学本科毕业论文 LaTeX 模板
===================================
在 caozengle 的基础上修改的一个模板，写了全新的文档，然后放在 Github 上作一个分发。也可参见 Google Code [项目主页](http://code.google.com/p/njubachelor/)。

注意事项——编译环境的准备
============

要想使用本模板，首先需要在你的计算机上安装一个 LaTeX 系统。关于其的一个简单介绍可以参考[维基百科](http://zh.wikipedia.org/wiki/Latex)。鉴于目前在线编译不是特别成熟，所以我们仍然采用本地安装一套 TEX 排版系统。根据你所采用的操作系统，请选择合适的发行版：- Mac OS: [http://www.tug.org/mactex/](http://www.tug.org/mactex/)- Windows: [http://www.ctex.org/CTeXDownload](http://www.ctex.org/CTeXDownload)，基于 MiKTeX；CTeX 套装使用方便。- Linux: 使用 Linux 的同学应该没必要在这里浪费时间，你们直接做你们想要做的吧。
CTeX 发行版又分为基本版 Basic 和完整版 Full，你可以试试基本版能否顺利使用，并给我们反馈，初学者推荐安装完整版。顺利安装后系统会自动与 .tex 即 LaTeX 源文件进行关联。双击便可以打开已安装好的 TEX 文本编辑器，比如 OS X 下的 TeXWorks，CTeX 套装里的 WinEdt 进行修改和编译。请先打开本模板里的 test.tex，你可以简单熟悉一下 LaTeX 的源文件结构，并试一下编译，看看生成的 test.pdf 效果和自带的 test-compare.pdf 效果是否一致（注意编译顺序为 XeLaTeX → BibTeX → XeLaTeX → XeLaTeX）。