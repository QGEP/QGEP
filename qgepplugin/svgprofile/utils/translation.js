/*
 * translation.js
 *
 * Copyright (C) 2013  Matthias Kuhn
 * matthias [dot] kuhn [at] gmx [dot] ch
 *-----------------------------------------------------------
 *
 * licensed under the terms of GNU GPL 2
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this progsram; if not, write to the Free Software Foundation, Inc.,
 * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 *
 */

/* Integrates closely with QGEP / Qt Linguist
 * Needs to be in the global namespace for lupdate-qt4 to recognize translation calls.
 * uses a named! dojo object as context.
 **/
function qsTr ( sourceString, context )
{
  "use strict";
  return i18n.qsTr( context.declaredClass, sourceString );
}