(eval-when-compile (require 'color-theme))

;ansi-term 样式
(defun term-color-theme() "" (interactive) (color-theme-install
   '(term-color-theme nil
     (term ((t (:background "black50" :foreground "white"))))
     (term-underline ((t nil))))))

;字体样式
(defun emacs-font-set() "" (interactive) (color-theme-install
 '(emacs-font-set nil
     (font-lock-keyword-face ((t (:foreground "#00ffff" :bold t)))) ;关键词
     (font-lock-comment-face ((t (:foreground "#6C6C6C" :background "black50" :italic t)))) ;注释
     (font-lock-comment-delimiter-face ((t (:foreground "#6C6C6C"))))   ;注释标记符
     (font-lock-string-face ((t (:foreground "#ffff00"))))  ;字符串
     (font-lock-constant-face ((t (:foreground "#00ff00"))))
     (font-lock-builtin-face ((t (:foreground "#ffaa00"))))
     (font-lock-type-face ((t (:foreground "Coral"))))  ;类型
     (font-lock-warning-face ((t (:foreground "Red" :bold t)))) ;警告
     (font-lock-doc-face ((t (:foreground "white"))))
     (font-lock-doc-string-face ((t (:foreground "darkgreen"))))
     (font-lock-exit-face ((t (:foreground "green"))))
     (font-lock-preprocessor-face ((t (:foreground "blue3"))))
     (font-lock-reference-face ((t (:foreground "red3"))))
     (font-lock-function-name-face ((t (:foreground "#4186be" :bold t))))
     (font-lock-variable-name-face ((t (:foreground "#C34480" :bold t)))) ;变量
     (font-lock-color-constant-face ((t (:foreground "red3"))))
     (font-lock-negation-char-face ((t (:foreground "red3"))))
     (font-lock-other-type-face ((t (:foreground "red3"))))
     (font-lock-regexp-grouping-construct ((t (:foreground "red3"))))
     (font-lock-special-keyword-face ((t (:foreground "red3"))))
     (font-lock-other-emphasized-face ((t (:foreground "red3"))))
     (font-lock-regexp-grouping-backslash ((t (:foreground "red3"))))
     )))

;自动补全下拉菜单样式
(defun autocomplete-style() "" (interactive) (color-theme-install
  '(autocomplete-style nil
     ;(company-tooltip-search ((t (:foreground "red"))))
     ;(company-preview ((t (:foreground "red"))))
     ;(company-preview-search ((t (:foreground "red"))))
     (company-preview-common ((t (:foreground "red3" :background "Black" :bold t))));当前行后补字符串
     (company-tooltip-annotation ((t (:foreground "white"))))
     (company-tooltip ((t (:foreground "white" :background "#009FEC" :bold t))))    ;背景
     (company-tooltip-common ((t (:foreground "white" :background "#009FEC"))))     ;背景
     (company-scrollbar-fg ((t (:foreground "white" :background "#7995DF")))) ;当前行
     (company-tooltip-selection ((t (:foreground "white" :background "#7995DF"))));当前行
     (company-tooltip-common-selection ((t (:foreground "white" :background "#7995DF")))))));当前行

;状态栏样式
(defun status-style-set() "" (interactive) (color-theme-install
 '(status-style-set nil
     (mode-line ((t (:foreground "white" :background "#622C03" :bold t)))) ;状态栏底色
     (modeline-buffer-id ((t (:foreground "white" :background "#622C03" :bold t)))) ;文件名

     (mode-line-inactive ((t (:foreground "green" :background "#622C03" :bold t)))); 切换buf后状态栏底色
     (powerline-inactive1 ((t (:foreground "#D75FD7" :background "#00005F" :bold t))));切换buffer后小段样式
     (powerline-inactive2 ((t (:foreground "#D75FD7" :background "#00005F" :bold t))));切换buffer后中间空白

     (powerline-active1 ((t (:foreground "#D75FD7" :background "#00005F" :bold t)))) ;文件类型，光标位置
     (powerline-active2 ((t (:foreground "#D75FD7" :background "#00005F" :bold t)))); 中间空白
     )))

;neotree 资源管理器样式
(defun imenu-style-set() "" (interactive) (color-theme-install
 '(imenu-style-set nil
     (imenu-list-entry-face-0 ((t (:foreground "red" :bold t))));主函数
     (imenu-list-entry-subalist-face-0 ((t (:foreground "#FF8759" :bold t))));类名
     (imenu-list-entry-face-1 ((t (:foreground "#53CCBD" :bold t))));方法名
     ;(imenu-list-entry-subalist-face-1 ((t (:background "black50" :foreground "green" :bold t))))
     ;(imenu-list-entry-face-2 ((t (:background "black50" :foreground "red" :bold t))));
     ;(imenu-list-entry-subalist-face-2 ((t (:background "black50" :foreground "green" :bold t))))
     ;(imenu-list-entry-face-3 ((t (:background "black50" :foreground "red" :bold t))));
     ;(imenu-list-entry-subalist-face-3 ((t (:background "black50" :foreground "green" :bold t))))
     )))

