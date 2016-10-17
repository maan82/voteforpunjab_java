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

<meta property="og:url" content="http://www.voteforpunjab.com" />
<meta property="og:title" content="Vote for punjab elections 2017" />
<meta property="og:description" content="Vote for punjab elections 2017 and view results and trends." />
<meta property="og:image" content="http://www.voteforpunjab.com/images/Vote-for-punjab-elections-2017.jpg" />

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
<%@ include file="headadd.jsp" %>

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
            <form action="/" class="form-horizontal well" role="form" method="post" onsubmit="if(allowSubmit) { return true;} else alert('Fill in the capcha!'); make_red('recaptcha'); return false;">
                <h1>Who are you going to vote in Punjab elections 2017?</h1>
                <%
                for(VoteBlock party: Arrays.asList(new VoteBlock("shiromani-akali-dal-election-symbol.jpg", "sad", "SAD + BJP"),
                                                    new VoteBlock("Aam-Aadmi-Party-election-symbol.jpg", "aap", "AAP"),
                                                    new VoteBlock("indian-national-congress-election-symbol.jpg", "congress", "CONGRESS"),
                                                    new VoteBlock("others.jpg", "other", "Other"))) {
                %>
                <div class="row">
                <div class="space-20">
                        <label for="<%=party.partyName%>" class="vote-label">
                            <div class="col-md-8 btn btn-primary btn-lg btn-block" style="min-height: 70px">

                                <img src="/images/<%=party.image%>" class="img-radio">
                                <span style="font-size: 30px"><%=party.partyLabel%></span>
                                <input style="margin-top: 15px; margin-right: 20px;" class="btn-radio" name="party" type="radio" id="<%=party.partyName%>" value="<%=party.partyName%>">
                            </div>
                        </label>

                    </div>
                </div>
                <%}%>


                <div class="row space-20">
                    <div>
                        <div class="form-group">
                            <label for="inputTitle1" class="col-md-4 control-label">Your Email :</label>
                            <div class="col-md-8">
                                <input type="text" name="email" class="form-control" id="inputTitle1">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row space-20">
                    <div class="col-md-6 col-md-offset-3">
                        <div id="recaptcha" class="form-group">
                            <span>Captcha :</span>

                            <div class="g-recaptcha" data-sitekey="6LdHBAcUAAAAAPjCpdROvceOUFiDcnZH1u36s_pr" data-callback="capcha_filled"
                                 data-expired-callback="capcha_expired"></div>
                        </div>
                    </div>
                </div>
                <div class="row space-20">

                    <input onclick="check_if_capcha_is_filled" type="submit" value="Vote" class="btn btn-primary btn-lg" style="float : right; margin-right: 20px;">
                </div>
            </form>
        </div>
    </div>
</div>
<%@ include file="analytics.jsp" %>
</body>
</html>

