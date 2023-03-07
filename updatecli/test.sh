temp = '.configuration.Properties.corporate-url'
export $temp
Value1=$(yq '.[env($temp)]' test.yml)