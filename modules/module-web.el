
;; ---------------------------------------------------------------------------
;; SASS CSS
;; ---------------------------------------------------------------------------

(autoload 'scss-mode "scss-mode")
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))


;; ---------------------------------------------------------------------------
;; Zotonic - Erlang Web Framework
;; ---------------------------------------------------------------------------

(require 'zotonic-tpl-mode)
(add-to-list 'auto-mode-alist '("\\.tpl$" . zotonic-tpl-mode))


;; ---------------------------------------------------------------------------
;; PHP
;; ---------------------------------------------------------------------------

(require 'php-mode)


(provide 'module-web)