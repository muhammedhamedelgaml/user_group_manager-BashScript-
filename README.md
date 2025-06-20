#  Linux User & Group Management Script (with Whiptail)

This Bash script provides an interactive terminal-based GUI for managing users and groups on a Linux system using `whiptail`.

> ⚠️ **Note:** Must be run as `root` or with `sudo`.

---

## 📌 Features

- ✅ Add / Modify / Delete users
- ✅ Add / Rename / Delete groups
- ✅ Add users to groups
- ✅ List system users
- ✅ Enable / Disable user accounts
- ✅ Change user passwords
- ✅ Delete users with or without home directories

---

## 🖥️ Requirements

- **Linux OS**
- `bash` shell
- `whiptail` installed  
  (Install with: `sudo apt install whiptail` or `sudo yum install newt`)

---

## 🚀 Usage

1. Clone this repo:
    ```bash
    git clone https://github.com/yourusername/user-group-manager.git
    cd user-group-manager
    ```

2. Make the script executable:
    ```bash
    chmod +x user_group_manager.sh
    ```

3. Run the script **as root**:
    ```bash
    sudo ./user_group_manager.sh
    ```

---

## 📸 Screenshots
Here's how the menu looks:

![User Group Management Menu](images/menu1.png)

---

## 🧾 Menu Options

| Option | Description                             |
|--------|-----------------------------------------|
| 1      | Add User                                |
| 2      | Modify (Rename) User                    |
| 3      | List Users                              |
| 4      | Add Group                               |
| 5      | Rename Group                            |
| 6      | Add User to Group                       |
| 7      | Delete Group                            |
| 8      | Change User Password                    |
| 9      | Enable User Account                     |
| 10     | Disable User Account                    |
| 11     | Delete User Account (with files)        |
| 12     | Delete User Account (keep files)        |


