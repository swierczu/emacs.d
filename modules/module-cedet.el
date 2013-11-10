
;; ---------------------------------------------------------------------------
;; CEDET
;; ---------------------------------------------------------------------------

(load-file "~/.emacs.d/cedet-bzr/trunk/cedet-devel-load.el")

(setq semantic-default-submodes
            '(
              global-semanticdb-minor-mode
              global-semantic-highlight-edits-mode
              global-semantic-idle-local-symbol-highlight-mode
              ;; global-cedet-m3-minor-mode
              
              ;; code helpers
              global-semantic-idle-scheduler-mode
              global-semantic-idle-summary-mode
              global-semantic-idle-completions-mode
                                              
              ;; eye candy
              global-semantic-decoration-mode
              global-semantic-highlight-func-mode
              global-semantic-highlight-edits-mode
              global-semantic-stickyfunc-mode
                                              
              ;; debugging semantic itself
              ;;global-semantic-show-parser-state-mode 1   ;; show the parsing state in the mode line
              ;;global-semantic-show-unmatched-syntax-mode 1
              ))

(semantic-mode 1)

(require 'semantic/ia)
(require 'semantic/bovine/gcc)
(require 'semantic/db-javap)
(require 'semanticdb)
(require 'semantic/bovine/erlang)

(defun my-semantic-hook ()
    (imenu-add-to-menubar "TAGS"))
(add-hook 'semantic-init-hooks 'my-semantic-hook)

(when (cedet-gnu-global-version-check t)
    (semanticdb-enable-gnu-global-databases 'c-mode)
    (semanticdb-enable-gnu-global-databases 'c++-mode))

(when (cedet-ectag-version-check)
    (semantic-load-enable-primary-exuberent-ctags-support))

(global-ede-mode t)

(provide 'module-cedet)
