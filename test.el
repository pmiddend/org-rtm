; TODO: CREATED: [...]
; TODO: SCHEDULED: [...] ggf.
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

(defun org-rtm-complete-items (list-id)
  (mapcar
   (lambda (taskseries-w-task)
     (rtm-tasks-complete list-id (car taskseries-w-task) (cdr taskseries-w-task)))
   (org-rtm-retrieve-taskseries-id-with-task-list list-id)))

(defun org-rtm-retrieve-taskseries-id-with-task-list (list-id)
  (mapcar
   (lambda (list)
     `(,(assoc-value 'id (nth 1 list)) . ,(assoc-value 'id (car (assoc-value 'task (nthcdr 2 list))))))
   (nthcdr 2 (car (rtm-tasks-get-list list-id "status:incomplete")))))

(defun org-rtm-retrieve-list-ids ()
  (mapcar (lambda (list) (assoc-value 'id (nth 1 list))) (rtm-lists-get-list)))

(org-rtm-retrieve-list-ids)
(org-rtm-format-lists)
(org-rtm-complete-items "35104378")