;imenu 代码结构样式
(defun neotree-style-set() "" (interactive) (color-theme-install
 '(neotree-style-set nil
     (neo-root-dir-face ((t (:background "black50" :foreground "red" :bold t))));路径样式
     (neo-dir-link-face ((t (:background "black50" :foreground "#009FEC" :bold t))));资源树目录样式
     (neo-file-link-face ((t (:background "black50" :foreground "green" :bold t)))))));资源树文件样式

;diff 样式
(defun diff-style-set() "" (interactive) (color-theme-install
 '(diff-style-set nil
     (diff-hl-change ((t (:background "black50" :foreground "#CDB464" :bold t))))
     (diff-hl-delete ((t (:background "black50" :foreground "#98be65" :bold t))))
     (diff-hl-insert ((t (:background "black50" :foreground "#ff6c6b" :bold t)))))))

;helm样式
(defun helm-style-set() "" (interactive) (color-theme-install
 '(helm-style-set nil
     (helm-selection ((t (:background "Black" :bold t))));选中行
     (helm-match ((t (:background "black50" :foreground "red" :bold t))))
     (helm-swoop-target-line-face ((t (:background "Black" :bold t)))) ;匹配到的行
     (helm-swoop-target-word-face ((t (:background "black50" :foreground "red3" :bold t)))) ;匹配到的单个词
     (helm-source-header ((t (:background "black50" :foreground "black50"))));标题头

     (helm-ff-directory ((t (:background "black50" :foreground "#009FEC"))));目录
     (helm-ff-dotted-directory ((t (:background "black50" :foreground "#009FEC"))));当前目录
     (helm-ff-file ((t (:background "black50" :foreground "green"))));文件
     (helm-ff-prefix ((t (:background "black50" :foreground "green"))));文件
     (helm-ff-executable ((t (:background "black50" :foreground "green"))));.开头的文件
     )))

;ivy样式
(defun ivy-style-set() "" (interactive) (color-theme-install
 '(ivy-style-set nil
     (ivy-current-match ((t (:background "Black" :bold t))))
     (ivy-subdir ((t (:foreground "#009FEC" :bold t))));目录颜色
     (ivy-minibuffer-match-face-1 ((t (:background "Black" :foreground "red" :bold t))))
     (ivy-minibuffer-match-face-2 ((t (:background "Black" :foreground "red" :bold t))))
     (ivy-minibuffer-match-face-3 ((t (:background "Black" :foreground "red" :bold t))))
     (ivy-minibuffer-match-face-4 ((t (:background "Black" :foreground "red" :bold t))))
     (ivy-confirm-face ((t (:background "Black" :foreground "red" :bold t))))
     (ivy-match-required-face ((t (:background "Black" :foreground "red" :bold t))))
     (ivy-modified-buffer ((t (:background "Black" :foreground "red" :bold t))))
     (vy-remote ((t (:background "Black" :foreground "red" :bold t))))
     (ivy-virtual ((t (:background "Black" :foreground "red" :bold t))))
     (ivy-action ((t (:background "Black" :foreground "red" :bold t))))
     (ivy-highlight-face ((t (:background "Black" :foreground "red" :bold t))))
     (ivy-prompt-match ((t (:background "Black" :foreground "red" :bold t))))
     )))

;search样式
(defun search-style-set() "" (interactive) (color-theme-install
 '(search-style-set nil
     (lazy-highlight ((t (:background "#622C03" :bold t)))))))

;基础配置
(defun color-theme-gaozh () "" (interactive)
  (term-color-theme);shell样式
  (helm-style-set);helm样式
  ;(ivy-style-set);ivy样式
  (autocomplete-style);补全下拉菜单样式
  (emacs-font-set);字体样式
  (status-style-set);状态栏样式
  (neotree-style-set);neotree资源管理器样式
  (imenu-style-set);imenu代码结构样式
  (diff-style-set);diff样式
  (search-style-set);search样式
  (color-theme-install
   '(color-theme-gaozh
     ((foreground-color . "white") (background-color . "block50"));前景色背景色
     (linum ((t (:foreground "cyan" :background "Black")))) ;行号背景色
     (hl-line ((t (:background "Black" :bold t)))) ;当前行背景色
    )))
