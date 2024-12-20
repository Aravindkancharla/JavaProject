<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Delete Event</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        /* Reusing your CSS styles from addevent.jsp */
        .form-container {
            max-width: 800px;
            margin: 2rem auto 2rem 33%;
            padding: 2rem;
            background: rgba(255, 255, 255, 0.75);
            border-radius: 20px;
            box-shadow: 0 8px 32px rgba(31, 38, 135, 0.15);
            backdrop-filter: blur(4px);
            border: 1px solid rgba(255, 255, 255, 0.18);
        }

        .page-background {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: 
                linear-gradient(120deg, rgba(26, 54, 93, 0.05) 0%, rgba(44, 82, 130, 0.05) 100%),
                url('https://images.unsplash.com/photo-1540575467063-178a50c2df87?auto=format&fit=crop&q=80&w=2070') center/cover no-repeat;
            filter: blur(0px);
            z-index: -1;
        }

        .form-header {
            text-align: center;
            margin-bottom: 2rem;
            color: #1a365d;
        }

        .form-header h2 {
            font-size: 2.5rem;
            margin-bottom: 0.5rem;
            background: linear-gradient(150deg, #1a365d, #2c5282);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .form-header p {
            color: #64748b;
            font-size: 1.1rem;
        }

        .event-list {
            margin-top: 2rem;
        }

        .event-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 1rem;
            margin-bottom: 1rem;
            background: rgba(255, 255, 255, 0.75);
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .event-item h3 {
            margin: 0;
            font-size: 1.3rem;
            color: #2c5282;
        }

        .event-item p {
            margin: 0;
            color: #4a5568;
        }

        .delete-btn {
            background-color: #e53e3e;
            color: white;
            border: none;
            border-radius: 8px;
            padding: 0.5rem 1rem;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .delete-btn:hover {
            background-color: #c53030;
            box-shadow: 0 4px 12px rgba(255, 0, 0, 0.3);
        }

        @media (max-width: 768px) {
            .form-container {
                margin: 1rem;
                padding: 1.5rem;
            }

            .form-header h2 {
                font-size: 2rem;
            }

            .event-item h3 {
                font-size: 1.1rem;
            }
        }
    </style>
</head>

<body>
    <%@ include file="adminnavbar.jsp" %>

    <div class="page-background"></div>

    <div class="form-container">
        <div class="form-header">
            <h2>Delete Event</h2>
            <p>Select an event to delete</p>
        </div>

        <!-- If there's any success or error message from the backend -->
        <c:if test="${not empty message}">
            <div class="success-message">
                <i class="fas fa-check-circle"></i> ${message}
            </div>
        </c:if>

        <!-- List of Events with Delete Buttons -->
        <div class="event-list">
            <c:forEach var="event" items="${eventList}">
                <div class="event-item">
                    <div>
                        <h3>${event.name}</h3>
                        <p><strong>Category:</strong> ${event.category}</p>
                        <p><strong>Venue:</strong> ${event.venue}</p>
                    </div>

                    <form action="removeevent" method="post" style="display:inline;">
                        <input type="hidden" name="eid" value="${event.id}">
                        <button type="submit" class="delete-btn">
                            <i class="fas fa-trash"></i> Delete
                        </button>
                    </form>
                </div>
            </c:forEach>
        </div>
    </div>
</body>
</html>
