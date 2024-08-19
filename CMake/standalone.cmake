#############################################
# REQUIRE ITK 3.20 OR LATER                 #
#############################################
FIND_PACKAGE(ITK REQUIRED)

INCLUDE(${ITK_USE_FILE})

#############################################
# REQUIRE VTK                               #
#############################################
find_package(VTK REQUIRED)

#############################################
# REQUIRE QT5                               #
#############################################
FIND_PACKAGE(Qt6Widgets)
FIND_PACKAGE(Qt6OpenGL)
FIND_PACKAGE(Qt6Concurrent)
FIND_PACKAGE(Qt6Qml)

SET(SNAP_QT_INCLUDE_DIRS
  ${Qt6Widgets_INCLUDE_DIRS}
  ${Qt6OpenGL_INCLUDE_DIRS}
  ${Qt6Concurrent_INCLUDE_DIRS}
  ${Qt6Qml_INCLUDE_DIRS}
)

SET(SNAP_QT_LIBRARIES
  Qt6::Widgets
  Qt6::OpenGL
  Qt6::Concurrent
  Qt6::Qml
)

# On Linux the X11Extras library is required
# IF(UNIX AND NOT APPLE)
#   FIND_PACKAGE(Qt6X11Extras)
#   SET(SNAP_QT_INCLUDE_DIRS ${SNAP_QT_INCLUDE_DIRS} ${Qt6X11Extras_INCLUDE_DIRS})
#   SET(SNAP_QT_LIBRARIES ${SNAP_QT_LIBRARIES} Qt6::X11Extras)
# ENDIF()

# Set vars for the QT binary and library directories
GET_FILENAME_COMPONENT(QT_BINARY_DIR "${Qt6Core_DIR}/../../../bin" ABSOLUTE)
GET_FILENAME_COMPONENT(QT_LIBRARY_DIR "${Qt6Core_DIR}/../../" ABSOLUTE)

# Set the QTVERSION var
SET(QTVERSION ${Qt6Widgets_VERSION})

# Look for CURL. It is now required part of ITK-SNAP
FIND_PACKAGE(CURL)
IF(CURL_FOUND)
  INCLUDE_DIRECTORIES(${CURL_INCLUDE_DIR})
ENDIF(CURL_FOUND)


