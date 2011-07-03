IF(MSVC)
	option (USE_VLD						"Use the Visual Leak Detector" OFF)

	IF(USE_VLD)
		FIND_PACKAGE(VLD REQUIRED)
		ADD_DEFINITIONS(-DUSING_VLD)
		include_directories(${VLD_INCLUDE_DIRS})
		SET(UPMC_EXTERNAL_LIBS ${UPMC_EXTERNAL_LIBS} ${VLD_LIBRARIES})
		
		IF (GET_RUNTIME)
			# The following adds support to copy the dependent dlls to the Debug folder. 
			FOREACH(elt ${VLD_RUNTIME_DEBUG})
				MESSAGE(STATUS " Adding code to copy ${elt} to the Debug folder.")
				add_runtime_file( ${RUNTIME_BATCH_FILENAME} ${elt} Debug )
			ENDFOREACH(elt)
		ENDIF(GET_RUNTIME)
		
	ENDIF(USE_VLD)

ENDIF(MSVC)