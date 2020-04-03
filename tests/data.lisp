(defpackage satisfactory-calc/tests/data
  (:use :cl
        :satisfactory-calc/data
        :rove))
(in-package :satisfactory-calc/tests/data)

(deftest load-db-return-default
  (let ((filename "~/.scl/test.lisp"))
    (handler-case (delete-file filename)
      (file-error nil nil))
    (testing "should return default db if file not accessible"
      (ok (load-db filename))
      (ok (equal satisfactory-calc/data::*default-db* satisfactory-calc/data::*db*)))))

(deftest save-load-db
  (testing "should make save-load cycle"
    (let ((file (merge-pathnames (satisfactory-calc/data::create-data-directory) "test.lisp"))
	  (data #(1 2 3)))
      (setf satisfactory-calc/data::*db* data)
      (satisfactory-calc/data::safe-db file)
      (ok (probe-file file))
      (ok (load-db file))
      (ok (equalp data satisfactory-calc/data::*db*))
      (handler-case (delete-file file)
	(file-error nil nil)))))
