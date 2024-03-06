<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <link rel="stylesheet" type="text/css" href="/css/hrmdashboardstyle.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script>
        document.getElementById('edit-profile-btn').addEventListener('click', function() {
                alert('Edit profile functionality will be implemented here.');
            });

            document.getElementById('userWelcome').addEventListener('click', function() {
                document.getElementById('profileBox').classList.toggle('show');
            });

            // Close profile box when clicking anywhere on the screen
            document.addEventListener('click', function(event) {
                const profileBox = document.getElementById('profileBox');
                const userWelcome = document.getElementById('userWelcome');

                if (event.target !== profileBox && event.target !== userWelcome) {
                    profileBox.classList.remove('show');
                }
            });
        const addProjectBtn = document.querySelector('.add-project-btn');
        const newProjectForm = document.querySelector('.new-project-form');

        addProjectBtn.addEventListener('click', function() {
            newProjectForm.style.display = newProjectForm.style.display === 'none' ? 'block' : 'none';
        });
        const calendar = document.querySelector('.calendar');
        const monthPicker = document.querySelector('#month-picker');
        const yearPicker = document.querySelector('#year-picker');
        const preYear = document.querySelector('#pre-year');
        const nextYear = document.querySelector('#next-year');
        const yearValue = document.querySelector('#year');
        const calendarDays = document.querySelector('.calendar-days');

        const months = [
          'January',
          'February',
          'March',
          'April',
          'May',
          'June',
          'July',
          'August',
          'September',
          'October',
          'November',
          'December'
        ];

        const daysInMonth = [
          31,
          28,
          31,
          30,
          31,
          30,
          31,
          31,
          30,
          31,
          30,
          31
        ];

        const currentYear = new Date().getFullYear();
        yearValue.textContent = currentYear;

        let currentMonth = new Date().getMonth();
        monthPicker.textContent = months[currentMonth];

        const renderCalendar = () => {
          calendarDays.innerHTML = '';
          const days = daysInMonth[currentMonth];
          const firstDay = new Date(currentYear, currentMonth, 1).getDay();

          for (let i = 0; i < firstDay - 1; i++) {
            calendarDays.innerHTML += `<div></div>`;
          }

          for (let i = 1; i <= days; i++) {
            const isCurrentDate = new Date().getFullYear() === currentYear && new Date().getMonth() === currentMonth && new Date().getDate() === i;
            const isEventDay = checkEventDay(i);
            const eventClass = isEventDay ? 'event-marked' : '';
            calendarDays.innerHTML += `<div class="${isCurrentDate ? 'current-date' : ''} ${eventClass}" onclick="showEvent('${i}')">${i}</div>`;
          }
        };

        const checkEventDay = (day) => {
          // Implement your logic to check if there's an event on this day
          // For now, let's assume there's an event on the 5th of every month
          return day === 5;
        };

        const updateYearPicker = () => {
          yearValue.textContent = currentYear;
          if (currentMonth === 0 || currentMonth === 2 || currentMonth === 4 || currentMonth === 6 || currentMonth === 7 || currentMonth === 9 || currentMonth === 11) {
            preYear.disabled = currentYear === 1900;
            nextYear.disabled = false;
          } else if (currentMonth === 1) {
            if (isLeapYear(currentYear)) {
              preYear.disabled = currentYear === 1900;
              nextYear.disabled = false;
            } else {
              preYear.disabled = currentYear === 1900;
              nextYear.disabled = currentYear === 1900;
            }
          } else {
            preYear.disabled = false;
            nextYear.disabled = false;
          }
        };

        const isLeapYear = (year) => {
          return (year % 4 === 0 && year % 100 !== 0) || year % 400 === 0;
        };

        const changeMonth = (direction) => {
          if (direction === 'prev') {
            currentMonth--;
            if (currentMonth < 0) {
              currentMonth = 11;
              currentYear--;
            }
          } else {
            currentMonth++;
            if (currentMonth > 11) {
              currentMonth = 0;
              currentYear++;
            }
          }
          monthPicker.textContent = months[currentMonth];
          updateYearPicker();
          renderCalendar();
        };

        const changeYear = (direction) => {
          if (direction === 'prev') {
            currentYear--;
          } else {
            currentYear++;
          }
          yearValue.textContent = currentYear;
          updateYearPicker();
          renderCalendar();
        };

        preYear.addEventListener('click', () => changeYear('prev'));
        nextYear.addEventListener('click', () => changeYear('next'));
        monthPicker.addEventListener('click', () => changeMonth('prev'));
        yearPicker.addEventListener('click', (e) => {
          if (e.target.tagName === 'SPAN') {
            changeMonth('prev');
          }
        });

        renderCalendar();

        // FullCalendar Initialization
        $(document).ready(function() {
          $('.calendar').fullCalendar({
            // Your FullCalendar options go here
            // You can customize the appearance and behavior of the calendar
          });
        });

        // Function to show events for a specific day
        function showEvent(day) {
          alert(`Events for ${months[currentMonth]} ${day}, ${currentYear}`);
          // Implement your logic to show events for the selected day
        }

        // Function to add event
        function addEvent() {
          const eventTitle = document.getElementById('event-title').value;
          const eventDate = document.getElementById('event-date').value;

          if (eventTitle && eventDate) {
            alert(`Event added: ${eventTitle} on ${eventDate}`);
            // Implement your logic to add the event and update the calendar
            // For now, let's assume the event is added to the 5th of every month
            renderCalendar();
          } else {
            alert('Please enter event details.');
          }
        }
        function showNotification() {
            const notificationCenter = document.getElementById('notificationCenter');

            const notification = document.createElement('div');
            notification.className = 'notification';

            notification.innerHTML = `
                <span class="close-btn" onclick="closeNotification(this)">X</span>
                <p><strong>Notification:</strong> Your message or task here.</p>
            `;

            notificationCenter.appendChild(notification);

            setTimeout(() => {
                closeNotification(notification.firstElementChild);
            }, 3000);
        }

        function closeNotification(element) {
            const notification = element.parentElement;
            notification.style.animation = 'fadeOut 0.5s ease-in-out';

            setTimeout(() => {
                notification.parentElement.removeChild(notification);
            }, 500);
        }
    </script>
