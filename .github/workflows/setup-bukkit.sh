echo "install bukkit started"

# bash script args
MC_VERSION=$1
RAM=$2

# consts
BUKKIT_DIR="_install-bukkit"

# reinitialize case for GitHub Runner 
rm -rf $BUKKIT_DIR
mkdir $BUKKIT_DIR

# --------------

cd $BUKKIT_DIR

# download bukkit
wget -O purpur.jar https://api.purpurmc.org/v2/purpur/1.19/latest/download

# set eula.txt to eula=true
rm -r eula.txt
touch eula.txt
echo 'eula=true' >> eula.txt 

# generate run.sh shell file 
rm -rf run.sh
touch run.sh
echo 'java -Xms${{ env.ram }} -Xmx${{ env.ram }} -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true -jar purpur.jar nogui' >> run.sh
chmod +x ./run.sh

echo "install bukkit finished"