

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>

</head>
<body>
<style>

    @import url('https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap');

    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: 'Poppins', sans-serif;
    }

    :root {
        --primaryColor: #199600;
    }


    html {
        scroll-behavior: smooth;
    }

    body {
        overflow-x: hidden;
    }

    .container {
        max-width: 85%;
        margin: 0 auto;
    }

    section {
        min-height: 100vh;
        width: 100%;
        padding: 120px 0;
    }

    .row {
        display: flex;
        align-items: center;
        justify-content: space-between;
        flex-wrap: wrap;
    }

    .feature-img {
        border-radius: 15px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
    }

    .row .col-2 {
        flex-basis: 47%;
    }

    .row .col-3 {
        flex-basis: 30%;
    }

    .appointment-button {
        background: var(--primaryColor);
        border: 3px solid var(--primaryColor);
        border-radius: 8px;
        font-size: 16px;
        text-transform: uppercase;
        color: #fff;
        padding: 10px 25px;
        font-family: 'Poppins', sans-serif;
        font-weight: 600;
        cursor: pointer;
        transition: all .3s ease-in-out;
        margin-top: 100px;
    }

    .appointment-button:hover {
        background: transparent;
        color: var(--primaryColor);
    }

    .btn-primary {
        background: var(--primaryColor);
        border: 3px solid var(--primaryColor);
        font-size: 16px;
        border-radius: 8px;
        text-transform: uppercase;
        color: #fff;
        padding: 10px 25px;
        font-family: 'Poppins', sans-serif;
        font-weight: 600;
        cursor: pointer;
        transition: all .3s ease-in-out;
        margin-top: 50px;
    }

    .btn-primary:hover {
        background: transparent;
        color: var(--primaryColor);
    }

    .section-title h2 {
        font-size: 25px;
        margin-bottom: 10px;
    }

    .section-title p {
        font-size: 15px;
        letter-spacing: .8px;
    }

    a {
        text-decoration: none;
    }

    li {
        list-style: none;
    }



    @media (max-width:900px) {
        .row .col-2 {
            flex-basis: 100%;
            margin-bottom: 40px;
        }

        .row .col-3 {
            flex-basis: 47%;
            margin-bottom: 40px;
        }
    }

    @media (max-width:600px) {
        .row .col-3 {
            flex-basis: 100%;
        }
    }


    .navbar {
        position: fixed;
        height: 80px;
        left: 0;
        top: 0;
        width: 100%;
        z-index: 2;
        transition: all .3s ease-in-out;
        background-color: transparent;
    }

    .navbar.active {
        background: #fff;
        box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.2);
    }

    .navbar .container {
        display: flex;
        align-items: center;
        justify-content: space-between;
        height: 100%;
        padding: 0 20px;
    }

    .navbar .container .logo img {
        width: 35px;
    }

    .navbar .container .links {
        display: flex;
        align-items: center;
    }

    .navbar .container .links li {
        list-style: none;
    }

    .navbar .container .links li a {
        font-size: 15px;
        font-weight: 600;
        text-transform: uppercase;
        color: #ffffff;
        padding: 0 20px;
        transition: color .2s ease-in-out;
    }

    .navbar .container .links li a:hover {
        color: rgb(47, 238, 29);
    }

    .navbar.active .container .links li a {
        color: #000;
    }

    .navbar .container .toggle-menu-btn {
        border: none;
        background: transparent;
        cursor: pointer;
        display: none;
    }

    .navbar .container .toggle-menu-btn i {
        font-size: 22px;
        color: #fff;
    }

    @media (max-width: 900px) {
        .navbar .container .links {
            position: absolute;
            left: 0;
            top: 80px;
            height: calc(100vh - 80px);
            width: 100%;
            background: rgba(0, 0, 0, 0.9);
            z-index: 3;
            flex-direction: column;
            gap: 30px;
            justify-content: center;
            transform: translateX(100%);
            transition: transform .3s ease-in-out;
        }

        .navbar.active .container .links {
            top: 80px;
        }

        .navbar .container .links.show {
            transform: translateX(0);
        }

        .navbar.active .container .links li a {
            color: #fff;
        }

        .navbar.active .container .links.show ~ .toggle-menu-btn i {
            color: #fff;
        }
        .navbar .container .toggle-menu-btn {
            display: block;
            z-index: 4;

        }
    }

    .hero::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: url('Images/image.jpg') no-repeat center;
        background-size: cover;
        filter: blur(8px);
        z-index: -1;
    }

    .hero .container {
        position: relative;
        z-index: 1;
        color: #fff;
    }


    .hero {
        background: linear-gradient(to right, rgba(0, 0, 0, 0.9), rgba(0, 0, 0, 0.2)), url('Images/image.jpg') no-repeat center;
        background-size: cover;
        height: 100vh;
        width: 100%;

    }

    .hero .hero-content {
        width: 50%;
    }

    .hero .hero-content h1 {
        font-size: 60px;
        color: #fff;
        line-height: 1.2;
    }

    .hero .hero-content p {
        font-size: 15px;
        font-weight: 400;
        margin: 20px 0;
        letter-spacing: .8px;
        color: rgba(255, 255, 255, 0.9);
        line-height: 1.5;
    }


    @media (max-width:900px) {
        .hero .hero-content {
            width: 100%;
        }

        .hero .hero-content h1 {
            font-size: 50px;
        }
    }

    @media (max-width:600px) {
        .hero .hero-content h1 {
            font-size: 30px;
        }
    }

    .services .section-title {
        width: 60%;
        margin: 0 auto;
    }

    .services .section-title h2,
    .services .section-title p {
        text-align: center;
    }

    .services .row {
        margin-top: 150px;
    }

    .services .row .col-3 {
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    .services {
        background-image: url('Images/service.gif');
        background-size: 80%;
        background-position: center;
        font-size: 1.5rem;
        font-weight: 500;
    }

    .services .row .col-3 .service-img {
        border: 2px solid #fff;
        border-radius: 50%;
        padding: 5px;
        display: flex;
        align-items: center;
        justify-content: center;
        cursor: pointer;
        transition: border .3s ease-in-out;
    }

    .services .row .col-3 .service-img:hover {
        border-color: var(--primaryColor);
    }

    .services .row .col-3 h4 {
        margin: 10px 0;
    }

    .services .row .col-3 p {
        font-size: 15px;
        text-align: center;
        letter-spacing: .8px;
    }


    @media (max-width:900px) {
        .services .section-title {
            width: 80%;
        }
    }

    @media (max-width:600px) {
        .services .section-title {
            width: 100%;
        }
    }



    .features .row {
        margin-top: 100px;
        align-items: start;
    }

    .features .row .feature-img {
        height: 350px;
    }

    .features .row .section-title p,
    .features .row .features-list {
        margin-bottom: 20px;
    }

    .features {
        background: linear-gradient(to bottom,
        rgba(49, 229, 6, 0.82),
        rgba(49, 229, 6, 0.6),
        rgba(49, 229, 6, 0.4),
        rgba(49, 229, 6, 0.6),
        rgba(49, 229, 6, 0.82)
        );        background-size: cover;
        background-position: center;
    }


    .row .features-list li {
        display: flex;
        gap: 8px;
    }

    @media (max-width:900px) {
        .features .row .feature-img {
            height: 400px;
            width: 100%;
        }
    }

    @media (max-width:600px) {
        .features .row .feature-img {
            height: 220px;
        }
    }


    .reviews .row {
        margin-top: 100px;
    }

    .reviews .row .review {
        display: flex;
        flex-direction: column;
        align-items: center;
        gap: 5px;
    }

    .reviews .row .review .review-img {
        margin-bottom: 20px;
    }

    .reviews {
        background-size: cover;
        background-position: center;
    }

    .reviews .row {
        display: flex;
        flex-wrap: wrap;
        justify-content: space-between;
    }

    .reviews .col-3 {
        flex: 0 0 15%;
        max-width: 15%;
        margin-bottom: 1rem;
    }

    .reviews .review-img img {
        width: 100%;
        height: auto;
        display: block;
        margin: 0 auto;
    }

    .reviews .review-img {
        padding: 0.5rem;
    }

    .review {
        margin-bottom: 15px;
    }

    .col-3 {
        padding-left: 5px;
        padding-right: 5px;
    }

    .reviews .row .review .review-img img {
        border-radius: 50%;
    }

    .reviews .row .review p {
        text-align: center;
    }

    .reviews .row .review .stars i {
        color: goldenrod;
    }




    .pricing .section-title {
        width: 60%;
        margin: 0 auto;
    }
    .logo {
        font-size: 2em;
        color: rgb(61, 221, 12);
        user-select: none;
        font-style: italic;
        text-shadow: 0 0 5px #228b02, 0 0 10px #228b02, 0 0 15px #228b02, 0 0 20px #228b02, 0 0 25px #228b02, 0 0 30px #228b02;
        cursor: pointer;
        animation: glow 1.5s infinite alternate;
    }

    .logo:hover {
        transform: scale(1.05);
    }

    .logo ion-icon {
        margin-bottom: -5px;
        transform: rotate(20deg);
        color: rgb(33, 143, 0);
        text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
    }

    .pricing .section-title h2,
    .pricing .section-title p {
        text-align: center;
    }

    .pricing .row {
        margin-top: 50px;
    }
    .price-img {
        background-size: contain;
        background-position: center;
        background-repeat: no-repeat;
        max-width: 80%;
        height: auto;
        margin: 0 auto;
    }
    .price-img img {
        max-width: 80%;
        height: auto;
        display: block;
        margin: 0 auto;
    }

    .pricing .row .price {
        background-color: rgba(255, 255, 255, 0.15);
        border-radius: 12px;
        display: flex;
        align-items: center;
        justify-content: center;
        flex-direction: column;
        gap: 10px;
        box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.1);
        padding: 20px;
        transition: transform 0.2s ease-in-out;
    }
    .pricing {
        background-size: cover;
        background-position: center;
        padding: 50px 0;
        background: linear-gradient(to bottom,
        rgba(49, 229, 6, 0.82),
        rgba(49, 229, 6, 0.6),
        rgba(49, 229, 6, 0.4),
        rgba(49, 229, 6, 0.6),
        rgba(49, 229, 6, 0.82)
        );    }

    .pricing .row .price:hover {
        transform: translateY(-5px);
    }

    .pricing .row .price .price-img {
        margin-bottom: 30px;
    }

    .pricing .row .price .price-img img {
        width: 50px;
    }

    .pricing .row .price h4 {
        color: #4d4b4b;
    }

    .pricing .row .price h1 {
        font-size: 40px;
        color: #817f7f;
    }

    .pricing .row .price h6 {
        font-size: 18px;
        letter-spacing: .8px;
        font-weight: 400;
        margin: 10px 0;
        color: #817f7f;
    }

    .pricing .row .price p {
        text-align: center;
        margin-bottom: 30px;
        color: #817f7f;
    }

    .pricing .subscribe {
        margin-top: 50px;
    }

    .pricing .subscribe .join-team {
        margin-top: 30px;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .pricing .subscribe .join-team input {
        margin-top: 50px;
        border: 1px solid rgba(0, 0, 0, 0.1);
        outline: none;
        padding: 13.7px;
        border-radius: 8px;
    }





    @media (max-width:900px) {
        .pricing .section-title {
            width: 80%;
        }
    }

    @media (max-width:600px) {
        .pricing .section-title {
            width: 100%;
        }
    }

    ::-webkit-scrollbar {
        width: 15px;
    }
    ::-webkit-scrollbar-track {
        background: linear-gradient(rgba(0, 128, 0, 0.46), rgba(0, 255, 0, 0.61));
    }

    ::-webkit-scrollbar-thumb {
        background: linear-gradient(#008000, #00ff00);
        border-radius: 10px;
    }




    .footer {
        padding: 60px 0;
        background-color: #02be1e;
    }

    .footer .footer-content {
        display: flex;
        align-items: center;
        flex-direction: column;
        gap: 20px;
    }

    .footer .footer-content .logo img {
        width: 40px;
        border-radius: 50%;
    }

    .footer .footer-content ul {
        display: flex;
        align-items: center;
    }

    .footer .footer-content ul li a {
        font-size: 15px;
        font-weight: 500;
        color: #817f7f;
        padding: 0 10px;
        text-transform: uppercase;
        transition: color .3s ease-in-out;
    }

    .footer .footer-content ul li a:hover {
        color: var(--primaryColor);
    }


    @media (max-width:900px) {
        .footer .footer-content p {
            text-align: center;
        }
    }
    .navbar .links {
        list-style: none;
        padding: 0;
        margin: 0;
        display: flex;
        align-items: center;
    }


    .navbar .links li {
        margin-right: 5px;
    }

    .navbar .links li a[href="#login"] {
        display: inline-block;
        padding: 10px 10px;
        color: #000000;
        font-weight: 500;
        text-decoration: none;
        border: 3px solid #171515;
        border-radius: 6px;
        transition: background-color 0.3s, color 0.3s;
    }
    #login {
        border: 3px solid #333;
        padding: 10px 10px;
        border-radius: 5px;
        color: #1c1616;
        transition: background-color 0.3s ease, color 0.3s ease;
    }
    #login:hover {
        background-color: #40ff00;
        color: #000000;
    }


    .navbar .links li a[href="#login"]:hover {
        background-color: #228b02;
        color: #000000;
    }
    @keyframes glow {
        0% {
            text-shadow: 0 0 5px #228b02, 0 0 10px #228b02, 0 0 15px #228b02, 0 0 20px #228b02, 0 0 25px #228b02, 0 0 30px #228b02;
        }
        100% {
            text-shadow: 0 0 10px #228b02, 0 0 10px #228b02, 0 0 20px #228b02, 0 0 25px #228b02, 0 0 30px #228b02, 0 0 35px #228b02;
        }
    }
