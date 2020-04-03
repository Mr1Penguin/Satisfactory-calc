(defpackage satisfactory-calc/types
  (:use :cl))
(in-package :satisfactory-calc/types)

(defstruct building
  (name "No name" :type string)
  (base-power 0.0 :type float)
  (enabled nil :type boolean))

(defstruct item
  (name "No name" :type string)
  (recipes #() :type vector))

(defstruct recipe
  (input #() :type vector)
  (output nil :type item)
  (per-min 0.0 :type float))

(defparameter *purity* '((:impure . 30) (:normal . 60) (:pure . 120)))

(defstruct resource-node
  (resource "" :type string)
  (per-min 0.0 :type float)
  (purity :normal :type keyword))
