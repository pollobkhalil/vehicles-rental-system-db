#  Vehicle Rental System - Database Project

##  Overview
Welcome to my Vehicle Rental System database project! This project was designed to solve a real-world problem: managing a fleet of vehicles, handling customer bookings, and maintaining user records efficiently. 

I’ve built this using **PostgreSQL**, focusing on creating a clean structure (Schema) and writing optimized queries to get meaningful data, like identifying popular vehicles or tracking rental statuses.

---

## Database Architecture (ERD)
The system is built on three main pillars:
1.  **Users:** Stores everyone from regular customers to system admins. (Includes secure fields like passwords and unique emails).
2.  **Vehicles:** Keeps track of our fleet—whether it's a car, bike, or truck—and its current status (Available/Rented/Maintenance).
3.  **Bookings:** The heart of the system that connects users with their desired vehicles, tracking dates and total costs.

> **🔗 Click here to view my ERD on Lucidchart: https://lucid.app/lucidchart/8bc77ccf-bb32-4285-a9a9-7b05700b9af2/edit?invitationId=inv_8e288459-5ee3-44e1-a32e-60ab3fb26e57**

---

##  How the Queries Work (Explanation)
I have included four specific queries in this project to handle common business needs:

* **Customer Booking Summary:** Uses an `INNER JOIN` to pull data from three different tables. Instead of just seeing IDs, this shows the actual names of the customer and the vehicle they rented.

* **Idle Inventory Check:** Uses the `NOT EXISTS` command to find vehicles that have never been booked. This is great for business analysis to see which assets aren't making money.

* **Quick Filter:** A simple `WHERE` query to instantly find all 'Cars' that are currently 'Available' for rent.

* **Popularity Report:** Uses `GROUP BY` and `HAVING` to list vehicles that have been booked more than twice. This helps identify the most in-demand rides in our fleet.

---

##  How to Use This Project
1.  Open the `queries.sql` file.
2.  Copy the code into your PostgreSQL editor (like pgAdmin or an online SQL runner).
3.  Run the **Schema** section first, then the **Insert** section, and finally the **Queries** to see the magic!


---
**Developed with ❤️ by Khalilur Rahman**