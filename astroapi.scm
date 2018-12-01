#! /usr/local/bin/csi -ss
; CLI for atroapi.appspot.com
(import http-client (chicken io))

(define astroapi_base_url "http://astroapi.appspot.com/v0/sunrise/")

(define (get_astroapi_url lat long)
  (string-append astroapi_base_url "lat" lat "/lon" long))

(define (astroapi lat long)
  (let ([url (get_astroapi_url lat long)])
    (with-input-from-request url #f read-string)))

(define (main args)
  (let ([lat (list-ref args 0)]
        [long (list-ref args 1)])
    (print (astroapi lat long))))
