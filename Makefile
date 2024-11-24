start:
	pm2 start bun --name "mi-gpt" -- start
stop:
	pm2 stop "mi-gpt"
delte:
	pm2 delete "mi-gpt"
