<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <meta charset="UTF-8">
    <title>Villes Liste</title>
    <style>
        body {
            background-color: #DDF2FD; /* Nouvelle couleur de fond bleue */
            color: #164863; /* Changement de la couleur du texte en bleu foncé */
        }

        .container {
            margin-top: 50px;
        }

        .custom-modal-label {
            font-weight: bold;
            color: #427D9D; /* Couleur de l'étiquette en bleu */
        }

        .display-4 {
            color: #427D9D; /* Couleur du titre en bleu */
        }

        .btn-primary {
            background-color: #164863; /* Couleur du bouton Ajouter une ville */
            color: #DDF2FD; /* Couleur du texte sur le bouton en blanc */
            border: none;
        }

        .btn-primary:hover {
            background-color: #427D9D; /* Couleur du bouton au survol */
        }

        .modal-header {
            background-color: #427D9D; /* Couleur de l'en-tête du modal en bleu */
            color: #DDF2FD; /* Couleur du texte dans l'en-tête en blanc */
            border: none;
        }

        .modal-footer {
            background-color: #427D9D; /* Couleur du pied du modal en bleu */
            color: #DDF2FD; /* Couleur du texte dans le pied en blanc */
            border: none;
        }

        .btn-secondary,
        .btn-danger {
            background-color: #DDF2FD; /* Couleur des boutons Modifier et Supprimer */
            color: #164863; /* Couleur du texte sur les boutons en bleu foncé */
            border: none;
        }

        .btn-secondary:hover,
        .btn-danger:hover {
            background-color: #9BBEC8; /* Couleur des boutons au survol */
            color: #164863; /* Couleur du texte sur les boutons en bleu foncé */
        }

        .table {
            margin-top: 30px;
        }

        .thead-light th {
            background-color: #427D9D; /* Couleur de l'en-tête du tableau en bleu */
            color: #DDF2FD; /* Couleur du texte dans l'en-tête en blanc */
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h1 class="display-4">Gestion des Villes</h1>
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#VilleModalCenter">
                Ajouter une ville
            </button>
        </div>

        <!-- Add Ville Modal -->
        <div class="modal fade" id="VilleModalCenter" tabindex="-1" role="dialog" aria-labelledby="VilleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <form action="VilleController" method="post">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="VilleModalCenterTitle">Ajouter une ville</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <label class="custom-modal-label" for="Nom">Nom</label>
                            <input type="text" name="Nom" class="form-control" required><br><br>

                            <!-- Ajouter d'autres champs si nécessaire -->

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Fermer</button>
                            <input type="submit" class="btn btn-primary" value="Enregistrer">
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <!-- Modify Ville Modal -->
        <div class="modal fade" id="ModifyVilleModal" tabindex="-1" role="dialog" aria-labelledby="ModifyVilleModalTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <form id="modifyForm" action="VilleController" method="post">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="ModifyVilleModalTitle">Modifier une ville</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <label class="custom-modal-label" for="Nom">Nom</label>
                            <input type="text" name="Nom" class="form-control" id="modalVilleNom" required><br><br>

                            <!-- Ajouter d'autres champs si nécessaire -->

                            <input type="hidden" name="action" value="edit">
                            <input type="hidden" name="id" id="modalVilleId">
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Fermer</button>
                            <button type="button" class="btn btn-primary" onclick="submitModifyForm()">Enregistrer les modifications</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <table class="table">
            <thead class="thead-light">
                <tr>
                    <th>ID</th>
                    <th>Nom</th>
                    <!-- Ajouter d'autres en-têtes si nécessaire -->
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${villes}" var="ville">
                    <tr>
                        <td>${ville.id}</td>
                        <td>${ville.nom}</td>
                        <!-- Afficher d'autres attributs si nécessaire -->
                        <td class="d-flex align-items-center">
                            <form action="VilleController" method="post">
                                <input type="hidden" name="action" value="delete">
                                <input type="hidden" name="id" value="${ville.id}">
                                <button type="submit" class="btn btn-danger">Supprimer</button>
                            </form>
                            <button type="button" class="btn btn-secondary ml-2" data-toggle="modal" data-target="#ModifyVilleModal"
                                    data-ville-id="${ville.id}" data-ville-nom="${ville.nom}">
                                Modifier
                            </button>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <script>
        $('#ModifyVilleModal').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget);
            var villeId = button.data('ville-id');
            var villeNom = button.data('ville-nom');
            // Ajouter d'autres attributs si nécessaire
            var modal = $(this);

            modal.find('#modalVilleNom').val(villeNom);
            modal.find('#modalVilleId').val(villeId);
            // Mettre à jour d'autres champs si nécessaire
        });

        function submitModifyForm() {
            document.getElementById("modifyForm").submit();
        }
    </script>
</body>
</html>
