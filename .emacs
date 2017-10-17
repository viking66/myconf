(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package gotham-theme
  :config
  (load-theme 'gotham t))

(use-package spaceline
  :config
  (require 'spaceline-config)
  (setq powerline-default-separator 'utf-8)
  (spaceline-spacemacs-theme))

(use-package evil
  :config
  (evil-mode 1))

(use-package general
  :config
  (setq general-default-keymaps 'evil-normal-state-map)
  (general-evil-setup)
  (general-define-key
   "h" 'evil-backward-char
   "s" 'evil-forward-char
   "t" 'evil-next-line
   "n" 'evil-previous-line
   "H" 'evil-window-top
   "S" 'evil-window-bottom
   "T" 'evil-join
   "N" 'help
   "j" 'evil-find-char-to
   "J" 'evil-find-char-to-backward
   "k" 'evil-substitute
   "K" 'evil-change-whole-line
   "l" 'evil-search-next
   "L" 'evil-search-previous
;   "l" (lambda () (interactive) (isearch-repeat-forward) (goto-char isearch-other-end))
;   "L" 'isearch-repeat-backward
   "-" 'evil-beginning-of-line
   "_" 'evil-end-of-line)
  (general-imap "j"
		(general-key-dispatch 'self-insert-command
		  :timeout 0.25
		  "j" 'evil-normal-state)))

(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(package-selected-packages (quote (evil use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
