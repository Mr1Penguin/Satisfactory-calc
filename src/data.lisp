(defpackage satisfactory-calc/data
  (:use :cl :satisfactory-calc/types)
  (:export :load-db))
(in-package :satisfactory-calc/data)

;; iron ignot

(defvar iron-ignot-recipe (satisfactory-calc/types::make-recipe :input (list (cons "Iron ore" 30.0))
                                                                :output "Iron ignot"
                                                                :per-min 30.0))
(defvar iron-alloy-ignot-recipe (satisfactory-calc/types::make-recipe :input (list (cons "Iron ore" 20.0)
                                                                                   (cons "Copper ore" 20.0))
                                                                      :output "Iron ignot"
                                                                      :per-min 50.0))

(defvar *default-db* (list (cons :items (list (satisfactory-calc/types::make-item :name "Iron ore")
                                              (satisfactory-calc/types::make-item :name "Copper ore")
                                              (satisfactory-calc/types::make-item :name "Crude oil")
                                              (satisfactory-calc/types::make-item :name "Coal")
                                              (satisfactory-calc/types::make-item :name "S.A.M")
                                              (satisfactory-calc/types::make-item :name "Limestone")
                                              (satisfactory-calc/types::make-item :name "Quartz")
                                              (satisfactory-calc/types::make-item :name "Iron ignot"
                                                                                  :recipes (list iron-ignot-recipe))))
                           (cons :nodes '())
                           (cons :buildings '())
                           (cons :miners-mk 1)
                           (cons :request nil)
                           (cons :result nil)))

(defvar *db* nil)

(defun create-data-directory ()
  (ensure-directories-exist "~/.scl/"))

(defun get-db-file (basepath)
  (merge-pathnames basepath "db.lisp"))

(defun safe-db (filename)
  (with-open-file (out filename :direction :output
                                :if-exists :supersede)
    (with-standard-io-syntax (print *db* out))))

(defun load-db (filename)
  (handler-case (with-open-file (in filename :if-does-not-exist :error)
                  (with-standard-io-syntax (setf *db* (read in))))
    (file-error nil
      (setf *db* *default-db*)))
  t)

(defun get-item (name)
  (find-if (lambda (x) (equal (satisfactory-calc/types::item-name x) name)) (cdr (assoc :items *db*))))