</style>
</li>
<div class="navbar">
    <div class="container">
        <h2 class="logo">
            <ion-icon name="leaf"></ion-icon>
            Inaam Health Care
        </h2>
        <ul class="links">
            <li>
                <a href="#">home</a>
            </li>
            <li>
                <a href="#services">services</a>
            </li>
            <li>
                <a href="#features">features</a>
            </li>
            <li>
                <a href="#reviews">partners</a>
            </li>
            <li>
                <a href="#pricing">pricing</a>
            <li>
            <li><a id ="login" href = "http://localhost:8096/jsp/form.jsp">Register Now</a></li>
            </li>
        </ul>
        <button class="toggle-menu-btn">
            <i class="fa-solid fa-bars"></i>
        </button>
    </div>
</div>
<section class="hero">
    <div class="container">
        <div class="hero-content">
            <h1 data-aos="fade-right">
                Empowering <span style="color: #18c200;">Healthier</span> Lives Together.
            </h1>
            <p data-aos="fade-right">
                Experience personalized healthcare tailored to your needs at <span style="color: #2df618;">Inaam Healthcare</span>. Our dedicated team combines advanced technology with compassionate care to ensure you receive the best possible treatment.
                Discover a new standard in healthcare, where your well-being is our priority.
            </p>
            <button class="appointment-button" onclick="window.location.href='jsp/form.jsp';">Request an Appointment</button>
        </div>
    </div>
