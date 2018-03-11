;; ---------------------------------------------------------------------------
;; Emacs and prelude installation 
;; ---------------------------------------------------------------------------

;; 1) Install emacs from brew:
;; brew install emacs --HEAD --with-cocoa --with-gnutls --with-imagemagick@6 --with-librsvg
;; brew linkapps emacs
;; rm /Applications/Emacs.app
;; osascript -e 'tell application "Finder" to make alias file to POSIX file "/usr/local/opt/emacs/Emacs.app" at POSIX file "/Applications"'
;;
;; 2) Install prelude:
;; curl -L https://git.io/epre | sh
;;
;; 3) Edit the prelude modules config file to adjust the modules you want to use:
;; vi .emacs.d/sample/prelude-modules.el
;;
;; 4) Make a symbolic links to binaries 
;; ln -s /usr/local/opt/emacs/bin/emacs /usr/local/bin/emacs 
;; ln -s /usr/local/opt/emacs/bin/emacsclient /usr/local/bin/emacsclient
;; ln -s /usr/local/opt/emacs/bin/ebrowse /usr/local/bin/ebrowse
;; ln -s /usr/local/opt/emacs/bin/etags /usr/local/bin/etags
;; 
;; 5) Run emacs:
;; /usr/local/bin/emacs
;; and wait for downloading and building all packages needed by prelude. When it hase finished, quit emacs (c-x, c-c)
;;
;; 6) Install flyspell:
;; brew install aspell --lang=en
;;
;; 6) Put this file (emacs_config.el) in ~/.emacs.d/personal
;;
;; 7) Run emacs and test is if everything works.
;;
;; 8) Configure you shell and add aliases:
;; alias emacs='/usr/local/bin/emacs'
;; alias e='/usr/local/bin/emacsclient -n'
;; alias ec='/usr/local/bin/emacsclient -t'
;;
;; 9) Make emacs a defult app for text files:
;; brew install duti
;; for i in .c .cpp .cc .h .hh .hpp .swift .m .go .xml .css .js .less .ex .erl .py .php .rb; do duti -s org.gnu.Emacs $i all; done
;; for i in .java .txt .md .org .sh .yaml .sql Makefile Dockerfile; do duti -s org.gnu.Emacs $i all; done

;; ---------------------------------------------------------------------------
;; Prelude settings
;; ---------------------------------------------------------------------------

;; add MELPA repository for packages
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

;; install additional packages
(prelude-require-packages '(multiple-cursors ess atom-one-dark-theme))

;; smooth scrolling
(setq prelude-use-smooth-scrolling t)

;; ---------------------------------------------------------------------------
;; Editor settings
;; ---------------------------------------------------------------------------

;; Don't show startup screen
(setq inhibit-startup-screen t)

;; Scroll line by line
;;(setq scroll-step 1)

;; scroll one line at a time (less "jumpy" than defaults)
;;(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
;(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
;;(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse

;; more space
(tool-bar-mode 0)

;; parenthesis highlighted
(setq show-paren-delay 0)
(setq show-paren-syle 'mixed)
(show-paren-mode 1)

;; Highlight current line:
(global-hl-line-mode 1)
;; (set-face-background 'hl-line "#555")

;; enable syntax coloring
;; (global-font-lock-mode t)
;; (setq font-lock-verbose nil)                  ;; no messages

;; highlight query
;; (setq query-replace-highlight t)

;; highlight incremental search
;; (setq search-highlight t)

;; search for open-paren till point-min
(setq blink-matching-paren-distance nil)

;; deleting region by typing or del (like Win)
(delete-selection-mode t)

;; show selected region
(setq transient-mark-mode t)

;; show line numbers
;; (global-linum-mode t) - switched off due to conflict with org-mode

;; show line number in status bar
(line-number-mode t)

;; show column number in status bar
(column-number-mode t)

;; switch off bell sound
(setq visible-bell t)

;; replace y-e-s by y
(fset 'yes-or-no-p 'y-or-n-p)

;; backup off
;; (setq make-backup-files nil)
;; (setq auto-save-default nil)

;; menu for recently opened files
(recentf-mode 1)

;; modern copy,cut,paste
(cua-mode t)

;; Tab using 4 spaces
(setq-default indent-tabs-mode nil)
(setq tab-width 4)
(setq standard-indent 4)

;; uniquify: unique buffer names
(setq
 uniquify-buffer-name-style 'post-forward
 uniquify-separator ":"
 ;; regenerate buffer names after killing a buffer
 uniquify-after-kill-buffer-p t
 ;; ignore buffers with *, *ielm*, *cscope* etc.
 uniquify-ignore-buffers-re "^\\*")

;; speedbar in frame
(setq speedbar-show-unknown-files t)

;; TRAMP use ssh
(setq tramp-default-method "ssh")

;; multi-term
(autoload 'multi-term "multi-term" nil t)
(autoload 'multi-term-next "multi-term" nil t)
(setq multi-term-program "/usr/local/bin/zsh")

;; load color theme
;; (load "naquadah-theme")
(load-theme 'atom-one-dark t)

;; macOS related settings:
(setq mac-right-option-modifier nil)
(setq locate-command "mdfind")

;; use English as default dictionary
(setq ispell-dictionary "en")
