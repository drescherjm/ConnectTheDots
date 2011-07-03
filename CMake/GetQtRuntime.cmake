# --------------------------------------------------------------------
# Copy the needed Qt libraries into the Build directory. Also add installation
# and CPack code to support installer generation.
# --------------------------------------------------------------------

if (GET_RUNTIME)
	IF (WIN32)
		FOREACH(LIB QtCore QtXml QtGui QtNetwork QtSql)
				add_runtime_file( ${RUNTIME_BATCH_FILENAME} "${QT_BINARY_DIR}/${LIB}d${QT_VERSION_MAJOR}.dll" Debug )
				add_runtime_file( ${RUNTIME_BATCH_FILENAME} "${QT_BINARY_DIR}/${LIB}${QT_VERSION_MAJOR}.dll" RelWithDebInfo )
		ENDFOREACH(LIB)
		
		add_runtime_file( ${RUNTIME_BATCH_FILENAME} "${QT_PLUGINS_DIR}/sqldrivers/qsqlited${QT_VERSION_MAJOR}.dll" Debug )
		add_runtime_file( ${RUNTIME_BATCH_FILENAME} "${QT_PLUGINS_DIR}/sqldrivers/qsqlite${QT_VERSION_MAJOR}.dll" RelWithDebInfo )
		
	ENDIF(WIN32)
endif(GET_RUNTIME)