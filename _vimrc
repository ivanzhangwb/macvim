"""""""""""""""""""""Config Area""""""""""""""""""""
"打开语法
syntax enable
"设置历史记录
set history=1000
"检测文件类型
filetype on
"设置tab键
set tabstop=4
"显示行号
set number
"设置字符集
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
"""""""""""""""""""""function Area""""""""""""""""""""
function! Google()
    "从终端开始接收输入
	call inputsave()
    "接收到的值保存到 searchterm 变量里面
	let searchterm = input('Google: ')
	call inputrestore()
	return searchterm
endfunction

function! VSCSubmit()
	"从终端开始接受输入
	call inputsave()
	"接收到的值保存到变量vcslog里面
	let vcslog = input('请输入提交的Message')
	call inputrestore()
	return vcslog
endfunction
"""""""""""""""""""""keymap""""""""""""""""""""
"用F3触发打开文件夹视图的快捷键(NERDTree插件)
map <F3> :NERDTreeToggle<CR>
"用',g' 来匹配google搜索
map ,g <ESC>:! /usr/bin/open -a "/Applications/Google Chrome.app" 'http://www.google.com.hk./search?q=<C-R>=Google()<CR>'<CR><CR>
"使用,l 显示版本控制软件的日志
map ,l <ESC>:VCSLog --stop-on-copy<CR>
"使用,i 显示版本控制软件的日志
map ,i <ESC>:VCSInfo<CR>
"使用,c 来提交代码
map ,c <ESC>:VCSCommit <C-R>=VSCSubmit()<CR><CR>
"其他控件的信息 :help VCSCommand
"zencoding.vm 的帮助信息页面: http://mattn.github.com/zencoding-vim/

"""""""""""""""""""""diy command"""""""""""""""""""
"利用Today这个命令来显示日志，command 类似于 bash里面的alias 别名.
command Today Calendar
"""""""""""""""""""""plugin"""""""""""""""""""
call pathogen#runtime_append_all_bundles()