</section>
<section class="services" id="services">
    <div class="container">
        <div class="section-title">
            <h2 data-aos="fade-up">
                Empowering Healthcare Solutions
            </h2>
            <p data-aos="fade-up">
                We empower you with intelligent healthcare
                solutions, blending human expertise with cutting-edge technology.
            </p>
        </div>
        <div class="row">
            <div class="col-3" data-aos="fade-up">
                <div class="service-img">
                    <img src="Images/s-1.png" alt="" />
                </div>
                <h4>Highly Responsive Care</h4>
                <p>
                    Benefit from our highly responsive services.
                    We prioritize timely and efficient responses to ensure your healthcare
                    needs are met promptly and effectively.
                </p>
            </div>
            <div class="col-3" data-aos="fade-up">
                <div class="service-img">
                    <img src="Images/s-2.png" alt="" />
                </div>
                <h4>Built-in Security</h4>
                <p>
                    Rest assured with our built-in security features.
                    We implement robust security measures to safeguard your personal
                    information and ensure a safe experience.
                </p>
            </div>
            <div class="col-3" data-aos="fade-up">
                <div class="service-img">
                    <img src="Images/s-3.png" alt="" />
                </div>
                <h4>Safety Ensured</h4>
                <p>
                    Your safety is our priority. With safety locked
                    features, we provide additional layers of protection and peace of mind
                    throughout your healthcare journey.
                </p>
            </div>
        </div>
    </div>
