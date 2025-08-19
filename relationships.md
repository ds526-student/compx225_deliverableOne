# Costume Hire Database Schema

## Entities

### Customers
- **customer_id** – INT, PRIMARY KEY  
- **fname** – VARCHAR(50)  
- **lname** – VARCHAR(50)  
- **email** – VARCHAR(100)  
- **phone** – VARCHAR(20)  

---

### Staff
- **staff_id** – INT, PRIMARY KEY  
- **fname** – VARCHAR(50)  
- **lname** – VARCHAR(50)  
- **email** - VARCHAR(100)
- **phone** - VARCHAR(20)
- **position** – VARCHAR(50)  
- **branch_id** – FOREIGN KEY → Branch  

---

### Costumes
- **costume_id** – INT, PRIMARY KEY  
- **costume_name** – VARCHAR(100)  
- **description** – VARCHAR(200)  
- **size** – VARCHAR(10)  
- **price** – DECIMAL(10, 2)  
- **category_id** – FOREIGN KEY → Category  

---

### Category
- **category_id** – INT, PRIMARY KEY  
- **category_name** – VARCHAR(50)  

---

### Branch
- **branch_id** – INT, PRIMARY KEY  
- **branch_name** – VARCHAR(100)  
- **location** – VARCHAR(100)  
- **manager_id** – FOREIGN KEY → Staff  

---

### Availability
- **branch_id** – FOREIGN KEY → Branch  
- **costume_id** – FOREIGN KEY → Costume  
- **quantity_available** – INT  

---

### Booking Information
- **booking_id** – INT, PRIMARY KEY  
- **customer_id** – FOREIGN KEY → Customer  
- **branch_id** – FOREIGN KEY → Branch  
- **booking_date** – DATE  
- **hire_start_date** – DATE  
- **hire_end_date** – DATE  

---

### Booking Items
- **bookingItem_id** – INT, PRIMARY KEY  
- **booking_id** – FOREIGN KEY → Booking Information  
- **costume_id** – FOREIGN KEY → Costumes  
- **quantity** – INT  
- **hire_start_date** – DATE  
- **hire_end_date** – DATE  

---

### Repair
- **repair_id** – INT, PRIMARY KEY  
- **costume_id** – FOREIGN KEY → Costume  
- **staff_id** – FOREIGN KEY → Staff  
- **repair_date** – DATE  
- **description** – VARCHAR(200)  

---

### Check
- **check_id** – INT, PRIMARY KEY  
- **costume_id** – FOREIGN KEY → Costume  
- **staff_id** – FOREIGN KEY → Staff  
- **check_date** – DATE  
- **condition_status** – VARCHAR(20)  

---

## Relationships

- **Customer → Booking Information**: 1 : M  
- **Staff → Repair**: 1 : M  
- **Staff → Check**: 1 : M  
- **Costume → Category**: M : 1  
- **Costume → Repair**: 1 : M  
- **Costume → Check**: 1 : M  
- **Branch → Booking Information**: 1 : M  
- **Branch → Availability (Costume)**: M : M (via *Availability*)  
- **Branch → Staff**: 1 : M  
- **Booking Information → Booking Items (Costume)**: M : M (via *Booking Items*)  
