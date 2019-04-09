<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='br'>
    <head>
        <script src='https://static.codepen.io/assets/editor/live/console_runner-1df7d3399bdc1f40995a35209755dcfd8c7547da127f6469fd81e5fba982f6af.js'>            
        </script><script src='https://static.codepen.io/assets/editor/live/css_reload-5619dc0905a68b2e6298901de54f73cefe4e079f65a75406858d92924b4938bf.js'>            
        </script><meta charset='UTF-8'><meta name="robots" content="noindex"><link rel="shortcut icon" type="image/x-icon" href="https://static.codepen.io/assets/favicon/favicon-8ea04875e70c4b0bb41da869e81236e54394d63638a1ef12fa558a4a835f1164.ico" /><link rel="mask-icon" type="" href="https://static.codepen.io/assets/favicon/logo-pin-f2d2b6d2c61838f7e76325261b7195c27224080bc099486ddd6dccb469b8e8e6.svg" color="#111" /><link rel="canonical" href="https://codepen.io/machycek/pen/YPZbJy" />

        <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css'>
        <style class="cp-pen-styles">body {
                overflow: hidden;
                width: 100%;
                height: 100%;
                background: #2c323c;
            }

            section {
                float: left;
                width: 100%;
                height: 100%;
                padding: 100px;
                -moz-box-sizing: border-box;
                -webkit-box-sizing: border-box;
                box-sizing: border-box;
            }
            section.active .content {
                opacity: 1;
            }
            section.active .circle {
                -moz-transform: translate(0px, 0) scale(100);
                -ms-transform: translate(0px, 0) scale(100);
                -webkit-transform: translate(0px, 0) scale(100);
                transform: translate(0px, 0) scale(100);
            }
            section.active .wrap {
                -moz-transform: translate(0px, 0);
                -ms-transform: translate(0px, 0);
                -webkit-transform: translate(0px, 0);
                transform: translate(0px, 0);
            }
            section.active .wrap .plus {
                -moz-transform: rotate(-315deg);
                -ms-transform: rotate(-315deg);
                -webkit-transform: rotate(-315deg);
                transform: rotate(-315deg);
            }
            section.active .wrap:hover {
                -moz-transform: translate(0px, 0);
                -ms-transform: translate(0px, 0);
                -webkit-transform: translate(0px, 0);
                transform: translate(0px, 0);
            }
            section .wrap {
                position: relative;
                z-index: 2;
                float: left;
                width: 25px;
                height: 25px;
                padding: 15px;
                cursor: pointer;
                background: #1E90FF;
                -moz-border-radius: 50%;
                -webkit-border-radius: 50%;
                border-radius: 50%;
                -moz-box-shadow: 0 0 0 -2px #2c323c, 0 0 0 -1px rgba(44, 111, 182, 0.3);
                -webkit-box-shadow: 0 0 0 -2px #2c323c, 0 0 0 -1px rgba(44, 111, 182, 0.3);
                box-shadow: 0 0 0 -2px #2c323c, 0 0 0 -1px rgba(44, 111, 182, 0.3);
                -moz-transform-origin: 50% 50%;
                -ms-transform-origin: 50% 50%;
                -webkit-transform-origin: 50% 50%;
                transform-origin: 50% 50%;
                -moz-transition: all 0.3s, -moz-transform 0.5s;
                -o-transition: all 0.3s, -o-transform 0.5s;
                -webkit-transition: all 0.3s, -webkit-transform 0.5s;
                transition: all 0.3s, transform 0.5s;
                -moz-transform: translate(100px, 0);
                -ms-transform: translate(100px, 0);
                -webkit-transform: translate(100px, 0);
                transform: translate(100px, 0);
            }
            section .wrap img.plus {
                -moz-transition: -moz-transform 0.5s;
                -o-transition: -o-transform 0.5s;
                -webkit-transition: -webkit-transform 0.5s;
                transition: transform 0.5s;
            }
            section .wrap:hover {
                /*  @include box-shadow(0 0 0 30px $primary-color, 0 0 0 31px $light-sc);*/
                background: #1E90FF;
                -moz-transform: translate(100px, 0) scale(0.9);
                -ms-transform: translate(100px, 0) scale(0.9);
                -webkit-transform: translate(100px, 0) scale(0.9);
                transform: translate(100px, 0) scale(0.9);
            }

            .circle {
                position: absolute;
                /*  z-index: 3;*/
                width: 47px;
                height: 47px;
                margin: 4px;
                background: #1E90FF;
                -moz-border-radius: 50%;
                -webkit-border-radius: 50%;
                border-radius: 50%;
                -moz-transform: translate(100px, 0) scale(1);
                -ms-transform: translate(100px, 0) scale(1);
                -webkit-transform: translate(100px, 0) scale(1);
                transform: translate(100px, 0) scale(1);
                -moz-transition: -moz-transform 0.8s;
                -o-transition: -o-transform 0.8s;
                -webkit-transition: -webkit-transform 0.8s;
                transition: transform 0.8s;
            }

            .content {
                position: relative;
                z-index: 2;
                float: left;
                height: 50px;
                margin-left: 120px;
                /*  opacity: 0;*/
                -moz-transition: opacity 0.3s 0.1s;
                -o-transition: opacity 0.3s 0.1s;
                -webkit-transition: opacity 0.3s;
                -webkit-transition-delay: 0.1s;
                transition: opacity 0.3s 0.1s;
            }
            .content img {
                width: 50px;
                height: 50px;
                margin-right: 20px;
                opacity: 0;
                -moz-border-radius: 50%;
                -webkit-border-radius: 50%;
                border-radius: 50%;
                -moz-transition: all 0.3s 0.1s;
                -o-transition: all 0.3s 0.1s;
                -webkit-transition: all 0.3s;
                -webkit-transition-delay: 0.1s;
                transition: all 0.3s 0.1s;
                -moz-transform: translate(0, 50px);
                -ms-transform: translate(0, 50px);
                -webkit-transform: translate(0, 50px);
                transform: translate(0, 50px);
            }
            .content img:last-child {
                margin-right: 0;
            }
            .content img:hover {
                cursor: pointer;
                -moz-transition: -moz-transform 0.3s;
                -o-transition: -o-transform 0.3s;
                -webkit-transition: -webkit-transform 0.3s;
                transition: transform 0.3s;
                -moz-transform: scale(1.1, 1.1);
                -ms-transform: scale(1.1, 1.1);
                -webkit-transform: scale(1.1, 1.1);
                transform: scale(1.1, 1.1);
            }
            .content .fadeIn {
                opacity: 1;
                -moz-transform: translate(0, 0);
                -ms-transform: translate(0, 0);
                -webkit-transform: translate(0, 0);
                transform: translate(0, 0);
                -moz-animation: showImage 0.5s cubic-bezier(0.77, 0.33, 0.56, 0.89);
                -webkit-animation: showImage 0.5s cubic-bezier(0.77, 0.33, 0.56, 0.89);
                animation: showImage 0.5s cubic-bezier(0.77, 0.33, 0.56, 0.89);
            }

            @-webkit-keyframes showImage {
                0% {
                    opacity: 0;
                    -moz-transform: translate(0, 50px);
                    -ms-transform: translate(0, 50px);
                    -webkit-transform: translate(0, 50px);
                    transform: translate(0, 50px);
                }
                80% {
                    opacity: 1;
                    -moz-transform: translate(0, -7px);
                    -ms-transform: translate(0, -7px);
                    -webkit-transform: translate(0, -7px);
                    transform: translate(0, -7px);
                }
                100% {
                    opacity: 1;
                    -moz-transform: translate(0, 0);
                    -ms-transform: translate(0, 0);
                    -webkit-transform: translate(0, 0);
                    transform: translate(0, 0);
                }
            }
        </style></head>
    <body>
        <h1 style ="color: white; position: absolute; left: 39%;
                " >Seja bem vindo, Coordenador!</h1>
        <section><div class="wrap">
                <img class="plus" src="../imagens/seta.png"  alt="plus" />
            </div>
            <div class="content">  
                <a href="cadastroProfessorAluno.jsp"><img style ="color: white;" alt="Gerenciar Professor"/></a><br><br>
                <a href="cadastroAluno.jsp"><img style ="color: white;" alt="Gerenciar Aluno"/></a><br><br>
                <!--<a href="listaProfessorAluno.jsp"><img style ="color: white;"  alt="Lista de Professores e Alunos"/></a><br><br>-->
            </div>
            <div class="circle"></div>
        </section>
        