</head>
<body background="/images/bg.jpeg">
    <section class="sidebar">
        <div class="card1">
            <img src="/images/hrmlogo.png">
        </div>
        <div class="card2">
          <jsp:include page="/WEB-INF/views/sidebar.jsp" />
        </div>
    </section>
    <div class="headnbody">
        <header class="header">
            <div class="left">
                Welcome to HRMS
            </div>
            <div class="user-welcome" id="userWelcome">
                Mukesh Varma
            </div>
        </header>
        <main class="main">
            <div class="marquee-container">
                <div class="marquee-content">
                    <marquee>
                    <span>Company News: Exciting developments in the tech industry are reshaping the future.</span>
                    <span>HR Update: Enhancements in employee engagement strategies for a more productive workplace.</span>
                    <span>Another Update: Discover the latest trends in innovation and stay ahead in the competitive market.</span>
                    </marquee>
                </div>
            </div>
            <div class="boxes">
                <div class="statistics-box">
                    <div class="matter">
                        <h3>Employee Statistics</h3><br>
                        <p>Total number of employees: 500</p>
                        <p>Active employees: 450</p>
                        <p>On leave: 20</p>
                    </div>
                </div>
                <div class="spotlight-box">
                    <h3>Employee Spotlight</h3><br>
                    <p><strong>Name:</strong>Mukesh varma</p>
                    <p><strong>Experience:</strong> 2 years</p>
                    <button id="toggleSpotlightDetailsBtn">About</button>
                </div>
                <div class="notification">
                    <h3>Notification</h3><br>
                    <div class="notification-center" id="notificationCenter"></div>
                    <button onclick="showNotification()" value="Show Notification">Show Notification</button>
                </div>
            </div>
            <div class="project-box">
                <h2 >Projects</h2><br>
                <div class="project-stats">
                    <div class="stat">
                        <span class="label">HRM</span>
                        <span class="value">Assigned to: Mukesh</span>
                    </div>
                    <div class="stat">
                        <span class="label">Status:</span>
                        <span class="value">In Progress</span>
                    </div>
                    <div class="stat">
                        <span class="label">Due Date:</span>
                        <span class="value">01/05/2024</span>
                    </div>
                </div><br>
                <div class="project-stats">
                    <div class="stat">
                        <span class="label">HRM</span>
                        <span class="value">Assigned to: Nithin</span>
                    </div>
                    <div class="stat">
                        <span class="label">Status:</span>
                        <span class="value">In Progress</span>
                    </div>
                    <div class="stat">
                        <span class="label">Due Date:</span>
                        <span class="value">03/03/2024</span>
                    </div>
                </div><br>
                <div class="project-stats">
                    <div class="stat">
                        <span class="label">HRM</span>
                        <span class="value">Assigned to: Abhishek</span>
                    </div>
                    <div class="stat">
                        <span class="label">Status:</span>
                        <span class="value">In Progress</span>
                    </div>
                    <div class="stat">
                        <span class="label">Due Date:</span>
                        <span class="value">31/06/2024</span>
                    </div>
                </div>
            </div>
            <div class="cbox">
            <div class="calendar-container">
                <div class="calendar-box">
                    <div class="calendar-header">
                    <span class="month-picker" id="month-picker">May</span>
                    <div class="year-picker" id="year-picker">
                        <span class="year-change pre-year" id="pre-year">&lt;&lt;</span>
                        <span class="year-value" id="year">2023</span>
                        <span class="year-change next-year" id="next-year">&gt;&gt;</span>
                    </div>
                    </div>
                    <div class="calendar-body">
                    <div class="calendar-week-days">
                        <div>Sun</div>
                        <div>Mon</div>
                        <div>Tue</div>
                        <div>Wed</div>
                        <div>Thu</div>
                        <div>Fri</div>
                        <div>Sat</div>
                    </div>
                    <div class="calendar-days"></div>
                    </div>
                </div>
                </div>
                <div class="event-form">
                <input type="text" id="event-title" placeholder="Event Title">
                <button class="add-event-btn" onclick="addEvent()">Add Event</button>
                </div>
            </div>
        </main>
    </div>
</body>
</html>