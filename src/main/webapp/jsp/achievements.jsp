



<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Clickable Circular Images</title>
  <style>
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      margin: 0;
      background-image: url('Images/Progress.gif');

      background-size: cover;
      background-position: center -100px;
      background-repeat: no-repeat;
      transition: background-image 0.3s ease-in-out;
    }
    body::before {
      content: "";
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background-image: url('Images/Progress.gif');
      background-size: 117%;
      background-position: center -100px;
      background-repeat: no-repeat;
      filter: blur(7px);
      z-index: -1;
    }
    .header {
      text-align: center;
      font-size: 28px;
      font-weight: bold;
      color: #09ff00;
      text-transform: uppercase;
      position: absolute;
      top: 40px;
      left: 0;
      right: 0;
      z-index: 10;


      text-shadow: 0 0 10px rgba(17, 150, 0, 0.932), 0 0 20px rgba(54, 231, 0, 0.1), 0 0 30px rgba(255, 255, 255, 0.1), 0 0 40px rgba(255, 255, 255, 0.2), 0 0 50px rgba(255, 255, 255, 0.1);
    }
    .header:before,
    .header:after {
      content: "";
      display: inline-block;
      width: 20%;
      vertical-align: middle;
      border-top: 3px solid #059e00;
    }
    .header:before {
      margin-right: 20px;
      margin-top: -9px;
    }
    .header:after {
      margin-left: 20px;
      margin-top: -9px;
    }

    .image-container {
      display: flex;
      justify-content: center;
      gap: 80px;
      margin-top: 100px;
    }
    .image-container div {
      text-align: center;
    }
    .image-container img {
      width: 200px;
      height: 200px;
      border-radius: 50%;
      object-fit: cover;
      border: 4px solid transparent;
      transition: transform 0.3s ease-in-out, border-color 0.3s ease-in-out;
      cursor: pointer;
      margin-bottom: 100px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);


      transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
    }

    .image-container img:hover {
      transform: scale(1.1);
    }
    .image-caption {
      display: none;
      position: fixed;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
      background-color: rgba(255, 255, 255, 0.9);
      padding: 20px;
      border-radius: 10px;
      box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
      z-index: 1000;
      text-align: center;
      max-width: 80%;
    }
    .overlay {
      display: none;
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background-color: rgba(0, 0, 0, 0.5);
      backdrop-filter: blur(10px);
      z-index: 999;
    }
  </style>
</head>
<body>
<div class="header">
  <span>Top Three Achievements</span>
</div>

<div class="image-container">
  <div>
    <img src="Images/AI.jpg" alt="AI Icon" onclick="expandImage('AI')">
  </div>
  <div>
    <img src="Images/EHR.jpg" alt="EHR Icon" onclick="expandImage('EHR')">
  </div>
  <div>
    <img src="Images/Telemedicine.jpg" alt="Telemedicine Icon" onclick="expandImage('Telemedicine')">
  </div>
</div>

<div class="overlay" onclick="closeExpandedImage()"></div>

<div class="image-caption" id="expanded-caption"></div>

<script>
  function expandImage(imageType) {
    var caption = '';

    if (imageType === 'AI') {
      caption = "<strong>AI Chatbot</strong>: AI chatbot is an amazing tool in patient interaction, Inaam HealthCare provides intuitive guidance through inquiries and FAQs. It is Designed for ease of use, enhances user engagement  and streamlines customer support. You can always find the chat bot on the <strong>home</strong> page.";
    } else if (imageType === 'EHR') {
      caption = "<strong>EHR</strong>: Inaam Healthcare successfully digitized healthcare records, streamlining data management and ensuring secure access across our network. Our electronic health records system supports efficient care coordination and enhances patient outcomes.";
    } else if (imageType === 'Telemedicine') {
      caption = "<strong>Telemedicine</strong>: A monumental achievement at Inaam Healthcare, offering patients reliable and accessible medical consultations remotely. Our telemedicine services prioritize convenience and timely healthcare delivery from anywhere.";
    }

    document.getElementById("expanded-caption").innerHTML = caption;

    document.querySelector(".overlay").style.display = "block";
    document.querySelector(".image-caption").style.display = "block";

    document.querySelector(".image-caption").style.top = "50%";
    document.querySelector(".image-caption").style.left = "50%";
    document.querySelector(".image-caption").style.transform = "translate(-50%, -50%)";
  }

  function closeExpandedImage() {
    document.querySelector(".overlay").style.display = "none";
    document.querySelector(".image-caption").style.display = "none";
  }
</script>
</body>
</html>
