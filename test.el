(add-to-list 'load-path ".")
(require 'rtm)

(defun assoc-value (symbol list)
  (cdr (assoc symbol list)))

(defun assoc-first-value (symbol list)
  (car (cdr (assoc symbol list))))

(defun concat-string-list (ss) (apply #'concat ss))

(defun org-rtm-print-list (rtml)
  (progn
    (concat
     "* "
     (assoc-value 'name (car (cdr rtml))))))

(defun org-rtm-format-note (note)
  (nth 2 note))

(defun org-rtm-format-notes (notes-list)
  (cond (
	 (equal (length notes-list) 0)
	 "")
	 (t (concat "\n" (mapconcat 'org-rtm-format-note notes-list "\n")))))

(defun org-rtm-print-entry (e)
  (let*
      ((topAssocList (cdr e))
       (taskAssocList (car topAssocList))
       (notes-list (nthcdr 2 (assoc 'notes topAssocList))))
    (progn
      (concat
       "** "
       (assoc-value 'name taskAssocList)
       (org-rtm-format-notes notes-list)))))

(defun org-rtm-format-list-entries (list-id)
  (mapconcat 'org-rtm-print-entry (nthcdr 2 (car (rtm-tasks-get-list list-id "status:incomplete"))) "\n"))

(defun org-rtm-format-list (list-id list-name)
  (progn
    (print list-id)
    (concat "* " list-name "\n" (org-rtm-format-list-entries list-id))))

(defun org-rtm-format-lists ()
  (mapcar (lambda (list) (org-rtm-format-list (assoc-value 'id (nth 1 list)) (assoc-value 'name (nth 1 list)))) (rtm-lists-get-list)))

(org-rtm-format-lists)

((list ((id . "35104378") (name . "Inbox") (deleted . "0") (locked . "1") (archived . "0") (position . "-1") (smart . "0") (sort_order . "0"))) (list ((id . "35104382") (name . "Sent") (deleted . "0") (locked . "1") (archived . "0") (position . "1") (smart . "0") (sort_order . "0"))))


; map headlines
(mapcar 'org-rtm-print-list (rtm-lists-get-list))

(rtm-tasks-get-list nil "status:incomplete")
((list ((id . "35104378")) (taskseries (... ... ... ... ... ... ...) (tags nil) (participants nil) (notes nil ...) (task ...)) (taskseries (... ... ... ... ... ... ...) (tags nil) (participants nil) (notes nil) (task ...))))


((id . "277526819") (created . "2016-01-07T15:45:34Z") (modified . "2016-01-07T15:45:42Z") (name . "mitnotiz") (source . "js") (url . "") (location_id . ""))

((id . "264970492") (created . "2015-07-09T21:37:49Z") (modified . "2015-07-09T21:37:49Z") (name . "Chor Sarah Maschsee") (source . "android") (url . "") (location_id . ""))

((id . "277526238") (created . "2016-01-07T15:35:50Z") (modified . "2016-01-07T15:35:50Z") (name . "zweiter") (source . "js") (url . "") (location_id . ""))
("** mitnotiz" "** Chor Sarah Maschsee" "** zweiter")


(rtm-tasks-get-list "35104378")




