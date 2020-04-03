(defpackage satisfactory-calc/data
  (:use :cl)
  (:export :load-db))
(in-package :satisfactory-calc/data)

(defvar *default-db*
  (list (cons :items #())
	(cons :nodes #())))

(defvar *db* nil)

(defun create-data-directory ()
  (ensure-directories-exist "~/.scl/"))

(defun get-db-file (basepath)
  (merge-pathnames basepath "db.lisp"))

(defun safe-db (filename)
  (with-open-file (out filename
		       :direction :output
		       :if-exists :supersede)
    (with-standard-io-syntax
      (print *db* out))))

(defun load-db (filename)
  (handler-case
      (with-open-file (in filename
			  :if-does-not-exist :error)
	(with-standard-io-syntax
	  (setf *db* (read in))))
    (file-error nil
      (setf *db* *default-db*)))
  t)
