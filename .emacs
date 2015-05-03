;; Editors 
(setq make-backup-files nil)  ; no backup
(global-linum-mode t)  ; show line number 
(electric-pair-mode 1)  ; pairing brackets 
(setq frame-background-mode 'dark)

;; el-get
; el-get is smooth is osx
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
    (with-current-buffer
	(url-retrieve-synchronously
	 "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
        (goto-char (point-max))
	(eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)

; auto installing pacakge 
(el-get-install 'markdown-mode)

;; jedi:setup
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)
(setq jedi:get-in-function-call-delay 10)

(when (eq system-type 'darwin) ;; mac specific settings

)

; Keybindings
; move cursor multiple lines
(global-set-key (kbd "M-n")
		(lambda () (interactive) (next-line 7)))
(global-set-key (kbd "M-p")
		(lambda () (interactive) (previous-line 7)))
(global-set-key (kbd "C-m") 'newline-and-indent)  ; indentation