</section>
<section class="features" id="features">
    <div class="container">
        <div class="row">
            <div class="col-2">
                <img
                        src="Images/f-1.gif"
                        data-aos="fade-right"
                        alt=""
                        class="feature-img"
                />
            </div>
            <div class="col-2">
                <div class="section-title">
                    <h2 data-aos="fade-up">Streamlining Healthcare with Simplified Solutions</h2>
                    <p data-aos="fade-up">
                        Inaam Health Care website is designed to simplify your healthcare experience.
                        Our website makes it easier than ever to access comprehensive medical
                        services, connect with healthcare professionals, and manage your health
                        information securely. Experience seamless navigation, intuitive interfaces,
                        and robust functionalities that empower you to take charge of your health
                        effortlessly.
                    </p>
                </div>
                <ul class="features-list" data-aos="fade-right">
                    <li>
                        <span><i class="fa-solid fa-check"></i></span>
                        <span>🡪 Intuitive design for easy navigation.</span>
                    </li>
                    <li>
                        <span><i class="fa-solid fa-check"></i></span>
                        <span>🡪 Safely store and manage medical records.</span>
                    </li>
                    <li>
                        <span><i class="fa-solid fa-check"></i></span>
                        <span>🡪 Easily book and manage appointments.</span>
                    </li>
                </ul>

            </div>
        </div>
    </div>
