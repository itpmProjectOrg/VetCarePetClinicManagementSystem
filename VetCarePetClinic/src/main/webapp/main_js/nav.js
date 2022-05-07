const createNav = () => {
  let nav = document.querySelector("#header");

  nav.innerHTML = `
      
      <h1 class="logo">Vet<span class="else">Care</span> </h1>
  
        <div>
          <ul id="navbar">
            <li><a href="main_homepage.jsp#hero">Home</a></li>
            <li><a href="appointmentPortal.jsp">Appoinment</a></li>
            <li><a href="petprofile_mainpage.jsp">Pet Profile</a></li>
            <li><a href="">Vet's Portal</a></li>
            <li><a href="">Medical Records</a></li>
            <li><a href="main_homepage.jsp#sermain">Services</a></li>
            <li><a href="main_homepage.jsp#whyusmain">About</a></li>
            <li><a href="main_homepage.jsp#form">Contact</a></li>
            <a id="close"><i class="fa-solid fa-xmark"></i></a>
          </ul>
        </div>
        <div id="mobilenav">
          <i id="bar"
            ><svg
              width="36"
              height="36"
              viewBox="0 0 36 36"
              fill="none"
              xmlns="http://www.w3.org/2000/svg"
            >
              <path
                d="M14.3438 15.5391H31.2188C31.3734 15.5391 31.5 15.4125 31.5 15.2578V13.2891C31.5 13.1344 31.3734 13.0078 31.2188 13.0078H14.3438C14.1891 13.0078 14.0625 13.1344 14.0625 13.2891V15.2578C14.0625 15.4125 14.1891 15.5391 14.3438 15.5391ZM14.0625 22.7109C14.0625 22.8656 14.1891 22.9922 14.3438 22.9922H31.2188C31.3734 22.9922 31.5 22.8656 31.5 22.7109V20.7422C31.5 20.5875 31.3734 20.4609 31.2188 20.4609H14.3438C14.1891 20.4609 14.0625 20.5875 14.0625 20.7422V22.7109ZM31.7812 5.625H4.21875C4.06406 5.625 3.9375 5.75156 3.9375 5.90625V7.875C3.9375 8.02969 4.06406 8.15625 4.21875 8.15625H31.7812C31.9359 8.15625 32.0625 8.02969 32.0625 7.875V5.90625C32.0625 5.75156 31.9359 5.625 31.7812 5.625ZM31.7812 27.8438H4.21875C4.06406 27.8438 3.9375 27.9703 3.9375 28.125V30.0938C3.9375 30.2484 4.06406 30.375 4.21875 30.375H31.7812C31.9359 30.375 32.0625 30.2484 32.0625 30.0938V28.125C32.0625 27.9703 31.9359 27.8438 31.7812 27.8438ZM4.05703 18.2426L9.55195 22.5703C9.75586 22.732 10.0582 22.5879 10.0582 22.3277V13.6723C10.0582 13.4121 9.75938 13.268 9.55195 13.4297L4.05703 17.7574C4.02008 17.7861 3.99018 17.8229 3.96962 17.865C3.94905 17.907 3.93836 17.9532 3.93836 18C3.93836 18.0468 3.94905 18.093 3.96962 18.135C3.99018 18.1771 4.02008 18.2139 4.05703 18.2426V18.2426Z"
                fill="#465B52"
              />
            </svg>
          </i>
        </div>
        <div class='login-logout-popup hide'>
        <p class='account-info'>log in as, name</p>
        <button class='btn' id='user-btn'>Log out</button>
        </div>
      `;
};

createNav();

let prevScrollpos = window.pageYOffset;
window.onscroll = function () {
  let currentScrollPos = window.pageYOffset;
  if (prevScrollpos > currentScrollPos) {
    document.getElementById("header").style.top = "0";
  } else {
    document.getElementById("header").style.top = "-50px";
  }
  prevScrollpos = currentScrollPos;
};
