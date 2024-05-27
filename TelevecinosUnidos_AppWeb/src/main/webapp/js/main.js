(function ($) {
    "use strict";

    // Spinner
    var spinner = function () {
        setTimeout(function () {
            if ($('#spinner').length > 0) {
                $('#spinner').removeClass('show');
            }
        }, 1);
    };
    spinner();
    
    
    // Back to top button
    $(window).scroll(function () {
        if ($(this).scrollTop() > 300) {
            $('.back-to-top').fadeIn('slow');
        } else {
            $('.back-to-top').fadeOut('slow');
        }
    });
    $('.back-to-top').click(function () {
        $('html, body').animate({scrollTop: 0}, 1500, 'easeInOutExpo');
        return false;
    });


    // Sidebar Toggler
    $('.sidebar-toggler').click(function () {
        $('.sidebar, .content').toggleClass("open");
        return false;
    });


    // Progress Bar
    $('.pg-bar').waypoint(function () {
        $('.progress .progress-bar').each(function () {
            $(this).css("width", $(this).attr("aria-valuenow") + '%');
        });
    }, {offset: '80%'});


    // Calender
    $('#calender').datetimepicker({
        inline: true,
        format: 'L'
    });


    // Testimonials carousel
    $(".testimonial-carousel").owlCarousel({
        autoplay: true,
        smartSpeed: 1000,
        items: 1,
        dots: true,
        loop: true,
        nav : false
    });


    // Tipos de incidencias - Chart
    var ctx1 = $("#type-incidents-bar").get(0).getContext("2d");
    var myChart1 = new Chart(ctx1, {
        type: "bar",
        data: {
            labels: ["Lunes", "Martes", "Miercoles", "Jueves", "Viernes", "Sábado", "Domingo"],
            datasets: [{
                    label: "Seguridad pública",
                    data: [20, 33, 14, 25, 38, 11, 29],
                    backgroundColor: "rgba(255, 183, 3, 1)"
                },
                {
                    label: "Emergencia médica",
                    data: [23, 31, 17, 38, 29, 12, 35],
                    backgroundColor: "rgba(251, 133, 0, 1)"
                },
                {
                    label: "Infraestructura",
                    data: [28, 36, 15, 32, 19, 27, 10],
                    backgroundColor: "rgba(33, 158, 188, 1)"
                },
                {
                    label: "Otro",
                    data: [16, 30, 25, 12, 37, 22, 18],
                    backgroundColor: "rgba(2, 48, 71, 1)"
                }
            ]
            },
        options: {
            responsive: true
        }
    });
    // Estados de incidencias - Chart
    var ctx2 = $("#status-incidents").get(0).getContext("2d");
    var myChart2 = new Chart(ctx2, {
        type: "line",
        data: {
            labels: ["Lunes", "Martes", "Miercoles", "Jueves", "Viernes", "Sábado", "Domingo"],
            datasets: [{
                    label: "Procesado",
                    data: [17, 26, 14, 21, 25, 14, 18],
                    backgroundColor: "rgba(42, 157, 143, 1)",
                    fill: false
                },
                {
                    label: "Pendiente",
                    data: [22, 32, 18, 27, 31, 18, 23],
                    backgroundColor:"rgba(233, 196, 106, 1)",
                    fill: false
                },
                {
                    label: "En curso",
                    data: [26, 39, 21, 32, 37, 22, 28],
                    backgroundColor: "rgba(38, 70, 83, 1)",
                    fill: false
                },
                {
                    label: "Cancelado",
                    data: [13, 20, 11, 16, 18, 11, 14],
                    backgroundColor:"rgba(231, 111, 81, 1)",
                    fill: false
                },
                {
                    label: "Rechazado",
                    data: [9, 13, 7, 11, 12, 7, 9],
                    backgroundColor: "rgba(244, 162, 97, 1)",
                    fill: false
                }
            ]
            },
        options: {
            responsive: true
        }
    });
    // Tipo 1
    var ctx3 = $("#type-incidents-pie-1").get(0).getContext("2d");
    var myChart3 = new Chart(ctx3, {
        type: "pie",
        data: {
            labels: ["Procesado - 20%","Pendiente - 25%", "En curso - 30%", "Cancelado - 15%","Rechazado - 10%"],
            datasets: [{
                backgroundColor: [
                    "rgba(42, 157, 143, 1)",
                    "rgba(233, 196, 106, 1)",
                    "rgba(38, 70, 83, 1)",
                    "rgba(231, 111, 81, 1)",
                    "rgba(244, 162, 97, 1)"
                ],
                data: [20,25,30,15,10],
            }]
        },
        options: {
            responsive: true
        }
    });
    // Tipo 2
    var ctx4 = $("#type-incidents-pie-2").get(0).getContext("2d");
    var myChart4 = new Chart(ctx4, {
        type: "pie",
        data: {
            labels: ["Procesado - 20%","Pendiente - 25%", "En curso - 30%", "Cancelado - 15%","Rechazado - 10%"],
            datasets: [{
                backgroundColor: [
                    "rgba(42, 157, 143, 1)",
                    "rgba(233, 196, 106, 1)",
                    "rgba(38, 70, 83, 1)",
                    "rgba(231, 111, 81, 1)",
                    "rgba(244, 162, 97, 1)"
                ],
                data: [20,25,30,15,10],
            }]
        },
        options: {
            responsive: true
        }
    });
    // Tipo 3
    var ctx5 = $("#type-incidents-pie-3").get(0).getContext("2d");
    var myChart5 = new Chart(ctx5, {
        type: "pie",
        data: {
            labels: ["Procesado - 20%","Pendiente - 25%", "En curso - 30%", "Cancelado - 15%","Rechazado - 10%"],
            datasets: [{
                backgroundColor: [
                    "rgba(42, 157, 143, 1)",
                    "rgba(233, 196, 106, 1)",
                    "rgba(38, 70, 83, 1)",
                    "rgba(231, 111, 81, 1)",
                    "rgba(244, 162, 97, 1)"
                ],
                data: [20,25,30,15,10],
            }]
        },
        options: {
            responsive: true
        }
    });
    // Tipo 4
    var ctx6 = $("#type-incidents-pie-4").get(0).getContext("2d");
    var myChart6 = new Chart(ctx6, {
        type: "pie",
        data: {
            labels: ["Procesado - 20%","Pendiente - 25%", "En curso - 30%", "Cancelado - 15%","Rechazado - 10%"],
            datasets: [{
                backgroundColor: [
                    "rgba(42, 157, 143, 1)",
                    "rgba(233, 196, 106, 1)",
                    "rgba(38, 70, 83, 1)",
                    "rgba(231, 111, 81, 1)",
                    "rgba(244, 162, 97, 1)"
                ],
                data: [20,25,30,15,10],
            }]
        },
        options: {
            responsive: true
        }
    });

    // Tipos de incidencias - Chart
    var ctx7 = $("#type-incidents-urb-bar").get(0).getContext("2d");
    var myChart7 = new Chart(ctx7, {
        type: "bar",
        data: {
            labels: ["Rafael Escardó", "José de La Riva Agüero", " Juan XXIII", "Libertad", "Los Jardines de La Marina", "Las Leyendas", "Las Torres San Miguelito","Elmer Faucett","Maranga","Pando" ,"Parques de La Huaca", "Otro"],
            datasets: [{
                    label: "Seguridad pública",
                    data: [40, 23, 60, 31, 70, 37, 80, 38, 74, 29, 47, 29],
                    backgroundColor: "rgba(255, 183, 3, 1)"
                },
                {
                    label: "Emergencia médica",
                    data: [66, 65, 55, 70, 60, 75, 85, 80, 88, 95, 61, 73],
                    backgroundColor: "rgba(251, 133, 0, 1)"
                },
                {
                    label: "Infraestructura",
                    data:  [85, 52, 48, 63, 43, 72, 78, 82, 64, 93, 80, 66],
                    backgroundColor: "rgba(33, 158, 188, 1)"
                },
                {
                    label: "Otro",
                    data:  [47, 62, 58, 63, 50, 92, 78, 82, 58, 53, 55, 40],
                    backgroundColor: "rgba(2, 48, 71, 1)"
                }
            ]
            },
        options: {
            responsive: true
        }
    });
/*
    // Single Line Chart
    var ctx7 = $("#line-chart").get(0).getContext("2d");
    var myChart7 = new Chart(ctx7, {
        type: "line",
        data: {
            labels: [50, 60, 70, 80, 90, 100, 110, 120, 130, 140, 150],
            datasets: [{
                label: "Salse",
                fill: false,
                backgroundColor: "rgba(0, 156, 255, .3)",
                data: [7, 8, 8, 9, 9, 9, 10, 11, 14, 14, 15]
            }]
        },
        options: {
            responsive: true
        }
    });
    // Single Bar Chart
    var ctx8 = $("#bar-chart").get(0).getContext("2d");
    var myChart8 = new Chart(ctx8, {
        type: "bar",
        data: {
            labels: ["Italy", "France", "Spain", "USA", "Argentina"],
            datasets: [{
                backgroundColor: [
                    "rgba(0, 156, 255, .7)",
                    "rgba(0, 156, 255, .6)",
                    "rgba(0, 156, 255, .5)",
                    "rgba(0, 156, 255, .4)",
                    "rgba(0, 156, 255, .3)"
                ],
                data: [55, 49, 44, 24, 15]
            }]
        },
        options: {
            responsive: true
        }
    });
    // Doughnut Chart
    var ctx9 = $("#doughnut-chart").get(0).getContext("2d");
    var myChart9 = new Chart(ctx9, {
        type: "doughnut",
        data: {
            labels: ["Italy", "France", "Spain", "USA", "Argentina"],
            datasets: [{
                backgroundColor: [
                    "rgba(0, 156, 255, .7)",
                    "rgba(0, 156, 255, .6)",
                    "rgba(0, 156, 255, .5)",
                    "rgba(0, 156, 255, .4)",
                    "rgba(0, 156, 255, .3)"
                ],
                data: [55, 49, 44, 24, 15]
            }]
        },
        options: {
            responsive: true
        }
    });
    */
    
})(jQuery);

