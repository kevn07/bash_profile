# Custom Functions

function awslookup () {
    if [ "$#" -ne 2 ]; then
      echo "Not enough arguments, arguments $1 Tag name value, $2 profile name"
      return 1
    fi
    tag=*$1*
    aws ec2 describe-instances \
        --output table \
        --filters "Name=tag-key,Values=Name" "Name=tag-value,Values=$tag" "Name=instance-state-code,Values=16" \
        --query 'Reservations[].Instances[].[Tags[?Key==`Name`] | [0].Value, InstanceId, LaunchTime, Placement.AvailabilityZone]' \
        --profile $2
}

# Rrun git pull for all repos in current directory
function gitpullall() {
    for D in `find . -type d -maxdepth 1 -not -path '*/\.*' -not -name '.'`
    do
        printf "  \e[31m%-5s\e[m%s\n" "Git Pulling on" "${D}" # red
        git --git-dir=${D}/.git --work-tree=${D} pull
    done
}

# Print all Bash Colors
function colors() {
    color=16;

    while [ $color -lt 245 ]; do
        echo -e "$color: \\033[38;5;${color}mhello\\033[48;5;${color}mworld\\033[0m"
        ((color++));
    done
}
