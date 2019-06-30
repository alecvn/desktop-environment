;; Remove window ui elements
(menu-bar-mode -1) 
(toggle-scroll-bar -1) 
(tool-bar-mode -1)

;; Enable copy/past-ing from clipboard
(setq x-select-enable-clipboard t)

;; Prefer UTF-8 encoding
;; (prefer-coding-system 'UTF-8)

;; Always reload the file if it changed on disk, see also: auto-revert-tail-mode
(global-auto-revert-mode 1)

;; Auto update dired when files change
(add-hook 'dired-mode-hook 'auto-revert-mode)

;; Highlight matching parens
(show-paren-mode 1)

;; Jump between words in CamelCase - this isn't as great as I had hoped
;; (global-subword-mode 1)

;; Text wraps around buffer edges - still not convinced about this
(global-visual-line-mode 1)

;; Line number frame
(global-linum-mode t)
(setq column-number-mode t)

;; Opacity
(set-frame-parameter (selected-frame) 'alpha '(90 . 80))
(add-to-list 'default-frame-alist '(alpha . (90 . 80)))

;; Emacs session state management
(global-set-key (kbd "<C-f1>") 'desktop-save)
(global-set-key (kbd "<C-f2>") 'desktop-read)
(global-set-key (kbd "<C-f3>") 'desktop-clear)

(use-package markdown-mode :ensure t)

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode)
  :ensure-system-package (black . "pip3 install pylint")
  )

(use-package calmer-forest-theme :ensure t)

(use-package shader-mode :ensure t)

(use-package blacken :ensure t)

;; Requirements for dashboard
(use-package all-the-icons
  :ensure t
  :config
  (when (not (member "all-the-icons" (font-family-list)))
    (all-the-icons-install-fonts t))
  )

(use-package page-break-lines :ensure t)

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  ;; Neither working - but I'd like them to
  ;; (setq dashboard-set-navigator t)
  ;; (setq show-week-agenda-p t)
  (setq dashboard-set-heading-icons t)
  (setq dashboard-center-content t)
  (setq dashboard-set-file-icons t)
  (setq dashboard-set-footer nil)
  (setq dashboard-items '((agenda . 5)
                        (projects . 5)
			(recents  . 5)
                        (bookmarks . 5)))
)

;; Remove trailing whitespace after save when in programming mode
(use-package ws-butler
  :ensure t
  :defer
  :init
  (add-hook 'prog-mode-hook #'ws-butler-mode))

;; Inserts closing parentheses for a selection of packages
(use-package smartparens
  :ensure t
  :config
  (smartparens-global-mode t))