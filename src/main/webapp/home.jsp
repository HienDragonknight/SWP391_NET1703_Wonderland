<%-- 
    Document   : home
    Created on : Jan 20, 2024, 11:02:52 AM
    Author     : Le Huu Huy
--%>

<%@page import="models.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Wonderlands</title>
        <link rel="icon" href="image/LogoTron.png"/>
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700;900&display=swap');
            @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap');

            * {
                padding: 0;
                margin: 0;
                box-sizing: border-box;
                font-family: 'Roboto', sans-serif;
            }

            i {
                font-size: 24px;
            }

            a {
                text-decoration: none;
                font-size: 18px;
                color: #232325;
            }

            header .side-bar {
                display: flex;
                justify-content: space-between;
                align-items: center;
                height: 120px;
            }

            header .side-bar .logo {
                width: 217px;
                height: 38px;
                max-width: 100vw;
            }

            header .side-bar .logo img {
                position: relative;
                bottom: 45px;
                left: 35px;
                width: 100%;
                height: 120px;
            }

            header .side-bar .search-bar {
                position: relative;
                display: flex;
                width: 30%;
                padding: 8px;
                border-radius: 250px;
                border: 1px solid #919191;
                border-color: #5773ff;
            }

            header .side-bar .search-bar form {
                display: flex;
                gap: 12px;
                width: 100%;
            }

            header .side-bar .search-bar button {
                border: none;
                background-color: #fff;
            }

            header .side-bar .search-bar input {
                width: 100%;
                border: none;
                outline: none;
                background-color: transparent;
                font-size: 18px;
            }

            header .side-bar .search-bar:hover i{
                color: #5773ff;
            }

            header .side-bar .profile {
                display: flex;
                justify-content: center;
                align-items: center;
                gap: 8px;
                padding: 30px;
            }

            header .side-bar .profile .login-pro i,
            header .side-bar .profile .sign-pro i {
                cursor: pointer;
            }

            header .side-bar .profile .login-pro:hover i,
            header .side-bar .profile .login-pro:hover a {
                color: #5773ff;
            }

            header .side-bar .profile .sign-pro:hover i,
            header .side-bar .profile .sign-pro:hover a {
                color: #5773ff;
            }

            header .side-bar .user-logined {
                display: flex;
                justify-content: center;
                align-items: center;
                gap: 30px;
                padding: 30px;
            }

            header .side-bar .user-logined .logined,
            header .side-bar .user-logined .cart-items{
                display: flex;
                justify-items: center;
                align-items: center;
                gap: 8px;
            }

            header .side-bar .user-logined i {
                cursor: pointer;
            }

            header .side-bar .user-logined .logined:hover i,
            header .side-bar .user-logined .logined:hover a {
                color: #5773ff;
            }

            header .side-bar .user-logined .cart-items:hover i,
            header .side-bar .user-logined .cart-items:hover a {
                color: #5773ff;
            }

            .container .column {
                display: grid;
                grid-template-columns: 1fr 5fr 1fr;
            }

            .menu-ic li:hover a,
            .menu-ic li:hover i {
                color: #5773ff;
            }

            .menu-ic {
                list-style: none;
                display: flex;
                flex-direction: column;
                padding: 10px 50px;
            }

            .menu-ic li {
                margin-bottom: 12px;
                display: flex;
                align-items: center;
                gap: 20px;
                cursor: pointer;
            }

            .menu-ic li a {
                font-size: 16px;
                transition: all 0.3s ease;
            }

            .slide-container {
                position: relative;
                width: 100%;
                max-width: 100vw;
                height: 650px;
                max-height: 100vh;
                margin: auto;
            }

            .slide-container .slides {
                width: 100%;
                height: 100%;
                position: relative;
                overflow: hidden;
            }

            .slide-container .slides img{
                width: 100%;
                height: 100%;
                position: absolute;
                object-fit: cover;
                border-radius: 50px;
            }

            .slide-container .slides img:not(.active) {
                top: 0;
                left: -100%;
            }

            span.next, span.prev {
                display: none;
            }

            .dotsContainer {
                position: absolute;
                bottom: 5px;
                z-index: 3;
                left: 50%;
                transform: translateX(-50%);
                padding: 10px;
            }

            .dotsContainer .active {
                background-color: #5773ff;
            }

            .dotsContainer .dot {
                width: 15px;
                height: 15px;
                margin: 0px 2px;
                border: 3px solid #bbb;
                border-radius: 50%;
                display: inline-block;
                transition: background-color 0.6s ease;
                cursor: pointer;
            }

            .logout {
                list-style: none;
                display: flex;
                flex-direction: column;
                padding: 10px 50px;
            }

            .logout li a{
                color: red;
                margin-bottom: 12px;
                display: flex;
                align-items: center;
                gap: 20px;
                cursor: pointer;
            }

            .page-footer {
                background-color: #f6f6f9;
                border-top-left-radius: 50%;
                border-top-right-radius: 50%;
                font-family: 'Poppins', sans-serif;
            }

            footer {
                height: 100%;
            }

            .footer-content {
                display: flex;
                justify-content: center;
                align-items: center;
                padding: 50px;
                gap: 100px;
                margin-bottom: -50px;
            }

            .footer-content-usp ul {
                list-style: none;
            }

            .footer-content-usp ul li {
                margin-bottom: 20px;
            }

            .footer-header {
                display: flex;
                justify-content: center;
                align-items: center;
            }

            .footer-header h2 {
                margin-top: 40px;
            }

            .footer-content-usp a {
                display: flex;
                align-items: center;
            }

            .copy-right {
                background-color: #fff;
            }

            .copy-right-content {
                padding: 20px;
                display: flex;
                justify-content: center;
                align-items: center;
            }

            .logout li form {
                display: flex;
                gap: 20px;
                color: red;
                cursor: pointer
            }

            .logout li form input {
                border: none;
                background-color: #fff;
                font-size: 17px;
                color: red;
                cursor: pointer;
            }

            main {
                margin-bottom: 30px;
            }

            @keyframes next1 {
                from {
                    left: 0%;
                }
                to {
                    left: -100%;
                }
            }

            @keyframes next2 {
                from {
                    left: 100%;
                }
                to {
                    left: 0%;
                }
            }

            @keyframes prev1 {
                from {
                    left: 0%;
                }
                to {
                    left: 100%;
                }
            }

            @keyframes prev2 {
                from {
                    left: -100%;
                }
                to {
                    left: 0%;
                }
            }

            @media screen and (max-width: 992px) {
                .container main {
                    grid-template-columns: 3fr 2fr;
                }

                .menu {
                    position: absolute;
                    left: -100%;
                }
            }

            .intro-wrapper {
                display: flex;
                justify-content: center;
                align-items: center;
                padding-left: 100px;
                padding-right: 100px;
                margin-top: 30px;
                gap: 30px;
                margin-bottom: 20px;
            }

            .intro-image {
                width: 50%;
            }

            .intro-image img {
                width: 100%;
                border-radius: 20px;
            }

            .intro-text {
                width: 50%;
            }

            .intro-text p {
                margin-bottom: 20px;
            }

            .intro-text button {
                border: none;
                border-radius: 5px;
            }

            .intro-text button a{
                display: flex;
                justify-content: center;
                align-items: center;
                padding: 8px;
                color: #5773ff;
                gap: 5px;
            }

            .about {
                background: #FFF5CB;
                padding: 50px;
                border-top-left-radius: 25%;
                border-top-right-radius: 25%;
                border-bottom-left-radius: 25%;
                border-bottom-right-radius: 25%;
                margin-bottom: 40px;
            }

            .about .about-top h2 {
                display: flex;
                justify-content: center;
                align-items: center;
                margin-bottom: 40px;
            }

            .ups-row {
                display: flex;
                justify-content: space-evenly;
            }

            .ups-row-content {
                display: flex;
                flex-direction: column;
                align-items: center;
                gap: 20px;
                margin-bottom: 60px;
            }

            .service {
                padding: 60px;
            }

            .service-container {
                margin: 0px 231.5px;
                padding: 0px 7.5px;
            }

            .special-image {
                width: 100%;
                border-radius: 50px;
                margin-top: 20px;
            }

            .service .service-heading{
                text-align: center;
                font-weight: bold;
            }

            .special-title {
                display: flex;
                justify-content: flex-start;
                align-items: center;
                gap: 10px;
            }

            .special-title span {
                font-size: 20px;
                font-weight: bold;
            }

            .special-image {
                margin-bottom: 20px;
            }

            .special-image img {
                width: 100%;
                border-radius: 30px;
            }

            .theme {
                display: flex;
                justify-content: center;
                align-items: center;
                flex-direction: column;
                margin-bottom: 20px;
            }

            .theme h4 {
                border: 1px solid #ffa000;
                max-width: 250px;
                padding: 10px 20px;
                border-radius: 30px;
                position: relative;
                top: 20px;
                background: #fff;
            }

            .theme-container {
                background-color: #fff8e0;
                border-radius: 32px;
                padding: 40px;
                margin: 0 auto;
            }

            .service-other {
                display: flex;
                flex-direction: column;
            }

            .services-others-contents {
                border-radius: 32px;
                border: 6px dashed #c0f0ff;
                padding: 30px 0;
                gap: 30px;
                margin-top: 20px;
            }

            .services-other-list {
                display: flex;
                justify-content: center;
                align-items: center;
                margin: 0 auto;
                gap: 150px;
            }

            .services-other-item {
                display: flex;
                justify-content: center;
                align-items: center;
                flex-direction: column;
            }

            .service-desc {
                padding: 20px 0px;
                display: flex;
                justify-content: center;
                align-items: center;
            }

            .service-btn {
                display: flex;
                justify-content: center;
                align-items: center;
            }

            .service-btn button {
                padding: 20px;
                border-radius: 30px;
                background: #00a0e0;
                border: none;
            }

            .service-btn button a {
                display: flex;
                justify-content: center;
                align-items: center;
                gap: 5px;
            }
        </style>
    </head>
    <body>
        <!--Use the below code snippet to provide real time updates to the live chat plugin without the need of copying and paste each time to your website when changes are made via PBX-->
    <call-us-selector phonesystem-url="https://1111.3cx.cloud" party="wonderland"></call-us-selector>

    <!--Incase you don't want real time updates to the live chat plugin when options are changed, use the below code snippet. Please note that each time you change the settings you will need to copy and paste the snippet code to your website--> 
    <!--<call-us 
    phonesystem-url="https://1111.3cx.cloud" 
    style="position:fixed;font-size:16px;line-height:17px;z-index: 99999;--call-us-main-accent-color:#47D6D6;--call-us-main-background-color:#FFFFFF;--call-us-plate-background-color:#206C77;--call-us-plate-font-color:#E6E6E6;--call-us-main-font-color:#292929;--call-us-agent-bubble-color:#29292910;right: 20px; bottom: 20px;" 
    id="wp-live-chat-by-3CX" 
    minimized="false" 
    animation-style="fadein" 
    party="wonderland" 
    minimized-style="bubbleright" 
    allow-call="false" 
    allow-video="false" 
    allow-soundnotifications="true" 
    enable-mute="true" 
    enable-onmobile="true" 
    offline-enabled="true" 
    enable="true" 
    ignore-queueownership="false" 
    authentication="none" 
    operator-name="Wonderland Supporter" 
    show-operator-actual-name="true" 
    aknowledge-received="true" 
    operator-icon="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAIAAAACACAYAAADDPmHLAAAAAXNSR0IArs4c6QAAIABJREFUeF7EvQeQZdd5Hvjd+3JOneN0mBwwAwxyJBIRCBAkCICEQCVKcpC9a7kk2SqtpF3L2iqXlyuHlbS2xbVUkrlFihYpRgGkABAAkTHAYPJM93ROr1/O8d7V/59z7ruvp3sG5HJrm8R0eO/dcM73p+8PV3vkrgOmBvoyoWmABv4HmmZCg04/0L+A/Fe+FRra/BrofXQAOopJ7zJhGsCZmRQigX6M9PTDwWdw0GH5P3off9cMPpz8rfOi9Tf1uniXzifqfJm2j/KP/Ad5RNt7TVOjU9KV8fXRySv1Bnwet7jmruN2n0NdmwnDukw+2NYv00SlUYOpafC5PdZ9qus2TfEhbes9mHRVcgn40tT5TdBnxKsayvUGVgur6Ol1QdPavN4arx/9p/F7DcOAaRp8DD6NfQ10B0DHo+uQf6eftUfuOsjLwzfIh3Lw5gsQiAOJixKLqH6i38QmqnWh3wwYhob5lQL8rgQGI71y2wHdFDCyNooPpFay8xqDwuT/I1cuIhIM8pnF/djeZx3MtunbbYzApVwkcS/1ZgOlWgWJcLgDRvmezv10PifO0H3wrTChxSzXqmgYLUT8QbEo8iO6takdAKijKWBIGEC3CRptpvU+zUS2VEaquoL+/gB0XUFDXhtvrlxfuVedizBZPvmdtOmaAAyvyifuOWTSxqk/6LolpxZaadFoCxSg6C0aH0DiVSPJAjRdw+XFLFyIYjA+AKcFHXr/VgAoNaDgry5KaJR0MY+2riMRDLLUMhhtC9lBk/zJfjibdHa0BB1fKKpsoQCPxw2/xwtdrZoNUGrDtsPTNriz1q7ZaiGZz6EvkVDKUQpM58qVBlAaSe1wBwAdaCkNIEWN9yBbLiLXWkV/b0AgjHdP7p+6YAU+elndny7WX6yH0Br8vyfuO2J2VLFt5SzFTBsvdQDtDB9Bqn2pZfhVA1hLFlEquLFraBgOU4dGakrtr9E5Dv9JokmBijeHVZ4B0zCwlEthKN4DN6kuJcN29cmqzKbmPgIAaPfp1pOZNGLRMFwOpzAJW762A8BWiVcfsRaYpQtYSK5jcKCPNZ9UpHKpO5bOjjm6Y0sibfdAfzNsb2TA0GYbGtYKa/DHavB7HAwK1t7SlBjydsR6CqESy6YMPf29I/Dapx84Yupsx2lzty6G2nil6oUZoC9WFEKJ8KHXkxVUS04MJAZ482kRhVEAcsUinLoT4UCA/05XtN2C0oXRZieLWb6x3khMaBbbmcTNiKvYSULtx+68h+6PAKBhI5tCIhaBU6dtUvLV0STWndkAt53K3wocWr7NYoHsHRLBsBAcSy2Ld3c0ku3TLMhCmq84j1xjIelCTzSaLazmFzE85u44D+rypWZmAChbyi6aOD4pYgamNLPakw8eMR2kwrucpu5bI+0hnAqpxm03RX+vVk0sLNUwnBiEU3OAZJakv95qYTm1iWg4jLA3AJfDAV0ew7pReSEMFRNomgbOLl3G/rEpOHVhdoSU2sB45V51XfDVANAyDGwWckhEQwzKnx4AhMS2jTbOLM/jyPiU8I9sa2WBUV4g+14KEXLD1D7YNYtw8sSGKn+mWK0iXZ/HyHC481fLzkuwXSHQwgEUb5P/fvqBw6ZDCKX1Ap/IUh9CdSv8koqh49KFkhZoNtu4dLmEib4xOEmlElLbBgq1KrKlIgbifZZXTPAhAFyxQXxXBuk3XNogT7cXYZdXSD9pJ+nB8DXaNIDa9Sv11lbZVOpQSE+uVkIiHIJDExpgpy9l+ra+blfNnaXUYZhtjgLOLVzG9MgY3A4SBWVtbRrL5iCqzRB71TGt1r0pibZpPGH9TCxl1uCL1REOuBgEHRkWgiMOKTZdiJAtkFFO4GP3HDQdJOG2haDNp5CCN9swQY6hWHxCokCjQ9PQarWxulHHQGwYPranGor1OnvvAa8fUX9YaBaWBIE8u6bhdRDQ5vMXamXk6zUMxHsYSEL9C63D1yfD063K/1oAUFJG36v1BoqNCnrDpKLpiglgtpWx7Tbfr/U7u8H829UAwCavXEa73UIPn2M757UjUGINbL/bpKPbV1A2vBMekvBtlFfQO6DzHgmtQeGgAIPSFkriWPXLfeQ1pWt74t5DpkMXdlAFFpquy40SAaLaRGHExKK4TCeWk3noRgQxX4i3aSOXQ6lWw1j/IFyasyvmFSxAdxzcAYBQbuv5LELBILwuDx9PAUDdusU5bJHaawNA7DAtdKVWQ6VVQzwUsTgOAtuVTol0zmy2tbNN3TpBhcmsAcgZ0x1YSq5jrLeHzWa3zlNyqLZHmQH5+w6muBMJSP9HaobV7AbCvXV43N26jDaX1m+rz6E0jboD7amPHzEdOqlztUFyLaRPqNbG/p02s1wzsLrSxEC0hzQ3krk83C4XesMxll4hrTYZFuDsXmdls2Cg2Wxho5jDQKKXF0z8ZweMOMB2JmBHHa40jKVD6LprTNgkwpFu53K7g9iZJbv6tL/XtsJW3K5pWMuk0B+L8bqq/6mQSABGLogNYGwsLA0gNK3dzFk+gPT46fIa7Tbmc5cxucvf5RAKAEhQ8F52gGYnpbTPPnyUTYBly9QFyA9ZSLHieBPttoYz59MY7RtDs20gly0iEYnBR3E122yhNQSXKD1Iqeo7NlNcL2PFNLGS24TH60M0EIJuys1XAJD20YqrbBrA7k/YF8uCmmK/5GLkK2W0jDbiwZDgJizfZytL12Ho7LZTWGrbl32T6FzS8UsW8wh5vfC63dL26nZizopjhEtjeYUKDjazIP5EV0Pay+3xWCdnYJnAWnYTjkgR8bBHcj8SYOp6eJ3FYou7UiSeBu1zj1xnsmOmglb7vSkI8uaJwI7ed2kug7B3FKbRQq5YxkjfEMgD4Ksx2vw+8iFapgmf0y0MjwSAXSXZVerphRnsnZhi1ApvwgZKtcj2a5T3uDMA2hJhHdaLLmEtm4Lf50PI5xehqgK2zTZur1E6tLSdSbsCC3LN0uUCPE4n/F5fx5TZHFg7iISTq9SjLqVVhuZSi9FhN4i/SMSYYLO8eSnZp1ZPYXI8IjeX9lPsFdPD7GJLGniLTtE++/B1pvDyBTKUsKmwyxI+udKFYh2ZlAN+dwC1RhuJUAxup53nFwt/eW0Fw/2D8DmIuyaiSNouuwqQdmw9l4budiERIKdJRBEuXQJOEg7q0yIctQRly151zkGOkHUqtcAAzq8uYrS/n4EpYCb+3Y6r7+btOwu4LWUi5VRpiFypCDh0RHzEfXQTXywLrHksZNt0vdoL258kSZYrl9BEC7FAiNeIoi7aM1rxZG4TjmAJMdICXUyJMt5SECRALU3wmQcOiz1mJJETI9FFKlzmAXjNOR7XsLxchtnywoQL/ZG4CP0sSljcFKmqdLmIkXifxSJuH22Z7FHPbKxg18AwRxb0lcpm0BdLbPEBVByjpEURCFvQQEqIEiMwMTwQRjpVRrPZkbd3Z8/i4OQ03DqFrAJNHZssYW/XyPKauuPybhPAIVhHefNiVeo15KtlDETjwgRYiTYRR/Mn2EsTYS7/brnu8opsGpjugEzX3MYyxgeHkckRlxGVdp7WvI68sYGBfo8M/boNothjxfV1HEnt6Y8fsbSyIDI6i0UxrYNVO4VvJup1A7OzRfg9IQz3DEEQkUT5dmwKfZqYtlAoAj9JP4WQW3WqdQoTpWoFhVYd/eyUaciXSqi3W+gjFpA8aBnH2j1Im2zDgE6CxnQoqTtCrc/vwB237kXMq+FvXzqPYpnMElBuVHFm8RKu230ATmYr+YNX8hLSL+ArV46qipttXrpN1DqKVb6fCKGLq4vYPzwKgx1B6RexNaQzKyqbQu2Ou64SXkoriTBZ+hbQcGppFntHx5EtFpgmDwYCfIlGG1gvrWJwxMn8DEu4zY9TzB9dKK+TFHrt6YeICu72SztKSDgOjF5Tw9snlxD09WIo3ouA0yudG7KjymEibqCFZDHHNK6LmDabk9VlfqTB2Szm4Ha7EfR4WVvMr65geHAITk1DPOJnKc0Xq3wuj8+NfXt7cenyJv+tNxZGT48fvfEAGo02VtZzCIW92D3eA5dDQ6PaxMtvzKJUNdg9WckmsZpP4tjkfskzUIp0G4vf5ZNZCJAOY8ezVp+0A1wdjr5/ePkCJoaHEfD42Cl2OkzsnezBwkoehWpLGR8YpgGPywW/14V8sd6h0XkP2wiFfcjma3wPC6k1JCJRuN0uLK6ucN5FudvJXBqeRAN+r1L7wvNn4q5j4FlDWvyL8gG2SqlSC4rA2dis4L3z67hp92EE6YbYKZQCIm0a/YFVX6WEgWivNBtXuEmK1oHZbmM1l0E8Eobb4WRkLqeSGCUewaXh3lv2YHkljUtzKQZHIOzBXbfu5sgjn6+iJ+aD3+cWEqTpaDdbnCMX96Ihnc7jzfdWUW1S/hw4tzyLWruBw7v2WACwIj2bpPOPNh5fqc8uVaFAskUjWOlWmJhZW4KpGZgaHBF1E6YDxw72IR4L4qXXZtA0AJfLQG9PBOPDCfT3BPHD1y+hVGx1AkWzjofvuwEvvHwSjZaOQrmAutFEIhzFYnINA9EEg4dusNkyMZu5hMnJsGLW0W4zmydDaLFjAhSS9XnmoWOmkxnL7oIHmYEXBzJMvHN6BUM9E+j1kapW7lO39BBoNnNZeLwe6WULmyoSEWTvhd1TdSDtdhuL6Q2M9g1y9qxUKaNBTo4/hL7+MG6/bggfnl3H4mqBbyDR68Mdt+xlFaf8hS6HUCKbrsNhmpib38SJM2toizQDFjfXUW7VsGdwTHCMEsRX6IDt1L0th25//9YCD0u1EheQTeP8xhzu3n9MZl90TIxHcezAMKptE5lMGWODUS7wILOgGQaSmRpef3uO2Tw2bGYLd908ic3NMk7PpFjDrhVSGEz0olypotaooS8SlaLowPnFi5g8EIZDpnxF5k+pfKHJGQ4qGfS5R44KH5ltrcgTS+9PVvmYyOXr2EgBk4khmDJIu9IZFyUl82srGB8c4k0S0XwbbUoPmQZ6Y370Rvy4MJ9mdUamgtSRyPpp2Cxk4fN5mQncv7sX1+3uw4/emsNmrsbHnp6K4ciBMeG7q6RGlw/YITschokPz6zg7Owme/qtdhu5ZgEb2Qz2DE0I149t8ZVfO0UE2zmCOwIAQLZawvvzZ3DD9EGEvD5ej56EHzcdHYfX6wQl4ehvVl2UoaHdauGt9xexkazCJGAA2DsVR38ihLfeXwZFYeulNPpicbSaLWRLefTFYnBpXDWBbLGMhjeN3oRXgkLmEBlPolpLirvQk88+elRGBLbqE2k3jLbINi+vVRB0DSDkFQ6HIjc7vpz4qVivoFCtYDDWw+o/EvYiGPZgbm4DR/aPYN94HPPzaXwwk2EJPbV0GZPDY/BSOGOINHA44GNC6PjBIewZT+B73z+NcoPApeP6Y/2YGOnjzeP8xBXOpQKAAa1p4M0TC1hcLzLaq/U6TJ+ByyvL2Ds0JXMT2wNgG0xYOfut4LgaAMjcrBTX4YELQwm6bh1+vxN33roLQa9fpNQ7DherKQL2uYsrOHuhAFNrcTTTn/DhlmO78MPXZ5DO1rBWyjCVTXF+ijKboTB6414EvSEsr+Uxl7+EyQnSCiq075R8kDYXyT4p559/7JgIQrpWUzl/GhotE+fOFbGrfxyU6OVrthilDm1MGzi3sYKhgSG4KX9sAocPD2HvZD9MQ4Oj3WS1/a0XTqLa1Ng2vb84g6MTe6QX20aykEUvFWp4fbjt6DBG+iP4xrffR1tzoQUTd98+if54iO0zHctewyDCWBkfmBra9Rpefn0e6UKVJYPi8vhQCGcuzGFqaBc7lyo/sd2G/7h/6yqzkuairRlYTi8Cugtj8QGOiEjq779nL8I+P6CTv2LTQRxNmUhulvDqm/OygtGE09HAJz9+HD966wJW18tYL+UQ9PtYUxKHEg34kOgJYbo/hrMXM1jIriA+pMHjEuhiv0Rmdzv0slyrzz9+jLkwBQCxiLKaRdPwwdkN9IUnEKD0rASJiJ8V6WKCcuzEfVeaDeweHmV1bphNPPrgMfjddCwRKTTrbXzzhQ+gOdzIFIsoNGsYiRFXQPSygWQhg4FEAi6XE/feNoWw34NvfPsDwOlCq9XAY48ehd/tYtQxAGy7ZAFAgB6tRgt/++J5dgDpllYzSew/OIp33r+AXQPjfI0/TQBsBxha2IsrF7lELOAOcQUSVTvdc+c0BgjI0lntKsYxKS9i4hvfoXXyCGdNa+GRj+3H7OVNnL+cwmYhD6/PA7/Lw6VzmtuJvlgItxwYwvsfrmM1k0PZnUYkQGslF8R2gYLRla7yzz5+vaUBVKaI3QGSmkIVS8sadvUMW5U5UoEIutc0mJ4sVivwev3w+7zoDYZh6joiERcevHO/SEcboqgjuZHHq+/OsxG5vL6C/t4+eHTiCkw0Gk3kKkX0xKLwOHU8ev9h1Kt1vPDiBWgOB1qtKj7z5C1wyAiHnUBZ4CgcTFnxIjVUvdbGt144BYMSUoaJpewajl8/hdfeOodd/aMiSyFtmL3eoStm4RD4CkPzkZSDStxcWLqI6YlhNGtOeCgvYALHj49gajgmC3DF8Tvay4DD4cDXv/U+Gm2XcOAcGu48PoR8roYPzq0hXSjC4XMj5PKi1mhgtZjF+GAPbjkwilK+jvdPryClJxENOa1iX8H/i+yuOKHMw3z+setNJdlckWeYaLdEXd7cUgE9gXF4dEpodKqAyRMt1KtI5bOIhCLojSSQTKcRCgYQdHvQ1oHD+/txcHJAnkljm39pZh0fXExyVHFpbQUTw6N8LbQRdCy3x4Wgz49w0ImH7zmMtZUM3nx/iSOHdquGp566DVpblj3L8mdSA/VqDZrTybE/MZm0yPl8Hc+/fB6U2uYqoHIKh/cP480TlzHaNyRqFrsMsJRHzVal07XV3UC4Fi5EdaOBy2uL2Le7D7kM4JN5gQP7+3Bod7+lg+xugEikmXjl1RmsZRrSMddx/eEemE0T755ZRaFSQR1A3E8ZQB0XVhYwMTqI6/eMYLQnjG8+/yHSyKKnX1DFXYliW7U3czwEAEV4KXKAhKnVbGN5pYm4fwBulU0CUKqWkSoW4HS5kAjH4HG5oRkml1lFA0GOSdswcP/d+9Ab8ov4l27VNHDi5CJmljNoNE2sZFMY7u1nh5K0w+zaEsf/ulPHYF8Idx+fxqWLyzg9k5bb0MCTT95KfKj0Q8gtBGr1Kt5+Zx7BsBdHj+wCOa4OQ8Pyeg6vv7vILBwBoNjMY8+uHrz94QJGegkA9kKN7digrYK+Hd1jT992v58klxy4+dQKDu/pxdpGC0FPgE3t7qk4jh0cscJpe0pAsKomTnywjJnFPAdkbdPA4ek4gh4X3ji1inqjiVS5iIFYnDXU3NoKBgbiODAxiOunhvDtH5zCTGYNIxMuoSVl4Sl7/VahiMw/fe7h60xSOaL6RVbnmBrK1RYySSDuIy5byMpGIY10sYixgWF4aeNleReBJVMpoI/oXF0HOfUP3XsQQZerY6dbTbzx3jxWU0UUKw3kGxXOJfCRTROnFy7i4K7dXLQ4OR7HTQfH8f6JGcyvlZlH0NDAk5++BWZLOJ5EQxfyVbz4wzNoth1oteu49+796I1ROhm4OJfE+2c3+J4arRaqWgXTI3G8fXKBNQD5JdsUp23ZdVv9fJfIK8BIOyqTnfa3UF6FALCQWceNB/pxYa6AWIBifgPjo1HccnRC5iF4W+zeDG/YhUtJnDyX5NfaWhu7hyPoCXnw+ukN1s7zqSTG+/t531LZHDQvsH/XEO48uAuvvD2Dd2ZnsGufF7rkE6yzbKn91Z5+kHIB3alCupxisYVa0c+kTL3ZxGo2DafTicEE1ft3ctv03maziUy1iL5ojEERCLhw763T8JHDxoSLyfb89RMLSGfryJYLqKGNnqBozMiXS0iXsthFjBk0HN7Xg8OTw3j51bNIlyjXZbAT+PSnbmH1TsQVmYcTJ5dRbtBH2lyU4nUbePje6+DWgVNn13CW+AYA1UYdpreBydFe/OjtSxjtH+UoQC371ay8Ffvb6PKtW7ZF9uWvwi9ZzKzhzhvH8dZ7C+hL9FHmAoO9QXzs9gm021w8zhterVbRNjUEAx6+x6XFNN44uWGRaEN9fgxFPHjr/Cav8YXVRUwPjrIDTV1OmXoBe0b68Ymb9uPVd2fx4dwqvIMVRP3kR8iOKHnHqqSNU8afe/ioTAcrx16o7JX1EjytGAyHiY1MFvFIAuFACE6q72dVIr0xE8iUCtCdDkQoMaFpSMR9uOOGXXC76AZ1dtzyhTLeeHcB+XILmWIObYfOaU061nxyFV6PC72xBAPilmND2NUXxwsvnkO1ZcKg4tN6A09/8np4XDpmZzdw/mIGlYYowrQcUwM4dqgXB6YG8epblzG/XmKVV23U4AwbmBzpxcuvncPYwJjMBFqOOGuNq6QFLLJGbbYdNN0A6mQDaKEX0mu4/45pvPz6GQz27CLXGYmIDyP9PjRrwMSuBEIBP9597zIKpQaOHBnGUE8Ui4ubeP3kBgzJokbDLkwOhPHO+SQ0zcF2f3pklKOrtmlifnMNE8P9eO5jx/D9189jOVXERnsZu0bFGotGHrHHHcZHg/Ys1QOwREtvlJdBx+XLGWhaGAubqzgycRAezcmFCIZusgMFSh3zAXXMbqxgtH8ALic5HcDocAQ3HhqGw8nWH04DSOfKeO3NWdTbFJKl4PH7EPb6GJ2nF2YxNjDA9DFJ8303T8NjGnjtnTU01HkME7cfH8XiYharm1VZ306VuCJTppojiNUe7vViLVlCS6PePxPldh2+qInp4T688MNTFgBE+HV1p76LaNxu92WiRS2uUisUIdGx59OruO/OKZz4cBYeRy9HOExlG+ShEzNXlxXW9LsDTkcTtxybQKlUwfsXsrxZnEnUTUwMxXBpMcenmE2uYLhvgJNmdBsXVhYxMTSAn7vvGL758imUmxo+WDqL/fuicFBWVSY9aEcIMOq+tcfvPSQqgvgOhEKi398/uwzN9GJ6ZAJujWhL+ZoMs1TBGq3f+ZV57BmbsNiyqV1RHNs/Cp2IDlP0CSQ3y3j1zUtMbsyl15GIxuB1uEHtVGeWZnFgahJuiLDl9mODWFspY2Wjyh0oqqnBMNpwWMWm0mfpsmm23ZT3SAtYbTcQTgBTwz347g8+xPgQ0cmSz5RZWZU/UySX5TvbskVW1LCNPyhT+13pY/YBUiu4767dWJhbx0bKRE8wZKsTtINPxgIcthtwOE20Wk5xPAlwItTULi2l1hGNReF1ilL8i+tLmBgcxk2T/fhwZoMF7/X5D3H4YB+cQgWILh27t0EO4k1HplXKWYYMIoxaTRaxd2QaITcVfwi+StXqCbQr+reKzWIe4/2DEgAG9k3Fcd3eIfZWzVYbkYAPM/MZvHNymbN2FzeWOQFE/DVVEc+sL+LI9G4ixjj9SQxXs67y0N0+0hWW25bz3srVixwYAaCOnj4dE0M9+ObzH2DX8LisY+guB+lIu+iLEKvdcfi2BYBUq/ZQTula0k7zm8t44J59KOTLeO8Dum/iVDo1j5ydk+pDHZ/8tk4lv+jqEZukikZMUdrm9yPgoU5kjVnYsd5+OFmYKerScHLtMvxRDW7SxFZxqiCGyFlnXNx4aMqkTJSEFquGZrsFo+7CRK9g9SQIhdesSopItdZrmF1fwcjgIGK+oDQjBo7uS+DA5DC+94MP0WpqGOgLo1CtIZVt8D2QxpgaGecNp2bHlcwGDu6aFAtjUlBIIZ4qDO+WEt4Wq4St85rIdailFAuoOLBKo4qhUQ/GBxP46++ewK4hAQBFwqrqWTsAFFHSOYNizxR7JLd5u55EWibpfc9sLOCR+w/z2b7x3bewd3yvtUFcK6GyjHxYFYkp7SaTcyC2VbTjc4EOadR8Bi6XCyHmAjTOdA7FqDyP6jTafD5yQLNGhf0rUZch6SnO9Yj+QO3ZT9xkElJ5EUyy7xrOXl5D3DeKgJsyWJKtlpW+VItWbdaRrZZRqFWQLxVxw56DcFn21MTkUBjNag1rGcprSxstVXLbMNhnmBwaYYaQuOxsOYf9I7tExNA5oxB9seNXJH6ssNV6RTW4y/hWpUI0k+sTJqdDmBiI4SvfeR+7BgjYnSBwJ0pYpE07sNiJ/LFnFBl0LCdC355dnsWnHrkBPpcLf/G1l3Fo8iALmfL/t+Zg7DkNZaiJdCtTO3sowqVs9B5KAhFnEg4EOaRdSSeRiETgd1MW0GSzQJnC1VYKvTFfB62qHkDKkfbcYzeK1jBdXpSm4833lzHRt4cYSLEllEHSTNQaTWSKeZSbDSZ76GZr1RqOTu/lE5K2FPSqYakc4W8oBxPcQ58q5TDc08c3sri5gVQpi+FwjDuCqLdQdQOShy8EXgHDJo/S+99i1pT27dIAmXIBe/ZHMd4Txddf+BDDPcNdeYArAdC53k6Mvu2ZLMWprqwbABpOLV7EU4/fhIDTgS9/83VMD01b4LODUPkgFhfDxZ4mUsUcyo06Bqnww+kSiTjT5BwAUU2xSJQ16UY2jSCZBK+fIzQKvUlQN81VHNqdgC79B2G9pdkhDfCZB47I0kjBOlZqDaxt6himih4pj9QClirlkatUrKwRM1SGwZm/3YOjFqKtdmsruyRwrLh6yvm3NRO94Sj/bXZlGU6vG5FQCPlMBgOxhCg3I1qXi0k6zqfQBdYeS7Nl88hshpjCHs6EE1FSzuHQ4V4MRQL43svn0BMZ4OvlZhirXGq7ygC7+elkbncKHESphUzCkgbQNLw/fxaf/dTt8JsmvvXSSfSEB+GmWkmZbxGVR+KIHW+AkmNtTo9TQc9gnPZCnJ/DVZPmJxSonQZx2YiTzGV45kHYT2Gf7PTSNFxMX8CB3cQYSjHk65L2n1Lqzzx0lGsC1ZVvbORhtGKI+MKc7CEnLVssotpqis09hYU/AAAgAElEQVTgqltRPUQUZU8gjKFoT2cYhE1qBdqELabQgwmObBIBrw8Rf4ABdGFpAaFwiAFHpU6pXIY3hhIdxDuozho+lq1KWZrMbtMgN5TuhsND6V6tlzK46fgIYn4PXvzRRUR8vRzViL4l4Q0of6F7y7cAYIeqoM67OlqC/RFdw3uzJ/Hck/fAbZj44Tvn4DTDXCPII14UomVYRpdPkU6hUkK6UkLQ6+Oye1X8olhT+liqmGdfiVvcuBIrA7fHjSgDQJBvFH6dXT/PhTSiXIQwSbZfegMEwuceP64qtvhEVHAZ8gzCobuQymVRbNZ5Mamiplar8Ya6XW54PB40Ww2MJfoR597ATiuXPYO2FQBzm2voIVvl8TLDeGllET3xOPpDcYlBE41mA+lSAZvZFKOfSqsFamWdAmsGm4uwZdcYpDbFsJRbx923TSHoduC1d+bg1aNwOdQMg48GAIsnURnILecUMmyV9/I6UR7i3NJZPPO4SGK9f2YO5bwLYT9N9+hcoMiWAnWjgZn1ZSbVRhID8LmEh28l4mxOOBXT0q8xmkNATmE2LRteqGhHAkDXcDF1CeNjAVmhJWBuowGgPffYcZPiS+KXSe1Qvjng6UWhXEW91eRESqVaha5TNYsfDp38UIHeerOOiZ5B7v23mjmvmOPT0QB05pm1ZQz19sLrdKPcqHEDSX88jt5wXA4+kt26dHyYuLy2hDwlmoJB9ERIMwVFuTg3sKrxEZ1QTeQ5RX+W+utidhUP3L0PXoeJd95fhtH0wyvzFIL3EG3cQg/bg3z7Lm9V/N3vE6SYBIAMlupt6t5dxKN3H+FFn728jqXlOkuteL8JtNtotJpYTK1hJZfB1PA4a0NRUteJ+wXPIKMcyp4WhRMYYScQWM+kEA4GEPD4BWhkEmguv4SxMY/QIlZ3tS39/NmHjpospdSe3zZwZjaDZtPFwx3YMXE4WOKJTVJSIGhTMQxhV7wfQY9f+gA7K9C20Mu4sDzPjQ1U007t4HOpDYxEE4iHI4KeVZy7KjWHzkChaiHyalutJnu+xCISM+lyuuB1e/g/Gvig1pWqcQWp6cD85iweu/8o3JqJ904uoVrxwE/xM2+2bHfnUTTbAeAKr+OKm1Teg2V2ZEq5WC7DHang1iOTHF0trxfw2ntzbKcb7SYXwVCEUqiXEYvEMJLoh9+p5iKozRdORTcATGwUsvB4XAhR55EJLKeTnIvxUCue0hrkZBdXMDbmhtOhuIBO3of3l5pDlUQ3Gy28c3YDlaqJQCgMh0PW9VuhkFwjAV9G8Hi8D3439b91FTd1LRI7geygmTi7eBlTI2OcUMpVSljMbGIkluBuXQKA5Q1LilfQYEIRNo0WGu0WMoU8NvOUnNIR8vk4OUIFJa1mg2WGAMugcHqYVFrKzuGeW/fDBQNnL65jcaMEly+Aaq3GcfVw3yASAdEtrEAhbkBdzXbAVo5bd5wgpJS89BzmN1fhcDUQDbhRLlZRrJOud6M/3sPVvYVyBZFwGP2RBNdFiiIXuQb2fgob3axS9kuZDYQjYQSolV7OJhru7YOLgdwxG6ulVQyPuhgAnbE+HW2mPfvoMZM8Yjp5tdbEO+dTcDp80HTK5KkEkU1Dys8yZ6BpmOgZYK/WAsCWoQqWRMpDnFmYwe6xXfz+dCGHtXwWI/EeVosqIcOdxbLbqLPMtlp2TWdAVeo0haSAUpk6fltwO92csaSNbJlt1Fp1blPLVcvcqOlyO2G0WgzsvmgffE4n+iO98DhEXf2VbIO8aEX27GAdVPAhbKuQMHJ6T8yehsMrytdcbheqtQaKxSr3QPbFexANRTnsVR6+FRlcUaPZ4e4VJMk0DgxQrQblF3XMri1yNtXiF9hpNpEsbWBgROPEHN9jF6ZNaM994nqTZvHQ4lerDbx7PgvdSQSQQwif3HBLIcmNIR7Aqzkw0Tckizo6kBX467aZ6jhn5i9h97goy6bQhWzZcKIX8aAAgN0EkE7pXK/K+XVsNVf/SIyS9SWVSrl/Ys3aRktGKxoWM4u47eaDIDqkVqvj/Gwaw4kRkMFg22jdo5A+Pqd14o5PYu2/YiJVQ4wibqXZkpYaZ5cv4snP3I1GsYh2s4mNzTzOXNrEaM9AV2Oq1Vsp2e/tDalq7xaRxszyAsZHx+DgX03Mri4IdpVP3iHQMpUkEkNErwuQMwgsJtWE9vlP3MAlYYSPWr2Ft8+k4SAAkGNkj6uV1yp3kgAQdLgx3tPPCR62oLYQcCsvr6wGAWB6fIJRu57dRKZc5DJymqrF0akq9lQ3QlDh6xDEkwKWIpdUZGABzioW7dj0y6lZPPLxY3A3DeQKdbx3dhWxgOw9tNH9HciKn9jFVNlGJd1SpYn2TmFX2RmVY90Ee2ii2W5js5rEQ3cfhE6dvGgjW2jirRNL6I3EOaRWw2+UBuhiPO3aRq6FYAkFhTu/sYqxQVGrWWvUkcynMdY7aDNjpAE0ZIqb8ESK8LqJDpbwZpMuQnntsx+/znToOpzM9LXxztksXG6SFaoSUiagY99V4SgBIO728eaJTgGJPOt7N0kuTKPJE8CmR6kq14G1TBLZapFZLtIArAxt1b42N8jCorKxyvIyEBS6FLtvNUeKDZpNzuKR+4/Bo2kizXpmDR5nWPTOUyUJZbepMtloo9VucjcOsWykRYjrICKMvqt0muAONOgOB5xOB3j96GeHgyt/aRoaXV+8x49dw1HoJplIiqYMvPb2Rfg8QXa6SfvQZ8luU1UWRTaiFcvWa2fzRBRA6/U6kqU8hmmWkiY0KZw6eoPUK9CBEQ/FLGfgi1bh84qJaOpLbK0B7g7mfDGo+7eFExcKcDGf3CFI7QSEqi2lkajDoSjiwWhXYqUzU1hyw+qMcpDB+ZU5TAyNse1b5TxAnuP8HvYBugEglIqK/ZUCU+Ws0g9VToZ0fSj25kZ2qgVEm6uB5jYv49P3H0fQ6+Eo4tzlTRSrDQR9Hni8DjjdOvsOxA243brwF1xObj4RwzNEyZxyEK2kispSqG5iqSWslLJ0CFnwROMy1lN5lBstYaqaJuqNNpvearWOZq0Jh+mA3xdE0OeTTqFYcdYsxOYZ1EFdRNupiQQcgEsrCxgeGOTQWgXGSg7z1SwC8Sp8PuEbiaygMqOUDHpERAFMRDSaeO9cHg4ORaQJkI6gUr/0nd5LrdZ7eoc5DFHVdcKWisUXqRmbHyAbNygTODlIAHBivZDhPEB/JCpmC0nLeEUptnI8La/UhmTrNQ2VRh35WhF5CheNJqLRIBKJKIaHExiO0HxdMePA4EwGLSi1lgu3SVAHYqfsnoeQp46SVn4xGyQ5HFtRejLQsTxHoZgkd2s6YOqkUThVaKXn2XehRBsdS3eiUKljZW0TcwsbKJXaSETCSESIaVX1mkCykOMSfEr80DnPzM9g/+RuK1xUG0zfi408/AQArxRomVG2MEBVwUJmgEa9iXfP5aFRGbipM1UrxsUJXp1+JjVJarjeqOOm3YdEgkKagA4AlBtk916ZQ8bFtUWM9w9z5EBc90Yhw3mB/nDcIiss71PwOR3ShO1sm2f91Zp1zinQZrbQ5OqjUMiDnliIFy0Q9EIz26jWqiz5RPYI6dBFfl0RwFsXxMo9SntpEUNbymntmk2aLsssqSZVScaohBgVv6SzefTGqXhWxR0mjHYbTdPktRRfwilrNkwsb6Qxt5xEu6HDYbhYc9KQyF7qB3Q4eM/WizmM9fSz+bRrAAJysVWCL1KG1yOjAGUelbb6OQKAdALrtRZeP51EuS4WiuwT2yZZNczsG/8MFPJ53Di1X7aKiuSCcJw784akBuy4bpT8SS5jONEPj8PJdO9aPo14KIyBSI+4eO75U+FHR9nSIAnKIpp6G9FYAIl4ECG/m21b0OeFk+ywk2qFReEKfVUrNRTKZYwMEM1sc9jUMquxqXbDaFnJq/2gnCm5WVY0IDwhldIVbo8s6dKAzUwJtXoNwwMxfh91S9Mdbmzm4PV7ZG5feulMJgnnkoSAppulcxXMLqewuJzGeM8QM7DUT+H0eRD2UK+hVO/SUadsbqFZhu4rwO9VJeGyLVxd2y8+cYMggqhz2wBOXd7EWs7JDJu1Lpb9U7G4iXKhiBunDogUsBw/ICRADCdSiFBOo/p9PrWGnhBNFPMgXyliOZtC1B/AEI2TkQw597FJpJKjmCymMTiUwJGpUfTEA8IWymwaqcZauYZsLo+RsQExisjQ4HRpuDyzhFA8gng8wBpNjMKXdlAOUWKo2PzVLZyXkMet9DBHJB27ZKW75Yc5D0AatdFCuVzCZraAhZV1nJ/fYNOUiEcEs2qYbKYKhQpuP34Ag/2k6sXE1EypiUajgr5ETACBY3gaKkHMqIEvf/dVeLUgvB43BuL9XBom0uYdmpf6EIvtKlz+Erwecb2S/LSMs/aFJ45zGMhagLj6xSxm10041XQvlYGTiyCSOyYalQqOje/lg6rSCtYAKhTcIkAqKbSRS/M4OXJySvUaFlMbCHg9GE8Msqmhfvd6qwHdbcLlBUaGEhjoIcKkjXq1gWy5ZE0rJeq6RtMy1zfRMDVEQ3643QReJztV8yspBENejPYlEKBmSrcTiUgIXo908Cx138nN2LyWjrNkvxeLohZ/VABXCRb1ezpXQL5UhqY7Gew0Wu+t8zN44PZjzD8wgA0DP/rgPKKJKLwOHZVKWc4LAjKFIu6+6YCYlyx7K3m+Agy4HC5888X34HBEmAFl7Smn8XU4DZH5K7drcIdorE8nrrQGR9N1/OITx0VBiETH+ZkUNoseBD1BLigg6pU31cbRc3GmYWDvABWCXvkkDzX3jnM1ShlIqShWaAZQE7FQhL/Pr6/B43ahzx9HspbG0FAUY4MxhIMe+Nl2aygVK5hfXMJ6sgDD68G+qRH4nA6uKaRW8o1UGp6QHz0hargUKtdsNHF+JYU94/TEEpqe0eQIIBDwy5hYmBpFiijfWNEPwgzZ6/VEvl4BWXk5rHFkpCIiOFEBRaGkYMuFi/z2B5cwMtmHnmBQOmsGGrUmXjxxFg/cdh33MHI5XKuNN06ew41HpxCg2J0BILqtlVNJU86/+8qHiAWHLcePjY/if2RYTO5utV2DK1JAwCvaxETwZ3OiP/vQdSYdkNHcMnFxMYVwYBxu3Y2NfIbDKKu+jqcPicWkrp+J+AhfoCqs6AiKjOAl6IR3LNRi02xjM5PmCRdUV3BmeQGFehHTEwO4/bo9CJB0ck2b+PCl+VWUak1Mjw2jUmshUy1xcadKkVKYtrCaRiTsQ5gMnSz0WFzLQHOZGExQWTRR3eRf6Ox8UVgnSCfptkkHxiqc5HjcKoW10ryqOFPx8WIxyeJoVM3ODirQRLsifCRobgSDfrSMBl740Uk8/dD1qNbFHEA65RunL6EvFmbA0zVRw8vMQooLPfZMUZEthXUi9FO+BX0nruFbL32AnsgomwtpeLdoLHGOukEAyCPgc9jAawPAY3cdMKlX32xTU6KOpWQB/ZEpbrRcz2VRbTZlEAs0yOdu1Lgjdap3EL1h2gipAex8uWoft9lOayiBrmFhbZkHHVE/YSDuwpH9Y+iPUlaLagjFTH++KYl6zjuYwNwqSboL8bB47gD1J9A8wVMzi5jY1c9Dqag2MV+o4vTsAm4+MsXUb7VWR6nagNfnxeBAgmsLaMiSx0XmQpA5Lhf954Tb5YTDQQ6lcCrFoGxJhFEYKVk/awkl3UHJR63VxH/765fxrddOoaXTRhPw28wxtNomfG4Hh5qUYm+1KaIyMTlMA610NFttNNomUrkcxvtjSESC8PtpoKUXw70xngcgCk0pXHTgOwyAsc6Eto4Vk3IoTHXLrDMA/FIDCFMlh2jSOj95/xGTFoK0AtnUS4tZJIKjrF7XcnnUWk1mxZp0A14Dt103hQ/PzyPkTMBPw6JsIWDHyshrsAAgWQHJdZ9dmgPZnUItj5954h4EnKIoVVCVouxJKhv2Cyjb53HoePXEORw7NAa3kwoldLQaTSRTBS6G6O9NcMYtU67h3Pwap7FdGvUFmmgaBqrURaQDP/fJW3DHzaJtXbB3tOHExHUKRDrO7xZHRiJSefciyhGQJTbvtVdO4T/+1SsoNRpoGG2OTKiRRtyW0KOWqVHJEdspWDOwuRXSS2vi4oynE7cfnubeP+IMyIH89ksfoDdKnUay0seKw9QBqSCFQswGnNEc/B4aKc96hEGpzBZ3B9OwaC5Hahk4f7mIuG+A4+bVbJZn9hFt0m7X8Ozjt8LZquP0xRXkiz54aeGsp4F1p4OVhKiTWjZME5oEDhdWNy/jkw/cwMQIbTiHgUYL9ZaB5GYW66kM8uT4FWsolsqotgwMJsIolys8+aPSEOXjDBZmecTkQhGMGqKhRAc7haFwGJUKjYl341/9syfZZDA3wNk4Fb3Y3dktm9/1q4gCqJBGeAk6avkSfvUP/hLeRBi33XEM9xy/Hv/3l7+NF986KbUk2WBSw4pSlqGkFYKI8bpMAVBI69IFByMGnKFNwzdGevHpO4+w1vr6S6cwFKPydgEuO81rQYDrNhtwRvLwUou39aV2RYP2s584auqMftESfn6ugp7gIBeIruRy7ARS8cLhfb24brIPuubCeydnYRjRLg5A8OPdp1AOFTNmHCtrslSLmjVaMN1F3HbdBN8htTgRSXJ6ZhnnF5PIV2uyB1hIGSOXpUndCLWFMWLEHGNOytDsIKeoWnI40WhW0Ww3cGjfMH7vNz+PpcUMnn/5BEbiHnzy/qPsodNiS3fwCiV6RfhnV642t5/u7cLcGhouN8ZG++Ez2yjma/idf/dVzK9vwu+LI+AXTCflHrh1nFveOo96I6ksVLK8YfHeEH75l55CMVPG3PwGXvy7V9AkP8Bs88SVLzxxB155YwY9YWoxlwDo0igdVqZp1GF4M6An5HV8HiWeDACRDCIniXjpi3NV9ISG+EJXsjkuwiDy5e6bdmEwEmQK97V3LsDj6u1qsVYpTXsYZTXXWPZc1fKZyFcr6B/zYN9IglXa2dkFvPL+DIoN8gAoMSO6juOJGEaGh7C+uoZ0rgTTaMPl9MDj9nHdItlD2nRuVZd1g0yI6DrqjRpypST32/3aP/gk7ji2D/WqiYvzy9g70cszdLi8zNIAVxixHdWAynayiZLMn+i61Zm2pQFV/+a/foe7mmOxUb5WlYzjiGoLt0CfLNcLKJQ3oWst/Nl/+Z8RcNCoGw1LCyn871/6ClY2skjEHPiffvlT+IuvvIp4kKa1ymu2A0AKDJ2j3q6h6crATQCQdQaqXpL13s8/TuPihfTUqi1cvExz54Y5K7aczXGhhdcHPHDbFNebUXfwD9+6AL+3T/QCyAvotFnIcEXOFlZaQI1j4d91E5v5HA5eP4iBiAdOOHDy0ipeePMkS2XLBA4eGsMXfuExjNPQKbjwi//495DMVuB10wQRarO2suiKgRXjaKwuBFLTDqQKq2i0a7jp2CT++S89Co/uhFNy/qSymJCxwsFtSB8l9TvYbBERSFqIVZLOzRtf+uoP8bUX32VtFIuNiKtloHSKLAikdp1JtPZ6ZgFts4V/8iufwn23Xi/6+2sNvHHiLL7019/H7/3WZ9EH4It/8jwiAVVXIHkFsceSeRXXVDdoOhol+OSLcmAH/0bg/YXHj5qc9QJQqbRxcb6GocgIV6guZzKcD6Dw+uG7DnCmSmubePXtWQS8CVl8KBB4hfW0AcBe4MihkwZOBd91/wG4zQbCPi9643F8/ZWT+MEbJxGO+vGv/sUzGI31wKV7UCk28YVf/yKqpo6QPwa/JygVnzAPtNVOHexZEyMitlTw/aVqHvkGdccE8MV//QWEKPVKj1ThcFEWhNjqGK5m+e2vdQo0JTcgy97pevxuN377i3+Ft87PwecJIRgQ0RKFbF6vG3vGh9lBXEtmsJEpyPCM0NtGMrfCYeNDD9yIf/gzj3II2CxXsbCwjLLZwKHJPrSLTXzxPz+PkI+OK1PxdjZTknXk67eMOhAswO1R/Qfd+RntF564wXQ6hAkoFpq4MF/FcGyY2bilTJq98EgYePjOw0wVG00Dr783j4CHhhx16vWULRJOmHBmFChUClJpA9qa5fQaPv2ZGzDcF0UiFIDbqaNp6Li0sgmX18ltXA7NA4fuQTZdxj/+nT9C1QDC/hi8NGpF2hrymwb6I/j4LcdQKVfx1e+/BgclsyTn2WjXkSwswuPR8Z//wz9DhGb2UthLHkYXLfzR1b/lZNlG07E0kTYwNH7a6S//1n/C+ZVNRII98Lipb1LU/O+e6MPHjh2A23CgXmviyz94ExWae8QRAD3RbB2NdhXHj03jd37tOSJOYJRrMNoVHqblJIVQaeAPv/QCgh4SQsrbbhn7IaW7xVFQDXqYHpSpuh86VDGbhKfup/ZwjVuIS9U2NpJAX7QfjWZTAAAm4hEdD91xiLN5zXoLb32wjIBLjIwVLoj6VxAuShNZ6t9GUbAG1Exk6mn87m8/gVaZhiCLciWK9dl9ofCFs9E+OB0ebKwX8D/8/n9CrdVGOEAL6rMAUK+X8Ozj92LA42F28is/PIG1fI1VOx2Mrn8tcxmm1sSX/vg3kXBpcLZEaNYpBL7SJl9ho69mAoQ+FbSwAZ7i+cw/+d+wkC4gHh3gGkt6kfKWtx0cw417pmEaOtrVOv78+28xsCl+oY+ny+uoN8s4cHAE//pf/iL0hgGjWoVmNqHLKd/lUh3/4b/+AEF33DKEtiy/TEYZMHSg2qwAQeIBKGurIg95vQSApx8gJ5AAoCGVqyKfp+FPcdSbLTYBhOxE3IEHbzsAzdBRq9Tw3qlVCwDsiNs4deu5dzZ9adcATJPSzQYa+NVfuhNo2vv+VDEo62ZAc3F52uZGEf/0f/kT1FothAO9cLuoYolGsAB+dx1f+OSDFFvCZZj423dP4cxyhvlyYinp6lbTs2ijji/9yW+gx0lDK2XIyazgtTffLvE7mQELAKaJvkgcT/3qv8VytoxobABO3cO9eU63GzfsjjMAHIaOVDqHrxJpxIsozBIBoNYo48abd+Nf/tNnoNdaQL0OjWsISKmbKBXq+D/+/EXeg04M09Fgaho4RU2VRhmmPwuvl6qS6OO25hU67eceOsbJIALASrKIei2IWDCCSqOBlUyG75c8zwdvO8j2qFws44MzSfjdooZPURt2J1AtkpUYsjOCGlXsGoiNuPHsp45BM2SjiUo22atzNRd0pxf5bB2/8tv/jvmBkD8Bj9sv+hholHxuDb/21KPoDQU4QvmLF9/EWp4Wqs0AoLUlADjdJv70j/45wqZQo8IHkM8k3uKR7xT+KcdpKyCUIyi6rE1E/RH8/G/+EWY2sohH++HTI1yE6tBcKFXn8Oith9AT8OPFN88i2wyiVq9js0gUsIFUaQ21ZhkPP3ocv/LMx6HVGtCblFcQ6oVMRT5XxR//5Q8RdFFXkHpEre3ROMoNpPlBjTK0QA4+nwSAtJ3Kh9GefeR6TgYRXz67kIVDSyDsD3L+mYggOm0souGhO46w11/MFXHyHHUPUTtY58m7Np+8K562LyZXClHtYbOJ6WM9eOweyiYSALo/LQsLAIoPnF60Gjqe/R9/H5WWhpA/zjY17A4jEezl7ph0fhk9ET9KhRIcrh7Egn0oVnPIFNMoN4tYz1/mUarkBEb4yaaC+FLmauuG83XaVP5O5sDuCAoNICICqtX/zS9+De+em8dwYhfGeqbhpVJ7U0O1VUMyuwLdNJCIDiDgCnFUVKyVsJZdwWphHrVGCb/+G8/g7iPTcDVaMFpNlcdhtpR8ov/zy68h4ApbXdn26xWKXvyvQvUAwRwCPjFhVWlriwl49pEbGABUMfbhxSSigSFuXixVq1jL59hjjwSBR+48wjY6myng1KUUQh4xolw5Y/YtvGJB2UWQCQ2N4t0ajt42gvtvneQcPbsxqgKVuXUCCnn0DkCnJ2+F8IXf+DdY2igi6I9gonc3or44SxQ71/yQKqLM2nAwTSwKypvNBi5vXsBifhY3HN+DX/ulhxGkpIukpDuPyvtoDqD9vrZGAR0TYLAm+tOv/Qhf+8Fb2D14EKMxuk+1QqpcTpagWfSyhnQugw/WX6crx5/92e9Az+bw7usfwufz4PabDnDDJ2mtZLKIP/3KWwi4RFsYH8IG2A7la6LUKsEZLPCQar5LIstU3QJp2zuv2226XIJOXVgpYnJwkjtqCuUS1gv0CHcT4YCOh+84AI+mYzNVwOmZDCLeqECUjGuvBQAh/SKtXKyWcOt907jjmJrV02k7IzND8/PL9TZ+8PL7uP/emxD2R/GVb76G/+ubf4eeYBxHh27mXIKYFCUwrYpRrZ+IM4eOk4vvYqWyhJ//ufvw+F3Xw9mi4fUyg7aN/f+oYeB2ZoCTNTTfxwTeObeO3//jv8JofDcm+/ZJN1lR1bapXbQk5NwZGqqNAl669AIOHZ3EH/zWc9ArNTSbBmZnlrB/Sjyih4C9uprDn//39xBwB0QuwvaYH2WmOOlLU1yaZThDWQT83Y+bU666duPBacYO4XJ9o4TrJvdz3Rk9k2azXGQN4PWaePCW3Vxbl9os4uzlLEJuUYKs2py3KPHuwhDbQwzJ4ShWirj30f24Yf8ANLLzcgaAlc+gR6SlKA/RxlB/D1waXXwQz/36/4piqY6bp26F3xWTHcI6AtwGRlMxweaFogValEa9ircWX4UjYuL3/sVnMUmpYXYAVav0lQ6gEJJuE6AWdTvfoFsTyH5E00ShYuJ3/+PXkEm2cHzqVqnCdX40TshDJWwa9w4U6UGW9QY7iedWT2CluYR/9I8+hRsnh5BZT2F0kHr75bOaWTgMLC+l8eVvfACfm8JhoYW7NADzAOJa8vUi6o4c3LImkIVFVTSR9rjx0G7OTlPYtLqexbGpg1yYsJnP8hgYEnCa9nXvTRPoiQaxmSzg/OU8gh5yAv4djvAAACAASURBVAUAOInTNb1bNXMoARUKkJtYKAtYKeKhTx7BkWl6roBMJ0ntICIVqddkw+rs0ib2757G996axb//L/8NcW8Mx6duZ1ZtMBrjYZaUjSOwtpoGkvk8iuUa1nJLeG/tXTz21K34+U/cCmeDQk0xGp/1xlUiAPuCXk0rdAFAVIDw5eu6Cz86vYY/+MMv467998Hn9iPi82EkEucUtsgB0Th+A0ubVISTxitzL+P2h6/DP3j6fjjLZXzrO6/j7tsOoK9HPFBDPE/ZwMLfr8dX/uYUvC7VCXwlAHiGA4WV1Rw2y5twUypaWrrO/QPa7cf2ml4XZZ+cmJ3L4eDobr6wtWwGhQYlZKhfv467bpzArv4oNpN5zhjSwwkEvdkBgFgolVlTNk7aHQUA0gD1Eh554ggOTtCoWJcs1uiocdXATgzl1194A+FYFHcc3weHM4w//LPv4YWXX8PRkWMYiU/gutFdVFfNJd4imtK4YvnyahLvrb8H3y4T//Z3fw5apsiUs7D7V3r/V5Puj2IWVCGoIEEoU2jA64vhqy+dwgvfO4WpvmmMhHswEJIsJgOd1s+Blb9nRV+ceR27bozj177wBFrJDXi8LqyvF/hh1+NjMWZhSUsQAKhk/L9/+6wYCKU0gEr2Wo/NEVouXS0i20zB41F+ltRS8qa0f/j07abH5UC5Wscb76YwPTjOm7iSTqHcomnV4P71veMx3HpwFGvJHC5cLiHkDQrvvQsAypmSveiq9KjLBIDHtj30yQPYP0ZMFmXkRM6/01QiFrFlaPjg3CyuO0DNpDpSmQJi/SP4y7/+O7z9ziUM+Udx49RhuE3x7ELCPHHnuWIBlyvL8I8aePJTxxFxAE4KN20t7qo4dGvIulPMfy0QWBpDOmMi62dC94Tx2rsXUUibKKTr8MElprFTOEq1CLqGjJHBxMEEbrxuBM5mE6+9cQa333kQGvXU87j7trXR5AjOzm/g6989C5fDYz1/yR6iqrpN2jyqtnJEqhwFiHoDafBlGKA9+/AxkzLVqVwFGzQbKDHAlTYLmSSqbUE8kDoxjSp+/tGbsbKaxoX5MpchQ+bS7T1ESgsoNSN0nTABIhEENLQmHnxsL/aM9PDgR7ExSnt0bLCSKpqS+dKPzsEfcOGGw5PQdR8WNnIoVoHNZA75TBHU2k7vCwf86OuPIhp3oS/hE9WyUt2z0pWDEpSt/6kDQGqArkez8WI4kC9VUSpXOcPKelOnohQdkaAfHo9TePSayfUOwSA13IhhW7KLhYWCCKHZ2XV84/lzcNOEaFv6tSsslXkhAkCor45YhMgz8m1UPYLUmE8/QA+N0rCRKqJeD/CkDhq3fjm1wZU0qjy7XK3gtn29GIyEcXq+jAj1t8nWZpXp4/3lDJckh23RldpfOlfLZeLBx6YxPUSTMLqJoK1OGKd0NA0vv30Gt9+wTyyC5Lo50pWUrzA8KjEiZgiLc8r2a1vC5wpuYhua91oSv9PrV4aHinZVWVLV2qZMlpXMFIW36pFqfPGyEY+jC8H3EwDouQvf+v55OEENPN0hbLdPAmQrRTTdKa4JtH8JysKA9syDYkjU4koGbmc/PxiKaMrZ5Bo/p0dchph8XSym8cnjB3B5o44AZeTktKkrASD1gI1hsy6TPGyPgYcf34dd/eThdgNAbU53XCsffcZVuqqBUmmMDhnNDq5VHSM1z5aydrvkbxfX2zVCtyMoB0DJCmCLSLHlOezmY6s0inWUX7Ju4EoCqutd8hMCMOwXUwGoaeLCzDq+83cXuFPIGjYlhaLLhGka9142vDkE/JQPFlfQabcxaVq4mA9w4dIm4pFRfjoIqeuLa6tQjxJRjdmUIPIZdQz1jSDkoYc3SUpV2ZMtXnWXpFkrS3PdgceeOIThnqhQ/zvk44XNku11vArCgRP/lzfTReOSVKk2DVkBY+uW3Wnz7fZzR8nmD9MDm8kmU5pVTPG0J2G6JWzr07q7jyyUjn36qE2Xd8uqDCHFk78ovDt/cRXPv3gJmkG1nJ0rsAOWC1UAfo5Dy5fjMfSdL5EPYCKfAeDQ8eHpNYz0T4MYY7q4i2srXFipNICiF/PFAnb3DyMeisLFREyX69ZV6WLlAuSZhUo2ofmAxz99GAPxMNcUbt2YnSTzo4Zm9uNt/dku4Vs3bKfNl4vAZNk7Jy9hbnENTzx8OxeSXi1vcG1g2dX3DgCwKGbCn4jvL1xcw/MvzkCnhlNbgYn9fKp5NVPJwfTnEWQNoBjlTrua9vSD4okhH3y4iunR/cxi0XODLq6vch+g+BLyRv/SMIJdsT4eT6bIH3siaKt9FTgXX4I3MqH5TTzx5HXoj4h8gorHt/vsj7NJdoAIX2Tnr58o7JMZu0q1DmJP+UkrXZWQVz1lF1nTWZXujd+WhOKHYisAABcuruL7L82AHs7EJs+mERUIlAZIV3LQgnkEAwIAYjs7pkCjKWFUE3jywzVMDhMAqPHDwOzmBk/rVACg76Q4KMYei/cjIR/2wMEbxeDqoHa7rxwvW7rYoGf7+g08+Zlj6AkHma79qADYaXm30wzXksydXv9oWsbqDNzRBGzny1wNHlvXr8sHkgDgsNIAzl9axfdfnAEXTcgUP1+R3C56H0VunF6uZKEFCwgF6cFf8i2S+2Uz8OzDR/mT585lMNZP48woWdPAYjYt8+kWbETDY7OB0RgBQBAaPNnXNhvQupEtTJtiClk1+dv4zNPXIxEkAMjGC5vEXmvzri5nV766dXF3yu7tdNztpHKrZrrSoev2zpVk2sRwm9N1PrMdAGgDyOE+c34Z33+ZTIDo57B8IvaXhHQLAJhIV/ISAHJieNfAKw3a5x85ajaaBhYWaxiIUPEieHzZSilvUYdKCygAkAaI+68FAEUGyRYsqQ0IAHrAwFNP34BYQM4X5HLujsq+GgB+XMm62qZ2NOJODljn09cCwXbn2ekzwpUVOyfdWotB3e6aeIyNKAcQiab3LuHlNxbhdnh2AICI2hQAyAdQGkBR7apJRXvu0aNmrdLE+oaGXq62pWcAFbFRLtkCVMavpQHG4n2I+cSzaHgajt37t62l8O7FLYm+fy7TgCPYxNNP3YRIgCaRqHr+Hw8AP87m7bQ5P84xflrAU+e0ybqNy9khpreZAOpBfOWHp/D2h0l4qX1arjdLvqUBBNNIX+lqHm1PDuGQaAxgcq2t4jpQX8D1ZqlYQzbrQdRLhZ40hrSATWpVttkUhgD1DjQbGI/1cgJGUD6yOVSxbSoktMggSQpxwGCiTWNZAk189pmbuRqYXhUNHdcGwE9qGq7mI3w0m//jGp3tzdC2Ti5vnFijrddicQkWAOih2Cae/8EJnLyQhd8p2L1OUKyO0QFAppZH25tHOChqJwQuZP0iaYmf/cQNZi5XQrUaQdAZZBtDhSDZWnVbADRoQHSUACCygVYm0EJL5+atKeRSA7AWoUaMQB2f++ytCHv//wPA1i2SllO0Yl9pvq+KAMFXbP+ha5mOq5FR3QCQjl3dwN98+01cWKwiwLWR3QCwdDU7gkCulofhzyEUoEppBYBOQkj72UdvMDfTRZgteohTgFU6FYNSJrD7pqQJaEkN4BNTqjkUtPHrlj7bMjfAUqFEbQdqeO6ZOxD2eSwAKQ1gcQc7LOj/W1ncXuJJYkTrmjVg4adw/o/ibF7NtKhciCo34zrIWh1f/eqrWMqYCLj9MsciPQqViJIDuuhZA/lqAaZfmADOxvB7OnZae/bh6831ZB4efQBeXZRTLaQ2UaE6tC62rQOAsVgf4jyiTBY6XQMAnYUQ6q7uLuNnn71D+gBUjdQxATt50zuFST+uWejyrtWCtYFsPo94LMQdtXLspYW1rZv0Uc95Nem2A3k7LWFtPu0CmwChtivZMv7qr3+EZIkKYcSMZgavZUI66p8cQZqaRgAQTmD35rPmIiJoI1mC3zUEry4chcvJDdQNqkSVKU1qoJRJKWq2HI3aAbC9E6i0Art+nQBUlIRpefzic3ciFqTBRiJHv1UDWM7SFvt4NYnZ7rVrqlipvt89eRk9cT/GR/osMlmlTsU9COpXeFry6uRI+g4Z220GfhwAbPUBtkq/2uXk4ib+5vkTyFYcCPCYuO5JJlwKJtMWFAoWakW0fVmeoMbUb6cxSEQh9OjYZLICv2MQHnpePUzMbNADG0nf0Fw7mhckijZ4wgf5AOwEKh9AOnldKlMsiUgJd8JAWjfirrLI4Qs/cwd6wn6enq2md2zd9J1+385h4khjG2fqamrYsrHcGW3ib154Az/z+O3cf0BRtJgTQmlbQxZSihFz3M4uTshY6Gy7bJS5hvn4KI7ndgCgU8+dnsfzb5xHvkIagCqCOuNjuo4ry8Jy1QKqzhQ3hghnsfvZR1IDCAB4HS5OcsxvJnmUC3W2UhOzh0aSSwCwExjrRXwHAPCC28gGFSLSItGpabMzyOLJx67nJ3lS5a94mEEHSNdSsTvG19vU8l1TA/B1EcNmIpWp4LW338cTH78ZbTlAm/ol6PrK1RpKhSJP/KaJKjSrMFeoIhgMYWr3EFPDXOJ+xQMzto8IrubLWMBUjafqexs49eYZvH52EcWKE34XDfUWhLx6HnAHBELd5yoF1DxZBKksXALADhTtqQePmOvJOkLOAXh0BxqtNhYzKZ64TaVgFPrR/H1aBKUBRrcAwFKBstdOAYAXX/XfWQDQkNMzuOvWKdxyZK+VUeT5PTYQ/CTO3nbAuJoX3r3QgtE88eEc3I4G9kyO4MLMMpaTabRMjQdKRKNRntFPo2NabRpWSVNANB7pQk/Npeqma4F3J+21HSfBWkBWFpF4FLMlzJyaxyun59Boei0AqPi++xiiLyBfLaLuyfJMRSGbQgPwMAoyAU/ed9BcT7URc/Xz5Ml6ndrCU2iaBj/Th/IBbn5whAAAaQDBA1AmTyVEVfFFd3u1kn7WlmqWhq6h5MjgxutHcGB6AokoMYoqkvjoWmA7gOwEAPvC7ORMimILuhIdv/eHf4mBv3/O8G037cfE2Cj8TkWtXnlWxWNst/Hb/e1a6r/L+bM0gKj9X5lbxdpCEn/x0nsYio9zNbQogeluDhXPUxaRTaFaQsObQcjv4eoy5cBY6/DExw6am2kDCU8/D0SiIsSVbIanY1Pmz0EDlH4qABCnJkaw6sziphvG4He5ceTQFA95UFrEMhnXsKMfVdqv5jR2bact7XriwgomdyV4CCM/U0D6AvZLsrt7dqBv9e6v4BuuUX1kBwBLqXoGQdPA4pk5nL60hr989R1cP3lIRgFXB0CxVkbFkeSaQDnfyip75yjgiY8dMjdTbSRo4INO/fR1rBayTBdWGjV+0oV6DAmZA3YC472I+6gx0T4hrHvs2lZ1LnwAg2sMqnoatx6f4KLH6akBJBJylOs2CaSfxBTYHcLtVKtSw10SqgCg6Zhd3IQn4MRAXLCdYgC2dGh3uKCt0v6TSL+6LiuhwwCgcTIaatkSNufW8Cfffg3L+SqOjO3hKMCabiJpXiHjpOiFBijWy6i6UghSdzAX30riSDG2T9xzyEylDMT89JRpjWfzrBdybCPoKZ8er0dO0eDd5narcaoHICpYFnuKsEjIhPVcGpUDsNl18qBpnEveWMedN09zZBWPBjA1PSZGs6vlvgotvFWFXy1S2Gnzt/5dOK4Wh43ltQzcPjenq61chmKILABcvd5gu+u6lvq3A4DeS3vAMwfoQZHLm7hweg7//rtvwB8IYf/gLmkCRGjKJtYiggQM2mhzi1/Dm0LAr54YIgpP+YtM3uN3HjbTmTbiwT7xIKdyBeulPM/ioQHNXp5bL2+WGi9azZ8YAIRKGt6UaazgY7ft49CKnKi9e0cRDAmPVo2bt0vxdp78R5G47TZ6OyKo+1gUADpEJbS9mOX/A6p3W/NgGzqhJrU7mm1cOjmLr770HuYKLZjtNvYOkAkVD4yyRvRbAFDEdpubfBveNALkyEgHUD3hlNf4kVsPmNk80BPqhdN0IFMqIVkpsPdZrFbg8/usJ1aTkAsACCdQMIE21SgrcVn4VUQg1boAcpsfirhZWcH/09qXNcd5nWc+X+/7gkajsRAgQHARRYmi4oiSFdmWlNgul+Kx5Zpc5GIu52/kOpep3KdSNVOVytRkambKmniJPRNLsmRLsiyRlElxBbE3lkaj973j533P+fpDEySRZLpKtoQGvuWc57z7+z5//LVnTa+bg9xEEmfOzpnA8vHewNOs68d9f8Tl8Wzio6fRTavJc0g5BYtXnpIYeBw4jzvt3t9VK3y8DW3UYcw+QxvQOSyW8Mv3P8M7nz+Ezx+WPo3zU6cEAHYG4SgaYQfBaniYUrwTLZmqYM0pu8tACfDNqxeHlQowlS6IBNirVLHXqIoeqTXqiMQ03GgtdcYGNBSs6WDb12c33VtEcCQdLFXutAHYc3Afb7152fDa+yXgdPHiEpIpMmqqJa6NIp7h02Mn8Enu3fh3T9LHVvzrhpl/5F7/dhH/pGd7dNNHWUDhA5JIHuvyTJf0YIAHn97Ef/3n69iodsUg73Z7OJ+fRTSkoXtVXzbcqkA2VoCQaLTDJcRjdkYhQ1ujYJABgINCuiAX2z08xEGjJktRaz4OADQCTTLINHa6VrFPSaW5CCw10w3Vb2Vul8+PX375Kd589QIunSlIXT+jg+S4P39+USZZ6MuMSsW8QBgXm8f990kAYPXt6HfN5rvp2acDwHufx/37SZ5XwGcGO1H16tBp6n8Hzb0D/P3/ehe/fHiAkCR/uL59nBFqWaWIcXl0PeUlYgE4JAJroxncRzSqTSGWRFruSSn97VeeHZbLCgDq5GL5QHj2aLDVWg1EScxo0EVDjSVhVAHjALAbzbEkJD/mSPiwIU+yLdy8J3X++3euIeAf4D/9h1eQiHEYkKqSfH4CC6dnPNE0LwhGxSUnWdSnqQwLgNG1jiZKniYBxt3LE7ubT8j7S+5FAj88LX2ZDPLTH3+Iv/vwHqKk5jHGKjdvKVcQAFhqBmmVdz8aBCKjCgkq2iGOiFHvYDT/XI1L562vPT8s7QKFlBI2bJU5nrUhAKi31AjU7NhQfHgvALy1AN4F3z4sIRuNy0Bmldymfpg9+5QA924gGouh2zrED751BXkGgyQhBCwvzWMix7HvI7WjKuHxiRbvabZr8DQAnMQi9wLtaTbGcWJ//GePu6f1/aXsW6J/PYk/fP6bO/ibH36Itj/mWu4iLDhkenJKJYDd+CMdQgrmnq+PVrONTpgcQ0bBSbbTqAnGAb73jReGO8Wh0Jeyv5oAqLRbCgCqgCjFjhHl7OszbuCEVARpnPyIIcR6gv0d5JJpEetKBnkUAO/fvY5UMinsGQF/D2/90TPIp6PoO0q5trQ0jWzWUKCZplHew3uf8Q2RoIYHJP+/AHDS6/xrADAOBG/ihyAIOgPsbJbwl3/7I5TbDvwceOVumo6bW84bFSAAsBlK9fHtP32HjGRtdKOHBgCGS8FbD/D2Gy8Od7YH0hNIq3OrfCBMHsyLjwBgQrQ2DjBBI1CzgXaBvCJwvbSLeDSKNIs+XSo4fUhKgPduX0M6ncIAfvR7LbTah/jPb/8RwsGg3Dfg+PDMxUUhflLjU6B24oleT9u0R8X/45XK007+uMQ57pQf53q6Jj631px8jrgJ+YLYWNvGX/z1PwCRlAagPJFSXou8w2enphELjgJBR9LUtiDEUQnQjXJIlJqG+r8u+wScK8vzw3SU2b2MZJQYBq4zCTRUGyAmEsB8DAAYCczFlOr1yKkzv0Yp0nX6mMvklFDCNC/wa78vgPe+vIZ0Rsma+TA9smZ16vjWKxewNJuVwHcyGcXi4imZ8S+nn0/hTS972smeZCQekU5PCcOe1LY4qfo4buOtwSdvbq1381wc6P7Rx1/iv/3oY9QHYXT7bUlHWz5kdgFxC7vdNs4VZhA385DURjN0fWpAmBjGULiT64ESYglj+dtYgVElzuWzi8NcdBKZaEqs9/VyCY1uRyzGRouEg+MAYGPI1BMBsFMtC7PH2elZN1ooGl14AAIqATwAUFoaP3xDjkRP4dUry/D7BsKNt3B6DslkTCWBZRSzKukpauEkG3rcCX6SQfc0F89e79hTbwxABYHG+bkmnBHQqjbwzk8+wrvXN9DiMAijbpliDgapAmyPpKrh81OcMKZu4GMBMByi0W5hs7WFQED8SteWo4eRToXhPHdmYTiVnJZ2b6aAOR1UOAKEc6+lkUDjxkkugDZAzgDAEybRAhBVFaSDWz3YxbMLp81I+VEDFecBvHv7GjJp1fEyykwijixu4GSvPlqNA/z5d17EVCYmDaoXzy8jllKCSnWQ7WRw3vP4wNG4TfA0MBwn6k960o+7tqvXzZcjV093UlwyQMiiVleK+Ku/eQeH/Qh8gYDLa9hpa11mkJOeR9FbdDoqARKMBLrGstoC+swmGGRIuO6W10ln4toGoYAf83NZFLdLcF69dHaYCBUkrtzrDWQwBNkuaGg0Ox1EpXJXMUYAMB28OFHApIkDWPFrAcDbHzZquL+3heWZWclY8a/ZAsaHY8Lpl7evI51KucEr0scl4uwSUkDwcLRbNTx3bhKXTk9gOp/G3OwsMpMTWjpmahCVBu74FPJJ7IDjNu7fozKeJPJl/8w0cwKAcxlXVzbxT+9dxwfX1hCMxkHeBnXg9MPTy/5DkmxaIi5+x/Y8BYBWVVspwMNgA1ri8jGJ1G1hu72DYESngxB4/V4P+WwK27sVOK9cWBrmUgsIOn4hjHhQKkoVEIMN5AayAJAnIgBEAigAjjMC+XKcA3iruIaFfB7ZOIcZ2pn8OkDigzs3xAtQC2coXLgJ0yamD96XaV+8VirGwdFxfOMri8ik0piem0MoEjLgORoxHDdIn2QbnEQinFQCHG/kjVwtlQYaHAv5OG63gR/+6CN8fHMDxWob4Qiln37s9vNvqIIDwaAYhp6md6HWUwAov7ANB48AYMbBDn1o9To4GOwhmdGIofIO6X6UynU4zy/OD88Uzoq13u71cW9vWxBIAPC0h8O0NDUdyod7OgAgk8avb95HIT2B2WxOkG+JoZn7//DuDaQSOl+A7malVpORKDr1WpFGMecPhiSa2O21Ua2U8O2XFvCHF6axsLSMxETOTHtmfMIzY8AygY0ZiU877U8DhPf749w42TxjYDGDJ1vgFplwyXsi2d79xef47z/5LXoRZhqHqNYrSMVTWi0pJ1TvxPXmrMZohJuspTd2WouVAMlAxOU70FVTc10nhOmFOIpuv1NEIkvp4KDd4iBtPzrdPjgByLk0Pz88N3tOpmfS+Lu/vysihTQxnGUTNlUncjLFBujitBiBZkrYMWVctCU+XbktHL7zuYKgTdxBPqLfj1/d+wLJeFKngbJurVZFOmnHzqmk4Uv6g0Ehr5LFdXzoUiIFejg7E8cLz8zhygsXxZhUBgwWb3qy425ywi7o0UDS+IafSGWMZdvMkR2lYW19tivISfIYwM72npSaffCb+yiWW/CFw7qZHGhVOUQqTYp5OyrdPBkBwIPB8ntTfCohFWeIZruJs4VZJEUC2HceTWoSiSP6Zoh+f4CN6jriWUeY4fjfnMlAYIjncOnUwvDc3LLbFbxysCc3JKkjpYDUA0rs6OQA4AN8cv8WUukETmXzCPsZsTK2qs+HX93/nQsAqVurHCItizASg51OB37SuvlGhIcyk2hIVHcRCgKZmIOrzy3iT75+BdGkpVUz0sDNYNskyaMAGN/0J4LA40LqoCUr4kelBFb/UgKQ2KnTbIll/+mtLexVOxiSNsY8hkxMZ+eOvHvaDIiS42sAD1TrdSRi2n9h7QLet9VpioeVDGpjiL7hOAB4aEj+DayVHyI14Uenw00n58NQZizTRXQuzZ8enp05IwZYtdHCWqUk8ocSgACgBJBBRGayNk+hzAeIJeVlxodD2OrU3658iWg8htl0DslQVA03GUjp4Nf3byIeZ+ZPa1doA9AotAOP+LqsR6RRxBNkZaItwraGD/+ejNy9bh1vvf4cXn/1BUTDPoTDrH8zGT3D5KmFMEfB8K+JHFrZfMSPt8kX+ufGqueK9zt9vP+rG/ifP/sMPYZxzZyFEYb0hFJyHVYqSCc1JiKg8ugALwCMeSx/1263sTw9h5RUBdvmHLsTem1ehtlXQmP1YBXpXFD4FMOhABqNFlLJBIr7ZTh/cOb8cGFyThBYrtexVSPj5RgAPFkmsoYuZtke/ngAcJF+t3GffG2YTuWki0gwxPnfjg+frNwS99K+FHVdMpl0JQCXgrYGRXpI6OlVKXrPsHTEyA8k7YHnLxTgDLrIZ9JSX8D8wumFKaQSMZl4YpZXdamxaVw35AnlXuMxAdeHdyNqAxmqRePu/oNNsMHkg8/uotojMx5FvTm99gjbGj9j7nHkDtXfqOBIf5Ej9Ul6GWcSyA2Z6eYyw3d2ek5UgMZITZTUvKVKKC3/4BKtHKwjEO3LYSFVDbkgOKOwXG/C+erFK8NCkhM7gZ3DMvbNeNhuvyclSZQAVjCLUSEAmJK+gHEJYG9K+N3f2UC930U+lcF0PK19d8JM4sOnq3cQEh4zfaFqoy5egNuXN9ThlBSTEd7fW2giYDCHRY41T18P337tHPLZhOi5TruP9qCP7c099HsdvHTlPC4/tygulYRdVaQYALnlqI+AzIgeXVY3gmaCKaY5hPLpyztr+Meff4z9WgdfPNhBLJ5ClGXYZDMzRq3Yt8ZGUJdQe/grdbV/ZEK6KyKGYkjzWSNhk8WxmysZPgVAyrjY9LI0WmoOhAGAvfVqaQtOrIdWs4lwOCQspe1OBz0agV+/fHXIE0r9u36wj2qH4cchLABC3ACxPnTZOCls0RiBvKlXBYxOGbB1sIvtRgW5ZAqnkhmx1IVSzXHw2dp9BKjEZR8HCoCYRbouO1nLaKjQDbX2rTsCbsgpXX0RocRAf9DC4KB17gAAD8lJREFUd7/xggBAeIJFYNCq5hh5B3cebGBzq4jCVBZfeX4Zc9MTiEWDCEUibkuaLL5VE0YiGGopg39jWAkpBNBrt1ApN/CTdz9F9fddRS8+exY37m6gH42jP+hhZXUbxe19IZET4Jv5ibrHZlDbYCA1F0l6RHYUnEnmMBNL6Rcii7vXAmCOv9XC8swppD0xllHVxWg6mWruIVb2NoF4C512V+hx+ZqUDuyGcr79ldeG0UBI5tA+2N8RqlgBwIASYGjCkNa3Mm5gll5AyhRyPlo0xXcs16u4s7+FiUQCp7OTxlVjYtmH6xsrcORBdFFZecT6AYolg2FZxE6/jwj1ufkpd5yqgSPsJ/NZTGQTmMwkJbAxlwkil0mK22jMQCO59LRxE6rNDoq7Jfl9JppIp5qfSGDpdAG5LCWadtjY4iAZb29MMBqxrIeolWu4dWsF26UqSvUmZqbziArL+RC/ubWBU8unpdKJPY+tTh+bW3tYWd3C1nYJEVPFq7E6bc5oNpvGHjLyxqircq2MVCIlgD6i+wCJ0C5Pn0ImbG0Aawp6XtkcLvqea6VtnL2cQqvelr4PRnMZZun2HDh/+vLrQ46GowjSnkC1FGkE8sO+QK++tengxwHAqjoOkvhs/R6SsRjOTc9o3tqR84Abm6sAJ2yZ2AKnkIYCJG62UkHjELyGFKSI1PWh2qzizPkFXDzPpogAIgHlOdje3kcy4gg1nOUB1Opkr/7lxFGVZP2hH71OD61+H5VaAw9Xitgv72F5Po8/eP4Mzi/NI5tJSGEsCzSYjj0o1/GT//sJVosVLC7PIBGPIkIQG5eLuYwPrz/AM5fO6kBqy/htQLWytoP33v8tkkkSbRgp1+uJW813tB+Z/e8A++V95LIT+u5jDkyz3cKZwhyyYZ0W/gjjihv01RKz7YNdLF+OICaE2LrO9AhIz+t876tvDjl5ilLmzvamTgeVSSBtpTQPsFJwJIQEAEwHx1OymSPdYyTlCITi78cScSzm8pK5ss7Kze116b2zxg2rVnhPe9o1EMXGlJZkI3kqW90mXnvtRZwqTMgJZq+CzBh0BtjcLCIZdYRX2PWLPXEAM5TVjaZ5Ay7WOiW9ROmwjo3tPezulzDsdxFnQazfJ5zDji+IC+cXMZmlqtImVyu2KcVoX/zzJ7dw5cVnZUvIDF6t0+oOSZrb7w/gi9sr+OzGAwQpcY2hSylLr0UkH9WLmYd5UC4hmyErmCLAuo/8HQuADAFg1PDIiBz9rmw/GdoOy5hc7CMbV3XEmcoBZ4hYLAbn+y+/MRQDBMDtzQ2hGuOHi+8PBDUVaaZO8ucExryMiUub1jDTHm433li57LP76MFNhGIRTMaTKMTTpvTLwe3iJqho1MIeStCnN+whFhllHtmZxFBoPBZHvdnE115/QTgGOTa9VmvhsHyI+bmCLMz6+haSEeDUVMaNWpo+KPfwuIrKvJ+GRD1Hyzt9FI7MMmp1euJysUMoHNI4uwXtaENUxYT8frzzwed49ZUXMeizuWQdwUAQc7Mk4uasfya6Bvjx//sEbepernG7JV1RXGNXApgZvofVKjKMjZgv7FqRY7jZbmNpahYTEUZTDfmFOyXOAxaZyaRGdnCigrnJqNg8tu1C9vX7V9+gDSmIvb294Y6HbXaaCARCgmxTcyKPQgDMTUxhMp7REXGeLKB6ZWplMyzx6fpdOKEA4oGgxA74PX9+e1fbz+0IGXoW7Z5xeYyRxHAm6xGYJOLp/8HbryHIPgIGg0husVXC1uYmzp89jVq1jpCvgzOzytApkTNLCmjtB7PdR906Tx2dpX/1SDvv+2hbuDW1RlW1Gu4dCJXdf/k/72F2poDifgVXr16WARgCcTPNc9jv4f1f38LuQV1+3mjWEQyRHHM0yJm3Yek98zB8d+/62knfBMBifkbrMqXEy7XR5W3ddzR5QV6r6mzg3OmM7qf72iwJu/r6kKK80e1iZX9X4/NM6FAvhyPHAmAmO4mpRNbk+j0MoXbxDBpvbj9EGyRRcnBues5EAx3c390W9nCKV64qC0Ia7YYb9eIpExepWUMynsAAPXzvrZdl8yniBThMqjQ7+PLOQ2xsbcnI9WeWZpCM0HJ2EAqHEWZJmokViNgW8WpCy24pta6ebJIA2KPDXAlhXEePm0aZ2ev1pW2cxt7GXgW3tg5w5fIFzOZzcEi6bYo4uals7xp0O3j3VzexX25oy3mjLrkWbopVATyV7MmkZLAxEDdgJZ6KhoIJAE5qswB51AzUV+FeklJ3vXkXF5ezYmvRmDX2LQHwhvAFlJsNbFYOj/jm1L88beMSYDozgelkTi6ibZ26eMY9V90Iuh9bKHebCPj8WJosIOoPioRZLRZR7bMe0ABg0Ee10ZAEkd5L+YAlQJRIwvEP8N3vvCQxBEv64DJ+kZFz6KDWaIokoH3AeHer1QBPnB99aYzMZ1LIphKuoUn69lEgSMes6EffR8W9kWj8dylIclCpNoTPaLN0iKE/hEQyKWqObePkKhg32pVISgHW77Tx0198jnqrL8CsNRqIeABgUCCSIUJ1aNb+CC6HAzS7LUnJc1yvsK1aO8CDXVu4YkPO17Z+h0I+jliE/ARBJJJB3TvaAEzU7FYq2G3VRZxRwDFAIcEZKedSomUuClVAIZXBTJp8PxqBHkHAHCCNdGDrcB+b1QMEw2HMJFKCWO7w2m4RlW7HBQD11GGlJkUickolajuERMlSaTi+Af70Oy8J1874bGHt3VFXSV15MwaFdg2JI+m61RvYK+5it7iLw8OKbGwyHkU6GkAyTjbyGIIBBwG6b2Qv7/bQ7vRQb3VRafRQazVxWKljc6eEnXIZpxcX8NY3v4YA2dZMpsSUzapNqXJfw7ECAJUsnU4X7/z01+KF8D2p4sYBQAlQa9QQj2tswEprcwkR6rTP2JzDwtsAcyx2JL5XeKkuMAQRDj5evYFkSquLucOpqA9LswkFAF207XIJB+QIklSmRqiYsePHSgBuOMVTPpnEbGZSysUlHz3mp5j9x0Gzint7WwKAXCSG6ZQyYK3t7aDS1WIHG5fjkKZsJqszbNT9Rlni5Cwe7eHt775iJIDej8aMeCCy6yNjzoo9SV4ZS53eDD9Sg2NkH8OizWYL1VoTv/ntDSyfmUUhnxEVM/D5pHaRYpjlWuxnDPjZJq81E9dv3UUmk8DSqbwSUsguibM8koQGAJKZEy7tgUQo/8c77yMYjGjJXbul6Xa5gMpPuoFs5xIL/ZGV1YPV7LQwl5lAgeQeXgBYKeYZY2SiePhk9QskUyGDRSUCSUT8BMCbQwY51kq7qAlDpQLgsFaRQMQ4AOibT8RiODUxJW6YS/nmQZ8+x1A6U2/vbSAYCsksgPlMXgJBG+VdHLQasqgabAFK5RImWDtg/pYbVT4sS6as02niz37wdQRlXMvR4dLWOlbA24lZGmAy6v+Ite+tC7VWfa/v4Oad23j24ln4xZ/yGIf2vRRZck2O1l3ZLGJpoaA20jG5BGnzEumvRRh055rNLv7hh+8iGmG0kEUvHUSMK6fahlM8NUyruRLjYR2xS+gStzGdTosUFglgFJdrv3irxI3+uLZxC/MLaVRrDTTaZFSRRj04P7j6plz+wW5RAiMiSnn6qpwva2cBKj4lTdzrIB2JYDE341KXj6dRVVzxhZsSDfQFA2J8nErlZA4RG0fYf+jXuSryOaiUkUkbSnoTizg8PEAqnUajUcN/fPtNxEI8mRpAsrWAnsN/RAB6DoNCyoglb0bOLhhV3J0H6yjM5BCP8UTa+N8jqNZNYfV0sYTJyQyCATs74ChobEJGbQD9m1K5hv/94w8l7E3Dt93riQqQPkjzwL0OZxD1NaNpyDaPxIFoJPbaKKRTmE3lDeO6BwTygOZypsCE394p3sfcfBh+/1A8JPIvlqttBQCRd29nG10TD7cSQAwwtwNYAcAkTSIUxpn8rKv9VQqMGdDGmr27v4UhRarfh7lkVoYasGq4WDsUP1klAKuCKkjENZRrP/V6DeFoSKqDvvXNqzqwQWrkHw8Aa/yMA8CeMLESLArcGj1gdWsXkWgQudyIkXscUd5rrm/vIz+ZRkAAMJpt4AoME08W8a+iAKsbu/j5+58jFo1qKXyPoe6oum3m4gzTDvoD8WLERLaJMDsASwDQwVQigdksAeAlpTVQOQIAjV083NvE4jMx+IYM8fd0mDSlKQHApMvD/V10pKmTqci+xOfphyoADML4HdEZCODc1Ck9DWPj4i0Q+NLUs/f2NskQL783k8ogHYlhr17BZrUsALC6r96oyWLYoIiI2k4bLXoLPh9efvkCzi/O6mIbVaARMmOxHzkmR7ZuTAV45Kkp2eLmrG3vwx90UMjTTrHve5RB1MXNcIiHGzuYmc7KO2hWdFwCmOyOARmBcO13K/jFR+yL1FgG9T9zIBYAfIU2m3JYLSw5EK91pSsrhnivg8l4HHO5vKSi7R6ML4EYfOZQb5V2MXPWh1QsJPaH5Dy432+/9OaQOmXtoISe4ehhIojVIhRV/HgBQN3FMOz5wvyRKJuK4pE7qFYwJcsmmsOeGF+0HQqJDEr1CtYOS2Cm0b5is90QwysUGlGbMFNWrbFAxYfXvnoZL5o4u46nPa5TyBhhXqPwiP40CtGqBOvqDYD14h5YfFSgD2/+3rugXtuB/j8lxqnZCQRZsXsMAIwBoJ2+sooDfPjJl/AnYpjOT+De/Yd48GBLbACbUaX5wURP0JMX0T8262pyJ2KHkYU0P/VkAJhQMK+xWz1Adq6LyYwCTodPGAA02m3ZEA6FZFaLxglPOgsSRwAwr2F+59npBTUWrA9qCx9sxM0YNQ92N1EddOUlo6EgTmfyKDdqWC3vSxTMLjJH0vGBeCK42ET5xUsLeP7CaQn9Xr95F6+98rxhGDFzCTw9AXrmTw4A2RKTeePCb+7swyEAcioBRLrYFLFrQ+hdmFHj75+ayxmb5DgVwPZuLfHi//GKP3vvU1x56TnEg6xLcPDhJ19gq1gR70ZMT870adQl/0FVqEasRwpYAPQ6yIQjWMgXVAVY4i2v4LM2j2kGKTeaiObKyGdjUg4mY//6AoA/HlZbDWweHujYAEcbNdigwHpAFU8abpRFE/HRw+WZJdP0aQJFx1hjlADrpSJK3ba6kj7IYINKo461MkXuiMak3++i2WkjHotJtWpuKobXXr4kvj8lw89/8RHeeOMPtQLGtJtxWY+OmR8X/aMKK/uNvo4Bs2XdJgCKe+LX53PZ0XAKbx7eI0nIGVTcK2N+Nge/f9S7eGT9pfNnVOPn9wXxw5+9izffeEXo3/geLCS5dmvNrfrlhldMibw3pe0xEQTkPKAEwFJ+2qOix5xx12CRUJCwwPiSu5id0g4wIaX8fQTyXwAXjATgGjVNgAAAAABJRU5ErkJggg==" 
    gdpr-enabled="false" 
    message-userinfo-format="both" 
    message-dateformat="both" 
    start-chat-button-text="Chat now!" 
    lang="en" 
    button-icon-type="bubble" 
    authentication-message="Hello! How can we help you?" 
    greeting-visibility="none" 
    greeting-offline-visibility="none" 
    chat-delay="2000" 
    enable-direct-call="false" 
    enable-ga="false" 
    ></call-us>--> 
    <script defer src="https://downloads-global.3cx.com/downloads/livechatandtalk/v1/callus.js" id="tcx-callus-js" charset="utf-8"></script>
    <div class="container">
        <header>
            <aside class="side-bar">
                <div class="logo">

                    <a href="home.jsp"> <img src="image/LogoCN.png" alt="logo" ></a>
                </div>

                <div class="search-bar">
                    <form action="SearchServlet">
                        <button>
                            <i class='bx bx-search'></i>
                        </button>
                        <input type="text" placeholder="Type here to search">
                    </form>
                </div>



                <%
                    UserDTO dto = (UserDTO) session.getAttribute("USER_INFO");

                    if (dto == null) {
                %>
                <div class="profile">
                    <div class="login-pro">
                        <i class='bx bx-user'></i>
                        <a href="login.jsp">Login</a>
                    </div>

                    <span> / </span>

                    <div class="sign-pro">
                        <i class='bx bx-lock-alt'></i>
                        <a href="register.jsp">Sign Up</a>
                    </div>
                </div>
            </aside>
        </header>

        <main>
            <div class="column">
                <div class="menu">
                    <ul class="menu-ic">
                        <li>
                            <i class='bx bx-home-alt-2'></i>

                            <a href="home.jsp">Home</a>
                        </li>

                        <li>
                            <i class='bx bx-location-plus'></i>
                            <a href="ViewLocation">Location</a>
                        </li>
                        <li>
                            <i class='bx bx-package'></i>
                            <a href="ViewPackage">Packages</a>
                        </li>
                        <li>
                            <i class='bx bx-bell'></i>
                            <a href="ViewServiceServlet">Service</a>
                        </li>
                        <li>
                            <i class='bx bx-party'></i>
                            <a href="BookingPartyServlet">Booking Party</a>
                        </li>
                        <li>
                            <i class='bx bx-info-circle'></i>
                            <a href="about.jsp">About Us</a>
                        </li>
                    </ul>
                </div>

                <div class="column-content">
                    <div class="slide-container">
                        <div class="slides">
                            <img src="image/cover1.jpg" alt="image #1" class="active"/>
                            <img src="image/cover2.jpg" alt="image #2"/>
                            <img src="image/cover3.jpg" alt="image #3"/>
                            <img src="image/cover4.png" alt="image #4"/>
                        </div>

                        <div class="buttons">
                            <span class="next">&#10095;</span>
                            <span class="prev">&#10094;</span>
                        </div>

                        <div class="dotsContainer">
                            <div class="dot active" attr='0' onclick="switchImage(this)"></div>
                            <div class="dot" attr='1' onclick="switchImage(this)"></div>
                            <div class="dot" attr='2' onclick="switchImage(this)"></div>
                            <div class="dot" attr='3' onclick="switchImage(this)"></div>
                        </div>
                    </div>

                    <div class="intro-wrapper">
                        <div class="intro-image">
                            <img src="image/Birthday.png" alt="Best Party">
                        </div>
                        <div class="intro-text">
                            <div>
                                <p>
                                    Is a meaningful and special birthday to mark an important milestone for little angels always something parents wonder about?
                                </p>
                                <p>
                                    With a variety of birthday party packages, Wonderlands promises to bring little angels a party full of surprises and memorable moments.
                                </p>
                            </div>
                            <button>
                                <a href="#">
                                    <i class='bx bx-cake' ></i>
                                    <span>Contact to book a party</span>
                                </a>
                            </button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="about">
                <div class="about-top">
                    <h2 style="color: #005198;">WHY CHOOSE TO BOOK A PARTY AT WONDER?</h2>
                    <div class="ups-row">
                        <div class="ups-row-content">
                            <img class="usp-content-item-icon" src="https://tiniworld.com/static/version1699082497/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/usp-photo1.png" alt="usp-1">
                            <div>
                                <h3 style="color: #f86080">UNLIMITED FUN</h3>
                            </div>
                        </div>

                        <div class="ups-row-content">
                            <img class="usp-content-item-icon" src="https://tiniworld.com/static/version1699082497/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/usp-photo2.png" alt="usp-1">
                            <div>
                                <h3 style="color: #f0b000">LOVELY DECORATION</h3>
                            </div>
                        </div>

                        <div class="ups-row-content">
                            <img class="usp-content-item-icon" src="https://tiniworld.com/static/version1699082497/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/usp-photo3.png" alt="usp-1">
                            <div>
                                <h3 style="color: #20b050">FUN PARTY PROGRAM</h3>
                            </div>
                        </div>
                    </div>

                    <div class="ups-row">
                        <div class="ups-row-content">
                            <img class="usp-content-item-icon" src="https://tiniworld.com/static/version1699082497/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/usp-photo4.png" alt="usp-1">
                            <div>
                                <h3 style="color: #20b050">DIVERSE GAMES</h3>
                            </div>
                        </div>

                        <div class="ups-row-content">
                            <img class="usp-content-item-icon" src="https://tiniworld.com/static/version1699082497/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/usp-photo5.png" alt="usp-1">
                            <div>
                                <h3 style="color: #00a0f0">ATTRACTIVE DIVERSE MENU</h3>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="service">
                <div class="service-container">
                    <div class="service-heading">
                        <h1 style="color: #005198;">SPECIAL SERVICE</h1>
                    </div>

                    <div class="special-title">
                        <img src="https://tiniworld.com/static/version1706722373/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/color-wheel%201.png"/>
                        <span style="color: #005198; font-weight: bold">Full decoration according to theme</span>
                    </div>

                    <div class="special-image">
                        <img src="https://tiniworld.com/media/wysiwyg/birthday/birthday_slide-3.png"/>
                    </div>

                    <div class="theme">
                        <h4 style="color: #ffa000; text-align: center">HOT decoration theme</h4>

                        <div class="theme-container">
                            <div class="service-theme">
                                <img src="https://tiniworld.com/static/version1706722373/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/services%20(2).png"/>
                                <img src="https://tiniworld.com/static/version1706722373/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/services%20(3).png"/>
                                <img src="https://tiniworld.com/static/version1706722373/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/services%20(4).png"/>
                                <img src="https://tiniworld.com/static/version1706722373/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/services%20(5).png"/>
                                <img src="https://tiniworld.com/static/version1706722373/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/services%20(6).png"/>
                                <img src="https://tiniworld.com/static/version1706722373/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/services%20(7).png"/>
                                <img src="https://tiniworld.com/static/version1706722373/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/services%20(8).png"/>
                                <img src="https://tiniworld.com/static/version1706722373/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/services%20(9).png"/>
                                <img src="https://tiniworld.com/static/version1706722373/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/services%20(10).png"/>
                                <img src="https://tiniworld.com/static/version1706722373/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/services%20(11).png"/>
                                <img src="https://tiniworld.com/static/version1706722373/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/services%20(12).png"/>
                                <img src="https://tiniworld.com/static/version1706722373/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/services%20(15).png"/>
                            </div>
                        </div>
                    </div>

                    <div class="service-other">
                        <div class="special-title">
                            <img src="https://tiniworld.com/static/version1706722373/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/party%201.png"/>
                            <span style="color: #005198; font-weight: bold">Other services</span>
                        </div>

                        <div class="services-others-contents">
                            <div class="services-other-list">
                                <div class="services-other-item">
                                    <img src="https://tiniworld.com/static/version1706722373/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/other-services%20(1).png"/>
                                    <br>
                                    <font style="font-size: 19px; color: #00c2f3">Smash Pinata candy</font>
                                </div>
                                <div class="services-other-item">
                                    <img src="https://tiniworld.com/static/version1706722373/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/other-services%20(2).png"/>
                                    <br>
                                    <font style="font-size: 19px; color: #00c2f3">Bubble clown</font>
                                </div>
                                <div class="services-other-item">
                                    <img src="https://tiniworld.com/static/version1706722373/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/other-services%20(4).png"/>
                                    <br>
                                    <font style="font-size: 19px; color: #00c2f3">Giant bubble</font>
                                </div>
                                <div class="services-other-item">
                                    <img src="https://tiniworld.com/static/version1706722373/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/other-services%20(6).png"/>
                                    <br>
                                    <font style="font-size: 19px; color: #00c2f3">English MC</font>
                                </div>
                            </div>
                            <br/>
                            <br/>
                            <div class="services-other-list">
                                <div class="services-other-item">
                                    <img src="https://tiniworld.com/static/version1706722373/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/other-services%20(8).png"/>
                                    <br>
                                    <font style="font-size: 19px; color: #00c2f3">Artistic face painting</font>
                                </div>
                                <div class="services-other-item">
                                    <img src="https://tiniworld.com/static/version1706722373/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/other-services%20(3).png"/>
                                    <br>
                                    <font style="font-size: 19px; color: #00c2f3">Magic magic</font>
                                </div>
                                <div class="services-other-item">
                                    <img src="https://tiniworld.com/static/version1706722373/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/other-services%20(5).png"/>
                                    <br>
                                    <font style="font-size: 19px; color: #00c2f3">Lovely cake</font>
                                </div>
                                <div class="services-other-item">
                                    <img src="https://tiniworld.com/static/version1706722373/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/other-services%20(7).png"/>
                                    <br>
                                    <font style="font-size: 19px; color: #00c2f3">Gift for baby</font>
                                </div>
                            </div>
                        </div>

                        <div class="service-desc">
                            <font>Please contact Wonder staff for advice on special services</font>
                        </div>

                        <div class="service-btn">
                            <button>
                                <a href="#">
                                    <i style="color: #FFAC85" class='bx bx-cake' ></i>
                                    <font style="color: #fff">CONTACT FOR CONSULATION</font>
                                </a>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <footer class="page-footer">
            <div class="footer-header">
                <h2>NEW CHILDREN'S TRADING AND SERVICES JOINT STOCK COMPANY</h2>
            </div>

            <div class="footer-content">
                <div class="footer-content-usp">
                    <ul>
                        <li>History begin</li>
                        <li>Job opportunities</li>
                        <li>Wonder regulation</li>
                        <li>Wonder Partner</li>
                        <li>Wonder Charity Foundation</li>
                    </ul>
                </div>

                <div class="footer-content-usp">
                    <ul>
                        <li>
                            <a href="#">
                                <i class='bx bx-world'></i>
                                <span>nkidgroup.com</span>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <i class='bx bx-envelope' ></i>
                                <span>cskh@wonderland.com</span>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <i class='bx bx-phone' ></i>
                                <span>1900 63 63 28</span>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <i class='bx bx-current-location' ></i>
                                <span>SWP391</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>

            <div class="copy-right">
                <div class="copy-right-content">
                    <font>Copyright © 2016 N KID CORPORATION - Wonderland amusement park</font>
                </div>
            </div>
        </footer>
    </div>
    <%
    } else {
    %>
    <div class="user-logined">
        <div class="logined">
            <i class='bx bx-user-circle'></i>
            <%
                if (session.getAttribute("USER_INFO") != null && dto.getRoleID().equals("2")) {
            %>
            <a href="ViewUserServlet">${sessionScope.USER_INFO.fullName}</a>
            <%
            } else if (dto.getRoleID().equals("1")) {
            %>
            <a href="customer.jsp">${sessionScope.USER_INFO.fullName}</a>
            <%
            } else {
            %>
            <a href="PartyHostServlet">${sessionScope.USER_INFO.fullName}</a>
            <%
                }
            %>

        </div>
        <div class="cart-items">
            <i class='bx bx-cart' ></i>
            <a href="#">Cart</a>
        </div>
    </div>
</aside>
</header>

<main>
    <div class="column">
        <div class="menu">
            <ul class="menu-ic">
                <li>
                    <i class='bx bx-home-alt-2'></i>

                    <a href="home.jsp">Home</a>
                </li>

                <li>
                    <i class='bx bx-location-plus'></i>
                    <a href="ViewLocation">Location</a>
                </li>
                <li>
                    <i class='bx bx-package'></i>
                    <a href="ViewPackage">Packages</a>
                </li>
                <li>
                    <i class='bx bx-bell'></i>
                    <a href="ViewServiceServlet">Service</a>
                </li>
                <li>
                    <i class='bx bx-party'></i>
                    <a href="BookingPartyServlet">Booking Party</a>
                </li>
                <li>
                    <i class='bx bx-info-circle'></i>
                    <a href="about.jsp">About Us</a>
                </li>
            </ul>
            <ul class="logout">
                <li>
                    <form action="LogoutServlet" method="POST">
                        <i class='bx bx-log-out-circle'></i>
                        <input type="submit" value="Logout" name="action" />
                    </form>
                </li>
            </ul>
        </div>

        <div class="column-content">
            <div class="slide-container">
                <div class="slides">
                    <img src="image/cover1.jpg" alt="image #1" class="active"/>
                    <img src="image/cover2.jpg" alt="image #2"/>
                    <img src="image/cover3.jpg" alt="image #3"/>
                    <img src="image/cover4.png" alt="image #4"/>
                </div>

                <div class="buttons">
                    <span class="next">&#10095;</span>
                    <span class="prev">&#10094;</span>
                </div>

                <div class="dotsContainer">
                    <div class="dot active" attr='0' onclick="switchImage(this)"></div>
                    <div class="dot" attr='1' onclick="switchImage(this)"></div>
                    <div class="dot" attr='2' onclick="switchImage(this)"></div>
                    <div class="dot" attr='3' onclick="switchImage(this)"></div>
                </div>
            </div>

            <div class="intro-wrapper">
                <div class="intro-image">
                    <img src="image/Birthday.png" alt="Best Party">                
                </div>
                <div class="intro-text">
                    <div>
                        <p>
                            Is a meaningful and special birthday to mark an important milestone for little angels always something parents wonder about?
                        </p>
                        <p>
                            With a variety of birthday party packages, Wonderlands promises to bring little angels a party full of surprises and memorable moments.
                        </p>
                    </div>
                    <button>
                        <a href="#">
                            <i class='bx bx-cake' ></i>
                            <span>Contact to book a party</span>
                        </a>
                    </button>
                </div>
            </div>
        </div>
    </div>

    <div class="about">
        <div class="about-top">
            <h2 style="color: #005198;">WHY CHOOSE TO BOOK A PARTY AT WONDER?</h2>
            <div class="ups-row">
                <div class="ups-row-content">
                    <img class="usp-content-item-icon" src="https://tiniworld.com/static/version1699082497/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/usp-photo1.png" alt="usp-1">
                    <div>
                        <h3 style="color: #f86080">UNLIMITED FUN</h3>
                    </div>
                </div>

                <div class="ups-row-content">
                    <img class="usp-content-item-icon" src="https://tiniworld.com/static/version1699082497/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/usp-photo2.png" alt="usp-1">
                    <div>
                        <h3 style="color: #f0b000">LOVELY DECORATION</h3>
                    </div>
                </div>

                <div class="ups-row-content">
                    <img class="usp-content-item-icon" src="https://tiniworld.com/static/version1699082497/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/usp-photo3.png" alt="usp-1">
                    <div>
                        <h3 style="color: #20b050">FUN PARTY PROGRAM</h3>
                    </div>
                </div>
            </div>

            <div class="ups-row">
                <div class="ups-row-content">
                    <img class="usp-content-item-icon" src="https://tiniworld.com/static/version1699082497/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/usp-photo4.png" alt="usp-1">
                    <div>
                        <h3 style="color: #20b050">DIVERSE GAMES</h3>
                    </div>
                </div>

                <div class="ups-row-content">
                    <img class="usp-content-item-icon" src="https://tiniworld.com/static/version1699082497/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/usp-photo5.png" alt="usp-1">
                    <div>
                        <h3 style="color: #00a0f0">ATTRACTIVE DIVERSE MENU</h3>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="service">
        <div class="service-container">
            <div class="service-heading">
                <h1 style="color: #005198;">SPECIAL SERVICE</h1>
            </div>

            <div class="special-title">
                <img src="https://tiniworld.com/static/version1706722373/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/color-wheel%201.png"/>
                <span style="color: #005198; font-weight: bold">Full decoration according to theme</span>
            </div>

            <div class="special-image">
                <img src="https://tiniworld.com/media/wysiwyg/birthday/birthday_slide-3.png"/>
            </div>

            <div class="theme">
                <h4 style="color: #ffa000; text-align: center">HOT decoration theme</h4>

                <div class="theme-container">
                    <div class="service-theme">
                        <img src="https://tiniworld.com/static/version1706722373/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/services%20(2).png"/>
                        <img src="https://tiniworld.com/static/version1706722373/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/services%20(3).png"/>
                        <img src="https://tiniworld.com/static/version1706722373/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/services%20(4).png"/>
                        <img src="https://tiniworld.com/static/version1706722373/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/services%20(5).png"/>
                        <img src="https://tiniworld.com/static/version1706722373/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/services%20(6).png"/>
                        <img src="https://tiniworld.com/static/version1706722373/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/services%20(7).png"/>
                        <img src="https://tiniworld.com/static/version1706722373/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/services%20(8).png"/>
                        <img src="https://tiniworld.com/static/version1706722373/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/services%20(9).png"/>
                        <img src="https://tiniworld.com/static/version1706722373/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/services%20(10).png"/>
                        <img src="https://tiniworld.com/static/version1706722373/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/services%20(11).png"/>
                        <img src="https://tiniworld.com/static/version1706722373/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/services%20(12).png"/>
                        <img src="https://tiniworld.com/static/version1706722373/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/services%20(15).png"/>
                    </div>
                </div>
            </div>

            <div class="service-other">
                <div class="special-title">
                    <img src="https://tiniworld.com/static/version1706722373/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/party%201.png"/>
                    <span style="color: #005198; font-weight: bold">Other services</span>
                </div>

                <div class="services-others-contents">
                    <div class="services-other-list">
                        <div class="services-other-item">
                            <img src="https://tiniworld.com/static/version1706722373/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/other-services%20(1).png"/>
                            <br>
                            <font style="font-size: 19px; color: #00c2f3">Smash Pinata candy</font>
                        </div>
                        <div class="services-other-item">
                            <img src="https://tiniworld.com/static/version1706722373/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/other-services%20(2).png"/>
                            <br>
                            <font style="font-size: 19px; color: #00c2f3">Bubble clown</font>
                        </div>
                        <div class="services-other-item">
                            <img src="https://tiniworld.com/static/version1706722373/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/other-services%20(4).png"/>
                            <br>
                            <font style="font-size: 19px; color: #00c2f3">Giant bubble</font>
                        </div>
                        <div class="services-other-item">
                            <img src="https://tiniworld.com/static/version1706722373/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/other-services%20(6).png"/>
                            <br>
                            <font style="font-size: 19px; color: #00c2f3">English MC</font>
                        </div>
                    </div>
                    <br/>
                    <br/>
                    <div class="services-other-list">
                        <div class="services-other-item">
                            <img src="https://tiniworld.com/static/version1706722373/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/other-services%20(8).png"/>
                            <br>
                            <font style="font-size: 19px; color: #00c2f3">Artistic face painting</font>
                        </div>
                        <div class="services-other-item">
                            <img src="https://tiniworld.com/static/version1706722373/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/other-services%20(3).png"/>
                            <br>
                            <font style="font-size: 19px; color: #00c2f3">Magic magic</font>
                        </div>
                        <div class="services-other-item">
                            <img src="https://tiniworld.com/static/version1706722373/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/other-services%20(5).png"/>
                            <br>
                            <font style="font-size: 19px; color: #00c2f3">Lovely cake</font>
                        </div>
                        <div class="services-other-item">
                            <img src="https://tiniworld.com/static/version1706722373/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/other-services%20(7).png"/>
                            <br>
                            <font style="font-size: 19px; color: #00c2f3">Gift for baby</font>
                        </div>
                    </div>
                </div>

                <div class="service-desc">
                    <font>Please contact Wonder staff for advice on special services</font>
                </div>

                <div class="service-btn">
                    <button>
                        <a href="#">
                            <i style="color: #FFAC85" class='bx bx-cake' ></i>
                            <font style="color: #fff">CONTACT FOR CONSULATION</font>
                        </a>
                    </button>
                </div>
            </div>
        </div>
    </div>
</main>

<footer class="page-footer">
    <div class="footer-header">
        <h2>NEW CHILDREN'S TRADING AND SERVICES JOINT STOCK COMPANY</h2>
    </div>

    <div class="footer-content">
        <div class="footer-content-usp">
            <ul>
                <li>History begin</li>
                <li>Job opportunities</li>
                <li>Wonder regulation</li>
                <li>Wonder Partner</li>
                <li>Wonder Charity Foundation</li>
            </ul>
        </div>

        <div class="footer-content-usp">
            <ul>
                <li>
                    <a href="#">
                        <i class='bx bx-world'></i>
                        <span>nkidgroup.com</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class='bx bx-envelope' ></i>
                        <span>cskh@wonderland.com</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class='bx bx-phone' ></i>
                        <span>1900 63 63 28</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class='bx bx-current-location' ></i>
                        <span>SWP391</span>
                    </a>
                </li>
            </ul>
        </div>
    </div>

    <div class="copy-right">
        <div class="copy-right-content">
            <font>Copyright © 2016 N KID CORPORATION - Wonderland amusement park</font>
        </div>
    </div>
</footer>

</div>
<%
    }
%>

<script src="js/slider.js"></script>
</body>
</html>