(defpackage satisfactory-calc/tests/main
  (:use :cl
        :satisfactory-calc
        :rove))
(in-package :satisfactory-calc/tests/main)

;; NOTE: To run this test file, execute `(asdf:test-system :satisfactory-calc)' in your Lisp.

(deftest test-target-1
  (testing "should (= 1 1) to be true"
    (ok (= 1 1))))
