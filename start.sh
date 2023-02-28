python3 webserver.py &
if [[ -n $RCLONE_CONFIG ]]; then
	echo "Rclone config detected"
	echo -e "$RCLONE_CONFIG" > /app/rclone.conf
fi
chmod +x extract

while true
do
	if [ -f update.py ]
	then
		echo "Running update.py"
		python3 update.py
	else
		echo "Update script not found"
	fi
	python3 -m tobrot
	sleep 5
done



