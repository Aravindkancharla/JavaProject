<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View All Events</title>
<style>
    /* Card styling */
    .card-container {
        margin-left: 220px;
        padding: 20px;
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        gap: 20px;
    }
    .card {
        width: 300px;
        border: 1px solid #ddd;
        border-radius: 5px;
        box-shadow: 2px 2px 8px rgba(0, 0, 0, 0.1);
        padding: 15px;
        text-align: center;
        background-color: #fff;
    }
    .card img {
        width: 100%;
        height: 200px;
        object-fit: cover;
        border-radius: 5px;
    }
    .card h3 {
        margin: 15px 0 10px;
    }
    .card p {
        color: #555;
    }

    /* Responsive layout for smaller screens */
    @media (max-width: 768px) {
        .card-container {
            margin-left: 0;
            padding-top: 60px;
        }
    }
</style>
</head>

<body>

<!-- Include Navbar -->
<%@ include file="adminnavbar.jsp" %>

<h3 align="center"><u>All Events</u></h3>

<!-- Event Cards Section -->
<div class="card-container">
    <c:forEach var="event" items="${eventList}">
        <div class="card">
            <c:if test="${event.image != null}">
                <img src="displayeventimage?id=${event.id}" alt="Event Image" />
            </c:if>
            <h3>${event.name}</h3>
            <p><strong>Category:</strong> ${event.category}</p>
            <p><strong>Venue:</strong> ${event.venue}</p>
            <p><strong>Description:</strong> ${event.description}</p>
            <p><strong>Added By:</strong> ${event.addedby}</p>
            <p><strong>Available Slots:</strong> ${event.availableSlots}</p>
        </div>
    </c:forEach>
</div>

</body>
</html>
