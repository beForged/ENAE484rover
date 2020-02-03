# ENAE 484 Lunar Polar Rover
This is the LSM github repository for cad parts and matlab simulation scripts.

# Naming Convention for CAD files- prepared by Braden Rothwell
All parts and assembly names will start with a string of four numbers followed by a system designation and part class designation. Example below.
` 0000-XXX-XXX`
## Number String
Parts shall be numbered `0001 - 9999` in sequential order based on the time of saving the part.
For example, if the last part to be made was numbered `0001`, the next part to be made will be numbered `0002` regardless of system and class designations.
This allows us to have individual part numbers for each part up to 9999 parts.
## System Designation
Parts shall have specific system designations in order to differentiate the parts of each system from another.
The system designations are as follows:
- Avionics - AVI
- Crew - CRW
- Loads, Structures, Mechanisms - LSM
- Power - PWR
## Class Designation
Parts, Assemblies, etc. shall have a class designation in order to easily differentiate the structure of the part named.
The class designations are as follows:
- Custom Part - `CP`
- Purchase Part - `PP-XXX`
Off the shelf parts purchased from a supplier.
Purchase parts class designation shall be followed by the part number designated by the supplier.
- Reference Part - `RP`
Parts created specifically as a reference. Not a final part.
- Layout - `LYT`
Part created to specifically designate the layout of a system. For example, Avionics mounting configuration layout.
- Assembly - `ASY`
Higher-order assembly. Used for full system assemblies. For example, Final rover assembly.
- Sub-Assembly - `SASY`
Lower order assembly. Used for individual assemblies intended to be added to higher-order assemblies. For Example, Crew seat assembly.
## Examples
`0001-LSM-CP`
- Part number 0001
- Loads, Structures, Mechanisms system
- Custom Part

`0042-PWR-PP-735H435`
- Part number 0042
- Power system
- Purchase Part
- Supplier part number: 35H435

`0501-CRW-SASY`
- Part Number 0501
- Crew system
- Sub-Assembly
