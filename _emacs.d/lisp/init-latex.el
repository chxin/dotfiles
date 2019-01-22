;; -*- coding: utf-8; lexical-binding: t; -*-
(setq-default TeX-master nil)
(mapc (lambda (mode)
        (add-hook 'LaTeX-mode-hook mode))
      (list 'turn-on-cdlatex
            'reftex-mode
            'outline-minor-mode
            'auto-fill-mode
            'flyspell-mode
            'hide-body t))
;;;
;;; AUCTex customization
;;;

;; in case of TeX configurations make Emacs crash, the fllowing 3 configurations help
;; find tex
;; TeX-tree-roots path configuration
;; (setq TeX-tree-roots "D:\\Applications\\Tex\\texmf-dist\\")
;; (setenv "PATH"
;;         (concat
;;          "D:\\Applications\\Tex\\bin\\win32" ";"
;;          (getenv "PATH")))
;; (setq preview-gs-command "D:\\Applications\\Tex\\bin\\win32\\rungs.exe")
;; forward refenence
(setq TeX-PDF-mode t)
(setq TeX-source-correlate-mode t)
(setq TeX-source-correlate-method 'synctex)
;compile tex as PDF
(setq TeX-PDF-mode t)
;view the pdf using evince
(setq TeX-view-program-selection '((output-pdf "Evince")))
; enable source specials or SyncTeX to be enable to compile it to a forward / backword searching.
(add-hook 'LaTeX-mode-hook 'TeX-source-correlate-mode)
; always start emacs server when viewing in evance for backward search
(setq TeX-source-correlate-start-server t)
;; forward and inverse search on Ubuntu
;; (setq TeX-view-program-selection'((output-pdf "Evince")))
;; (add-hook 'LaTeX-mode-hook 'Tex-source-correlate-mode)
;; (setq TeX-source-correlate-start-server t)
;; forward and inverse search on Windows 10 with sumatraPDF not portable
;; path of SumatraPDF
;; (setq TeX-view-program-list
;;       '(("Sumatra PDF" ("\"D:/Applications/Sumatra/SumatraPDF.exe\" -reuse-instance" (mode-io-correlate " -forward-search %b %n ") " %o"))))
;; (setq TeX-view-program-selection
;;       '(((output-dvi style-pstricks)
;;          "dvips and start")
;;         (output-dvi "Yap")
;;         (output-pdf "Sumatra PDF")
;;         (output-html "start")))
;; (add-hook 'LaTeX-mode-hook
;;           (lambda ()
;;             (assq-delete-all 'output-pdf TeX-view-program-selection)
;;             (add-to-list 'TeX-view-program-selection '(output-pdf "Sumatra PDF"))))
;; set inverse search
;; in SumatraPDF: menu->setting->options->inverse search: C:\emacs\bin\emacsclientw.exe +%l "%f"

;; set fill column to 1000
(add-hook 'LaTeX-mode-hook (lambda () (set-fill-column 1000)))

;; flymake
;; (require 'flymake)
;; (defun flymake-get-tex-args (file-name)
;; (list "pdflatex"
;; (list "-file-line-error" "-draftmode" "-interaction=nonstopmode" file-name)))
;; (add-hook 'LaTeX-mode-hook 'flymake-mode)

;; outline mode
;; (setq outline-minor-mode-prefix "\C-c \C-o")
(provide 'init-latex)
