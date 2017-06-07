;; spaceline configuration file

(use-package spaceline
  :ensure t
  :config
  (setq-default mode-line-format '("%e" (:eval (spaceline-ml-main)))))

(use-package spaceline-config
  :ensure spaceline
  :config
  (spaceline-helm-mode 1)
  (spaceline-emacs-theme)
  (setq-default
   powerline-height 24
   powerline-default-separator 'slant
   spaceline-separator-dir-left '(right . right)
   spaceline-separator-dir-right '(left . left))
  (spaceline-install
    'main
    '((buffer-modified :face region)
      (projectile-root :face powerline-active2)
      ((buffer-id which-function) :separator " @ " :face powerline-active1)
      (anzu :when active :face spaceline-modified))
    '((selection-info :face spaceline-modified :when mark-active)
      (version-control)
      (global :when active)
      (line-column)
      (major-mode :face region)))

  ;; Mac config
  (when (eq system-type 'darwin)
    (setq
     powerline-height 32
     powerline-default-separator 'alternate)))

(provide 'spaceline.config)
