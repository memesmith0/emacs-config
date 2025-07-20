
;;y2k-term
;; Prevent the cursor from blinking
(blink-cursor-mode 0)
;; Don't use messages that you don't read
(setq initial-scratch-message "")
(setq inhibit-startup-message t)
;; Don't let Emacs hurt your ears
(setq visible-bell t)
;; You need to set `inhibit-startup-echo-area-message' from the
;; customization interface:
;; M-x customize-variable RET inhibit-startup-echo-area-message RET
;; then enter your username
(setq inhibit-startup-echo-area-message "guerry")
;; This is bound to f11 in Emacs 24.4
;(toggle-frame-fullscreen) 
;; Who use the bar to scroll?
(scroll-bar-mode 0)
(tool-bar-mode 0)
(menu-bar-mode 0)
;(custom-set-faces
;  '(default ((t (:background "black" :foreground "grey"))))
;  '(fringe ((t (:background "black")))))



;;change the font size so my poor eyes can see
(set-face-attribute 'default nil :height 200)


					;load darktooth theme
;; (require 'url) ; No longer needed if not using url-retrieve-file

(setq darktooth-theme-dir "~/.config/")
(setq darktooth-theme-file (expand-file-name "darktooth-theme.el" darktooth-theme-dir))
(setq darktooth-theme-url "https://emacsthemes.com/assets/local-src/darktooth-theme-source-code.el")

;; 1. Ensure the directory exists
(unless (file-directory-p darktooth-theme-dir)
  (make-directory darktooth-theme-dir t)
  (message "Created directory: %s" darktooth-theme-dir))

;; 2. Download the file only if it doesn't exist, using wget
(unless (file-exists-p darktooth-theme-file)
  (message "Darktooth theme file not found. Downloading with wget...")
  (let* ((wget-command "wget") ; Or "curl"
         (wget-args (list "-O" darktooth-theme-file darktooth-theme-url)) ; -O specifies output file
         (status-code (call-process wget-command nil nil nil "-O" darktooth-theme-file darktooth-theme-url)))
    ;; Check if wget (or curl) command was successful
    (if (zerop status-code) ; wget/curl return 0 for success
        (progn
          (message "Darktooth theme downloaded successfully to %s." darktooth-theme-file)
          ;; 3. Load the theme after successful download
          (add-to-list 'custom-theme-load-path darktooth-theme-dir)
          (load-theme 'darktooth t))
      (message "Failed to download Darktooth theme with %s. Status code: %d" wget-command status-code))))

;; If the file already exists (or was just downloaded successfully), directly load the theme
(if (file-exists-p darktooth-theme-file)
    (progn
      (add-to-list 'custom-theme-load-path darktooth-theme-dir)
      (load-theme 'darktooth t)))



;;god mode
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
(package-refresh-contents)
(package-install 'god-mode)
(setq god-mode-enable-function-key-translation nil)
(require 'god-mode)
(setq god-exempt-major-modes nil)
(setq god-exempt-predicates nil)
(global-set-key (kbd "<escape>") #'god-local-mode)


(setq explicit-shell-file-name "/bin/sh")
(term "/bin/sh")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '("god-mode" god-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