</section>

<section class="reviews" id="reviews">
    <div class="container">
        <div class="row">
            <div class="col-3">
                <div class="review" data-aos="fade-up">
                    <div class="review-img">
                        <a href="jsp/drInaam.jsp" onclick="window.location.href='jsp/drInaam.jsp';">
                            <img src="Images/" alt="" />
                        </a>
                    </div>
                    <p>
                        Directs overall strategy and operations.
                    </p>

                    <h4>(CEO)</h4>
                    <div class="stars">
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star-half-stroke"></i>
                    </div>
                </div>
            </div>
            <div class="col-3">
                <div class="review" data-aos="fade-up">
                    <div class="review-img">
                        <a href="jsp/drRafay.jsp" onclick="window.location.href='jsp/drRafay.jsp';">
                            <img src="Images/WhatsApp%20Image%202024-06-15%20at%2016.jpeg" alt="" />
                        </a>
                    </div>
                    <p>
                        Leads nursing staff and patient services.
                    </p>
                    <h4>- Abdul Rafay</h4>
                    <h4>(CNO)</h4>
                    <div class="stars">
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star-half-stroke"></i>
                    </div>
                </div>
            </div>
            <div class="col-3">
                <div class="review" data-aos="fade-up">
                    <div class="review-img">
                        <a href="jsp/drBilalQadir.jsp" onclick="window.location.href='jsp/drBilalQadir.jsp';">
                            <img src="Images/photo.png" alt="" />
                        </a>
                    </div>
                    <p>
                        Guides medical staff and patient care.
                    </p>
                    <h4>- Bilal Qadir</h4>
                    <h4>(CMO)</h4>
                    <div class="stars">
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star-half-stroke"></i>
                    </div>
                </div>
            </div>
            <div class="col-3">
                <div class="review" data-aos="fade-up">
                    <div class="review-img">
                        <a href="jsp/drBilalKhan.jsp" onclick="window.location.href='jsp/drBilalKhan.jsp';">
                            <img src="Images/WhatsApp%20Image%202024-06-23%20at%2000.09.jpeg" alt="" />
                        </a>
                    </div>
                    <p>
                        Manages financial operations and planning.
                    </p>
                    <h4>- Bilal Khan</h4>
                    <h4>(CFO)</h4>
                    <div class="stars">
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star-half-stroke"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>

