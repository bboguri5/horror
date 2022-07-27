<%@ page contentType="text/html; charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="ko">

        <head>
            <%@ include file="./include/static-head.jsp" %>
        </head>

        <style>
            @font-face {
                font-family: 'horror';
                src: url('/youmurdererbb_reg.ttf') format('truetype');
            }

            body {
                position: relative;
            }

            #navBox {
                position: absolute;
                transform: translate(-50%, -50%);
                height: 735px;
                width: 800px;
                left: 50%;
                top: 450px;
                /* background: orange; */
                /* border: 2px solid #db0a0a; */
            }

            .menu1 {
                height: 350px;
                display: flex;
                justify-content: space-between;
                margin-bottom: 15px;
            }

            .menu2 {
                height: 350px;
                display: flex;
                justify-content: space-between;
            }

            .menu {
                width: 50%;
                height: 350px;
                /* flex: 1; */
                /* border: 1px solid #fff; */

                /* 컨텐츠 가운데 */
                /* display: flex; */
                /* justify-content: center; */
                /* align-items: center; */
                margin-left: 25px;
            }

            .menu a {
                width: 350px;
                height: 300px;
                display: block;
                background: #000;
            }

            .menu p {
                width: 350px;
                display: block;
                color: white;
                margin-bottom: 5px;
                font-size: 30px;
                font-family: 'horror';
                text-shadow: 4px 5px 7px red;

            }

            .community a {
                background: url('https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjA1MTVfMTE5%2FMDAxNjUyNTQ1ODQxOTMz.ZbkDSWEwyRgYbbEke3kqcG3b53ljpnMc7Lwxtic5-nYg.Ug-4BKttM3_yN5FjLwj24zUwaylQ7545Zd3L4eni6GMg.PNG.cdyeon11%2F2022-05-15.png&type=a340') no-repeat center/cover;
            }

            .community a:hover {
                transform: scale(3);
                position: absolute;
                top: 200px;
                left: 200px;
                z-index: 1;
            }

            .media a {
                background: url('https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAxNjEyMThfMzEg%2FMDAxNDgyMDMzMzYwNTcw.ue1oc67146Q6k_LGRbi9nBHXym6bhqVaK1l9-eYWBB8g.VFy8cTfTF7HHRQm76x9XvWObwFveQ1RFuxl3eBDTsU0g.GIF.hello131201%2F%25C5%25E4%25B7%25D5%25C0%25CC%25BC%25D2%25BE%25DF%25B9%25E6%25B1%25DF%25BF%25F2%25C2%25A9.gif&type=a340') no-repeat center/cover;
            }


            .media a:hover {
                transform: scale(3);
                position: absolute;
                top: 200px;
                left: 200px;
                z-index: 1;
            }

            .spot a {
                background: url('https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAxNzA3MDRfMjU2%2FMDAxNDk5MTI0NzIyNjgy.srcexfewmqgCxjnWNeGZAhl8loNHbJKZ_Q302d3pu4gg.WZ2yvLzDXOgoh0U94yFN5jR3GkrsgxlimleoR9d-ksIg.JPEG.hello131201%2F%25C6%25CE_%25C1%25C1%25BE%25C6%25C1%25C1%25BE%25C6.jpg&type=a340') no-repeat center/cover;
            }

            .spot a:hover {
                transform: scale(3);
                position: absolute;
                top: 200px;
                left: 200px;
                z-index: 1;
            }

            .calendar a {
                background: url('https://search.pstatic.net/common/?src=http%3A%2F%2Fshop1.phinf.naver.net%2F20220622_174%2F1655865717187iKIJ6_PNG%2F57001544800305040_938632062.png&type=a340') no-repeat center/cover;
            }



            .calendar a:hover {
                transform: scale(3);
                position: absolute;
                top: 200px;
                left: 200px;
                z-index: 1;
            }



            /* side bar */
            /* .sidenav {
                height: 100%;
                width: 0;
                position: fixed;
                z-index: 1;
                top: 0;
                right: 0;
                background-color: #111;
                overflow-x: hidden;
                transition: 0.5s;
                padding-top: 60px;
            }

            .sidenav a {
                padding: 8px 8px 8px 32px;
                text-decoration: none;
                font-size: 30px;
                color: #818181;
                display: block;
                transition: 0.3s;
                font-family: 'horror';
                letter-spacing: 4px;
                text-shadow: 4px 5px 7px red;
            }


            .sidenav a:hover {
                color: #f1f1f1;
            }

            .sidenav .closebtn {
                position: absolute;
                top: 0;
                right: 25px;
                font-size: 36px;
                margin-left: 50px;
            }

            @media screen and (max-height: 450px) {
                .sidenav {
                    padding-top: 15px;
                }

                .sidenav a {
                    font-size: 18px;
                }
            }

            .menuOpen {
                position: absolute;
                top: 20px;
                right: 20px;
                color: #fff;
                font-family: 'horror';
                letter-spacing: 4px;
                text-shadow: 4px 5px 7px red;
            } */
        </style>

        <body>
             <!-- header -->
            <%@ include file="./include/header.jsp" %>
            <!-- /header -->
            <div id="navBox">
                <div class="menu1">
                    <div class="community menu">
                        <p>community</p><a href="/horror/community/list"></a>
                    </div>
                    <div class="media menu">
                        <p>media</p><a href="/recboard/reclist"></a>
                    </div>
                </div>
                <div class="menu2">
                    <div class="spot menu">
                        <p>spot</p><a href="/horror/spot_board/spot"></a>
                    </div>
                    <div class="calendar menu">
                        <p>calendar</p><a href="/horror/calendar_board/list"></a>
                    </div>
                </div>
            </div>
        </body>
        <script>
           

            // ##[community] 이미지 확대 이벤트 [community]

            const $communityMenu = document.querySelector('.community a');
            console.log($communityMenu);

            // 공포이미지로 전환 + 확대 이벤트
            $communityMenu.addEventListener('mouseover', function () {

                $communityMenu.style.background =
                    'url("https://search.pstatic.net/common/?src=http%3A%2F%2Fshop1.phinf.naver.net%2F20210826_289%2F1629968179395714ar_JPEG%2F4uz7e2y_202182520622762357.jpg&type=a340") no-repeat center/cover';
            });

            // 귀여운 이미지로 전환

            $communityMenu.addEventListener('mouseleave', function () {

                $communityMenu.style.background =
                    'url("https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjA1MTVfMTE5%2FMDAxNjUyNTQ1ODQxOTMz.ZbkDSWEwyRgYbbEke3kqcG3b53ljpnMc7Lwxtic5-nYg.Ug-4BKttM3_yN5FjLwj24zUwaylQ7545Zd3L4eni6GMg.PNG.cdyeon11%2F2022-05-15.png&type=a340") no-repeat center/cover';
            });

            // ##[media] 이미지 확대 이벤트 [media]

            const $mediaMenu = document.querySelector('.media a');
            console.log($mediaMenu);

            // 공포이미지로 전환 + 확대 이벤트
            $mediaMenu.addEventListener('mouseover', function () {

                $mediaMenu.style.background =
                    'url("data:image/jpeg;base64,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") no-repeat center/cover';
            });

            // 귀여운 이미지로 전환

            $mediaMenu.addEventListener('mouseleave', function () {

                $mediaMenu.style.background =
                    'url("https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAxNjEyMThfMzEg%2FMDAxNDgyMDMzMzYwNTcw.ue1oc67146Q6k_LGRbi9nBHXym6bhqVaK1l9-eYWBB8g.VFy8cTfTF7HHRQm76x9XvWObwFveQ1RFuxl3eBDTsU0g.GIF.hello131201%2F%25C5%25E4%25B7%25D5%25C0%25CC%25BC%25D2%25BE%25DF%25B9%25E6%25B1%25DF%25BF%25F2%25C2%25A9.gif&type=a340") no-repeat center/cover';


            });

            // ##[spot]] 이미지 확대 이벤트 [spot]

            const $spotMenu = document.querySelector('.spot a');
            console.log($spotMenu);

            // 공포이미지로 전환 + 확대 이벤트
            $spotMenu.addEventListener('mouseover', function () {

                $spotMenu.style.background =
                    'url("https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2F20140627_100%2Fhyoungno1_1403860003388VPS4g_JPEG%2F3_%25281%2529.jpg&type=a340") no-repeat center/cover';
            });

            // 귀여운 이미지로 전환

            $spotMenu.addEventListener('mouseleave', function () {

                $spotMenu.style.background =
                    'url("https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAxNzA3MDRfMjU2%2FMDAxNDk5MTI0NzIyNjgy.srcexfewmqgCxjnWNeGZAhl8loNHbJKZ_Q302d3pu4gg.WZ2yvLzDXOgoh0U94yFN5jR3GkrsgxlimleoR9d-ksIg.JPEG.hello131201%2F%25C6%25CE_%25C1%25C1%25BE%25C6%25C1%25C1%25BE%25C6.jpg&type=a340") no-repeat center/cover';
            });

            // ##[calendar]] 이미지 확대 이벤트 [calendar]

            const $calendarMenu = document.querySelector('.calendar a');
            console.log($calendarMenu);

            // 공포이미지로 전환 + 확대 이벤트
            $calendarMenu.addEventListener('mouseover', function () {

                $calendarMenu.style.background =
                    'url("data:image/jpeg;base64,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") no-repeat center/cover ';
            });

            // 귀여운 이미지로 전환

            $calendarMenu.addEventListener('mouseleave', function () {

                $calendarMenu.style.background =
                    'url("https://search.pstatic.net/common/?src=http%3A%2F%2Fshop1.phinf.naver.net%2F20220622_174%2F1655865717187iKIJ6_PNG%2F57001544800305040_938632062.png&type=a340") no-repeat center/cover';
            });






        </script>

        </html>