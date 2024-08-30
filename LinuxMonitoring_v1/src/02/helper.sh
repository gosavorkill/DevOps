#!/bin/bash

greet() {
echo "Do you want to save the results to a file? (y/n)"
read response
if [ "$response" = "y" ] || [ "$response" = "Y" ]; then
  echo "The results are saved."
else
  rm $current_datetime.status
  echo "The results have not been saved."
fi
}
