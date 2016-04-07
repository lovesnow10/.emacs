(eval-after-load "semantic"
  '(progn
     ;; any other config specific to sql
     (defun my-semantic-hook ()
       (semantic-add-system-include "/usr/include/wx-2.8" 'c++-mode)
       (semantic-add-system-include "/usr/include/wx-2.8/wx/gtk" 'c++-mode)
       )
     (add-hook 'semantic-init-hooks 'my-semantic-hook)
     ))

;Try completion with semantic-mode, it may slow the emacs,
;`M-x complete-symbol` (Hotkey: C-M-i) will trigger the completion
; Uncomment below code if you want semantic plus complete-symbol
(setq semantic-default-submodes '(global-semantic-idle-scheduler-mode
                                  global-semanticdb-minor-mode
                                  global-semantic-idle-summary-mode
                                  global-semantic-mru-bookmark-mode
                                  semantic-load-enable-code-helpers))
(semantic-mode 1)
(global-semantic-highlight-edits-mode (if window-system 1 -1))
(global-semantic-show-unmatched-syntax-mode 1)
(global-semantic-show-parser-state-mode 1)
(defconst user-include-dirs
(list ".." "../include" "../inc" "../common" "../public"
      "../.." "../../include" "../../inc" "../../common" "../../public"
      "/Applications/root_v6.04.10/include"))
(let ((include-dirs user-include-dirs))
     (mapc (lambda (dir)
        (semantic-add-system-include dir 'c++-mode)
        (semantic-add-system-include dir 'c-mode))
     include-dirs))

;(semantic-load-enable-code-helpers)
;(setq semanticdb-search-system-databases t)


;(add-to-list 'completion-at-point-functions 'semantic-completion-at-point-function)

(provide 'init-semantic)

