(add-to-list 'load-path ".")
(require 'rtm)

(defun org-rtm-print-list (rtml)
  (progn
; debug print    
;    (print (car (cdr rtml)))
    (concat "* " (cdr (assoc 'name (car (cdr rtml)))))
  )
)

; map headlines
(mapcar 'org-rtm-print-list (rtm-lists-get-list))


