/**
 * executable.ld
 *
 * Copyright (C) 2023 Mateusz Stadnik <matgla@live.com>
 *
 * This program is free software: you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation, either version
 * 3 of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be
 * useful, but WITHOUT ANY WARRANTY; without even the implied
 * warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
 * PURPOSE. See the GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General
 * Public License along with this program. If not, see
 * <https://www.gnu.org/licenses/>.
 */

MEMORY
{
  image(rwx) : ORIGIN = 0x00000000, LENGTH = 0xffffffff
}

ENTRY(start)

SECTIONS
{
  .text :
  {
    . = ALIGN(16);
    KEEP(*(.entry))
    *(.text)
    *(.text*)
    *(.rel.text)
    *(.rel.text*)
    *(.glue_7)
    *(.glue_7t)
    *(.eh_frame)
    KEEP(*(.init))
    KEEP(*(.fini))
    *(.rodata)
    *(.rodata*)
    *(.ARM.extab*)
    . = ALIGN(16);
  } > image

  .data :
  {
    . = ALIGN(16);
    *(.data)
    *(.ARM.exidx)
    *(.debug_frame)
    *(.ARM.exidx*) 
     
    *(.data*)
    . = ALIGN(16);
  } > image 

  .bss :
  {
    . = ALIGN(16);
    *(.bss)
    *(.bss*)
    *(COMMON)
    . = ALIGN(16);
  } > image

  .got :
  {
    *(.got*)
  } > image

  .dynsym :
  {
    *(.dynsym*)
  } > image 

  .dynstr :
  {
    *(.dynstr*)
  } > image

  .dynamic : 
  {
    *(.dynamic*)
  } > image
}
