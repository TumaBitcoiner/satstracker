cmake_minimum_required(VERSION 3.16)

find_package(Qt6 REQUIRED COMPONENTS Gui)
find_package(Qt6 REQUIRED COMPONENTS Quick)

set(SOURCES
    main.cpp
 )
    
qt_add_executable(satstracker ${SOURCES})

target_link_libraries(satstracker PRIVATE 
	
	Qt6::Gui
	Qt6::Quick
)

qt_add_qml_module(satstracker
    URI gui
    VERSION 1.0
    QML_FILES gui/main.qml)

set_target_properties(satstracker PROPERTIES
	WIN32_EXECUTABLE ON
)
