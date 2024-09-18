 
****************************************
Report : resources
Design : Convolution
Version: T-2022.03
Date   : Sat Dec 23 21:54:50 2023
****************************************

Resource Sharing Report for design Convolution in file ./Convolution.v

===============================================================================
|          |              |            | Contained     |                      |
| Resource | Module       | Parameters | Resources     | Contained Operations |
===============================================================================
| r446     | DW_cmp       | width=5    |               | lt_115               |
| r448     | DW01_inc     | width=5    |               | add_116              |
| r1285    | DW_mult_uns  | a_width=8  |               | mult_131             |
|          |              | b_width=8  |               |                      |
| r1287    | DW_mult_uns  | a_width=8  |               | mult_131_2           |
|          |              | b_width=8  |               |                      |
| r1289    | DW_mult_uns  | a_width=8  |               | mult_131_3           |
|          |              | b_width=8  |               |                      |
| r1291    | DW_mult_uns  | a_width=8  |               | mult_131_4           |
|          |              | b_width=8  |               |                      |
| r1293    | DW_mult_uns  | a_width=8  |               | mult_131_5           |
|          |              | b_width=8  |               |                      |
| r1295    | DW_mult_uns  | a_width=8  |               | mult_131_6           |
|          |              | b_width=8  |               |                      |
| r1297    | DW_mult_uns  | a_width=8  |               | mult_131_7           |
|          |              | b_width=8  |               |                      |
| r1299    | DW_mult_uns  | a_width=8  |               | mult_131_8           |
|          |              | b_width=8  |               |                      |
| r1301    | DW_mult_uns  | a_width=8  |               | mult_131_9           |
|          |              | b_width=8  |               |                      |
| r1303    | DW01_add     | width=18   |               | add_7_root_add_0_root_add_131_8 |
| r1305    | DW01_add     | width=21   |               | add_2_root_add_0_root_add_131_8 |
| r1307    | DW01_add     | width=19   |               | add_3_root_add_0_root_add_131_8 |
| r1309    | DW01_add     | width=20   |               | add_5_root_add_0_root_add_131_8 |
| r1311    | DW01_add     | width=21   |               | add_6_root_add_0_root_add_131_8 |
| r1313    | DW01_add     | width=21   |               | add_1_root_add_0_root_add_131_8 |
| r1315    | DW01_add     | width=21   |               | add_4_root_add_0_root_add_131_8 |
| r1317    | DW01_add     | width=21   |               | add_0_root_add_0_root_add_131_8 |
===============================================================================


Implementation Report
===============================================================================
|                    |                  | Current            | Set            |
| Cell               | Module           | Implementation     | Implementation |
===============================================================================
| add_0_root_add_0_root_add_131_8       |                    |                |
|                    | DW01_add         | rpl                |                |
| add_1_root_add_0_root_add_131_8       |                    |                |
|                    | DW01_add         | rpl                |                |
| add_2_root_add_0_root_add_131_8       |                    |                |
|                    | DW01_add         | rpl                |                |
| add_3_root_add_0_root_add_131_8       |                    |                |
|                    | DW01_add         | rpl                |                |
| add_5_root_add_0_root_add_131_8       |                    |                |
|                    | DW01_add         | rpl                |                |
| add_7_root_add_0_root_add_131_8       |                    |                |
|                    | DW01_add         | rpl                |                |
| mult_131_9         | DW_mult_uns      | apparch (area)     |                |
|                    |                  | mult_arch: and     |                |
| mult_131_8         | DW_mult_uns      | apparch (area)     |                |
|                    |                  | mult_arch: and     |                |
| mult_131_7         | DW_mult_uns      | apparch (area)     |                |
|                    |                  | mult_arch: and     |                |
| mult_131_6         | DW_mult_uns      | apparch (area)     |                |
|                    |                  | mult_arch: and     |                |
| mult_131_5         | DW_mult_uns      | apparch (area)     |                |
|                    |                  | mult_arch: and     |                |
| mult_131_4         | DW_mult_uns      | apparch (area)     |                |
|                    |                  | mult_arch: and     |                |
| mult_131_3         | DW_mult_uns      | apparch (area)     |                |
|                    |                  | mult_arch: and     |                |
| mult_131_2         | DW_mult_uns      | apparch (area)     |                |
|                    |                  | mult_arch: and     |                |
| mult_131           | DW_mult_uns      | apparch (area)     |                |
|                    |                  | mult_arch: and     |                |
===============================================================================

1
