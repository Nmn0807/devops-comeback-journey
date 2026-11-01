#!/bin/bash

check_server() {
	    local server=$1

	        echo "Checking $server..."

		    if ping -c 1 -W 2 "$server" > /dev/null 2>&1; then
			            echo "STATUS: $server is REACHABLE"
				        else
						        echo "STATUS: $server is NOT REACHABLE"
							    fi

							        echo "-----------------------------"
							}

						echo "SERVER HEALTH CHECK"
						echo "============================="

						for server in google.com github.com amazon.com
						do
							    check_server "$server"
						    done

						    echo "CHECK COMPLETED"
