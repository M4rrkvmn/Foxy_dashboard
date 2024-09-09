document.addEventListener("DOMContentLoaded", function () {
  const overlay = document.querySelector(".overlay");

  window.addEventListener("message", function (event) {
      const item = event.data;

      if (item.action === "open") {
          overlay.style.opacity = "1";
          overlay.setAttribute("aria-hidden", "false");
          getPlayerData(); 
      } else if (item.action === "close") {
          overlay.style.opacity = "0";
          overlay.setAttribute("aria-hidden", "true");
      }
  });

  document.addEventListener("keyup", function (event) {
      if (event.key === "Escape") {
          fetch("https://Foxy_dashboard/close", {
              method: "POST",
              body: JSON.stringify({}),
          }).catch((error) => console.error("Fetch error:", error));
      }
  });

  function getPlayerData() {
      fetch("https://Foxy_dashboard/getPlayerData", {
          method: "POST",
          body: JSON.stringify({}),
      })
      .then(response => response.json())
      .then(data => {
          document.getElementById("playername").textContent = data.name;
          document.getElementById("job").textContent = data.job;
          document.getElementById("jobgrade").textContent = data.jobgrade;
          document.getElementById("money").textContent = data.money;
          document.getElementById("bank").textContent = data.bank;
          document.getElementById("group").textContent = data.group;
          document.getElementById("id").textContent = data.id;
          document.getElementById("date").textContent = data.date;
          document.getElementById("Heal").textContent = data.Heal;
          document.getElementById("Armor").textContent = data.Armor;
          document.getElementById("Steam").textContent = data.steam;
          if (data.sex == "m") {
            document.getElementById("sex").innerHTML = data.Male;
          } else {
            document.getElementById("sex").innerHTML = data.Female;
          }
        document.getElementById("ServerName").textContent = data.ServerName;
      })
      .catch(error => console.error("Fetch error:", error));
  }
});
