;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;(require 'package)
;(package-initialize)
;(add-to-list 'package-archives 
   	    ;'("marmalade" . "http://marmalade-repo.org/packages/")
;	     '("melpa-stable" . "https://stable.melpa.org/"))
;(package-initialize)
;;The lines just below add melpa and marmalade packages available for download.
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/")t)
(package-initialize)
					;(require 'package)
;(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
;                    (not (gnutls-available-p))))
;       (proto (if no-ssl "http" "https")))
;  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
;  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
;  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
;  (when (< emacs-major-version 24)
;    ;; For important compatibility libraries like cl-lib
;    (add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/")))))
;(package-initialize)
;; Install Elpy, magit, blacken, ivy, org-alert,org-wild-notifier, use-package by M-x package-install 'use-package', wakatime which is a productivity tracker for emacs.
;; At this point I have no clue if it is actually anything worth it so I am testing it right now. You basically enable it then it records your productivity and gives a visual display on it.
;;To get auto complete working install elpy then do =M-x + elpy-config= and change Python path if it isn't working.
;;Then do =M-x + elpy-black-fix-code=
;;Install =treemacs=, this thing is dope.
;;============================================
;;Treemacs https://github.com/Alexander-Miller/treemacs
;;============================================
;;Multiple cursors
;; https://github.com/magnars/multiple-cursors.el
;;Install Ace-Jump-Mode. People keep raving about this so I am abou tto test it out.
;; use C-c SPC then enter a word or part of a word
;;Yep, it is pretty fucking nice. Install ace-popup-menu as well.
(global-set-key (kbd "C-c SPC") 'ace-jump-mode) 
;(require 'ace-popup-menu)
;(ace-popup-menu-mode 1)
;The above isn't working. I think it is because Smex is enabled.

(require 'multiple-cursors);M-x occur goes great with this.

(global-set-key (kbd "C-S-c C-s-c") 'mc/edit-lines)

(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(global-unset-key (kbd "M-<down-mouse-1>"))
(global-set-key (kbd "M-<mouse-1>") 'mc/add-cursor-on-click);mouse-1 means left clicking with my mouse.


;;Symon
(require 'symon)
(symon-mode)

;enables dashboard that spacemacs has
;(require 'dashboard)
;(dashboard-setup-startup-hook)
;;; Or if you use use-package
;(use-package dashboard
;  :ensure t
;  :config
;  (dashboard-setup-startup-hook))
;This made emacs incridibly slow for me so I commented it out. Like, so slow I can't even see what I am typing, slow.
(custom-set-variables
 '(zoom-mode t))

(custom-set-variables
 '(zoom-size '(0.618 . 0.618)))

;;Elfeed to listen to podcasts within emacs
(global-set-key (kbd "C-x w") 'elfeed)
;
;(setq ravar/elfeed-podcast-dir "C:/Users/Hank/Music/Podcasts")
;(defun ravar/elfeed-play-enclosure-mpd ()
;  "Downloads the item in the enclosure and starts playing once in mpd using mpc"
;  (interactive)
;  (let* ((entry elfeed-show-entry)
;	 (enclosure-index (elfeed--get-enclosure-num
;			   "Enclosure to save" entry))
;	 (url-enclosure (car (elt (elfeed-entry-enclosures entry)
;				  (- enclosure index 1))))
;	 (fname
;	  (funcall elfeed-show-enclosure-filename-function
;		   entry url-enclosure)))
;    (start-process-shell-command
;     "Play enclosure" nil
;     (format "cd %s; curl %s;mpc update; mpc search filename %s | mpc insert; mpc next"
;	     ravar/elfeed-podcast-dir url-enclosure fname))))
;(define-key elfeed-show-mode-map (kbd "o") 'ravar/elfeed-play-enclosure-mpd)

;======================================================================
;https://github.com/emacs-tw/awesome-emacs
;======================================================================

;;SEt up EMMS to play mp3 files inside of emacs
(use-package emms
  :ensure t
  :config)
(require 'emms-setup)
(require 'emms-player-mplayer)
(emms-all)
(setq emms-player-list '(
                         emms-player-mpg321
                         emms-player-ogg123
                         emms-player-mplayer))
;(defun emms-player-mplayer-volume(amount)
;  (process-send-string
;   emms-player-simple-process-name
;   (format "volume %d\n" amount)))
;(setq emms-volume-change-function 'emms-player-mplayer-volume)
;(emms-add-directory-tree emms-source-file-default-directory)
;)



;;Bruh, hyperspace is dope. 
;;Changing key binding for minor mode
(eval-after-load "hyperspace"
  (lambda () (define-key hyperspace-minor-mode-map "\C-ca" #'hyperspace)))
(global-set-key (kbd "C-c s") 'hyperspace);;C-c s is now hyper space enter and is a beatutiful thing.
;; load emacs 24's package system. Add MELPA repository.
;(when (>= emacs-major-version 26)
;  (require 'package)
;  (add-to-list
;   'package-archives
;   '("melpa" . "http://stable.melpa.org/packages/") ; many packages won't show if using stable
;   '("melpa" . "http://melpa.milkbox.net/packages/")
;   t))
;(add-to-list 'package-archives
;             '("melpa" . "http://melpa.org/packages/") t)

;; Global key bind to set 'g' for git in magit
(global-set-key (kbd"C-x g") 'magit-status)


;;Centaur Tabs https://github.com/ema2159/centaur-tabs
(use-package centaur-tabs
  :demand
  :config
  (centaur-tabs-mode t)
  :bind
  ("C-<prior>" . centaur-tabs-backward)
  ("C-<next>" . centaur-tabs-forward))
(centaur-tabs-headline-match)
(setq centaur-tabs-style "slant")
(setq centaur-tabs-set-icons t)
(setq centaur-tabs-set-bar 'under)
(setq centaur-tabs-close-button "X")
(setq centaur-tabs-set-modified-marker t)
(setq centaur-tabs-modified-marker "*")

;; Global key bind to my init file. This will obviously need to have the path changed for the specific location of the init file.
(global-set-key (kbd"C-x i") (lambda () (interactive)(find-file "C:\\Users\\Hank\\AppData\\Roaming\\.emacs")))

;;Global key bind to my postgres development space
(global-set-key (kbd"C-x p") (lambda () (interactive)(find-file "C:\\Users\\Hank\\Documents\\Random Python Scripts\\postgres-odbc\\tkinterdataPsycop.py")))



;; Mute that annoying ass beep
(setq visible-bell 1)

;;Adding WindMove to make it so that hold shift and hitting the arrows moves through
;;the available buffers rather than hitting C-x o
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

;; Status bar editing https://github.com/purcell/ergoemacs-statu cs
;(require 'ergoemacs-status)
;(ergoemacs-status-mode)

;;Spaceline
(require 'spaceline-config)
(spaceline-spacemacs-theme)
;(use-package spaceline-config :ensure spaceline
;  :config
;  (spaceline-ivy-mode 1)
;  (spaceline-install
;   'main
;   '((buffer-modified)
;     ((remote-host buffer-id) :face highlight-face)
;     (process :when active))
;   '((selection-info :face 'region :when mark-active)
;     ((flycheck-error flycheck-warning flycheck-info) :when active)
;     (which-function)
;     (version-control :when active)
;     (line-column)
;     (global :when active)
;     (major-mode))))

(setq-default
 powerline-height 24
 powerline-default-separator 'wave
 spaceline-separator-dir-left '(right . right)
 spaceline-separator-dir-right '(left . left))

;;(package-install 'spaceline-all-the-icons)

;;(require 'spaceline-all-the-icons)
;; or
;;(use-package spaceline-all-the-icons)
;;(use-package spaceline-all-the-icons 
;;  :after spaceline
;;  :config (spaceline-all-the-icons-theme))



;; -*- mode: elisp -*-
;; Disable the splash screen(to enable again replace t with 0)
(setq inhibit-splash-screen t)

;;============================
;; Org mode configuration
;;============================
;; Enable org mode
(require 'org)
;;Should let YaSnippet work within org-mode, fingers crossed.
;;This works but to enable snippets you have to do =M-x + yas-minor-mode-on= and snippets will work.
(defun my-org-mode-hook ()
  (setq-local yas-buffer-local-condition
              '(not (org-in-src-block-p t))))
(add-hook 'org-mode-hook #'my-org-mode-hook)


;; fix some org-mode + yasnippet conflicts:
(defun yas/org-very-safe-expand ()
  (let ((yas/fallback-behavior 'return-nil)) (yas/expand)))

(add-hook 'org-mode-hook
          (lambda ()
            (make-variable-buffer-local 'yas/trigger-key)
            (setq yas/trigger-key [tab])
            (add-to-list 'org-tab-first-hook 'yas/org-very-safe-expand)
            (define-key yas/keymap [tab] 'yas/next-field)))


;; customizations from https://zzamboni.org/post/beautifying-org-mode-in-emacs/ 
;;Hides the markup emphasis ie ** or _ _ or //
(setq org-hide-emphasis-markers t)

;;Better looking bullets, should make the org bullets look much better.
;;(require 'org-bullets)
;;(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
;;(setq inhibit-compacting-font-caches t) ;; Org-bullets is making my org mode insanely slow so I am using this to speed it up as per https://github.com/sabof/org-bullets/issues/11.

;;(setq alert-default-style 'libnotify)
;;Changing the default alert style setting to see what other notifications look like
;;(setq alert-default-style 'fringe) ;;Does something...
;;(setq alert-default-style 'mode-line) ;;not a fan
;;Need to install notification system on computer first. So for Windows it is BurntToast
;;saved at C:\Users\Hank\Documents\WindowsPowerShell\modules\BurntToast
;;=====================================================
;;Setting up Toaster notifications on Windows 10 (uck)
(add-to-list 'load-path "C:/Users/Hank/Documents/WindowsPowerShell/modules/BurntToast")
(add-to-list 'load-path "C:/Users/Hank/AppData/Roaming/erc-burnt-toast-master")
(eval-after-load 'erc-match
  (progn (require 'erc-burnt-toast)
	 (erc-burnt-toast-mode 1)))


;;Adding curl to my load path
(add-to-list 'exec-path "C:/Windows/System32/")
;;Adding mplayer to my load path
;(add-to-list 'load-path "C:/Users/Hank/AppData/mplayer-svn-38117/mplayer-svn-38117/mplayer.exe")
(add-to-list 'exec-path
              "C:/Users/Hank/AppData/mplayer-svn-38117/mplayer-svn-38117/")
(setq alert-default-style 'toaster) ;;ehh




(setq org-todo-keywords
      '((sequence "TODO" "IN-PROGRESS" "WAITING" "DONE")))

(global-set-key "\C-ca" 'org-agenda)

(setq org-tag-alist
      '(("@work" . ?w)("@LowPriority" . ?L) ("@MediumPriority" . ?M)("@HighPriority" . ?H) ("@home" . ?h) ("laptop" . ?l)))



;;Smex which is basically a better version of M-x
(require 'smex) ; Not needed if you use package.el
(smex-initialize) ; Can be omitted. This might cause a (minimal) delay
                    ; when Smex is auto-initialized on its first run.

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
  ;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;;Nyan-mode
(require 'nyan-mode)
(nyan-mode 1)
;(nyan-start-animation 1)
(eshell 1)

;;======================
;; Development Setup
;;======================
(require 'use-package)
;;git gutter(shows what is new)https://github.com/emacsorphanage/git-gutter
;;(git-gutter-mode 1)


;;This is for Ivy
(ivy-prescient-mode 1)
;;(use-package ivy :demand
;;	     :config
;;	     (setq ivy-use-virtual-buffers t
;;		   ivy-count-format "d/%d"))
(ivy-mode 1) ;;This sets ivy-mode on by default
(global-set-key (kbd "C-s") 'swiper) ;;Replaces I-search with Swiper
;; To scroll up or down in swiper do C-p and C-n and to open swiper use C-s
(global-linum-mode t)
(elpy-enable)
;;Hopefully gets blacken to work
(use-package blacken
    :hook (python-mode . blacken-mode)
    :config
    (setq blacken-line-length '88))

;;Should fix the indentation issue with yasnippet, it works, thank god. That was so damn annoying
(setq yas-indent-line nil);;Doesn't solve the issue inside of a function. FML.

;;Setting up py-autopep8 to automatically format python code because blacken still isn't working for me.
(defcustom python-autopep8-path (executable-find "autopep8")
  "C:/Users/Hank/Anaconda3/Scripts/autopep8.exe"
  ;;C:\Users\Hank\Anaconda3\Scripts
  :group 'python
  :type 'string)

(defun python-autopep8 ()
  "Automatically formats Python code to conform to the PEP 8 style guide.
$ autopep8 --in-place --aggressive --aggressive <filename>"
  (interactive)
  (when (eq major-mode 'python-mode)
    (shell-command 
     (format "%s --in-place --aggressive %s" python-autopep8-path
             (shell-quote-argument (buffer-file-name))))
    (revert-buffer t t t)))

(bind-key "C-c C-a" 'elpy-black-fix-code)

(eval-after-load 'python
  '(if python-autopep8-path
       (add-hook 'before-save-hook 'python-autopep8)))

;;(use-package direnv
;; :config
;; (direnv-mode))

;;Gives the ability to run Julia code
(require 'julia-mode)

;;Symbol hightlighting [https://github.com/nschum/highlight-symbol.el]
;;Enable the highlight-symbol-mode to have it highlight every occurance of the word your cursor is on.
(require 'highlight-symbol)
(global-set-key [(control f3)] 'highlight-symbol);;This is super useful
(global-set-key [f3] 'highlight-symbol-next)
(global-set-key [(shift f3)] 'highlight-symbol-prev)
(global-set-key [(meta f3)] 'hightlight-symbol-query-replace)

;;SEt Ranger shortcut
(global-set-key (kbd "C-c r") 'ranger)

;;=================================
;;Org mode customizations
;;=================================
(setq org-export-with-section-numbers nil);;Gets rid of the numbered sections
(setq org-list-description-max-indents 5) ;; Sets max indentation for description lists to 5

;;Enable python code evaluation in org-mode
;(org-babel-do-load-languages
; 'org-babel-load-languages
; '(python . t))
;(org-babel-do-load-languages
; 'org-babel-load-languages
; '((emacs-lisp . nil)
					;   (R . t)))
(org-babel-do-load-languages
 'org-babel-load-languages '((python . t)))
(require 'python)

(setq org-adapt-indentation nil) ;;Prevent demoting heading also shifting text inside sections.
(require 'alert)
(require 'org-alert)
;;Auto compelete
;; Completion words longer than 4 characters
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-ispell-fuzzy-limit 4)
 '(ac-ispell-requires 4)
 '(ace-popup-menu-mode t)
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(column-number-mode t)
 '(custom-enabled-themes (quote (leuven)))
 '(custom-safe-themes
   (quote
    ("2f1518e906a8b60fac943d02ad415f1d8b3933a5a7f75e307e6e9a26ef5bf570" "dbade2e946597b9cda3e61978b5fcc14fa3afa2d3c4391d477bdaeff8f5638c5" "7b3d184d2955990e4df1162aeff6bfb4e1c3e822368f0359e15e2974235d9fa8" "6c3b5f4391572c4176908bb30eddc1718344b8eaff50e162e36f271f6de015ca" "6b80b5b0762a814c62ce858e9d72745a05dd5fc66f821a1c5023b4f2a76bc910" "e074be1c799b509f52870ee596a5977b519f6d269455b84ed998666cf6fc802a" "d4131a682c4436bb5a61103d9a850bf788cbf793f3fd8897de520d20583aeb58" "2d035eb93f92384d11f18ed00930e5cc9964281915689fa035719cab71766a15" "37768a79b479684b0756dec7c0fc7652082910c37d8863c35b702db3f16000f8" default)))
 '(elfeed-feeds
   (quote
    ("https://rss.acast.com/the-little-dum-dum-club-with-tommy-and-karl" "http://goodchatcomedy.com/index.php/feed/carr-crash/" "https://www.omnycontent.com/d/playlist/cf92379f-6cb4-4ad2-8504-a7310004d9dd/a9d5bfcb-e57d-4feb-a7dd-a8e00028a551/e45f954e-abe4-4ac7-b4e9-a8e0002a0b97/podcast.rss" "https://open.spotify.com/show/3VdnwB8rqoO4br3p4Vg50X" "http://www.50ply.com/atom.xml" "https://podcasts.google.com/feed/aHR0cHM6Ly93d3cub21ueWNvbnRlbnQuY29tL2QvcGxheWxpc3QvY2Y5MjM3OWYtNmNiNC00YWQyLTg1MDQtYTczMTAwMDRkOWRkL2E5ZDViZmNiLWU1N2QtNGZlYi1hN2RkLWE4ZTAwMDI4YTU1MS9lNDVmOTU0ZS1hYmU0LTRhYzctYjRlOS1hOGUwMDAyYTBiOTcvcG9kY2FzdC5yc3M" "https://play.acast.com/s/filthycasualswithtommydassalobenvernelandadamknox/" "https://play.acast.com/s/filthycasualswithtommydassalobenvernelandadamknox" "https://www.podparadise.com/Podcast/1511471064" "https://podcasts.google.com/feed/aHR0cHM6Ly93d3cub21ueWNvbnRlbnQuY29tL2QvcGxheWxpc3QvY2Y5MjM3OWYtNmNiNC00YWQyLTg1MDQtYTczMTAwMDRkOWRkL2E5ZDViZmNiLWU1N2QtNGZlYi1hN2RkLWE4ZTAwMDI4YTU1MS9lNDVmOTU0ZS1hYmU0LTRhYzctYjRlOS1hOGUwMDAyYTBiOTcvcG9kY2FzdC5yc3M?sa=X&ved=2ahUKEwiq04z_t9zrAhUJzp4KHWqtDEYQ9sEGegQIARAC")))
 '(elpy-rpc-python-command "python3")
 '(hyperspace-minor-mode nil)
 '(ivy-mode t)
 '(org-agenda-files
   (quote
    ("c:/Users/Hank/Emacs(DontTouch)/1.org" "c:/Users/Hank/Emacs(DontTouch)/DevThoughts.org" "c:/Users/Hank/Emacs(DontTouch)/Chillers.org")))
 '(package-selected-packages
   (quote
    (zoom fireplace parrot symon dashboard ace-popup-menu doom-themes tao-theme rainbow-delimiters poet-theme simple-mpc vlc bongo emms elfeed ranger ace-jump-mode centaur-tabs nyan-mode spaceline-all-the-icons spaceline torus ivy-prescient multiple-cursors hyperspace wakatime-mode smex nord-theme treemacs-icons-dired treemacs-magit treemacs major-mode-icons highlight-symbol julia-mode direnv use-package py-autopep8 org-alert ac-ispell counsel magit dash)))
 '(size-indication-mode t))
(eval-after-load "auto-complete"
 '(progn
     (ac-ispell-setup)))

(add-hook 'git-commit-mode-hook 'ac-ispell-ac-setup)
(add-hook 'mail-mode-hook 'ac-ispell-ac-setup)

;;=======================================
;;

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
