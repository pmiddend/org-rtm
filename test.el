(add-to-list 'load-path ".")
(require 'rtm)

(defun assoc-value (symbol list)
  (cdr (assoc symbol list)))

(defun assoc-first-value (symbol list)
  (car (cdr (assoc symbol list))))

(defun org-rtm-print-list (rtml)
  (progn
    (concat
     "* "
     (assoc-value 'name (car (cdr rtml))))))

(defun org-rtm-print-entry (e)
  (let*
      ((topAssocList (cdr e))
       (taskAssocList (car topAssocList)))
    (progn
;      (print taskAssocList)
      (print (assoc 'notes topAssocList))
      (concat
       "** "
       (assoc-value 'name taskAssocList)
       " notes: "
       (assoc-first-value 'notes topAssocList)
       ))))

; map headlines
(mapcar 'org-rtm-print-list (rtm-lists-get-list))

(mapcar 'org-rtm-print-entry (cdr (cdr (car (rtm-tasks-get-list nil "status:incomplete")))))

(rtm-tasks-get-list nil "status:incomplete")
((list ((id . "35104378")) (taskseries (... ... ... ... ... ... ...) (tags nil) (participants nil) (notes nil ...) (task ...)) (taskseries (... ... ... ... ... ... ...) (tags nil) (participants nil) (notes nil) (task ...))))


((id . "277526819") (created . "2016-01-07T15:45:34Z") (modified . "2016-01-07T15:45:42Z") (name . "mitnotiz") (source . "js") (url . "") (location_id . ""))

((id . "264970492") (created . "2015-07-09T21:37:49Z") (modified . "2015-07-09T21:37:49Z") (name . "Chor Sarah Maschsee") (source . "android") (url . "") (location_id . ""))

((id . "277526238") (created . "2016-01-07T15:35:50Z") (modified . "2016-01-07T15:35:50Z") (name . "zweiter") (source . "js") (url . "") (location_id . ""))
("** mitnotiz" "** Chor Sarah Maschsee" "** zweiter")


(rtm-tasks-get-list "35104378")




