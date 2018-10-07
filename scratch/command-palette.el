;; (betafcc/make-editor)
(defun betafcc/make-minibuffer ()
  (setq betafcc/minibuffer-frame
    (make-frame `((name . "editor-minibuffer")
                  (background-color . "white")
                  (width . 70)
                  (height . 10)
                  (top . 0)
                  (minibuffer . only)
                  (undecorated . t)))))

(defun betafcc/make-editor  ()
  (unless (boundp 'betafcc/minibuffer-frame)
    (betafcc/make-minibuffer))
  (make-frame
   `((minibuffer . ,(frame-first-window betafcc/minibuffer-frame))))

  ;;(betafcc/add-hooks)
  )

(defun betafcc/add-hooks ()
  (add-hook 'minibuffer-setup-hook 'betafcc/show-minibuffer)
  (add-hook 'minibuffer-exit-hook 'betafcc/hide-minibuffer))

(defun betafcc/delete-editor (&optional editor-frame)
  (betafcc/detach-minibuffer)
  (delete-frame editor-frame))

(defun betafcc/detach-minibuffer ()
  (modify-frame-parameters
   betafcc/minibuffer-frame
   `((parent-frame . nil))))

(defun betafcc/show-minibuffer ()
  (make-frame-invisible betafcc/minibuffer-frame)

  (modify-frame-parameters
   betafcc/minibuffer-frame
   `((parent-frame . ,(selected-frame))
     (width . 70)
     (height . 10)
     (top . 0)))

  (betafcc/frame-center-horizontally betafcc/minibuffer-frame)
  (make-frame-visible betafcc/minibuffer-frame))

(defun betafcc/hide-minibuffer ()
  (let* ((parent-frame (frame-parent betafcc/minibuffer-frame))
         (top (frame-pixel-height parent-frame))
         (width (frame-pixel-width parent-frame)))

    (make-frame-invisible betafcc/minibuffer-frame)

    (modify-frame-parameters
     betafcc/minibuffer-frame
     `((top . ,top)
       (width . ,width)))))

(defun betafcc/frame-center-horizontally (child-frame)
  (modify-frame-parameters
   child-frame
   `((left . ,(- (/ (frame-pixel-width (frame-parent child-frame)) 2)
                 (/ (frame-pixel-width child-frame) 2))))))
