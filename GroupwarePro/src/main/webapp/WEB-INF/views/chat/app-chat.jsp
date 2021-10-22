<!DOCTYPE html>
<html dir="ltr" lang="ko">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="${ pageContext.servletContext.contextPath }/resources/assets/images/favicon.png">
    <title>채팅</title>
    <!-- This page css -->
    <!-- Custom CSS -->
    <link href="${ pageContext.servletContext.contextPath }/resources/dist/css/style.min.css" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
</head>

<body>
    <!-- ============================================================== -->
    <!-- Preloader - style you can find in spinners.css -->
    <!-- ============================================================== -->
    <div class="preloader">
        <div class="lds-ripple">
            <div class="lds-pos"></div>
            <div class="lds-pos"></div>
        </div>
    </div>
    <!-- ============================================================== -->
    <!-- Main wrapper - style you can find in pages.scss -->
    <!-- ============================================================== -->
    <div id="main-wrapper" data-theme="light" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full" data-sidebar-position="fixed" data-header-position="fixed" data-boxed-layout="full">
        <!-- ============================================================== -->
        <!-- Topbar header - style you can find in pages.scss -->
      	<jsp:include page="../common/header.jsp"/>
      	        <!-- End Topbar header -->
        <!-- ============================================================== -->
        
        
        <!-- Left Sidebar - style you can find in sidebar.scss  -->
        <!-- ============================================================== -->
        <jsp:include page="../common/sidebar.jsp"/>
        <!-- ============================================================== -->
        <!-- End Left Sidebar - style you can find in sidebar.scss  -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Page wrapper  -->
        <!-- ============================================================== -->
        <div class="page-wrapper">
            <!-- ============================================================== -->
            <!-- Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-7 align-self-center">
                        <h4 class="page-title text-truncate text-dark font-weight-medium mb-1">Chat</h4>
                        <div class="d-flex align-items-center">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb m-0 p-0">
                                    <li class="breadcrumb-item text-muted active" aria-current="page">Apps</li>
                                    <li class="breadcrumb-item text-muted" aria-current="page">Chat</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                    <div class="col-5 align-self-center">
                        <div class="customize-input float-right">
                            <select class="custom-select custom-select-set form-control bg-white border-0 custom-shadow custom-radius">
                                <option selected>Aug 19</option>
                                <option value="1">July 19</option>
                                <option value="2">Jun 19</option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
            <!-- ============================================================== -->
            <!-- End Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- Container fluid  -->
            <!-- ============================================================== -->
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="row no-gutters">
                                <div class="col-lg-5 col-xl-2 border-right">
                                    <div class="card-body border-bottom">
                                        <form>
                                            <input class="form-control" type="text" placeholder="Search Contact">
                                        </form>
                                    </div>
                                    <div class="scrollable position-relative" style="height: calc(100vh - 111px);">
                                        <ul class="mailbox list-style-none">
                                            <li>
                                                <div class="message-center">
                                                    <!-- Message -->
                                                    <a href="javascript:void(0)"
                                                        class="message-item d-flex align-items-center border-bottom px-3 py-2">
                                                        <div class="user-img"><img src="${ pageContext.servletContext.contextPath }/resources/assets/images/users/1.jpg"
                                                                alt="user" class="img-fluid rounded-circle"
                                                                width="40px"> <span
                                                                class="profile-status online float-right"></span>
                                                        </div>
                                                        <div class="w-75 d-inline-block v-middle pl-2">
                                                            <h6 class="message-title mb-0 mt-1">Pavan kumar</h6>
                                                            <span
                                                                class="font-12 text-nowrap d-block text-muted text-truncate">Just
                                                                see
                                                                the my new
                                                                admin!</span>
                                                            <span class="font-12 text-nowrap d-block text-muted">9:30
                                                                AM</span>
                                                        </div>
                                                    </a>
                                                    <!-- Message -->
                                                    <a href="javascript:void(0)"
                                                        class="message-item d-flex align-items-center border-bottom px-3 py-2">
                                                        <div class="user-img"><img src="${ pageContext.servletContext.contextPath }/resources/assets/images/users/2.jpg"
                                                                alt="user" class="img-fluid rounded-circle"
                                                                width="40px"> <span
                                                                class="profile-status busy float-right"></span>
                                                        </div>
                                                        <div class="w-75 d-inline-block v-middle pl-2">
                                                            <h6 class="message-title mb-0 mt-1">Sonu Nigam</h6>
                                                            <span
                                                                class="font-12 text-nowrap d-block text-muted text-truncate">I've
                                                                sung a
                                                                song! See you at</span>
                                                            <span class="font-12 text-nowrap d-block text-muted">9:10
                                                                AM</span>
                                                        </div>
                                                    </a>
                                                    <!-- Message -->
                                                    <a href="javascript:void(0)"
                                                        class="message-item d-flex align-items-center border-bottom px-3 py-2">
                                                        <div class="user-img"> <img src="${ pageContext.servletContext.contextPath }/resources/assets/images/users/3.jpg"
                                                                alt="user" class="img-fluid rounded-circle"
                                                                width="40px"> <span
                                                                class="profile-status away float-right"></span>
                                                        </div>
                                                        <div class="w-75 d-inline-block v-middle pl-2">
                                                            <h6 class="message-title mb-0 mt-1">Arijit Sinh</h6>
                                                            <span
                                                                class="font-12 text-nowrap d-block text-muted text-truncate">I
                                                                am a
                                                                singer!</span>
                                                            <span class="font-12 text-nowrap d-block text-muted">9:08
                                                                AM</span>
                                                        </div>
                                                    </a>
                                                    <!-- Message -->
                                                   
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="col-lg-7  col-xl-10">
                                    <div class="chat-box scrollable position-relative"
                                        style="height: calc(100vh - 111px);">
                                        <!--chat Row -->
                                        <ul class="chat-list list-style-none px-3 pt-3">

                                           
                                            <!--chat Row -->
                                            <li class="chat-item list-style-none mt-3">
                                                <div class="chat-img d-inline-block"><img
                                                        src="${ pageContext.servletContext.contextPath }/resources/assets/images/users/3.jpg" alt="user"
                                                        class="rounded-circle" width="45">
                                                </div>
                                                <div class="chat-content d-inline-block pl-3">
                                                    <h6 class="font-weight-medium">Angelina Rhodes</h6>
                                                    <div class="msg p-2 d-inline-block mb-1">Well we
                                                        have good budget
                                                        for the project
                                                    </div>
                                                </div>
                                                <div class="chat-time d-block font-10 mt-1 mr-0 mb-3">11:00 am
                                                </div>
                                            </li>
                                            <!--chat Row -->
                                            <li class="chat-item odd list-style-none mt-3">
                                                <div class="chat-content text-right d-inline-block pl-3">
                                                    <div class="box msg p-2 d-inline-block mb-1">I
                                                        would love to
                                                        join the team.</div>
                                                    <br>
                                                </div>
                                            </li>
                                            <!--chat Row -->
                                            <li class="chat-item odd list-style-none mt-3">
                                                <div class="chat-content text-right d-inline-block pl-3">
                                                    <div class="box msg p-2 d-inline-block mb-1 box">
                                                        Whats budget
                                                        of the new project.</div>
                                                    <br>
                                                </div>
                                                <div class="chat-time text-right d-block font-10 mt-1 mr-0 mb-3">
                                                    10:59 am</div>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="card-body border-top">
                                        <div class="row">
                                            <div class="col-9">
                                                <div class="input-field mt-0 mb-0">
                                                    <input id="textarea1" placeholder="Type and enter"
                                                        class="form-control border-0" type="text">
                                                </div>
                                            </div>
                                            <div class="col-3">
                                                <a class="btn-circle btn-lg btn-cyan float-right text-white"
                                                    href="javascript:void(0)"><i class="fas fa-paper-plane"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- footer -->
            <!-- ============================================================== -->
            <footer class="footer text-center">
                All Rights Reserved by Adminmart. Designed and Developed by <a
                    href="https://wrappixel.com">WrapPixel</a>.
            </footer>
            <!-- ============================================================== -->
            <!-- End footer -->
            <!-- ============================================================== -->
        </div>
        <!-- ============================================================== -->
        <!-- End Page wrapper  -->
        <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- End Wrapper -->
    <!-- ============================================================== -->
    <!-- End Wrapper -->
    <!-- ============================================================== -->
    <!-- All Jquery -->
    <!-- ============================================================== -->
    <script src="${ pageContext.servletContext.contextPath }/resources/assets/libs/jquery/dist/jquery.min.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/assets/libs/popper.js/dist/umd/popper.min.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- apps -->
    <!-- apps -->
    <script src="${ pageContext.servletContext.contextPath }/resources/dist/js/app-style-switcher.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/dist/js/feather.min.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/dist/js/sidebarmenu.js"></script>
    <!--Custom JavaScript -->
    <script src="${ pageContext.servletContext.contextPath }/resources/dist/js/custom.min.js"></script>
    <!--This page JavaScript -->
    <script>
        $(function () {
            $(document).on('keypress', "#textarea1", function (e) {
                if (e.keyCode == 13) {
                    var id = $(this).attr("data-user-id");
                    var msg = $(this).val();
                    msg = msg_sent(msg);
                    $("#someDiv").append(msg);
                    $(this).val("");
                    $(this).focus();
                }
            });
        });
    </script>
</body>

</html>