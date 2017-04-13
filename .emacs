;; To reload this configuration
; M-x load-file
; ~/.emacs
; or M-x eval-buffer

;; Editors
; file
(setq make-backup-files nil)  ; no backup
(setq auto-save-default nil)  ; no auto-save
(setq vc-follow-symlinks t)  ; auto follow symbolic links
(setq confirm-kill-emacs 'y-or-n-p)  ; close confirmation
(setq initial-scratch-message "scratch")

;; visible-bell
(setq visible-bell nil) ;; The default
(setq ring-bell-function 'ignore)

; file content
(setq-default indent-tabs-mode nil)  ; disable tab
(set-default 'truncate-lines t)  ; disable soft wrap
(add-to-list 'write-file-functions 'delete-trailing-whitespace)

; indentation
(setq js-indent-level 2)
(setq-default c-basic-offset 4)

; line number
(global-linum-mode t)  ; show line number
(setq linum-format "%4d ")
;; http://www.w3schools.com/colors/colors_picker.asp?colorhex=000000
(set-face-background 'linum "#404040")
(set-face-foreground 'linum "#1a1a1a")
(setq frame-background-mode 'dark)
; fringe does not working in tty mode

; duplicate line
(global-set-key "\C-x\C-d" "\C-a\C- \C-n\M-w\C-y")

;; pbcopy
(defun pbcopy ()
  (interactive)
  (call-process-region (point) (mark) "pbcopy")
  (setq deactivate-mark t))

(defun pbpaste ()
  (interactive)
  (call-process-region (point) (if mark-active (mark) (point)) "pbpaste" t t))

(defun pbcut ()
  (interactive)
  (pbcopy)
  (delete-region (region-beginning) (region-end)))

(global-set-key (kbd "C-c c") 'pbcopy)
(global-set-key (kbd "C-c v") 'pbpaste)
(global-set-key (kbd "C-c x") 'pbcut)

;; elpa
(require 'package)
(custom-set-variables
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa" . "http://stable.melpa.org/packages/")))))

;; el-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
    (url-retrieve-synchronously
      "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)

; auto installing pacakge, sudo required
(el-get-install 'markdown-mode)
(el-get-install 'web-mode)  ; major-mode for editing web templates
(el-get-install 'anaconda-mode)  ; require virtualenv
(el-get-install 'multiple-cursors)  ;  C-M-l
(el-get-install 'smex)  ; inline M-x autocomplete
(el-get-install 'expand-region)  ; expand markset selection
(el-get-install 'helm)  ; complete in buffer
(el-get-install 'haskell-mode)
(el-get-install 'powerline)
(el-get-install 'ghc-mod)  ; cabal update && cabal install ghc-mod
(el-get-install 'company-ghc)
; (el-get-install 'csharp-mode)  ; sudo apt-get install -y git-svn
(el-get-install 'neotree)  ; left folder tree
(el-get-install 'js2-mode)  ; mooz/js2-mode
(el-get-install 'switch-window)  ; indexing window
(el-get-install 'magit)  ; sudo apt-get install -y texinfo
(el-get-install 'git-gutter)  ; left side gutter
(el-get-install 'smartparens)  ; pair
(el-get-install 'use-package)  ; for .emacs to isolate package

(el-get-install 'company-mode)  ; replace auto-complete
(el-get-install 'company-anaconda)  ; python autocomplete
(el-get-install 'company-irony)  ; cpp autocomplete

;; company-mode
(setq company-idle-delay 0)  ; autocomplete delay
(setq company-minimum-prefix-length 2)
(setq company-dabbrev-downcase nil)  ; avoid lowercase in plain tex

(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'python-mode-hook 'anaconda-mode
  (lambda ()
    (setq-local company-backends '((company-anaconda)))))

(eval-after-load 'company  '(add-to-list 'company-backends 'company-irony))
(eval-after-load 'company  '(add-to-list 'company-backends 'company-ghc))

(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))


;; OS X
(when (eq system-type 'darwin) ;; mac specific settings

)
;; flycheck
; TODO

;; Keybindings
; move cursor multiple lines
(global-set-key (kbd "M-n")
  (lambda () (interactive) (next-line 7)))
(global-set-key (kbd "M-p")
  (lambda () (interactive) (previous-line 7)))
(global-set-key (kbd "C-m") 'newline-and-indent)  ; indentation

; Multi-line cursor
(global-set-key (kbd "C-M-l") 'mc/edit-lines)  ; C-S combo does not work in osx

;; smex, M-x enhancement
(global-set-key (kbd "M-x") 'smex)  ; $ chmod 777 ~/.emacs.d/smex-items
(global-set-key (kbd "M-X") 'smex-major-mode-commands) ; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; org-mode
; for *.org
(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))  ; new line

;; helm
(require 'helm-config)
(global-set-key (kbd "M-h") 'helm-M-x)  ; upper case

;; shell-mode
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8-unix)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(put 'upcase-region 'disabled nil)  ; C-x C-u

;; expand-region
(require 'expand-region)
(global-set-key (kbd "M-+") 'er/expand-region)
(global-set-key (kbd "M-_") 'er/contract-region)

;; switch-window
(require 'switch-window)
(global-set-key (kbd "C-x o") 'switch-window)

;; magit
(global-set-key (kbd "C-x g") 'magit-status)

;; git-gutter
(global-git-gutter-mode +1)
(custom-set-variables
 '(git-gutter:unchanged-sign " ")
 '(git-gutter:modified-sign " ")
 '(git-gutter:added-sign " ")
 '(git-gutter:deleted-sign " ")
 '(git-gutter:update-interval 1))  ; not real-time

(git-gutter:linum-setup)

(set-face-background 'git-gutter:unchanged "black")
(set-face-background 'git-gutter:added "green")
(set-face-background 'git-gutter:deleted "red")
(set-face-background 'git-gutter:modified "purple")

(global-set-key (kbd "C-x v p") 'git-gutter:previous-hunk)
(global-set-key (kbd "C-x v n") 'git-gutter:next-hunk)
(global-set-key (kbd "C-x v =") 'git-gutter:popup-hunk)
(global-set-key (kbd "C-x v r") 'git-gutter:revert-hunk)

;; smartparens
(require 'smartparens-config)
(smartparens-global-mode t)
(show-smartparens-global-mode t)

(sp-local-pair 'clojure-mode "#(" ")")
(sp-local-pair 'ruby-mode "#{" "}")

;; Add smartparens-strict-mode to all sp--lisp-modes hooks. C-h v sp--lisp-modes
;; to customize/view this list.
(mapc (lambda (mode)
        (add-hook (intern (format "%s-hook" (symbol-name mode))) 'smartparens-strict-mode))
      sp--lisp-modes)

; https://ebzzry.github.io/emacs-pairs.html
(defmacro def-pairs (pairs)
  `(progn
     ,@(loop for (key . val) in pairs
          collect
            `(defun ,(read (concat
                            "wrap-with-"
                            (prin1-to-string key)
                            "s"))
                 (&optional arg)
               (interactive "p")
               (sp-wrap-with-pair ,val)))))

(def-pairs ((paren        . "(")
            (bracket      . "[")
            (brace        . "{")
            (single-quote . "'")
            (double-quote . "\"")
            (back-quote   . "`")))

;; buffer-file-name
(defun show-file-name ()
  "Show the full path file name in the minibuffer."
  (interactive)
  (message (buffer-file-name)))

(global-set-key (kbd "C-x l") 'show-file-name)

;; powerline
(require 'powerline)
(powerline-default-theme)


;; Window move
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)

;; ghc-mod
(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-debug "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init)))

;; neotree
(require 'neotree)
(global-set-key (kbd "M-t") 'neotree-toggle)
(setq-default neo-show-hidden-files t)

(defun neotree-startup ()
  (interactive)
  (neotree-show)
  (call-interactively 'other-window))

(if (daemonp)
    (add-hook 'server-switch-hook #'neotree-startup)
  (add-hook 'after-init-hook #'neotree-startup))
