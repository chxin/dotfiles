;; this file is to be placed in ~/.emacs.d/lisp/,
;; referred in ~/.emacs.d/init.el, before init-evil.el

;; include custom mode configuration
(require 'init-latex)

;; to install packages; uncomment elpa in ~/.emacs.d/lisp/init-elpa.el
;; the packages to install : auctex, flymake-cursor

;; no ring
(setq ring-bell-function 'ignore)

;; set shortkeys for file access
(defun open-my-init-file ()
  (interactive)
  (find-file "~/.emacs.d/lisp/init-chxin.el"))
(defun open-my-org-file ()
  (interactive)
  (find-file "~/.emacs.d/org/gtd.org"))
(global-set-key (kbd "C-c 1") 'open-my-init-file)
(global-set-key (kbd "C-c 2") 'open-my-org-file)

;; configure GUI for window; if terminal, comment the following
;; set window position and height width
;; (set-frame-position (selected-frame) 650 5)
;; (set-frame-width (selected-frame) 60)
;; (set-frame-height (selected-frame) 33)
;; full screen
(add-to-list 'default-frame-alist '(fullscreen . maximized))
;; load theme
;; (load-theme 'sanityinc-solarized-dark t)

;; recent open files
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; resize window
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

;; auto split window vertically
(split-window-horizontally)
(other-window 1)
(find-file "~/.emacs.d/org/gtd.org")
(setq i 0)
(while (< i 15)
  (shrink-window-horizontally 1)
  (incf i))
(other-window 1)

;; show paren highlight
(show-paren-mode t)

;; evil insert mode no keybindings
;; this command must be set before evil-mode turns on
(setq evil-disable-insert-state-bindings t)

;; evil find char
;; (evil-mode 1)
;; (evil-local-set-key 'normal ";'" 'evil-repeat-find-char)
;; (evil-local-set-key 'normal ";," 'evil-repeat-find-char-reverse)

;; org capture
;; capture function to quickly add gtd to a specific file
(setq org-capture-templates
			'(("t" "ToDo" entry (file+headline "~/Documents/Emacs/org/gtd.org" "arrangement")
				 "* TODO [#B] %?\n %i\n"
				 :empty-line 1)))
(global-set-key (kbd "C-c r") 'org-capture)

(provide 'init-chxin)
