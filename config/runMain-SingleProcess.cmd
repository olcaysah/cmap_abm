
rem ############  PARAMETERS  ############
set RUNTIME=Y:/{{{TEMPLATE}}}/model
set JAVA_PATH=C:/Program Files/Java/jdk1.7.0_13
set HOST_IP=10.10.1.52

rem ############  JPPF DRIVER  ############
cd..
mkdir logFiles

rem ############  HH MANAGER in memory ############
start java -Xmx196000m -cp "%RUNTIME%;config;exec/*" -Dlog4j.configuration=log4j_hh.xml com.pb.cmap.tourBased.CmapHouseholdDataManager -hostname %HOST_IP%

rem ############  MATRIX MANAGER #########
start java -Xmx12000m -cp "%RUNTIME%;config;exec/*" -Dlog4j.configuration=log4j_mtx.xml -Djava.library.path="%RUNTIME%" com.pb.models.ctrampIf.MatrixDataServer -hostname %HOST_IP%
