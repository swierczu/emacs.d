
;; ---------------------------------------------------------------------------
;; C / C++
;; ---------------------------------------------------------------------------

;; use cscope
(require 'xcscope)

;; gtags
(require 'gtags)
(gtags-mode t)

;; C-mode:
(setq c-default-style "ellemtel")
;(setq c-default-style "linux")
(setq-default c-basic-offset 4)
(setq-default comment-column 80)

;; GDB
(setq gdb-many-windows t)


;; ---------------------------------------------------------------------------
;; Python
;; ---------------------------------------------------------------------------

(require 'ac-python)
;; eldoc mode
(add-hook 'python-mode-hook 'turn-on-eldoc-mode)

;; pdb
(setq gud-pdb-command-name "python -m pdb")


;; ---------------------------------------------------------------------------
;; Lisp
;; ---------------------------------------------------------------------------

(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)


;; ---------------------------------------------------------------------------
;; Git
;; ---------------------------------------------------------------------------

;; magit
(require 'magit)

;; ---------------------------------------------------------------------------
;; PHP
;; ---------------------------------------------------------------------------

(require 'php-mode)

;; ---------------------------------------------------------------------------
;; Erlang
;; ---------------------------------------------------------------------------

(setq load-path (cons "/opt/local/lib/erlang/lib/tools-2.6.8/emacs/" load-path))
(setq erlang-root-dir "/opt/local/lib/erlang")
(setq exec-path (cons "/opt/local/lib/erlang/bin" exec-path))
(setq erlang-man-root-dir "/opt/local/lib/erlang/man")
(setq inferior-erlang-machine-options '("-sname" "emacs"))

(require 'erlang-start)
(require 'erlang-flymake)

(add-to-list 'auto-mode-alist '("\\.erl?$" . erlang-mode))
(add-to-list 'auto-mode-alist '("\\.hrl?$" . erlang-mode))

(add-to-list 'load-path "~/.emacs.d/distel/elisp/")
(require 'distel)
(distel-setup)

;; ---------------------------------------------------------------------------
;; Zotonic - Erlang Web Framework
;; ---------------------------------------------------------------------------

(require 'zotonic-tpl-mode)
(add-to-list 'auto-mode-alist '("\\.tpl$" . zotonic-tpl-mode))

;; ---------------------------------------------------------------------------
;; Snippets
;; ---------------------------------------------------------------------------

(require 'module-snippets)

(provide 'module-devel)
