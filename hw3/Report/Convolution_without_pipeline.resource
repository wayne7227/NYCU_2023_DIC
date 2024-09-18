 
****************************************
Report : resources
Design : Convolution_without_pipeline
Version: T-2022.03
Date   : Wed Nov  8 20:13:27 2023
****************************************

Resource Sharing Report for design Convolution_without_pipeline in file
        ./Convolution_without_pipeline.v

===============================================================================
|          |              |            | Contained     |                      |
| Resource | Module       | Parameters | Resources     | Contained Operations |
===============================================================================
| r531     | DW01_cmp2    | width=7    |               | gte_125 lt_123       |
| r532     | DW01_cmp2    | width=7    |               | gte_127 lt_125       |
| r533     | DW01_cmp2    | width=7    |               | gte_129 lt_127       |
| r534     | DW01_cmp2    | width=7    |               | gte_131 lt_129       |
| r566     | DW_cmp       | width=7    |               | lt_94                |
| r568     | DW01_inc     | width=7    |               | add_95               |
| r604     | DW01_sub     | width=7    |               | sub_121              |
| r606     | DW_cmp       | width=7    |               | lt_131               |
| r608     | DW01_add     | width=7    |               | add_126              |
| r610     | DW01_add     | width=7    |               | add_128              |
| r612     | DW01_add     | width=7    |               | add_130              |
| r614     | DW01_add     | width=7    |               | add_132              |
| r1417    | DW_mult_uns  | a_width=16 |               | mult_110_9           |
|          |              | b_width=16 |               |                      |
| r1419    | DW_mult_uns  | a_width=16 |               | mult_110_8           |
|          |              | b_width=16 |               |                      |
| r1421    | DW_mult_uns  | a_width=16 |               | mult_110_7           |
|          |              | b_width=16 |               |                      |
| r1423    | DW_mult_uns  | a_width=16 |               | mult_110_6           |
|          |              | b_width=16 |               |                      |
| r1425    | DW_mult_uns  | a_width=16 |               | mult_110_5           |
|          |              | b_width=16 |               |                      |
| r1427    | DW_mult_uns  | a_width=16 |               | mult_110_4           |
|          |              | b_width=16 |               |                      |
| r1429    | DW_mult_uns  | a_width=16 |               | mult_110_3           |
|          |              | b_width=16 |               |                      |
| r1431    | DW_mult_uns  | a_width=16 |               | mult_110_2           |
|          |              | b_width=16 |               |                      |
| r1433    | DW_mult_uns  | a_width=16 |               | mult_110             |
|          |              | b_width=16 |               |                      |
| r1435    | DW01_add     | width=36   |               | add_5_root_add_0_root_add_110_16 |
| r1437    | DW01_add     | width=36   |               | add_3_root_add_0_root_add_110_16 |
| r1439    | DW01_add     | width=34   |               | add_2_root_add_0_root_add_110_16 |
| r1441    | DW01_add     | width=34   |               | add_7_root_add_0_root_add_110_16 |
| r1443    | DW01_add     | width=36   |               | add_1_root_add_0_root_add_110_16 |
| r1445    | DW01_add     | width=36   |               | add_6_root_add_0_root_add_110_16 |
| r1447    | DW01_add     | width=36   |               | add_4_root_add_0_root_add_110_16 |
| r1449    | DW01_add     | width=36   |               | add_0_root_add_0_root_add_110_16 |
===============================================================================


Implementation Report
===============================================================================
|                    |                  | Current            | Set            |
| Cell               | Module           | Implementation     | Implementation |
===============================================================================
| add_1_root_add_0_root_add_110_16      |                    |                |
|                    | DW01_add         | pparch (area,speed)                 |
| add_4_root_add_0_root_add_110_16      |                    |                |
|                    | DW01_add         | pparch (area,speed)                 |
| add_0_root_add_0_root_add_110_16      |                    |                |
|                    | DW01_add         | pparch (area,speed)                 |
| add_6_root_add_0_root_add_110_16      |                    |                |
|                    | DW01_add         | pparch (area,speed)                 |
| add_7_root_add_0_root_add_110_16      |                    |                |
|                    | DW01_add         | pparch (area,speed)                 |
| add_3_root_add_0_root_add_110_16      |                    |                |
|                    | DW01_add         | pparch (area,speed)                 |
| mult_110           | DW_mult_uns      | pparch (area,speed)                 |
|                    |                  | mult_arch: benc_radix4              |
| mult_110_8         | DW_mult_uns      | pparch (area,speed)                 |
|                    |                  | mult_arch: benc_radix4              |
| mult_110_9         | DW_mult_uns      | pparch (area,speed)                 |
|                    |                  | mult_arch: benc_radix4              |
| mult_110_7         | DW_mult_uns      | pparch (speed)     |                |
|                    |                  | mult_arch: benc_radix4              |
| add_5_root_add_0_root_add_110_16      |                    |                |
|                    | DW01_add         | pparch (speed)     |                |
| mult_110_2         | DW_mult_uns      | pparch (speed)     |                |
|                    |                  | mult_arch: benc_radix4              |
| mult_110_3         | DW_mult_uns      | pparch (speed)     |                |
|                    |                  | mult_arch: benc_radix4              |
| mult_110_6         | DW_mult_uns      | pparch (speed)     |                |
|                    |                  | mult_arch: benc_radix4              |
| add_2_root_add_0_root_add_110_16      |                    |                |
|                    | DW01_add         | rpl                |                |
| mult_110_4         | DW_mult_uns      | apparch (area)     |                |
|                    |                  | mult_arch: benc_radix4              |
| mult_110_5         | DW_mult_uns      | apparch (area)     |                |
|                    |                  | mult_arch: benc_radix4              |
| add_95             | DW01_inc         | rpl                |                |
===============================================================================

1
