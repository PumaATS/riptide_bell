# 🚨 PD Reception Bell Script for FiveM

This lightweight and easy-to-use script introduces a functional **reception bell system** to police departments (PD) within your FiveM server. It allows players to interact with a reception bell placed at PD front desks, sending an alert to notify on-duty officers or staff that someone is waiting.

---

## ✨ Features

- Immersive and practical front desk interaction for civilians  
- Sends a notification to online police officers or configured job roles
- Players are able to apply to departments in-city. Completed applications are automatically sent to Discord via webhooks
- Includes [ps-dispatch](https://github.com/Project-Sloth/ps-dispatch) integration  
- Easily configurable bell placement for one or multiple PD locations  
- Clean, optimized code with minimal performance impact

---

## 🛠️ Requirements

- [ox_lib](https://github.com/overextended/ox_lib)  
- [qb-core](https://github.com/qbcore-framework/qb-core)  
- [ps-dispatch](https://github.com/Project-Sloth/ps-dispatch)

---

## 📦 Installation

This is a **plug-and-play** script. To install:

1. **Download or clone the repository** into your server’s `resources` folder:

    ```bash
    https://github.com/PumaATS/riptide_reception.git
    ```

    Or download and extract the ZIP file manually.

2. **Ensure the script is started** in your `server.cfg` (after `ox_lib` and `qb-core`):

    ```cfg
    ensure ox_lib
    ensure qb-core
    ensure riptide_reception
    ```

3. ✅ You're done! Players can now ring the reception bell and notify on-duty officers.

---

## 🧩 Configuration

Bell locations and notification settings can be easily customized through the provided config file. You can define multiple bell locations for different stations with full control over coordinates and behavior.

---

## Credits
- [Jimathy666](https://github.com/jimathy) for the Version Check code
- BettsPlays
- CamMcH for helping out with the getCopCount() functions

---

Feel free to open issues or submit pull requests for improvements. Enjoy!
