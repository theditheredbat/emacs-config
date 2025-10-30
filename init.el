(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(setq inhibit-startup-screen  t
      initial-scratch-message nil)

(set-language-environment "UTF-8")
(prefer-coding-system 'utf-8)

(setq frame-title-format "electronic macaronis")
(add-hook 'emacs-startup-hook 'toggle-frame-maximized)

(set-face-attribute 'default nil :font "BlexMono Nerd Font Mono" :height 110)

(blink-cursor-mode -1)
(global-hl-line-mode)

(auto-save-mode -1)
(setq make-backup-files nil
      create-lockfiles  nil)

;; Remove Funny Error Noise
(setq ring-bell-function 'ignore)

;; Move Emacs' auto-configs to another file
(setq custom-file "~/.emacs.d/.emacs.custom.el")
(load custom-file)

;; (setq-default display-line-numbers-type 'relative)
;; (global-display-line-numbers-mode)

;; Tabs are now SPACES buahuahuahauahuahuaha
(setq-default indent-tabs-mode nil
              tab-width        4)

;; There shall only be ONE!
(global-set-key (kbd "C-c s") 'just-one-space)

;; c-style things
(setq c-basic-offset 4) ;; c-default-style
(global-set-key (kbd "C-c c") 'compile)
(global-set-key (kbd "C-c r") 'recompile)
(if (eq system-type 'windows-nt)
    (setq compile-command "cd .. && build"))

(require 'package)
(setq package-archives
      '(("melpa-stable" . "https://stable.melpa.org/packages/")
       ("melpa" . "https://melpa.org/packages/"))
      package-archive-priorities
      '(("melpa-stable" . 10)
        ("melpa"        . 5)))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

(use-package kanagawa-themes
  :config
  (load-theme 'kanagawa-dragon t))

(use-package nasm-mode
  :config
  (setq nasm-basic-offset 4)
  :mode "\\.asm\\'")

(use-package org
  :defer t
  :config
  (add-hook 'org-mode-hook 'org-indent-mode)
  (custom-set-faces
   '(org-level-1 ((t (:inherit outline-1 :height 1.2))))
   '(org-level-2 ((t (:inherit outline-2 :height 1.1))))))

;; Minibuffer Completions
(use-package vertico
  :init
  (vertico-mode 1)
  :config
  (setq vertico-count 5))

(use-package magit
  :defer t)
