<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*" %>
<%@ page import="sample.tomcat.jsp.*" %>
<html lang="en" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Vote for punjab elections 2017</title>

    <!-- Bootstrap -->
    <link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
    <style>
    .chart {
      width: 100%;
      min-height: 450px;
    }
        .btn-radio {
        float: right;
        margin-top: 15px;
        margin-right: 20px;
        }
        .vote-label{
            display : block;
        }
        .img-radio {
        opacity: 0.9;
        margin-bottom: 5px;
        height : 40px;
        float :left;
        }

        .space-20 {
        margin-top: 20px;
        }
    </style>
    <script type="text/javascript">
var allowSubmit = false;
function capcha_filled () {
    allowSubmit = true;
}
function capcha_expired () {
    allowSubmit = false;
}
function check_if_capcha_is_filled () {
    if(allowSubmit) return true;
    alert('Fill in the capcha!');
}
function make_red(id) {
 document.getElementById(id).style.color = "red";
}
    </script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
        google.charts.load('current', {'packages':['corechart']});
        google.charts.setOnLoadCallback(drawChart);
        function drawChart() {

            var data = google.visualization.arrayToDataTable([
                ['Party', 'Vote count'],
                <c:forEach items="${stat}" var="listItem">
                    ['<c:out value="${listItem.getParty()}" />', <c:out value="${listItem.getCount()}" />],
                </c:forEach>
            ]);

            var options = {
                'title': 'Voting trend for punjab elections 2017',
                'legend': 'top'
            };

            var chart = new google.visualization.PieChart(document.getElementById('piechart'));

            chart.draw(data, options);
        }
    </script>
</head>
<body>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>


<br />
<div class="container">

    <div class="row">
        <div class="col-md-6 col-md-offset-3">

            <form class="form-horizontal well" role="form" method="post" onsubmit="if(allowSubmit) { return true;} else alert('Fill in the capcha!'); make_red('recaptcha'); return false;">
                <h1>Share this page to view results?</h1>
                <!-- Go to www.addthis.com/dashboard to customize your tools -->
                <div class="addthis_inline_share_toolbox_99zq"  data-url="http://www.voteforpunjab.com" data-title="Vote for punjab elections 2017"></div>
                <!-- Go to www.addthis.com/dashboard to customize your tools -->
                <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-55e46e96495cf7ee"></script>
            </form>

  <div class="clearfix"></div>
            <div class="col-md-6">
              <div id="piechart" style="display: none" class="chart"></div>
            </div>

        </div>

    </div>
</div>
<script>
// Alert a message when the user shares somewhere
function shareEventHandler(evt) {
    if (evt.type == 'addthis.menu.share') {


        setTimeout( function() {document.getElementById("piechart").style.display = 'block'; drawChart();}, 5000);
       // alert(typeof(evt.data)); // evt.data is an object hash containing all event data
//        alert(evt.data.service); // evt.data.service is specific to the "addthis.menu.share" event
    }
}

// Listen for the share event
addthis.addEventListener('addthis.menu.share', shareEventHandler);
</script>
<%@ include file="analytics.jsp" %>

</body>
</html>