<!--        <h1>Seja bem vindo,  coordenador!</h1>
        <a href="./vestibular/indexVestibular.jsp"> Cadastrar Professor </a><br>
        <a href="./curso/indexCurso.jsp">Cadastrar Disciplinas </a><br>
        <a href="./vestibular/indexVestibular.jsp"> Cadastrar turma </a><br>
        <a href="./vestibular/indexVestibular.jsp"> Vincular Professor ao Curso </a><br>
        <a href="../diretor/cadastroCoordenador.jsp"> Vincular Disciplinas aos Cursos </a><br>
        <a href="./vestibular/indexVestibular.jsp"> Vincular Disciplinas ao Professor </a><br>
        <a href="./vestibular/indexVestibular.jsp">  Vincular Turma ao Curso </a><br>
        <a href="./vestibular/indexVestibular.jsp">   Matricular Aluno na turma </a><br>
        <a href="./vestibular/indexVestibular.jsp">  Visualizar Alunos matriculados por turma </a><br>
        <a href="./coordenador/listaProfessorAluno.jsp">  Lista de Professores e Alunos </a><br>-->
        
       
        <script src='https://static.codepen.io/assets/common/stopExecutionOnTimeout-de7e2ef6bfefd24b79a3f68b414b87b8db5b08439cac3f1012092b2290c719cd.js'>            
        </script><script src='//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
        <script id="rendered-js">
            var images = $('.content img');
            $('.wrap').on('click', function () {
                fadeOut();
                $('section').toggleClass('active');
            });

            function fadeOut() {
                if (images.hasClass('fadeIn')) {
                    for (var i = 1; i <= images.length; i++) {
                        if (window.CP.shouldStopExecution(0))
                            break;
                        (function (i) {
                            setTimeout(function () {
                                $('.content img:nth-child(' + i + ')').removeClass('fadeIn');
                            }, i * 50);
                        })(i);
                    }
                    window.CP.exitedLoop(0);
                } else {
                    for (var i = 1; i <= images.length; i++) {
                        if (window.CP.shouldStopExecution(1))
                            break;
                        (function (i) {
                            setTimeout(function () {
                                $('.content img:nth-child(' + i + ')').addClass('fadeIn');
                            }, i * 80);
                        })(i);
                    }
                    window.CP.exitedLoop(1);
                }
            }
            //# sourceURL=pen.js
        </script>
    </body>
</html>

  
        

