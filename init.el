;; Disable UI Stuff
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(setq inhibit-startup-screen  t
      initial-scratch-message nil)

;; Cursor Customization
(global-hl-line-mode)
(blink-cursor-mode -1)

;; Frame Format
(setq frame-title-format "electronic macaronis")
(add-hook 'emacs-startup-hook 'toggle-frame-maximized)

;; No Weird File Shenanigans
(auto-save-mode -1)
(setq make-backup-files nil
      create-lockfiles  nil)

;; Move Emacs' Auto-configurations to another file
(setq custom-file "~/.emacs.d/.emacs.custom.el")
(load custom-file)

;; No funny bell noise(most of the time)
(setq ring-bell-function 'ignore)

;; Extra Whitespace BEGONE!
(global-set-key (kbd "C-c s") 'just-one-space)

;; Use UTF-8 Character Encoding
(set-language-environment "UTF-8")
(prefer-coding-system 'utf-8)

;; Package setup
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

;; Aesthetics
(set-face-attribute 'default nil :font "BlexMono Nerd Font Mono" :height 110)
(use-package nord-theme
  :config
  (load-theme 'nord t))
  
;; TABS are now SPACES buahahahahhaha
(setq-default indent-tabs-mode nil
              tab-width        4)

;; c-mode
(global-set-key (kbd "C-c c") 'compile)
(global-set-key (kbd "C-c r") 'recompile)

;; nasm-mode
(use-package nasm-mode
  :mode "\\.asm\\'")

;; org-mode
(use-package org
  :config
  (add-hook 'org-mode-hook 'org-indent-mode)
  (custom-set-faces
   '(org-level-1 ((t (:inherit outline-1 :height 1.2))))
   '(org-level-2 ((t (:inherit outline-2 :height 1.1))))))

;; Git Integration
(use-package magit
  :defer t)

;; Completion Framework
(use-package vertico
  :init
  (vertico-mode 1)
  :config
  (setq vertico-count 5))

;; Maybe Add Projectile or something
