;; Disable UI Stuff
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(setq inhibit-startup-screen t)

;; Cursor Customization
(blink-cursor-mode -1)
(global-hl-line-mode 1)

;; Frame Format
(setq frame-title-format "electronic macaronis")
(add-hook 'emacs-startup-hook 'toggle-frame-maximized)

;; Aesthetics
(set-face-attribute 'default nil :font "BlexMono Nerd Font Mono" :height 110)
(load-theme 'modus-operandi-tinted)

;; No Auto-Saves(most of the time)
(auto-save-mode -1)
(setq make-backup-files nil)

;; Move Emacs' Auto-configurations to another file
(setq custom-file "~/.emacs.d/.emacs.custom.el")
(load custom-file)

;; No funny bell noise(most of the time)
(setq ring-bell-function 'ignore)

;; TABS are now SPACES buahahahahhaha
(setq-default indent-tabs-mode nil)

;; c-mode
(setq-default c-basic-offset 4)
(global-set-key (kbd "C-c b") 'compile)
(global-set-key (kbd "C-c r") 'recompile)

;; org-mode
(add-hook 'org-mode-hook 'org-indent-mode)
(setq org-hide-emphasis-markers t)
(custom-set-faces
 '(org-level-1 ((t (:inherit outline-1 :height 1.2))))
 '(org-level-2 ((t (:inherit outline-2 :height 1.1)))))
