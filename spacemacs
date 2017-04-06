;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     (mu4e :variables mu4e-account-alist t)
     ruby
     csv
     rust
     sql
     clojure
     restclient
     nginx
     javascript
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     auto-completion
     better-defaults
     emacs-lisp
     (python :variables python-test-runner 'pytest)
     git
     html
     (erc :variables erc-server-list '(("stamkracht.irc.slack.com"
                                        :port 6667
                                        :ssl t
                                        :nick "erwin"
                                        :password nil)))
     yaml
     markdown
     syntax-checking
     slack
     spotify
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '((pytest :location (recipe
                                                         :fetcher github
                                                         :repo "ErwinJunge/pytest-el"))
                                      visual-regexp-steroids
                                      eredis
                                      password-store
                                      auth-password-store)
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '()
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'. (default t)
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. (default t)
   dotspacemacs-check-for-update t
   ;; One of `vim', `emacs' or `hybrid'. Evil is always enabled but if the
   ;; variable is `emacs' then the `holy-mode' is enabled at startup. `hybrid'
   ;; uses emacs key bindings for vim's insert mode, but otherwise leaves evil
   ;; unchanged. (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'.
   ;; (default '(recents projects))
   dotspacemacs-startup-lists '(recents projects)
   ;; Number of recent files to show in the startup buffer. Ignored if
   ;; `dotspacemacs-startup-lists' doesn't include `recents'. (default 5)
   dotspacemacs-startup-recent-list-size 5
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light
                         solarized-light
                         solarized-dark
                         leuven
                         monokai
                         zenburn)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; (Not implemented) dotspacemacs-distinguish-gui-ret nil
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil `Y' is remapped to `y$'. (default t)
   dotspacemacs-remap-Y-to-y$ t
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f), `find-spacemacs-file' (SPC f e s), and
   ;; `find-contrib-file' (SPC f e c) are replaced. (default nil)
   dotspacemacs-use-ido nil
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-micro-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'trailing
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  (setq mu4e-maildir "~/.mail"
        mu4e-get-mail-command "mbsync -a"
        mu4e-update-interval 1800
        mu4e-view-show-addresses t
        mu4e-headers-skip-duplicates t
        mu4e-change-filenames-when-moving t
        mu4e-hide-index-messages t
        mu4e-enable-mode-line t
        mu4e-view-show-images t)
  (setq mu4e-account-alist
        '(("erwin@stamkracht.com"
           ;; Under each account, set the account-specific variables you want.
           (mu4e-sent-messages-behavior delete)
           (mu4e-sent-folder "/erwin@stamkracht.com/sent")
           (mu4e-drafts-folder "/erwin@stamkracht.com/drafts")
           (mu4e-trash-folder "/erwin@stamkracht.com/trash")
           (mu4e-compose-signature
                 "<#part type=text/html><html><body>
<div class='gmail_signature' data-smartmail='gmail_signature'>
    <div dir='ltr'>
        <div class='gmail_signature' data-smartmail='gmail_signature'>
            <div dir='ltr'>
                <div>
                    <div dir='ltr'>
                        <font size='2'>
                            <span style='font-family:Roboto,sans-serif;line-height:24px'>
                                <b>Erwin Junge</b>
                            </span><br>

                            <font color='#A5A5A5' style='font-family:Roboto,sans-serif;line-height:24px'>
                                Backend Developer
                            </font><br>

                            <span style='font-family:Roboto,sans-serif;line-height:24px'>
                                <a href='mailto:erwin@stamkracht.com' target='_blank'>erwin@stamkracht.com</a>
                            </span><br>
                            <br>

                            <span style='font-family:Roboto,sans-serif;line-height:24px'>
                                020 2108008
                            </span><br>
                        </font>

                        <a href='http://stamkracht.com' target='_blank'>
                            <img alt='www.stamkracht.com' src='http://www.stamkracht.com/media/images/Email_Footer_SKTCC_Erwin.original.png' width='420' height='214'>
                        </a>
                        <br>

                        <font size='2' color='#A5A5A5' style='font-family:Roboto,sans-serif;line-height:24px'>
                            Adres: Oostenburgervoorstraat 72, 1018MR, Amsterdam
                        </font><br>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body></html><#/part>" )
           (user-mail-address "erwin@stamkracht.com")
           (user-full-name "Erwin Junge")
           (message-send-mail-function smtpmail-send-it)
           (smtpmail-stream-type starttls)
           (smtpmail-default-smtp-server "smtp.gmail.com")
           (smtpmail-smtp-server "smtp.gmail.com")
           (smtpmail-smtp-user "erwin@stamkracht.com")
           (smtpmail-smtp-service 587))))
  (setq mu4e-alert-interesting-mail-query
        (concat
         "flag:unread"
         " AND maildir:/erwin@stamkracht.com/inbox"))
  (mu4e/mail-account-reset)
  (mu4e t)
  (defun get-slack-secret (type)
    (funcall
     (plist-get
      (nth 0
           (auth-source-search :max 1
                               :host (concat type ".stamkracht.slack.com")
                               :require '(:secret)))
      :secret)))
  (slack-register-team
   :name "stamkracht"
   :default t
   :client-id (get-slack-secret "client-id")
   :client-secret (get-slack-secret "client-secret")
   :token (get-slack-secret "token")
   :subscribed-channels '(general scope))
  (setq alert-default-style 'libnotify)
  (put 'project-venv-name 'safe-local-variable #'stringp)
  (add-hook 'python-mode-hook (lambda ()
                                (hack-local-variables)
                                (when (boundp 'project-venv-name)
                                  (pyvenv-workon project-venv-name))))
  (setq-default pytest-cmd-flags "-s --lf")
  (setq web-mode-engines-alist '(("django"    . "\\.html\\'")))
  (setq web-mode-markup-indent-offset 2)
  (set-default 'tramp-default-proxies-alist (quote ((".*" "\\`root\\'" "/ssh:%h:"))))
  (defun sudo-edit-current-file ()
    (interactive)
    (let ((position (point)))
      (find-alternate-file
       (if (file-remote-p (buffer-file-name))
           (let ((vec (tramp-dissect-file-name (buffer-file-name))))
             (tramp-make-tramp-file-name
              "sudo"
              (tramp-file-name-user vec)
              (tramp-file-name-host vec)
              (tramp-file-name-localname vec)))
         (concat "/sudo:root@localhost:" (buffer-file-name))))
      (goto-char position)))
  (spacemacs/set-leader-keys "os" 'sudo-edit-current-file)
  (setq erc-ignore-list '("SK_Dashboard" "Beanstalk" "SLACK" "Nagios" "You have joined channel" "Topic for" "Users on"))
  (defun next-song ()
    (interactive)
    (require 'eredis)
    (eredis-connect "localhost" "6379")
    (eredis-publish "commands" "next"))
  (spacemacs/set-leader-keys "on" 'next-song)
  (auth-pass-enable)
  (spacemacs/set-leader-keys "op" 'password-store-copy))
;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (spotify helm-spotify multi mu4e-maildirs-extension mu4e-alert auth-password-store password-store toml-mode slack emojify circe oauth2 websocket ht racer flycheck-rust csv-mode cargo rust-mode alert log4e gntp rvm ruby-tools ruby-test-mode rubocop rspec-mode robe rbenv rake minitest chruby bundler inf-ruby sql-indent clojure-snippets clj-refactor inflections edn paredit peg cider-eval-sexp-fu cider seq queue clojure-mode restclient ob-http nginx-mode powerline spinner org markdown-mode hydra parent-mode projectile request haml-mode gitignore-mode pos-tip pkg-info epl flx magit-popup git-commit with-editor iedit evil goto-chg undo-tree highlight diminish web-completion-data company bind-map bind-key yasnippet packed anaconda-mode pythonic f dash s avy async auto-complete popup package-build flycheck visual-regexp hide-comnt web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc company-tern dash-functional tern coffee-mode anzu smartparens helm helm-core magit helm-purpose window-purpose imenu-list eredis evil-unimpaired yapfify yaml-mode ws-butler window-numbering which-key web-mode volatile-highlights visual-regexp-steroids vi-tilde-fringe uuidgen use-package toc-org tagedit spacemacs-theme spaceline smeargle slim-mode scss-mode sass-mode restart-emacs rainbow-delimiters quelpa pyvenv pytest pyenv-mode py-isort pug-mode popwin pip-requirements persp-mode pcre2el paradox orgit org-plus-contrib org-bullets open-junk-file neotree mwim move-text mmm-mode markdown-toc magit-gitflow macrostep lorem-ipsum live-py-mode linum-relative link-hint less-css-mode info+ indent-guide ido-vertical-mode hy-mode hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation help-fns+ helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag google-translate golden-ratio gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md flycheck-pos-tip flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu erc-yt erc-view-log erc-social-graph erc-image erc-hl-nicks emoji-cheat-sheet-plus emmet-mode elisp-slime-nav dumb-jump define-word cython-mode company-web company-statistics company-emoji company-anaconda column-enforce-mode clean-aindent-mode auto-yasnippet auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
