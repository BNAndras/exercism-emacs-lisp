;;; phone-number-test.el --- Tests for phone-number (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(load-file "phone-number.el")
(declare-function numbers "phone-number.el" (num))
(declare-function area-code "phone-number.el" (num))
(declare-function pprint "phone-number.el" (num))

(ert-deftest cleans-number-test ()
  (should (equal (numbers "(223) 456-7890") "2234567890")))


(ert-deftest cleans-numbers-with-dots-test ()
  (should (equal (numbers "223.456.7890") "2234567890")))


(ert-deftest valid-when-11-digits-and-first-is-1-test ()
  (should (equal (numbers "12234567890") "2234567890")))


(ert-deftest invalid-when-11-digits-test ()
  (should (equal (numbers "21234567890") "0000000000")))


(ert-deftest invalid-when-9-digits-test ()
  (should (equal (numbers "123456789") "0000000000")))

(ert-deftest invalid-when-more-than-11-digits-test ()
  (should (equal (numbers "321234567890") "0000000000")))

(ert-deftest invalid-with-letters ()
  (should (equal (numbers "523-abc-7890") "0000000000")))


(ert-deftest invalid-with-punctuations ()
  (should (equal (numbers "523-@:!-7890") "0000000000")))


(ert-deftest area-code-test ()
  (should (equal (area-code "2234567890") "223")))


(ert-deftest pprint-test ()
  (should (equal (pprint "2234567890") "(223) 456-7890")))


(ert-deftest pprint-full-us-phone-number-test ()
  (should (equal (pprint "12234567890") "(223) 456-7890")))


(provide 'phone-number)
;;; phone-number-test.el ends here
