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

(defun crear-grafo ()
  (let ((grafo '()))
    (format t "Creando un nuevo grafo.~% Ingrese los vertices y sus conexiones con pesos.~% Ingrese 'fin' para terminar.~%")
    (loop
      (format t "Ingrese el nombre del vertice (o 'fin' para terminar): ")
      (let ((vertice (read)))
        (if (equal vertice 'fin)
            (return (reverse grafo))
            (progn
              (format t "Ingrese las conexiones y pesos en el formato '(vertice peso)': ")
              (let ((conexiones (parsear-conexiones (read-line))))
                (push (list vertice conexiones) grafo))))))))

(defun parsear-conexiones (conexiones-str)
  (let ((parsed-connections '()))
    (loop for pair in (read-from-string (concatenate 'string "(" conexiones-str ")"))
          do (push (list (first pair) (second pair)) parsed-connections))
    parsed-connections))

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

(defun krusk (grafo)
    ; (setq grafo (crear-grafo))
    ;Genera las aristas y elimina el valor nil
    (setq aristas (listaRes grafo))
    (setq aristasn (quitarnil aristas))
    ;Ordenar, dar formato y quitar valor nil
    (setq aris-sort (lista-ordenada aristasn))
    (setq aris-sortn (quitarnil aris-sort))
    (kruskal aris-sortn)
  )

(defun krusk1 ()
    (setq grafo (crear-grafo))
    ;Genera las aristas y elimina el valor nil
    (setq aristas (listaRes grafo))
    (setq aristasn (quitarnil aristas))
    ;Ordenar, dar formato y quitar valor nil
    (setq aris-sort (lista-ordenada aristasn))
    (setq aris-sortn (quitarnil aris-sort))
    (kruskal aris-sortn)
  )

; (setf grafo1 '((E (D 2)) (D (E 2)) (M (F 3)) (I (A 3)) (F (M 3)) (A (I 3)) (I (D 4)) (F (E 4)) (E (F 4)) (D (I 4)) (C (B 4)) (B (C 4)) (B (A 4)) (A (B 4)) (E (B 5)) (D (A 5)) (B (E 5)) (A (D 5))))



;; Definición de las funciones auxiliares para el algoritmo de Kruskal

;; Función para encontrar el representante de un conjunto usando uni-encontrar
(defun encontrar (x parent)
  (if (equal x (cdr (assoc x parent)))
      x
      (encontrar (cdr (assoc x parent)) parent)))

;; Función para unir dos conjuntos disjuntos
(defun uni (x y parent)
  (let ((x-root (encontrar x parent))
        (y-root (encontrar y parent)))
    (setf (cdr (assoc x-root parent)) y-root)))



;; Función principal para Kruskal
(defun kruskal (graph)
  (let ((parent '()))

    ;; Inicializar cada vértice como su propio conjunto
    (dolist (node graph)
      (push (cons (car node) (car node)) parent))

    ;; Inicializar la variable MINIMUM-SPANNING-TREE como una lista vacía
    (let ((MINIMUM-SPANNING-TREE '()))
      ;; Iterar sobre los nodos del grafo
      (dolist (node graph)
        (let ((node-name (car node))
              (connections (cdr node)))
          ;; Iterar sobre las conexiones del nodo
          (dolist (connection connections)
            (let ((neighbor (car connection))
                  (weight (cdr connection)))
              ;; Obtener los nodos raíz de los conjuntos de los nodos de la conexión
              (let ((start-node (encontrar node-name parent))
                    (end-node (encontrar neighbor parent)))
                ;; Si los nodos no están en el mismo conjunto, agregar esta arista al árbol
                (if (not (equal start-node end-node))
                    (progn
                      (push (list node-name neighbor weight) MINIMUM-SPANNING-TREE) ;; Agregar resultado a MINIMUM-SPANNING-TREE
                      ;; Unir los conjuntos de los nodos conectados por esta arista
                      (uni start-node end-node parent))))))))
                      MINIMUM-SPANNING-TREE
                      )

      ;; Devolver el árbol de expansión mínimo como lista de aristas
      )) ;; Devolver MINIMUM-SPANNING-TREE como resultado

(defun imprimir-arbol-expansion-minima (graph)
  (let ((tree (krusk graph)))
    (format t "Arbol de expansion minima: ~a~%" tree))) ;; Imprimir MINIMUM-SPANNING-TREE


(defun mostrar-menu ()
  (format t "~%Menu:")
  (format t "~%1. Ejecutar kruskal con grafo predefinido")
  (format t "~%2. Crear grafo y ejecutar kruskal")
  (format t "~%0. Salir del menu")
  (format t "~%Ingrese el numero de la opcion deseada: "))

(defun ejecutar-opcion (opcion)
  (cond ((= opcion 1) (imprimir-arbol-expansion-minima vconocido2))
        ((= opcion 2) (imprimir-arbol-expansion-minima (krusk1)))
        ((= opcion 0) (format t "~%Saliendo del menu. Hasta luego!~%"))
        (t (format t "~%Opcion no valida. Por favor, seleccione una opcion valida."))))

(defun inicio ()
  (loop
    (mostrar-menu)
    (let ((opcion (parse-integer (read-line nil))))
      (ejecutar-opcion opcion)
      (when (= opcion 0) (return)))))