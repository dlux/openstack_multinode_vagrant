#!/bin/bash

# ==============================================================================
# Script installs the redhat director undercloud node
# Use non admin user.
# ==============================================================================

# Uncomment the following line to debug this script
set -o xtrace

#=================================================
# GLOBAL VARIABLES DEFINITION
#=================================================
_original_proxy=''
_proxy=''
_password='secrete123'

#=================================================
# GLOBAL FUNCTIONS
#=================================================
# Error Function
function PrintError {
    echo "************************" >&2
    echo "* $(date +"%F %T.%N") ERROR: $1" >&2
    echo "************************" >&2
    exit 1
}

function PrintHelp {
    echo " "
    echo "Script installs redhat director undercloud node requirements. Optionally uses given proxy"
    echo " "
    echo "Usage:"
    echo "./install_undercloud.sh [--proxy | -x <http://proxyserver:port>][--domain | -d domain.something]"
    echo " "
    echo "     --proxy | -x     Uses the given proxy server to install the tools."
    echo "     --domain | -d    Uses the given domain for no_proxy."
    echo "     --help           Prints current help text. "
    echo " "
    exit 1
}

# Ensure script is run as root
if [ "$EUID" -e "0" ]; then
  PrintError "This script must be run as non root user."
fi

# Set locale
locale-gen en_US
update-locale
export HOME=/root

# ============================= Processes devstack installation options ============================
# Handle file sent as parameter - from where proxy info will be retrieved.
while [[ ${1} ]]; do
  case "${1}" in
    --proxy|-x)
      if [[ -z "${2}" || "${2}" == -* ]]; then
          PrintError "Missing proxy data."
      else
          _original_proxy="${2}"
#          if [ -f /etc/apt/apt.conf ]; then
#              echo "Acquire::http::Proxy \"${2}\";" >>  /etc/apt/apt.conf
#          elif [ -d /etc/apt/apt.conf.d ]; then
#              echo "Acquire::http::Proxy \"${2}\";" >>  /etc/apt/apt.conf.d/70proxy.conf
#          fi
          npx="127.0.0.0/8,localhost,10.0.0.0/8,192.168.0.0/16,.intel.com"
          _proxy="http_proxy=${2} https_proxy=${2} no_proxy=${npx}"
          _proxy="$_proxy HTTP_PROXY=${2} HTTPS_PROXY=${2} NO_PROXY=${npx}"
      fi
      shift
      ;;
    --password|-p)
      if [[ -z "${2}" || "${2}" == -* ]]; then
          PrintError "Missing password."
      else
        _password="{2}"
      fi
      shift
      ;;
    --help|-h)
      PrintHelp
      ;;
    *)
      PrintError "Invalid Argument."
  esac
  shift
done

# ============================================================================================
# BEGIN PREWORK

eval $_proxy yum update
mkdir ~/images
mkdir ~/templates


