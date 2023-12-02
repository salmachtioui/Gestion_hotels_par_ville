<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestion des hôtels</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #DDF2FD;
            color: #164863;
            font-family: 'Arial', sans-serif;
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
            padding: 15px; /* Augmenter la taille du bouton */
            font-size: 18px; /* Augmenter la taille du texte */
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

        /* Styles pour créer l'effet d'échelle */
        .section {
            margin-top: 20px;
            margin-bottom: 40px;
        }

        .section:nth-child(even) {
            transform: scaleX(-1);
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="section">
            <h1 class="display-4 mb-4">ChercheHotelExpress</h1>
            
            <form action="VilleController" class="form-group">
                <button class="btn btn-block">Gestion des villes</button>
            </form>
            
            <form action="HotelController" class="form-group">
                <button class="btn btn-block">Gestion des hotels</button>
            </form>
        </div>

        <!-- Ajouter le reste de votre code ici ... -->

    </div>
    <!-- Ajout de Bootstrap JS -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
