#!/bin/bash

# Check if running as root
if [ "$UID" -ne 0 ]; then
    whiptail --title "Permission Denied" --msgbox "This script must be run as root!" 10 50
    exit 1
fi

while true; do
    CHOICE=$(whiptail --title "User & Group Management" --menu "Choose an option:" 20 60 12 \
        "0" "Exit" \
        "1" "Add User" \
        "2" "Modify User" \
        "3" "List Users" \
        "4" "Add Group" \
        "5" "Modify Group" \
        "6" "Add User to Group" \
        "7" "Delete Group" \
        "8" "Change User Password" \
        "9" "Enable User Account" \
        "10" "Disable User Account" \
        "11" "Delete User Account (with files)" \
        "12" "Delete User Account (keep files)"  3>&1 1>&2 2>&3)

    case $CHOICE in
         0)
            exit 0
	    ;;

	   
	 1)
            USERNAME=$(whiptail --inputbox "Enter new username:" 10 50 3>&1 1>&2 2>&3)
            useradd "$USERNAME" && whiptail --msgbox "User '$USERNAME' added." 10 50
            ;;
        2)
            USERNAME=$(whiptail --inputbox "Enter username to modify:" 10 50 3>&1 1>&2 2>&3)
            NEWNAME=$(whiptail --inputbox "Enter new username:" 10 50 3>&1 1>&2 2>&3)
            usermod -l "$NEWNAME" "$USERNAME" && whiptail --msgbox "User renamed to '$NEWNAME'." 10 50
            ;;
        3)
          cut -d: -f1 /etc/passwd  > /tmp/userlist.txt
          whiptail --scrolltext --title "List of Users" --textbox /tmp/userlist.txt 20 50
           rm -f /tmp/userlist.txt

	    ;;
        4)
            GROUPNAME=$(whiptail --inputbox "Enter new group name:" 10 50 3>&1 1>&2 2>&3)
            groupadd "$GROUPNAME" && whiptail --msgbox "Group '$GROUPNAME' added." 10 50
            ;;
        5)
            OLDGROUP=$(whiptail --inputbox "Enter group to modify:" 10 50 3>&1 1>&2 2>&3)
            NEWGROUP=$(whiptail --inputbox "Enter new group name:" 10 50 3>&1 1>&2 2>&3)
            groupmod -n "$NEWGROUP" "$OLDGROUP" && whiptail --msgbox "Group renamed to '$NEWGROUP'." 10 50
            ;;
        6)
            USER=$(whiptail --inputbox "Enter username:" 10 50 3>&1 1>&2 2>&3)
            GROUP=$(whiptail --inputbox "Enter group to add to:" 10 50 3>&1 1>&2 2>&3)
            usermod -aG "$GROUP" "$USER" && whiptail --msgbox "User '$USER' added to group '$GROUP'." 10 50
            ;;
        7)
            GROUP=$(whiptail --inputbox "Enter group to delete:" 10 50 3>&1 1>&2 2>&3)
            groupdel "$GROUP" && whiptail --msgbox "Group '$GROUP' deleted." 10 50
            ;;
        8)
            USER=$(whiptail --inputbox "Enter username to change password:" 10 50 3>&1 1>&2 2>&3)
            passwd "$USER"
            ;;
        9)
            USER=$(whiptail --inputbox "Enter username to enable:" 10 50 3>&1 1>&2 2>&3)
            usermod -U "$USER" && whiptail --msgbox "User '$USER' enabled." 10 50
            ;;
        10)
            USER=$(whiptail --inputbox "Enter username to disable:" 10 50 3>&1 1>&2 2>&3)
            usermod -L "$USER" && whiptail --msgbox "User '$USER' disabled." 10 50
            ;;
        11)
            USER=$(whiptail --inputbox "Enter username to delete (with files):" 10 50 3>&1 1>&2 2>&3)
            userdel -r "$USER" && whiptail --msgbox "User '$USER' and files deleted." 10 50
            ;;
        12)
            USER=$(whiptail --inputbox "Enter username to delete (keep files):" 10 50 3>&1 1>&2 2>&3)
            userdel "$USER" && whiptail --msgbox "User '$USER' deleted (files kept)." 10 50
            ;;
        *)
            whiptail --msgbox "Invalid option." 10 50
            ;;
    esac
done
        
