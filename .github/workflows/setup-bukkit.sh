echo "setup bukkit started"

# bash script args
MC_VERSION=$1
RAM=$2

BUKKIT_FILE_NAME="server.jar"
# download bukkit
wget -q -O $BUKKIT_FILE_NAME https://api.purpurmc.org/v2/purpur/1.19/latest/download

# set eula.txt to eula=true
rm -rf eula.txt
touch eula.txt
echo 'eula=true' >> eula.txt 

# generate run.sh shell file 
rm -rf run.sh
touch run.sh
echo 'java -Xms$RAM -Xmx$RAM -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true -jar $BUKKIT_FILE_NAME nogui' >> run.sh
chmod +x ./run.sh

echo "setup bukkit finished"