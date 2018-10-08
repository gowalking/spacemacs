(defun dotspacemacs/layers ()
  (setq-default
   dotspacemacs-distribution 'spacemacs
   dotspacemacs-enable-lazy-installation 'unused
   dotspacemacs-ask-for-lazy-installation t
   dotspacemacs-configuration-layer-path '()	;;定义自定义配置路径
   dotspacemacs-configuration-layers	;;添加所需要的层
   '(
     helm
     ;; (auto-completion :variables
     ;;        auto-completion-tab-key-behavior 'cycle
     ;;        auto-completion-complete-with-key-sequence nil
     ;;        auto-completion-complete-with-key-sequence-delay 0.1
     ;;        auto-completion-private-snippets-directory "~/.spacemacs.d/snippets/"
     ;;        auto-completion-enable-sort-by-usage t
     ;;        auto-completion-enable-help-tooltip 'manual
     ;;        auto-completion-enable-snippets-in-popup t)
     (ibuffer :variables ibuffer-group-buffers-by 'projects)
     (shell :variables
      	  shell-default-shell 'term
          shell-default-term-shell "/bin/bash"
          shell-default-height 40
          shell-default-position 'bottom)

     html
     emacs-lisp
     javascript
    ;shell-scripts

     (go :variables go-tab-width 4
        ;gofmt-command "goimports"
        go-use-gometalinter t
        go-use-gocheck-for-testing t)

     (python :variables python-enable-yapf-format-on-save t
        ;python-auto-set-local-pyvenv-virtualenv 'on-project-switch
        python-test-runner '(nose pytest))

     (c-c++ :variables c-c++-default-mode-for-headers 'c++-mode
        c-c++-default-mode-for-headers 'c-mode)

     spell-checking
     markdown
     version-control
     ;org
     ;git
     chinese
     ;markdown
     (syntax-checking :variables syntax-checking-enable-by-default nil)
     (gtags :variables gtags-enable-by-default t)
     ;ycmd
     ;yaml
     imenu-list;代码结构表
     )
   dotspacemacs-additional-packages '()	;;添加所需要的包
   dotspacemacs-frozen-packages '()
   dotspacemacs-excluded-packages '(
           exec-path-from-shell
           highlight-parentheses)
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  (setq-default
   dotspacemacs-elpa-https t	;;git下载时走的协议类型  nil 为http协议
   dotspacemacs-elpa-timeout 5
   dotspacemacs-check-for-update nil;启动时检查是否更新
   dotspacemacs-elpa-subdirectory nil
   dotspacemacs-editing-style 'vim
   dotspacemacs-verbose-loading nil
   dotspacemacs-startup-banner nil ;启动页面的logo
   dotspacemacs-startup-lists '((recents . 5) (projects . 7));启动页面显示5个文件，7个工程
   dotspacemacs-startup-buffer-responsive t
   dotspacemacs-scratch-mode 'text-mode
   dotspacemacs-colorize-cursor-according-to-state t
   dotspacemacs-default-font '("Source Code Pro"
                               :size 18
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   dotspacemacs-leader-key "SPC"
   dotspacemacs-emacs-command-key "SPC"
   dotspacemacs-ex-command-key ":"
   dotspacemacs-emacs-leader-key "M-m"
   dotspacemacs-major-mode-leader-key ","
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   dotspacemacs-distinguish-gui-tab nil
   dotspacemacs-remap-Y-to-y$ nil
   dotspacemacs-retain-visual-state-on-shift t
   dotspacemacs-visual-line-move-text nil
   dotspacemacs-ex-substitute-global nil
   dotspacemacs-default-layout-name "Default"
   dotspacemacs-display-default-layout nil
   dotspacemacs-auto-resume-layouts nil
   dotspacemacs-large-file-size 1
   dotspacemacs-auto-save-file-location 'cache
   dotspacemacs-max-rollback-slots 5
   dotspacemacs-helm-resize nil
   dotspacemacs-helm-no-header t
   dotspacemacs-helm-position 'bottom
   dotspacemacs-helm-use-fuzzy 'always
   dotspacemacs-enable-paste-transient-state nil
   dotspacemacs-which-key-delay 0.4
   dotspacemacs-which-key-position 'bottom
   dotspacemacs-loading-progress-bar t
   dotspacemacs-fullscreen-at-startup t ;全屏运行emacs
   dotspacemacs-fullscreen-use-non-native nil
   dotspacemacs-maximized-at-startup t	;自动时自动最大化
   dotspacemacs-active-transparency 90
   dotspacemacs-inactive-transparency 90
   dotspacemacs-show-transient-state-title t
   dotspacemacs-show-transient-state-color-guide t
   dotspacemacs-mode-line-unicode-symbols nil	;;不在状态栏中使用unicode
   dotspacemacs-smooth-scrolling t
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   dotspacemacs-line-numbers 'relative ;t开启行号
   dotspacemacs-folding-method 'evil ;vim模式
   dotspacemacs-smartparens-strict-mode nil
   dotspacemacs-smart-closing-parenthesis nil
   dotspacemacs-highlight-delimiters 'all
   dotspacemacs-persistent-server nil ;t 持久化服务器
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   dotspacemacs-default-package-repository nil
   dotspacemacs-whitespace-cleanup nil	;trailing删除多余的空白
   ))

(defun dotspacemacs/user-init ()
 (setq tramp-ssh-controlmaster-options "-o ControlMaster=auto -o ControlPath='tramp.%%C' -o ControlPersist=no")
)

(defun dotspacemacs/user-config ()
 ;设置自定义主题插件
 (add-to-list 'load-path "~/.spacemacs.d/themes/colortheme")
 (require 'color-theme)
 (eval-after-load "color-theme" '(progn (color-theme-initialize) (color-theme-gaozh)))

 ;设置ace-jump插件
 (add-to-list 'load-path "~/.spacemacs.d/plugins/ace-jump")
 (require 'ace-jump-mode)
 (define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

 (add-to-list 'load-path "~/.spacemacs.d/plugins/yasnippet")
 (require 'yasnippet)
 (yas-global-mode 1)

 ;自动补全
 (add-to-list 'load-path "~/.spacemacs.d/plugins/auto-complete")
 (require 'auto-complete-config)
 (ac-config-default)

 ;全局快捷键
 (global-set-key [f1] 'other-window);
 (global-set-key (kbd "M-o") (lambda() (interactive)(neotree-toggle)));打开文件目录树
 (global-set-key (kbd "M-p") #'imenu-list-minor-mode);打开代码结构表
 (global-set-key (kbd "M-i") 'ibuffer);打开ibuffer-list
 (global-set-key (kbd "M-h") (lambda() (interactive)(windmove-left)))   ;移到左边的窗口
 (global-set-key (kbd "M-l") (lambda() (interactive)(windmove-right)))  ;移到右边的窗口
 (global-set-key (kbd "M-j") (lambda() (interactive)(windmove-down)))   ;移到下边的窗口
 (global-set-key (kbd "M-k") (lambda() (interactive)(windmove-up)))     ;移到上边的窗口
 (global-set-key (kbd "M-h") (lambda () (interactive)(cond
			       ((string= evil-state "insert") (backward-char))
			       ((string= evil-state "normal") (anaconda-mode-go-back))
			       (t (windmove-left)))))
 ;(global-set-key (kbd "C-l") (lambda () (interactive)(cond
;			       ((string= evil-state "insert") (forward-char))
;			       ((string= evil-state "normal") (jump-to-definition))
;			       (t (windmove-right)))))

 ;全局映射键
 (define-key key-translation-map (kbd "C-p") 'scroll-down);上翻页
 (define-key key-translation-map (kbd "C-n") 'scroll-up);下翻页

 ;vim中快捷键绑定
 (with-eval-after-load 'evil
  (define-key evil-insert-state-map (kbd "C-j") 'next-line);编辑模式向下移动一行
  (define-key evil-insert-state-map (kbd "C-k") 'previous-line);编辑模式向上移动一行
  (define-key evil-normal-state-map (kbd "H") (kbd "0"));普通模式光标移动到行首
  (define-key evil-normal-state-map (kbd "L") (kbd "$"));普通模式光标移动到行尾
  (define-key evil-normal-state-map (kbd "TAB") (lambda() (interactive)(enlarge-window-horizontally 1000)))
  )

 (unless (display-graphic-p) (setq linum-relative-format "%-4s")) ;设置行号与内容的间距
 (setq powerline-default-separator 'utf-8)  ;状态栏风格 arrow utf-8
 (setq inhibit-startup-screen t) ;隐藏启动显示画面
 (setq inhibit-startup-message t);关闭emacs启动画面
 (setq initial-scratch-message nil) ;关闭 默认 scratch buffer 提示信息
 (progn (smartparens-global-mode -1)) ;关闭括号自动配对 SPC t p 打开
 ;(setq scroll-margin 5 scroll-conservatively 10000) ;靠近屏幕边沿3行时开始滚动
 (setq mouse-yank-at-point t) ;鼠标中间插入功能
 (setq font-lock-maximum-decoration t) ;只渲染当前屏幕语法高亮，加快显示速度
 (setq-default make-backup-files 'nil) ;保存文件时，不将源文件备份为 file~

 (global-flycheck-mode t)

 ;用空格代替tab来进行代码的缩进
 (setq indent-tabs-mode nil)
 (setq tab-always-indent nil)
 (setq tab-width 4)
)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (yapfify xterm-color ws-butler winum which-key web-mode web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package toc-org tagedit spaceline powerline slim-mode shell-pop scss-mode sass-mode restart-emacs request rainbow-delimiters pyvenv pytest pyim pyim-basedict pyenv-mode py-isort pug-mode popwin pip-requirements persp-mode pcre2el paradox spinner pangu-spacing org-plus-contrib org-bullets open-junk-file neotree multi-term move-text mmm-mode markdown-toc markdown-mode macrostep lorem-ipsum livid-mode skewer-mode simple-httpd live-py-mode linum-relative link-hint less-css-mode json-mode json-snatcher json-reformat js2-refactor yasnippet multiple-cursors js2-mode js-doc indent-guide imenu-list ibuffer-projectile hydra hy-mode dash-functional hungry-delete hl-todo highlight-numbers parent-mode highlight-indentation helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make projectile helm-gtags helm-flx helm-descbinds helm-css-scss helm-ag haml-mode google-translate golden-ratio go-guru go-eldoc go-mode git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-commit with-editor git-gutter gh-md ggtags flyspell-correct-helm flyspell-correct flycheck-pos-tip pos-tip flycheck-gometalinter flycheck pkg-info epl flx-ido flx find-by-pinyin-dired fill-column-indicator fancy-battery eyebrowse expand-region evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight eshell-z eshell-prompt-extras esh-help emmet-mode elisp-slime-nav dumb-jump disaster diminish diff-hl define-word cython-mode column-enforce-mode coffee-mode cmake-mode clean-aindent-mode clang-format bind-map bind-key auto-highlight-symbol auto-dictionary auto-compile packed anaconda-mode pythonic f dash s aggressive-indent adaptive-wrap ace-window ace-pinyin pinyinlib ace-link ace-jump-helm-line helm avy helm-core popup async))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
