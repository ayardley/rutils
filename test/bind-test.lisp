;;;;; Test suite for RUTILSX BIND
;;;;; see LICENSE file for permissions


(cl:in-package #:rutilsx.test)
(named-readtables:in-readtable rutils-readtable)

(defstruct dummy-struct-for-bind i j)
(defclass dummy-obj-for-bind ()
  ((k :initarg :k)
   (l :initarg :l))

(deftest bind ()
  (should be equal '(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15)
          (bind ((a 1)
                 (b c (values 2 3))
                 ((d e &rest f) '(4 5 12 13 14 15))
                 (((g :g) (h :h)) ? #h(:g 6 :h 7))
                 ((i rutilsx.bind::j) @ (make-dummy-struct-for-bind :i 8 :j 9))
                 (((k k) (l l)) @ (make 'dummy-obj-for-bind :k 10 :l 11)))
            (list* a b c d e g h i j k l f))))
