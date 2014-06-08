<%@include file="header.jsp" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="has-error">
    <div class="help-block"
            <%
                String errorStyle = "";
                if (request.getAttribute("errors") == null)
                    errorStyle = "style='display: none;'";
                else
                    errorStyle = "style='display: block;'";
            %>
            <%=errorStyle%>>${errors}
    </div>
</div>
<h3>Event: ${event.name}</h3>

<div class="row">
    <div class="col-md-6">
        <div class="panel panel-default projectSummary">
            <div class="panel-heading">Detail Information</div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-md-6 col-sm-6 col-xs-6">
                        Name
                    </div>
                    <div class="col-md-6 col-sm-6 col-xs-6">
                        ${event.name}
                    </div>
                </div>
                <p/>

                <div class="row">
                    <div class="col-md-6 col-sm-6 col-xs-6">
                        Date
                    </div>
                    <div class="col-md-6 col-sm-6 col-xs-6">
                        <fmt:formatDate value="${event.date}" pattern="dd/MM/yyyy"/>
                    </div>
                </div>
                <p/>

                <div class="row">
                    <div class="col-md-6 col-sm-6 col-xs-6">
                        Time
                    </div>
                    <div class="col-md-6 col-sm-6 col-xs-6">
                        <fmt:formatDate value="${event.date}" pattern="HH:mm"/>
                    </div>
                </div>
                <p/>

                <div class="row">
                    <div class="col-md-6 col-sm-6 col-xs-6">
                        Address
                    </div>
                    <div class="col-md-6 col-sm-6 col-xs-6">
                        ${event.address}
                    </div>
                </div>
                <p/>

                <div class="row">
                    <div class="col-md-6 col-sm-6 col-xs-6">
                        Description
                    </div>
                    <div class="col-md-6 col-sm-6 col-xs-6">
                        ${event.description}
                    </div>
                </div>
                <p/>

                <div class="row">
                    <div class="col-md-6 col-sm-6 col-xs-6">
                        Organizer
                    </div>
                    <div class="col-md-6 col-sm-6 col-xs-6">${event.owner.firstName} ${event.owner.lastName}</div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-6">
        <div class="panel panel-default">
            <div class="panel-heading">Tasks</div>
            <div class="panel-body">
                <div id="taskChart"></div>
            </div>
        </div>
    </div>
</div>
<c:if test="${userId == event.owner.userId}">
    <div class="row">
        <div class="col-md-12">
            <a class="btn btn-primary next" href="/home/events/users/${event.id}">Manage Users</a>

            <p/>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <a class="btn btn-primary next" href="/home/tasks/show/${event.id}">Manage Tasks</a>

            <p/>
        </div>
    </div>
</c:if>
<script src="<spring:url value="/web/js/jquery-2.0.0.js" />"></script>
<script src="<spring:url value="/web/js/jquery.validate.js" />"></script>
<script src="<spring:url value="/web/js/bootstrap.js" />"></script>
<script src="<spring:url value="/web/js/moment.min.js" />"></script>
<script src="<spring:url value="/web/js/bootstrap-datetimepicker.min.js" />"></script>
<script src="<spring:url value="/web/js/bootstrap-select.js" />"></script>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script src="<spring:url value="/web/js/script.js" />"></script>
<script src="<spring:url value="/web/js/events.js" />"></script>
<script src="<spring:url value="/web/js/invitationsManager.js" />"></script>


<script src="<spring:url value="/web/js/events.js" />"></script>
<script>
    google.load("visualization", "1", {packages: ["corechart"]});
    google.setOnLoadCallback(redrawTaskChart("${event.id}"));
    $(document).ready(function () {
        $(window).resize(google.setOnLoadCallback(redrawTaskChart("${event.id}")))
    });
</script>
<%@include file="footer.jsp" %>