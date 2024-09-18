 
****************************************
Report : resources
Design : Convolution_with_pipeline
Version: T-2022.03
Date   : Wed Nov  8 21:31:19 2023
****************************************

Resource Sharing Report for design Convolution_with_pipeline in file
        ./Convolution_with_pipeline.v

===============================================================================
|          |              |            | Contained     |                      |
| Resource | Module       | Parameters | Resources     | Contained Operations |
===============================================================================
| r542     | DW01_cmp2    | width=7    |               | gte_166 lt_164       |
| r543     | DW01_cmp2    | width=7    |               | gte_168 lt_166       |
| r544     | DW01_cmp2    | width=7    |               | gte_170 lt_168       |
| r545     | DW01_cmp2    | width=7    |               | gte_172 lt_170       |
| r578     | DW_cmp       | width=7    |               | lt_112               |
| r580     | DW01_inc     | width=7    |               | add_113              |
| r582     | DW_cmp       | width=7    |               | gte_123              |
| r618     | DW01_sub     | width=7    |               | sub_162              |
| r620     | DW_cmp       | width=7    |               | lt_172               |
| r622     | DW01_add     | width=7    |               | add_167              |
| r624     | DW01_add     | width=7    |               | add_169              |
| r626     | DW01_add     | width=7    |               | add_171              |
| r628     | DW01_add     | width=7    |               | add_173              |
| r1381    | DW01_add     | width=36   |               | add_154              |
| r1383    | DW01_add     | width=36   |               | add_154_2            |
| r1385    | DW01_add     | width=36   |               | add_154_5            |
| r1387    | DW01_add     | width=36   |               | add_154_6            |
| r1389    | DW01_add     | width=36   |               | add_154_3            |
| r1391    | DW01_add     | width=36   |               | add_154_7            |
| r1393    | DW01_add     | width=36   |               | add_1_root_add_0_root_add_154_8 |
| r1395    | DW01_add     | width=36   |               | add_0_root_add_0_root_add_154_8 |
| r2111    | DW_mult_uns  | a_width=16 |               | mult_153             |
|          |              | b_width=16 |               |                      |
| r2827    | DW_mult_uns  | a_width=16 |               | mult_145             |
|          |              | b_width=16 |               |                      |
| r3543    | DW_mult_uns  | a_width=16 |               | mult_146             |
|          |              | b_width=16 |               |                      |
| r4259    | DW_mult_uns  | a_width=16 |               | mult_148             |
|          |              | b_width=16 |               |                      |
| r4975    | DW_mult_uns  | a_width=16 |               | mult_147             |
|          |              | b_width=16 |               |                      |
| r5691    | DW_mult_uns  | a_width=16 |               | mult_149             |
|          |              | b_width=16 |               |                      |
| r6407    | DW_mult_uns  | a_width=16 |               | mult_150             |
|          |              | b_width=16 |               |                      |
| r7123    | DW_mult_uns  | a_width=16 |               | mult_151             |
|          |              | b_width=16 |               |                      |
| r7839    | DW_mult_uns  | a_width=16 |               | mult_152             |
|          |              | b_width=16 |               |                      |
===============================================================================


Implementation Report
===============================================================================
|                    |                  | Current            | Set            |
| Cell               | Module           | Implementation     | Implementation |
===============================================================================
| add_154_3          | DW01_add         | pparch (area,speed)                 |
| add_154_7          | DW01_add         | pparch (area,speed)                 |
| add_154_6          | DW01_add         | pparch (area,speed)                 |
| add_154_5          | DW01_add         | pparch (area,speed)                 |
| mult_145           | DW_mult_uns      | pparch (area,speed)                 |
|                    |                  | mult_arch: benc_radix4              |
| mult_146           | DW_mult_uns      | pparch (area,speed)                 |
|                    |                  | mult_arch: benc_radix4              |
| mult_147           | DW_mult_uns      | pparch (area,speed)                 |
|                    |                  | mult_arch: benc_radix4              |
| mult_148           | DW_mult_uns      | pparch (area,speed)                 |
|                    |                  | mult_arch: benc_radix4              |
| mult_149           | DW_mult_uns      | pparch (area,speed)                 |
|                    |                  | mult_arch: benc_radix4              |
| mult_150           | DW_mult_uns      | pparch (area,speed)                 |
|                    |                  | mult_arch: benc_radix4              |
| mult_151           | DW_mult_uns      | pparch (area,speed)                 |
|                    |                  | mult_arch: benc_radix4              |
| mult_152           | DW_mult_uns      | pparch (area,speed)                 |
|                    |                  | mult_arch: benc_radix4              |
| mult_153           | DW_mult_uns      | pparch (area,speed)                 |
|                    |                  | mult_arch: benc_radix4              |
| add_0_root_add_0_root_add_154_8       |                    |                |
|                    | DW01_add         | pparch (speed)     |                |
| add_1_root_add_0_root_add_154_8       |                    |                |
|                    | DW01_add         | pparch (speed)     |                |
| add_154_2          | DW01_add         | pparch (speed)     |                |
| add_154            | DW01_add         | pparch (speed)     |                |
| add_113            | DW01_inc         | rpl                |                |
===============================================================================

1
