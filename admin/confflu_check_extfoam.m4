dnl confFlu - pythonFlu configuration package
dnl Copyright (C) 2010- Alexey Petrov
dnl Copyright (C) 2009-2010 Pebble Bed Modular Reactor (Pty) Limited (PBMR)
dnl 
dnl This program is free software: you can redistribute it and/or modify
dnl it under the terms of the GNU General Public License as published by
dnl the Free Software Foundation, either version 3 of the License, or
dnl (at your option) any later version.
dnl
dnl This program is distributed in the hope that it will be useful,
dnl but WITHOUT ANY WARRANTY; without even the implied warranty of
dnl MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
dnl GNU General Public License for more details.
dnl 
dnl You should have received a copy of the GNU General Public License
dnl along with this program.  If not, see <http://www.gnu.org/licenses/>.
dnl 
dnl See http://sourceforge.net/projects/pythonflu
dnl
dnl Author : Alexey PETROV
dnl


dnl --------------------------------------------------------------------------------
AC_DEFUN([CONFFLU_CHECK_EXTFOAM],dnl
[
AC_CHECKING(for extFoam package)

AC_LANG_SAVE
AC_LANG_CPLUSPLUS

EXTFOAM_CPPFLAGS=""
AC_SUBST(EXTFOAM_CPPFLAGS)

EXTFOAM_CXXFLAGS=""
AC_SUBST(EXTFOAM_CXXFLAGS)

EXTFOAM_LDFLAGS=""
AC_SUBST(EXTFOAM_LDFLAGS)

AC_SUBST(ENABLE_EXTFOAM)

extfoam_ok=no

dnl --------------------------------------------------------------------------------
AC_ARG_WITH( [extfoam],
             AC_HELP_STRING( [--with-extfoam=<path>],
                             [use <path> to look for extFoam installation] ),
             [extfoam_root_dir=${withval}],
             [withval=yes])
   

dnl --------------------------------------------------------------------------------
if test ! "x${withval}" = "xno" ; then
   if test "x${withval}" = "xyes" ; then
      if test ! "x${EXTFOAM_ROOT_DIR}" = "x" && test -d ${EXTFOAM_ROOT_DIR} ; then
         extfoam_root_dir=${EXTFOAM_ROOT_DIR}
      fi
   fi

   AC_CHECK_FILE( [${extfoam_root_dir}/bin/ext_icoFoam], [ extfoam_ok=yes ], [ extfoam_ok=no ] )

   if test "x${extfoam_ok}" = "xyes" ; then
      EXTFOAM_CPPFLAGS=""

      EXTFOAM_CXXFLAGS=""

      EXTFOAM_LDFLAGS="-L${extfoam_root_dir}/lib"
   fi
fi

dnl --------------------------------------------------------------------------------
if test "x${extfoam_ok}" = "xno" ; then
   AC_MSG_WARN([use either \${EXTFOAM_ROOT_DIR} or --with-extfoam=<path>])
fi

dnl --------------------------------------------------------------------------------
ENABLE_EXTFOAM=${extfoam_ok}
])


dnl --------------------------------------------------------------------------------
