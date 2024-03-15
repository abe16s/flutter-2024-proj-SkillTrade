# Flutter-2024-proj-SkillTrade
# SkillTrade Connect: Your Home Services Hub

## Group Members   
| No.|      Full Name            |     ID        |
|:---| :---                      |    :---       |
| 1  | Abenezer Seifu Dula       | UGR/6499/14   |
| 2  | Betsegaw Mesele Worku     | UGR/9758/14   |
| 3  | Biniyam Assefa Mekonnen   | UGR/8320/14   |
| 4  | Kaleb Asratemedhin Bekele | UGR/9104/14   |

# Basic Features
## Authentication
The application shall enable users to do the following
  <ul>
    <li>Signup</li>
    <li>Login/logout</li>
    <li>Change username</li>
    <li>Delete Account</li>
  </ul>

## Authorization
The application should allow users do what they are allowed to do or what is in their role. Below we will list the roles we have identified in the application. The administartor will serve a crucial role in managing roles i.e. assigning, removing, restricting them. 
  
### Roles
  1. <b>Technicians</b>  - These are the skilled professionals who offer their services through the platform. They could be plumbers, electricians, HVAC technicians, carpenters, mechanics, or experts in various other trades. Their role involves creating profiles showcasing their skills, expertise, availability, and accepting service requests from customers. 
    They perform the requested services at the customers' homes.
  2. <b>Customers</b> - These are the individuals or households seeking home maintenance or installation services. Customers use the platform to search for technicians based on their specific         needs, schedule appointments, track service requests. They book appointments with technicians to address their home-related technical issues or installation needs.
  3. <b>Administrator</b> - The administrator has the authority to approve and deny technician applications. He can revoke or block(restrict) users 
  
## Profiles
 ### Profile - CRUD
 #### Customers
 1. Create - their profile
 2. Update - their profile
 3. Read - their profile, technicians profile
  
  #### Technicains
  1. Create - their profile
  2. Update - their profile (personal and technical information)
  3. Read - their profile and others
     
# Business Features
## Feature 1 - Booking Appointments
Appointment Scheduling: Customers can easily book appointments with technicians based on their availability.
Flexible Scheduling: Options for same-day or future appointments to cater to immediate needs or plan ahead.
  ### Booking - CRUD
  #### Customers
  1. Create - Booking
  2. Read - Bookings they have created in the past.
  3. Update - Booking ( time, location, description etc )
  4. Delete - Booking

  #### Technicians
  1. Read - Booking
  2. Update - Booking( change status to declined, accepted, serviced, pending)

## Feature 2 - Review and Rating
Upon receiving a service from a technician, a customer should be able to write a review and post it so that future users can make an informed decision in choosing a technician. The users should also be able to rate the technician on a given scale.

  ### Review and Rating - CRUD
  #### Customers
  1. Create - review or rate technician
  2. Read - their review or other people's
  3. Update - only their reviews
  4. Delete - only their reviews
  #### Technicians
  1. Read - ratings and reviews about themselves



## Benefits
Efficiency: Streamlined process for finding skilled technicians quickly.
Convenience: Easy booking and tracking of services from the comfort of home.

## Conclusion
This platform aims to revolutionize the way home services are sought and provided, ensuring a hassle-free experience for both technicians and customers. By facilitating efficient connections and transparent transactions, it strives to create a reliable and trustworthy ecosystem for home maintenance and installations.