</section>
<section class="pricing" id="pricing">
    <div class="container">
        <div class="section-title">
            <h2 data-aos="fade-up">Pickup the right pricing plan.</h2>
            <p data-aos="fade-up">
                Our healthcare plans are meticulously crafted to cater to the
                needs of both newcomers and veterans alike. Discover the perfect plan
                that aligns seamlessly with your health goals and lifestyle.
            </p>
        </div>
        <div class="row">
            <div class="col-2">
                <div class="price" data-aos="fade-up">
                    <div class="price-img">
                        <img src="Images/p-1.png" alt="">
                    </div>
                    <h4>Beginner Plan</h4>
                    <h1>$5.99</h1>
                    <h6>Affordable health care, unlimited possibilities.</h6>
                    <p>
                        Designed to provide essential healthcare services with
                        affordability and simplicity in mind.
                    </p>
                    <button class="btn-primary" onclick="alert('You are not eligible for this offer');">get plan</button>
                </div>
            </div>
            <div class="col-2">
                <div class="price" data-aos="fade-up">
                    <div class="price-img">
                        <img src="Images/p-2.png" alt="" />
                    </div>
                    <h4>Premium Plan</h4>
                    <h1>$19.99</h1>
                    <h6>Exclusive health care with enduring benefits.</h6>
                    <p>
                        Offers comprehensive healthcare solutions with enhanced benefits
                        and personalized care for maximum peace of mind and well-being.
                    </p>
                    <button class="btn-primary" onclick="alert('You are not eligible for this offer');">buy now</button>
                </div>
            </div>
        </div>
        <div class="subscribe" data-aos="fade-up">
            <div class="section-title">
                <h2>Still confused ? Try a 7-day free trial now</h2>
                <p>
                    Don't worry, we won't need your credit card details. Just enter
                    your email address and we'll take care of the rest.
                </p>
            </div>
            <div class="join-team">
                <input type="text" placeholder="Join wait list" />
                <button class="btn-primary" onclick="alert('You are not eligible for this offer');">
                    Subscribe
                </button>
            </div>
        </div>
    </div>
</section>
<footer class="footer">
    <div class="container">
        <div class="footer-content" data-aos="fade-up">
            <div class="logo">
                <a href="#">
                    <img src="Images/logo.png" alt="" />
                </a>
            </div>
            <ul>
                <li>
                    <a href="#">home</a>
                </li>
                <li>
                    <a href="#">about</a>
                </li>
                <li>
                    <a href="#">terms</a>
                </li>
                <li>
                    <a href="#">privacy</a>
                </li>
            </ul>
            <p>copyright © 2024 Inaam HealthCare Inc. All Rights Reserved.</p>
        </div>
    </div>
</footer>
<script src="script.js"></script>
<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</script>
<script
        src="https://www.chatbase.co/embed.min.js"
        chatbotId="1EVAyZhlbBiCsjut_jHeE"
        domain="www.chatbase.co"
        defer>

</script>
</body>
</html>