(defsystem "satisfactory-calc"
  :version "0.1.0"
  :author "Mr1Penguin"
  :license ""
  :depends-on ()
  :components ((:module "src"
                :components
                ((:file "main" :depends-on ("data"))
		 (:file "types")
		 (:file "data" :depends-on ("types")))))
  :description ""
  :in-order-to ((test-op (test-op "satisfactory-calc/tests"))))

(defsystem "satisfactory-calc/tests"
  :author ""
  :license ""
  :depends-on ("satisfactory-calc"
               "rove")
  :components ((:module "tests"
                :components
                ((:file "main")
		 (:file "data"))))
  :description "Test system for satisfactory-calc"
  :perform (test-op (op c) (symbol-call :rove :run c)))
