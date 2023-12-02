<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hotel Management</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #DDF2FD;
        }

        .container {
            margin-top: 50px;
            text-align: center;
        }

        .display-4 {
            color: #427D9D;
        }

        .btn-block {
            background-color: #427D9D;
            color: #DDF2FD;
            border: none;
            padding: 15px;
            font-size: 18px;
        }

        .btn-block:hover {
            background-color: #164863;
            color: #DDF2FD;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-control {
            border: 2px solid #427D9D;
        }

        .form-control:focus {
            border-color: #164863;
            box-shadow: none;
        }

        .table {
            margin-top: 30px;
        }

        .thead-light th {
            background-color: #427D9D;
            color: #DDF2FD;
        }

        .modal-header,
        .modal-footer {
            background-color: #427D9D;
            color: #DDF2FD;
            border: none;
        }

        .btn-danger,
        .btn-secondary {
            background-color: #DDF2FD;
            color: #164863;
            border: none;
        }

        .btn-danger:hover,
        .btn-secondary:hover {
            background-color: #9BBEC8;
            color: #164863;
        }

        .btn-primary {
            background-color: #164863;
            border: none;
        }

        .btn-primary:hover {
            background-color: #427D9D;
        }

        /* Nouvelles couleurs fournies */
        .custom-modal-label {
            color: #9BBEC8;
        }

        .close {
            color: #9BBEC8;
        }

        .fas {
            color: #9BBEC8;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h1 class="display-4">Gestion Hotels</h1>
            <a href="index.jsp" class="btn btn-light" style="color: #0766AD;">
                <i class="fas fa-home"></i> Accueil
            </a>
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#HotelModalCenter">
                Ajouter Hotel
            </button>
        </div>

        <!-- Add Hotel Modal -->
        <div class="modal fade" id="HotelModalCenter" tabindex="-1" role="dialog" aria-labelledby="HotelModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <form action="HotelController" method="post">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="HotelModalCenterTitle">Add Hotel</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <label class="custom-modal-label" for="nom">Name</label>
                            <input type="text" name="nom" class="form-control" required><br><br>

                            <label class="custom-modal-label" for="adresse">Address</label>
                            <input type="text" name="adresse" class="form-control" required><br><br>

                            <label class="custom-modal-label" for="telephone">Téléphone</label>
                            <input type="text" name="telephone" class="form-control" required><br><br>

                            <label class="custom-modal-label" for="ville">Ville</label>
                            <select name="ville" class="form-control" required>
                                <option value="" disabled selected>Séléctionner une ville</option>
                                <c:forEach items="${villes}" var="ville">
                                 <option value="${ville.id}">${ville.nom}</option>
                                </c:forEach>

                            </select>
                            
                        </div>
                        
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <input type="submit" class="btn btn-primary" value="Save">
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <!-- Modify Hotel Modal -->
        <div class="modal fade" id="ModifyHotelModal" tabindex="-1" role="dialog" aria-labelledby="ModifyHotelModalTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <form id="modifyForm" action="HotelController" method="post">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="ModifyHotelModalTitle">Modifier </h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <label class="custom-modal-label" for="nom">Nom</label>
                            <input type="text" name="nom" class="form-control" id="modalHotelNom" required><br><br>

                            <label class="custom-modal-label" for="adresse">Adresse</label>
                            <input type="text" name="adresse" class="form-control" id="modalHotelAdresse" required><br><br>

                            <label class="custom-modal-label" for="telephone">Téléphone</label>
                            <input type="text" name="telephone" class="form-control" id="modalHotelTelephone" required><br><br>

                            <label class="custom-modal-label" for="ville">Ville</label>
                            <select name="ville" class="form-control" id="modalHotelVille" required>
                                <c:forEach items="${villes}" var="ville">
                                    <option value="${ville.id}">${ville.nom}</option>
                                </c:forEach>
                            </select>

                            <input type="hidden" name="action" value="edit">
                            <input type="hidden" name="id" id="modalHotelId">
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary" onclick="submitModifyForm()">Save Changes</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <form action="HotelController" method="post" class="mb-4">
            <div class="form-group">
                <label for="filterVille">Filtre par Ville:</label>
                <select name="filterVille" class="form-control">
                    <option value="0">Villes</option>
                    <c:forEach items="${villes}" var="ville">
                        <option value="${ville.id}">${ville.nom}</option>
                    </c:forEach>
                </select>
                <input type="hidden" name="action" value="filterByVille">
            </div>
            <button type="submit" class="btn btn-primary">Filter</button>
        </form>
        <table class="table">
            <thead class="thead-light">
                <tr>
                    <th>ID</th>
                    <th>Nom</th>
                    <th>Adresse</th>
                    <th>Téléphone</th>
                    <th>Ville</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${hotels}" var="hotel">
                    <tr>
                        <td>${hotel.id}</td>
                        <td>${hotel.nom}</td>
                        <td>${hotel.adresse}</td>
                        <td>${hotel.telephone}</td>
                        <td>${hotel.ville.nom}</td>
                        <td class="d-flex align-items-center">
                            <form action="HotelController" method="post">
                                <input type="hidden" name="action" value="delete">
                                <input type="hidden" name="id" value="${hotel.id}">
                                <button type="submit" class="btn btn-danger">Supprimer</button>
                            </form>
                            <button type="button" class="btn btn-secondary ml-2" data-toggle="modal" data-target="#ModifyHotelModal"
                                    data-hotel-id="${hotel.id}" data-hotel-nom="${hotel.nom}" data-hotel-adresse="${hotel.adresse}"
                                    data-hotel-telephone="${hotel.telephone}" data-hotel-ville="${hotel.ville.id}">
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
        $('#ModifyHotelModal').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget);
            var hotelId = button.data('hotel-id');
            var hotelNom = button.data('hotel-nom');
            var hotelAdresse = button.data('hotel-adresse');
            var hotelTelephone = button.data('hotel-telephone');
            var hotelVille = button.data('hotel-ville');
            var modal = $(this);

            modal.find('#modalHotelNom').val(hotelNom);
            modal.find('#modalHotelAdresse').val(hotelAdresse);
            modal.find('#modalHotelTelephone').val(hotelTelephone);
            modal.find('#modalHotelVille').val(hotelVille);
            modal.find('#modalHotelId').val(hotelId);
        });

        function submitModifyForm() {
            document.getElementById("modifyForm").submit();
        }
    </script>
</body>
</html>
