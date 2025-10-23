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

(setq ring-bell-function 'ignore)

(setq custom-file "~/.emacs.d/.emacs.custom.el")
(load custom-file)

(setq-default indent-tabs-mode nil
              tab-width        4)

(global-set-key (kbd "C-c s") 'just-one-space)

(global-set-key (kbd "C-c c") 'compile)
(global-set-key (kbd "C-c r") 'recompile)

(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

(use-package nord-theme
  :config
  (load-theme 'nord t))

(use-package nasm-mode
  :mode "\\.asm\\'")

(use-package org
  :defer t
  :config
  (add-hook 'org-mode-hook 'org-indent-mode)
  (custom-set-faces
   '(org-level-1 ((t (:inherit outline-1 :height 1.2))))
   '(org-level-2 ((t (:inherit outline-2 :height 1.1))))))

(use-package vertico
  :init
  (vertico-mode 1)
  :config
  (setq vertico-count 5))

(use-package magit
  :defer t)
