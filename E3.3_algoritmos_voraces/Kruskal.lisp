;Arbol para kruskal
(setf vconocido2 '(
    (i ((a 3)(d 4)))
    (a ((i 3)(b 4)(d 5)))
    (b ((a 4)(c 4)(e 5)))
    (c ((b 4)))
    (d ((i 4)(a 5)(e 2)))
    (e ((d 2)(b 5)(f 4)))
    (f ((e 4)(m 3)))
    (m ((f 3)))
))

;Obtener los nodos adyacentes del grafo
(defun adyacentes (nodo graph)
    (cadr (assoc nodo graph))
)

;Obtener todo los nodos del grafo
(defun listaV (graph)
    (setf lista '())
    (loop for element in graph
        do(push (car element) lista)
    )
    (sort lista #'string<)
)

;Genera lista con las aristas
(defun listaRes (graph)
    (let ((lista (listaV graph))
            (res '()))
        (loop for nodo in lista
            do (let ((ady (adyacentes nodo graph)))
                (loop for a in ady
                    do (push (list nodo a (cdr (assoc a ady))) res))))
        res))

;(setq lista '((M (F 3) NIL) (I (D 4) NIL) (I (A 3) NIL) (F (M 3) NIL) (F (E 4) NIL) (E (B 5) NIL) (E (F 4) NIL) (E (D 2) NIL) (D (E 2) NIL) (D (A 5) NIL) (D (I 4) NIL) (C (B 4) NIL) (B (E 5) NIL) (B (C 4) NIL) (B (A 4) NIL) (A (D 5) NIL) (A (B 4) NIL) (A (I 3) NIL)))

;; Remueve los valores vacios
(defun quitarnil (lista)
(mapcar #'(lambda (x) (remove-if #'null x)) lista))

; (setf quit (quitarnil lista))

; ((M (F 3)) (I (D 4)) (I (A 3)) (F (M 3)) (F (E 4)) (E (B 5)) (E (F 4)) (E (D 2)) (D (E 2)) (D (A 5)) (D (I 4)) (C (B 4)) (B (E 5)) (B (C 4)) (B (A 4)) (A (D 5)) (A (B 4)) (A (I 3)))

;; Función para obtener el número de la tupla
(defun obtener-numero (elem)
    (if (listp (second elem))
        (cadr (second elem))
        0))

;; Función comparadora para ordenar la lista por número
(defun comparador-numero (a b)
    (< (obtener-numero a) (obtener-numero b)))

;; Ordenar la lista utilizando la función sort con el comparador personalizado
(defun lista-ordenada (lista) (sort lista #'comparador-numero))


;((E (D 2) NIL) (D (E 2) NIL) (M (F 3) NIL) (I (A 3) NIL) (F (M 3) NIL) (A (I 3) NIL) (I (D 4) NIL) (F (E 4) NIL) (E (F 4) NIL) (D (I 4) NIL) (C (B 4) NIL) (B (C 4) NIL) (B (A 4) NIL) (A (B 4) NIL) (E (B 5) NIL) (D (A 5) NIL) (B (E 5) NIL) (A (D 5) NIL))

; (setf quit (quitarnil lista))

; (defun kruskal (grafo)
;     ;Genera las aristas y elimina el valor nil
;     (setq aristas (listaRes grafo))
;     (setq aristasn (quitarnil aristas))
;     ;Ordenar, dar formato y quitar valor nil
;     (setq aris-sort (lista-ordenada aristasn))
;     (setq aris-sortn (quitarnil aris-sort))
;     aris-sortn
; )


; (setq ordenado '((E (D 2)) (D (E 2)) (M (F 3)) (I (A 3)) (F (M 3)) (A (I 3)) (I (D 4)) (F (E 4))
;                  (E (F 4)) (D (I 4)) (C (B 4)) (B (C 4)) (B (A 4)) (A (B 4)) (E (B 5)) (D (A 5))
;                  (B (E 5)) (A (D 5))))


; ((D E 2) (I A 3) (C B 4) (E F 4) (F M 3) (A B 4))

; (defun encontrar (x padre)
;   "Encuentra el conjunto al que pertenece el nodo X."
;   (if (eq x (car padre))
;       x
;       (encontrar (car padre) padre)))

; (defun uni (x y padre)
;   "Une dos conjuntos x e y."
;   (let ((raizX (encontrar x padre))
;         (raizY (encontrar y padre)))
;     (setf (car (member raizX padre)) raizY)))

; (defun kruskal (edges)
;   "Algoritmo de Kruskal para encontrar un árbol de expansión mínima."
;   (let* ((sorted-edges (sort edges #'< :key #'caddr))
;          (resultado '())
;          (padre (make-hash-table :test #'equal)))
;     (dolist (edge sorted-edges)
;       (let ((u (first edge))
;             (v (second edge))
;             (peso (third edge)))
;         (unless (and (gethash u padre)
;                      (gethash v padre)
;                      (equal (gethash u padre) (gethash v padre)))
;           (push edge resultado)
;           (setf (gethash u padre) u)
;           (setf (gethash v padre) u))))
;     resultado))

; (setq ordenado '((E D 2) (D E 2) (M F 3) (I A 3) (F M 3) (A I 3) (I D 4) (F E 4)
;                  (E F 4) (D I 4) (C B 4) (B C 4) (B A 4) (A B 4) (E B 5) (D A 5)
;                  (B E 5) (A D 5)))

; (setq resultado (kruskal ordenado))

; (format t "Árbol de expansión mínima (Kruskal):~%")
; (dolist (edge resultado)
;   (format t "~a -> ~a (~a)~%" (first edge) (second edge) (third edge)))




; kruskal ordenado
; ((D A 5) (E B 5) (B A 4) (C B 4) (F E 4) (I D 4) (I A 3) (M F 3) (E D 2))
; ((B A 4) (C B 4) (F E 4) (I D 4) (I A 3) (M F 3) (E D 2))




