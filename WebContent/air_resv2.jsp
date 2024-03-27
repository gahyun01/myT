<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <title>í­ê³µê¶ìë§¤2</title>
  <style>
    .bg1 {
      width: 1300px;
      margin: 0 auto;
    }

    #sched {
      height: 30px;
      margin-top: 30px;
      color: white;
      font-weight: bold;
      background-color: #263e50;
      padding-left: 15px;
      padding-top: 11px;
      border-top-left-radius: 10px;
      border-top-right-radius: 10px;
    }

    #sched1 {
      height: 30px;
      background-color: #e7f4ff;
      padding-left: 15px;
      padding-top: 11px;
    }

    #guest {
      width: 990px;
      margin-top: 20px;
    }

    #guest_info {
      width: 990px;
      height: 200px;
      border: solid 1px lightgrey;
    }

    #fixed_pay {
      position: fixed;
      width: 300px;
      height: 410px;
      top: 335px;
      left: 1300px;
      border: solid 1px lightgrey;
    }
  </style>

</head>

<!-- êµ¬sê¸í°í¸ ë¤ì´ ë°ìì ì ì©í¨ 
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Nanum+Gothic&display=swap" rel="stylesheet">
-->
<link href="css/default.css" rel="stylesheet" type="text/css">

<body>
<form>  
  <header> 
    <div id="logo">
          <a href="index.html"><img src="img/myT2.jpg" height="50px"></a>
    </div>
    <div id="topmenu">
        <ul><a href="login.html">
          <li>ë¡ê·¸ì¸</li></a>
            <a href="sign_up2.html"><li>íìê°ì</li></a>
        </ul>
    </div>
  </header>

  <nav> 
    <div id="menu">
        <ul>
            <li><a href="t_planner.html">Tíëë</a></li>
            <li  class="top"><a href="t_diary.html">Të¤ì´ì´ë¦¬</a>
              <ul class="sub">
                  <li><a href="t_diary.html">myTë¤ì´ì´ë¦¬</a></li>
                  <li><a href="t_d_home.html">Të¤ì´ì´ë¦¬í</a></li>
              </ul>
            </li>
            <li class="top"><a href="t_info.html">ì¬íì ë³´</a>
              <ul class="sub">
                <li><a href="t_spot.html">ê´ê´ì§</a></li>
                <li><a href="festv.html">ì¶ì </a></li>
                <li><a href="rest.html">ë ì¤í ë</a></li>
                <li><a href="hotel.html">í¸í</a></li>
              </ul>
            </li>
            <li class="top"><a href="t_info.html">ìì½</a>
              <ul class="sub">
                <li><a href="hotel_resv.html">í¸í</a></li>
                <li><a href="air_resv.html">í­ê³µê¶</a></li>
                <li><a href="car_resv.html">ì°¨ë</a></li>
              </ul>
            </li>
        </ul>
 
       <!-- ê²ìì°½ -->
    <div class="search-container">
        <input type="text" class="search-box">
        <button class="search-button"><svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
          viewBox="0 0 1664 1664">
            <path fill="#263e50"
            d="M1152 704q0-185-131.5-316.5T704 256T387.5 387.5T256 704t131.5 316.5T704 1152t316.5-131.5T1152 704m512 832q0 52-38 90t-90 38q-54 0-90-38l-343-342q-179 124-399 124q-143 0-273.5-55.5t-225-150t-150-225T0 704t55.5-273.5t150-225t225-150T704 0t273.5 55.5t225 150t150 225T1408 704q0 220-124 399l343 343q37 37 37 90">
            </path>
        </svg></button>
    </div>
    </div>
    </nav>

    <div class="line"></div>

    <div id="bg">
      <div id="sched">ICN ìì¸/ì¸ì² >>>>>>>> KIX ì¤ì¬ì¹´/ê°ì¬ì´</div>
      <div id="sched1">ê°ë í¸ ì¶ë°ì§ ICN ìì¸/ê¹í¬ ëì°©ì§ KIX ì¤ì¬ì¹´/ê°ì¬ì´</div>
      <div id="sched1">2024ë 02ì 13ì¼ (í) ì¶ë°ìê° 08:55 -ëì°©ìê° 10:45KE2117 ì¼ë°ì(M)</div>
      <div id="sched1">ì¤ë í¸ ì¶ë°ì§ ICN ìì¸/ê¹í¬ ëì°©ì§ KIX ì¤ì¬ì¹´/ê°ì¬ì´</div>
      <div id="sched1">2024ë 02ì 13ì¼ (í) ì¶ë°ìê° 08:55 -ëì°©ìê° 10:45KE2117 ì¼ë°ì(M)</div>

      <div class="bg1">
        <div id="guest">
          <div id="guest_info">ì¹ê° ì ë³´ìë ¥
          </div>

          <div id="guest_info" style="margin-top: 10px">ì¹ê° ê¸°íì ë³´ìë ¥(ì°ë½ì²..)
          </div>
        </div>
      </div>

      <div id="fixed_pay">ê²°ì ì ë³´</div>

      <div class="caution1">
        ììëì¸ì!
      </div>
      <div class="caution2">
        <ul>
          <li>ê° ì´ìì ë°ë¼ ê¸°ë³¸ ìí ìíë¬¼ íì©ëì´ ì ê³µëë©°, ìíë¬¼ ì¶ê° êµ¬ë§¤ ììë ë³ë ìê¸ì´ ë¶ê³¼ë©ëë¤.</li>
          <li>"í­ê³µì´ì ë± ì´ì¡"ì ì ë¥í ì¦ë£ì ì¸ê¸ì í¬í¨í ì´ ì´ìì¼ë¡ êµ¬ë§¤ ìì ê³¼ íì¨ì ë°ë¼ ë³ëë  ì ììµëë¤.</li>
          <li>ì¶ë°/ëì°© ìê°ì íì§ ìê° ê¸°ì¤ì´ë©°, í­ê³µê¸° ì¤ì¼ì¤ì ì ë¶ì¸ê° ì¡°ê±´ì¼ë¡ ìê³  ìì´ ë³ê²½ë  ì ììµëë¤.</li>
          <li>ê³µëì´í­í¸ì íì¹ ë° ê¸°ë´ìë¹ì¤ë ì´í­ì¬ì ê·ì ì ë°ë¦ëë¤.</li>
          <li>í ì¸ ì´ìì êµ¬ë§¤íê³  ì¶ì¼ì  ê²½ì° ìì½ ì·¨ì í ì¬êµ¬ë§¤íì¬ ì£¼ìê¸° ë°ëëë¤.</li>
        </ul>
      </div>
    </div>
  </form>
</body>

</html>